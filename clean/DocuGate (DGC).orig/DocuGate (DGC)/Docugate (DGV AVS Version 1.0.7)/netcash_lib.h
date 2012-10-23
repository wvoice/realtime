#ifndef INC_NETCASH_LIB_H
#define INC_NETCASH_LIB_H	1

#include <winbase.h>
#include <winsock2.h>

/****************************************************************************/
/*	Netcash API Event Defines                                                   */
/****************************************************************************/
// Event types
#define NETCASH_EVENT_STATE			0
#define NETCASH_EVENT_NETCASH_ERR	1
#define NETCASH_EVENT_SOCKET_ERR	2	// Windows Socket Error

/* NetcashDeviceID nState member states 
	also NETCASH_EVENT_STATE event codes */
#define NETCASH_STATE_DISCONNECTED	0
#define NETCASH_STATE_CONNECTING	1
#define NETCASH_STATE_RETR_MAC		2
#define NETCASH_STATE_RETR_VER		3
#define NETCASH_STATE_LOCATION		4
#define NETCASH_STATE_SETUP1		5		// sets device's real time clock
#define NETCASH_STATE_SETUP2		6		// sets encryption
#define NETCASH_STATE_SETUP3		7		// sets timeout (ping timeout)
#define NETCASH_STATE_SETUP4		8		// reserved, not currently used
#define NETCASH_STATE_SETUP5		9		// reserved, not currently used
#define NETCASH_STATE_CONNECTED		10
#define NETCASH_STATE_DISCONNECTING	11

/* NETCASH_EVENT_NETCASH_ERR event error codes */
#define NETCASH_ERR_LOST_CONNECTION			30000
#define NETCASH_ERR_NO_DEVICES				30001
#define NETCASH_ERR_OUTOFMEMORY				30002
#define NETCASH_ERR_WAITFAILED				30003

/****************************************************************************/
/*	Data structures                                                         */
/****************************************************************************/

typedef struct _NetcashDeviceID	{
	LONG	nDevice;
	LONG	nAppData;
	BYTE	nState;
	SOCKADDR_IN SockAddr;
	BYTE	nMACAddress[6];
	char 	strModel[9];
	char 	strImageType[13];
	BYTE	nVersionMajor;
	BYTE	nVersionMinor;
	SYSTEMTIME CompTime;
	char	strLocation[41];
} NetcashDeviceID;

/*	The NetcashDeviceID structure contains information about a Netcash 
	device.  The data is not protected in any way to prevent you from 
	altering it, but doing so will likely produce errors and unexpected 
	behavior.  A pointer to a NetcashDeviceID structure is returned 
	by the ConnectNetcashDevice() function.
	
	You pass the nDevice member to many of the functions to identify the 
	device.  Modifiying this member will invalidate the device and render
	the device object useless.	

	The nAppData member is provided to allow you to store an identifier of 
	your own design for the device.  Ideally this would be a pointer to a 
	structure/object or an index into an array of structures/objects of your
	construction.  This is the only member which you may alter.  You initially 
	set it by passing its value in the ConnectNetcashDevice() call.

	The nState member is a copy of the device's connection processing state 
	(NETCASH_STATE_DISCONNECTED, NETCASH_STATE_CONNECTED, etc).  You will only 
	be able to send and receive packets while the state is 
	NETCASH_STATE_CONNECTED.
  
	SockAddr is the address that was used in the ConnectNetcashDevice() 
	call and should never be modified.  Doing so may prevent forming 
	connections to other devices.

	The rest of the members are provided purely for your information and 
	should not be altered even though modifing them will have no affect on 
	the device or the processing of data.  The strLocation member will 
	automatically be updated if you send a packet with the function code 
	NAT_A_LOCATION (0x4A).
*/

typedef struct _NetcashPacket {
	NetcashDeviceID *pID;
	BYTE fc;			
	BYTE df;			
	BYTE data8[4];		
	LONG data16[4];		// uses long instead of short for easier use by VB 
	BYTE lenS;			
	BYTE dataS[41];
	BYTE lenX;			
	BYTE dataX[44];		
} NetcashPacket;
/*
	The NetcashPacket structure is used for sending and receiving packets.
 */


/****************************************************************************/
/*	Stand Alone Functions                                                               */
/****************************************************************************/


