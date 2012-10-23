
#ifndef _MYUSTRNG_H_
#define _MYUSTRNG_H_
#include <windows.h>
#include <string.h>
#include <tchar.h>

#define USTR_INIT_SIZE 100
#define MYERR_NOMEM 1

class MUString {

	private:
		WCHAR m_DefBuffer[USTR_INIT_SIZE+1];
		LPWSTR m_lpBuffer;
		size_t m_Length;
		
  public:

    MUString() {
			m_lpBuffer = NULL;
      Reset();
    }

    MUString(LPCSTR lp) {
			m_lpBuffer = NULL;
      Reset();
      Set(lp);
		}
    
		MUString(LPCSTR lp, size_t len) {
			m_lpBuffer = NULL;
      Reset();
      Set(lp, len);
    }
		
		MUString(LPCWSTR lp) {
			m_lpBuffer = NULL;
      Reset();
      Set(lp);
		}
    
		MUString(LPCWSTR lp, size_t len) {
			m_lpBuffer = NULL;
      Reset();
      Set(lp, len);
    }
    
    ~MUString() {Reset();}

    size_t Length() {return m_Length;}
	  
		LPWSTR Deref() {return m_lpBuffer ? m_lpBuffer : m_DefBuffer;}

    void Reset() {
			m_DefBuffer[0] = m_DefBuffer[USTR_INIT_SIZE] = 0;
			if (m_lpBuffer) {
				free(m_lpBuffer);
				m_lpBuffer = NULL;
			}
			m_Length = 0;
		}

    int Set(LPCSTR lpStr) {
		  if ( ! lpStr) lpStr = "";
		  return Set(lpStr, strlen(lpStr));
	  }

    int Set(LPCWSTR lpStr) {
		  if ( ! lpStr) lpStr = L"";
		  return Set(lpStr, wcslen(lpStr));
	  }
	  

	  int Set(LPCSTR lpStr, size_t len) {

		  Reset();
			
		  if (len <= USTR_INIT_SIZE) {

        MultiByteToWideChar(CP_ACP, 0, lpStr, len, m_DefBuffer, USTR_INIT_SIZE+1);
        m_DefBuffer[len] = 0;
		  
			} else {          
				
				m_lpBuffer = (LPWSTR)malloc(2*len+2);
				if ( ! m_lpBuffer) return MYERR_NOMEM;
        MultiByteToWideChar(CP_ACP, 0, lpStr, len, m_lpBuffer, len+1);
				m_lpBuffer[len] = 0;
			}

			m_Length = len;
			return 0;
	  }
	  
	  int Set(LPCWSTR lpStr, size_t len) {

		  Reset();
			
		  if (len <= USTR_INIT_SIZE) {

			  memcpy((LPWSTR)m_DefBuffer, lpStr, 2*len);
				m_Length = len;
        m_DefBuffer[len] = 0;
		  
			} else {          
				
				m_lpBuffer = (LPWSTR)malloc(2*len+2);
				if ( ! m_lpBuffer) return MYERR_NOMEM;
			  memcpy(m_lpBuffer, lpStr, 2 * len);
				m_lpBuffer[len] = 0;
			}

			m_Length = len;
			return 0;
		}
};

class MAString {

	private:
		char m_DefBuffer[2*USTR_INIT_SIZE+1];
		LPSTR m_lpBuffer;
		size_t m_Length;

	public:

    MAString() {
			m_lpBuffer = NULL;
			m_Length = 0;
		}

    MAString(LPCWSTR lp) {
			m_lpBuffer = NULL;
      Reset();
      Set(lp);
		}
    
		MAString(LPCWSTR lp, size_t len) {
			m_lpBuffer = NULL;
      Reset();
      Set(lp, len);
    }

		~MAString() {Reset();}

		LPSTR Deref() {return m_lpBuffer ? m_lpBuffer : m_DefBuffer;}

    size_t Length() {
			return m_Length;
		}

    void Reset() {
			m_DefBuffer[0] = m_DefBuffer[USTR_INIT_SIZE] = 0;
			if (m_lpBuffer) {
				free(m_lpBuffer);
				m_lpBuffer = NULL;
			}
			m_Length = 0;
		}

    int Set(LPCWSTR lpStr) {
		  if ( ! lpStr) lpStr = L"";
		  return Set(lpStr, wcslen(lpStr));
	  }

		int Set(LPCWSTR lpStr, size_t len) {

			if (!lpStr)

		  Reset();
			
		  if (len <= USTR_INIT_SIZE) {

    		m_Length = WideCharToMultiByte(CP_ACP, 0, lpStr, len, m_DefBuffer, sizeof(m_DefBuffer), NULL, NULL);
    		m_DefBuffer[m_Length] = 0;
		  
			} else {          
				
				m_lpBuffer = (LPSTR)malloc(2*len+1);
				if ( ! m_lpBuffer) return MYERR_NOMEM;
    		m_Length = WideCharToMultiByte(CP_ACP, 0, lpStr, len, m_lpBuffer, 2*len+1, NULL, NULL);
    		m_lpBuffer[m_Length] = 0;
			}

			return 0;
		}
};

#endif //_MYUSTRNG_H_