/* If you prefer to handle the sockets yourself, Buffer2Packet() and 
	Packet2Buffer() are stand alone functions thadt generate and decode 
	NetcashPacket structures.  These functions do not perform encryption/
	decryption of string fields, so you must handle that yourself if you
	enable encryption on the device.
*/

LONG _stdcall Buffer2Packet(LONG nBytes, BYTE *pBuf, NetcashPacket *pPacket);
/*	Buffer2Packet() parses a buffer of data and fills in a NetcashPacket.   
	returns x where x is:
	> 0		complete packet using x bytes of buffer
	= 0		no packet found
	= -1	incomplete packet

	if the return value x is < nBytes, you should call this function again
	passing the address of the next character of the buffer.
	example:
	while (nBytes) {
		x = Buffer2Packet(nBytes, pBuf, pPacket);
		if ( x > 0) {
			nBytes -= x;
			pBuf = &pBuf[x];
			// insert code to process packet here
		} else {
			etc
		}
	}
*/

LONG _stdcall Packet2Buffer(NetcashPacket *pPacket, BYTE *pBuf);
/* 	SendPacket2Socket() parses a NetcashPacket structure and produces a 
	complete packet including the start of packet character and checksum.

	This function returns 0 if packet is invalid, otherwise it returns the 
	size of the packet in bytes.

	The buffer pointed to by pBuf should be at least 102 bytes in size. This is
	the maximum possible packet size this function will produce.
*/




/****************************************************************************/
/*	Netcash API Functions                                                   */
/****************************************************************************/

/*  Before you can use any of the other Netcash API functions in your 
	program/process, you must first	call InitNetcashThread. This function
	initializes the data structures and resources that it and the other 
	functions require for operation.
	
	You also must call EndNetcashProcess() before terminating your 
	program/process	in order to properly free all the memory and resources 
	allocated by the API functions.  If you only use the Buffer2Packet() and/or 
	Packet2Buffer() functions, you don't need to do this.

	WaitForNetcashPacket() and GetNextUnreadPacket() must be called from the
	thread that owns the devices they service.  All other functions can be 
	called from any thread of the process, but keep in mind that if they are 
	not	called from the thread that owns the device you are accessing, the
	operation will get put into a queue to be executed the next time the 
	owning thread is active and executing the WaitForNetcashPacket().

  	The API functions use I/O completion routines, asynchronous procedure 
	calls (APC), and other waitable objects to minimize the amount of
	processor time used while there is nothing to do.  But because of this,
	nearly all of the work is performed only while WaitForNetcashPacket() is
	running.  However, network data is buffered normally while 
	WaitForNetcashPacket() is not executing, so incoming messages will not be
	lost.

	Ideally you should spawn off a worker thread that calls 
	WaitForNetcashPacket() and either process incoming packets via the 
	GetNextUnreadPacket() function or use the NetcashReceivePacketCB callback 
	to process your packets more directly.

	You can also use WaitForNetcashPacket() without needing to spawn a thread 
	by operating it in a polled manner using a short timeout.  Keep in mind 
	that WaitForNetcashPacket() is what services queued commands and parses 
	the incoming data for you, so it needs to be called frequently in order
	for everything to function properly.
*/


#ifdef FOR_REFERENCE_ONLY // defined for real after callback typedefs
HANDLE _stdcall InitNetcashThread(
			LONG nThreadID, 
			LONG nThreadHandle,
			NETCASH_RECEIVE_RAW_CALLBACK pReceiveRawCB,
			NETCASH_RECEIVE_PACKET_CALLBACK pReceivePacketCB, 
			NETCASH_EVENT_CALLBACK pEventCB,
			LONG nAppData,
			LONG nPingTimeout
);
#endif
/*	
	The InitNetcashThread function set the specified thread's callback 
	routines, the 32 bit application defined value that is passed to the 
	callback routines, and the thread's ping timeout and returns the handle to
	the thread's end-thread event object.  You can use the end-thread event 
	object with the Windows API function SetEvent() to abort from a waiting 
	WaitForNetcashPacket(). See also EndNetcashThread().

	Ping timeout is in seconds.  Once set to a non-zero value, it can not be 
	set to zero, however you may set the ping timeout to another non-zero 
	value later	using SetThreadPingTimeout().  See also SetThreadPingTimeout().
	
	Pass a NULL if you do not wish to use a particular callback routine.

	Each callback function should be a global function (or a static class 
	member function).  If you wish to use a non-static class member function
	to do the processing, you can use a global/static function for the 
	callback and use the nAppData to pass the instanciated class's address 
	to that global function so it can defreference the pointer and call the 
	appropiate member function of that class.

	The first two optional application defined callbacks allow monitoring 
	and/or overriding the receive process.  These functions are called from 
	the thread which owns the device they are being called for.

*/
#ifdef FOR_REFERENCE_ONLY
LONG CALLBACK NetcashReceiveRawCB(
	const NetcashDeviceID *pID,		// pointer to NetcashDeviceID for the device
	LONG nBytes,					// number of bytes received
	BYTE *nBuffer,					// pointer to data received
	LONG nAppData					// application defined data
);

#endif

typedef LONG (CALLBACK * NETCASH_RECEIVE_RAW_CALLBACK)(		\
	const NetcashDeviceID *pID,								\
	LONG nBytes,											\
	BYTE *nBuffer,											\
	LONG nAppData											\
);

/*	The NetcashReceiveRawCB function is an application-defined routine called 
	when a device's socket receives data prior to parsing it into a 
	NetcashPacket data structure.  This is mainly intended for debugging
	purposes as it allows you to see the raw data as it comes in.

	The NETCASH_RECEIVE_RAW_CALLBACK type defines a pointer to this callback 
	function. 

	NetcashReceiveRawCB is only an example for the application-defined 
	function and is not contained in the dll.  The function can be named 
	whatever you like, but the parameters and return values must be the same.

	This function should return a non-zero value if processing of the data 
	should continue, or zero if you processed the data yourself.  You must
	return a non-zero value whenever the device's connection state is anything
	other than NETCASH_STATE_CONNECTED.

	Note that the data pointed to by nBuffer will be overwritten once the 
	function returns.  If you need to retain the data, you must copy it into 
	your own buffer.
*/

#ifdef FOR_REFERENCE_ONLY
LONG CALLBACK NetcashReceivePacketCB(
	NetcashPacket *pPacket,			// pointer to data packet
	LONG nAppData					// application defined data
);
#endif

typedef LONG (CALLBACK * NETCASH_RECEIVE_PACKET_CALLBACK)(	\
	NetcashPacket *pPacket,									\
	LONG nAppData											\
);
/*	The NetcashReceivePacketCB function is an application-defined routine 
	called immediately after parsing the received data into a NetcashPacket 
	data structure. 

	The NETCASH_RECEIVE_PACKET_CALLBACK type defines a pointer to this callback 
	function. 

	NetcashReceivePacketCB is only an example for the application-defined 
	function and is not contained in the dll.  The function can be named 
	whatever you like, but the parameters and return values must be the same.

  	This function should return a non-zero value to queue the packet into the 
	unread packets queue (see GetNextUnreadPacket()).  If this function 
	returns zero, the packet will not be added to the unread packet queue and 
	the data in the packet will be overwritten.
*/

/*	A third application defined callback allows more direct handling of 
	connection state changes and/or errors. This function may be called from 
	a thread which does not own the device they are being called for.  The pID
	may be NULL for error event types. */

#ifdef FOR_REFERENCE_ONLY
void CALLBACK NetcashEventCB(
	const NetcashDeviceID *pID,		// pointer to NetcashDeviceID for the device
	LONG nEvent,					// Netcash Event type
	LONG nCode,						// state or error #
	LONG nAppData					// application defined data
);
#endif

typedef void (CALLBACK * NETCASH_EVENT_CALLBACK)(			\
	const NetcashDeviceID *pID,								\
	LONG nEvent,											\
	LONG nCode,												\
	LONG nAppData											\
);
/*	The NetcashEventCB function is an application-defined routine called 
	whenever the connection state changes or when errors are detected.

	The NETCASH_EVENT_CALLBACK type defines a pointer to this callback function. 

	NetcashEventCB is only an example for the application-defined function and 
	is not contained in the dll.  The function can be named whatever you like, 
	but the parameters and return values must be the same.

  	This function does not return a value.  If this function is not defined, a 
	disconnection will be indicated by the creation of an empty NetcashPacket 
	packet for the device, and all other errors and state changes will be 
	ignored.
*/

// InitNetcashThread defined here because the callback typedefs are valid now
HANDLE _stdcall InitNetcashThread(
			LONG nThreadID, 
			LONG nThreadHandle,
			NETCASH_RECEIVE_RAW_CALLBACK pReceiveRawCB,
			NETCASH_RECEIVE_PACKET_CALLBACK pReceivePacketCB, 
			NETCASH_EVENT_CALLBACK pEventCB,
			LONG nAppData,
			LONG nPingTimeout
);


void	_stdcall EndNetcashProcess();
/*	EndNetcashProcess MUST be called before terminating the process in order to 
	free all the memory and	resources allocated by the dll.  Failure to do this
	will result in memory leaks.
*/
 
void	_stdcall EndNetcashThread(LONG nThreadID); 
/* EndNetcashThread should be called when terminating a particular worker 
	thread to free all memory and resources used by it.  This function is 
	called by EndNetcashProcess() and if a thread's end-thread event is 
	signaled.  You do not need to call it upon terminating the process as it 
	is automatically called by EndNetcashProcess() for each thread in the 
	process.

	Note:	Because the functions may create a duplicate handle to a thread,
			any thread object you close with the ExitThread() API function
			may continue to exist until the EndNetcashThread function 
			executes for that thread.
*/

NetcashDeviceID *  _stdcall ConnectNetcashDevice(
	LONG nThreadID, 
	SOCKADDR_IN *sAddress, 
	LONG nAppData
);
/*	ConnectNetcashDevice connects to a device at the address specified. The 
	threadID must be of the thread which will own and handle the 
	communications for this device.
	
	This function returns a pointer to the NetcashDeviceID structure for the 
	device if the device is successfully created and initialized, else returns 
	NULL.

  	If this function is called from the thread specified by the nthreadID, the 
	connection is started immedately.  Otherwise it will be added to a queue 
	for processing the next time the owning thread runs and is waiting for 
	messages (WaitForNetcashPacket()).

	You may only send packets if the connection state is 
	NETCASH_STATE_CONNECTED.  This can be determined by polling the nState 
	member of the NetcashDeviceID if you do not use a NetcashEventCB routine.
*/


int		_stdcall RemoveNetcashDevice(LONG nDevice);
/*	RemoveNetcashDevice will free the memory and resources allocated for the 
	specified device.  
	
	Return codes:
	-1	The device was valid but the connection has not finished closing. 
		You must call DisconnectNetcashDevice() first and wait for either an 
		empty packet from this device or receive the NETCASH_STATE_DISCONNECTED 
		state event before calling RemoveNetcashDevice() again.  See also
		DisconnectNetcashDevice().

	 0	All other failures.

	 1	The calling thread owns the device and the device was successfully 
		deleted.

	 2	The calling thread does not own device and the device was successfully 
		queued to be deleted.  The device will be deleted the next time the 
		owning thread runs and is waiting for messages (WaitForNetcashPacket()).

*/


int		_stdcall DisconnectNetcashDevice(LONG nDevice);
/*	DisconnectNetcashDevice will initiate the closing of a connection with the 
	associated device.  

	This function returns 1 if the device is valid, 0 if not.
	
	Once the connection	is finished closing, if	the NetcashReceivePacketCB is 
	not used, an empty NetcashPacket packet for the device will be queued, 
	otherwise the NetcashReceivePacketCB callback is called with the 
	NETCASH_STATE_DISCONNECTED state event.  

  	If this function is called from the thread which owns the device, the 
	disconnection process is started immediately.  Otherwise it will be added 
	to a queue for processing the next time the owning thread runs and is 
	waiting for messages (WaitForNetcashPacket()).
*/

int		_stdcall SendNetcashPacket( NetcashPacket *pPacket);
/*	SendNetcashPacket queues a packet to be sent to the specified device.

	If this function is called from the thread which owns the device, the 
	packet will be sent immediately.  If this function is called from a 
	thread that does not own the device, it will be added to a queue for 
	processing the next time the owning thread runs and is waiting for 
	messages (WaitForNetcashPacket()).  
	
	This function returns a non-zero value if the packet was either 
	successfully sent or successfully queued for transmission.  If the packet
	cannot be sent for whatever reason, this function returns zero.

*/

int		_stdcall SetThreadPingTimeout( LONG nThreadID, LONG nPingTimeout);
/*	SetThreadPingTimeout allows you to change the ping timeout to a non-zero value
	after it has already been set.

	Ping timeout is in seconds.  Once set to a non-zero value, it can not be 
	set to zero.  Minimum timeout value is 60 seconds.  If a value less than
	60 seconds is given, the function will use 60 seconds without returning 
	an error.

	The ping timeout uses a single waitable system timer to test each device
	if it has been heard from since the last timeout.  If it hasn't, it sends
	a 4 byte ping packet to the device and increments a counter.  Whenever
	it receives a packet from the device, the counter is reset to zero.  If
	the counter reaches four, the state event NETCASH_STATE_PING_TIMEDOUT
	and the netcash error event NETCASH_ERR_LOST_CONNECTION are issued and
	the connection to the device is closed.

	Replys to ping messages sent by this functionality are not queued for 
	GetNextUnreadPacket() retrieval or NetcashReceivePacketCB callbacks.  
	However, the NetcashReceiveRawCB callback will be called when the reply
	is initially processed.

	Setting the ping timeout also sets a similar timeout on the device itself.
	This timeout is set to 4.25 x the ping timeout.  Each time the device 
	receives a packet, the timeout's countdown is restarted.  If the timeout's 
	countdown reaches zero, the unit performs a hardware reset.
	
	This function returns a non-zero value if the timeout is accepted, 
	otherwise it returns zero.

*/

NetcashPacket * _stdcall GetNextUnreadPacket();
/*	GetNextUnreadPacket retreives the next queued packet received by the 
	calling thread.

	If there are no unread packets left in the queue, this function returns 
	NULL.

	If the NetcashReceivePacketCB callback is used and always returns 0, this 
	function will always return NULL.

	Each packet returned will remain valid until you call 
	WaitForNetcashPacket() again within the same thread.  An empty packet 
	(fc = 0) indicates the connection for the device was closed.
*/

int		_stdcall WaitForNetcashPacket(LONG nTimeout);
/*	WaitForNetcashPacket is used to service network IO for all devices owned by
	the thread which it is called from.  This includes forming connections, 
	processing incoming data, processing ping timeouts, processing any queued 
	commands issued from other threads.

	nTimeout is in milliseconds and causes the function to return after the 
	specified time elapses if no packets are received within that time.	 
	However, any processing of received data, queued commands, and ping 
	timeouts are performed before this function returns regardless of what 
	the timeout is set to.

	This function invalidates all packets previously returned by 
	GetNextUnreadPacket() and returns them to a pool for reuse.
	
	This function returns -1 if the thread is about to be terminated, 
	otherwise it returns the number of unread packets waiting in the queue.

	If the NetcashReceivePacketCB callback is used to process the packets and
	always returns 0, WaitForNetcashPacket() will only return due to a timeout or 
	if the thread is being terminated.

*/

/****************************************************************************/
/* Protocol packet field defines                                            */
/****************************************************************************/

/* SOP (1 byte), FC (1byte), DF (1byte), [data (variable),] CS (1 byte) */
#define NAT_STX_BYTE		0	// 1
#define NAT_FC_BYTE			1	// 1
#define NAT_DF_BYTE			2	// 1
#define NAT_DATA_BYTE		3	// 0
#define NAT_DATA8			4	// 4
#define NAT_DATA16			5	// 8
#define NAT_DATA_SLEN		6	// 1
#define NAT_DATA_STR		7	// 40
#define NAT_DATA_XLEN		8	// 1
#define NAT_DATA_DATAX		9	// 44
#define NAT_CS_BYTE			10	// 1

/* Data Format bitmap defines */
#define NAT_DF_NONE		0x00

#define NAT_DF_8BITX	0x03
#define NAT_DF_8BIT1	0x01
#define NAT_DF_8BIT2	0x02
#define NAT_DF_8BIT4	0x03

#define NAT_DF_16BITX	0x0C
#define NAT_DF_16BIT1	0x04
#define NAT_DF_16BIT2	0x08
#define NAT_DF_16BIT4	0x0C

#define NAT_DF_STRING	0x10
#define NAT_DF_XBYTES	0x20
#define NAT_DF_ERROR	0x80

/* Function codes */
#define NAT_A_MYMAC			0x10
#define NAT_A_PING			0x11
#define NAT_A_RESET			0x12
#define NAT_A_SW_VERSION	0x13
#define NAT_A_CLOCK			0x14
#define NAT_A_CON_TIMER		0x15

#define NAT_A_AUTHORIZE		0x20
#define NAT_A_BALANCE		0x21
#define NAT_A_VALUES		0x22
#define NAT_A_COUNTER		0x23
#define NAT_A_SES_START		0x24
#define NAT_A_SES_TIMOUT	0x25
#define NAT_A_SES_END		0x26
#define NAT_A_NEW_PAGE		0x27
#define NAT_A_NEW_VALUE		0x27
#define NAT_A_DISP_BAL		0x28
#define NAT_A_DSP_CARD		0x29

#define NAT_A_CLEAR			0x30
#define NAT_A_DISP_AT		0x31
#define NAT_A_DISP_CHAR		0x32
#define NAT_A_KEY_MODE		0x33
#define NAT_A_KEY_TIMEOUT	0x34
#define NAT_A_USER_DATA		0x35
#define NAT_A_FLTR_ACCNT	0x36
#define NAT_A_CURRENCY		0x37
#define NAT_A_RECEIPT		0x38

#define NAT_A_PL_CONFIG		0x40
#define NAT_A_RELAY_CONFIG	0x41
#define NAT_A_PL_BLIND		0x42
#define NAT_A_PL_LENGTH		0x43
#define NAT_A_PL_POL		0x44
#define NAT_A_MY_IP			0x45
#define NAT_A_MY_NETMASK	0x46
#define NAT_A_MY_GATEWAY	0x47
#define NAT_A_MY_PORT		0x48
#define NAT_A_DHCP			0x49
#define NAT_A_LOCATION		0x4A
#define NAT_A_ENCRYPT_KEY	0x4B
#define	NAT_A_BNC_VALUES	0x4C
#define	NAT_A_BNC_ENABLES	0x4D
#define	NAT_A_BNC_STATUS	0x4E

#define NAT_A_NUM_TRANS		0x60
#define NAT_A_GET_TRANS		0x61
#define NAT_A_CLEAR_TRANS	0x62
#define NAT_A_OL_CONFIG		0x63
#define NAT_A_OL_MAX_VALUE	0x64
#define NAT_A_OL_MODE		0x65
#define NAT_A_OOS_MSG		0x66
#define NAT_A_ACCNT_ADD		0x67
#define NAT_A_ACCNT_CLEAR	0x68

/* Error codes */
#define NAT_ERR_CHECKSUM		0x00
#define NAT_ERR_BAD_CODE		0x01
#define NAT_ERR_DATA_MISSING	0x02
#define NAT_ERR_DATA_BAD		0x03
#define NAT_ERR_OOR				0x04
#define NAT_ERR_STR_LEN_OOR		0x05
#define NAT_ERR_SET_ACCOUNT		0x06
#define NAT_ERR_SET_CLOCK		0x07

/* NAT_A_SES_END codes */
#define NAT_SES_END_USER	0x01 // User ended session.
#define NAT_SES_END_FUNDS	0x02 // Out of funds
#define NAT_SES_END_SERVER	0x03 // Server ended session.
#define NAT_SES_END_TIMEOUT	0x04 // Session timeout
#define NAT_SES_END_RESET	0x05 // Reset command received
#define NAT_SES_END_JAM		0x06 // paper jam
#define NAT_SES_END_BNC		0x07 // bill or coin error

#endif // INC_NETCASH_LIB_H

/*
#ifdef VB_DEFS
Public Type sockaddr_in
    sin_family       As Integer
    sin_port         As Integer
    sin_addr         As Long
    sin_zero(1 To 8) As Byte
End Type


Public Type SYSTEMTIME
    wYear as Integer
    wMonth  as Integer
    wDayOfWeek as Integer
    wDay as Integer 
    wHour as Integer
    wMinute as Integer
    wSecond as Integer
    wMilliseconds as Integer
} SYSTEMTIME; 

Public Type NETDEVICEINFO
	SockAddr As SOCKADDR_IN 
	nPort As Long
	nMACAddress (1 to 6) As Byte 
	strModel As String * 9
	strImageType As String * 12
	nVersionMajor As Byte
	nVersionMinor As Byte
	CompTime As SYSTEMTIME
End Type

Public Type NETCASHPACKET
	fc As Byte
	df As Byte
	data8 (1 to 4) As Byte
	data16 (1 to 4) As Long
	lenS As Byte
	dataS As String * 41
	lenX As Byte
	dataX (1 to 44) As Byte
End Type

#endif
*/
