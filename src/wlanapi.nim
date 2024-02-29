import winim
type
  WLAN_INTERFACE_STATE = enum
    wlan_interface_state_not_ready = 0,
    wlan_interface_state_connected = 1,
    wlan_interface_state_ad_hoc_network_formed = 2,
    wlan_interface_state_disconnecting = 3,
    wlan_interface_state_disconnected = 4,
    wlan_interface_state_associating = 5,
    wlan_interface_state_discovering = 6,
    wlan_interface_state_authenticating = 7

  WLAN_INTERFACE_INFO = object
    InterfaceGuid: GUID
    strInterfaceDescription: array[256, WCHAR]
    isState: WLAN_INTERFACE_STATE

  WLAN_INTERFACE_INFO_LIST = object
    dwNumberOfItems: DWORD
    dwIndex: DWORD
    InterfaceInfo: array[10, WLAN_INTERFACE_INFO]
  WLAN_PROFILE_INFO = object
    strProfileName: array[256,WCHAR]
    dwFlags: DWORD
  WLAN_PROFILE_INFO_LIST = object
    dwNumberOfItems: DWORD
    dwIndex: DWORD
    ProfileInfo: array[10,WLAN_PROFILE_INFO]

  PWLAN_INTERFACE_INFO_LIST = ptr WLAN_INTERFACE_INFO_LIST

proc WlanOpenHandle(dwClientVersion: DWORD, pReserved: PVOID, pdwNegotiatedVersion: PDWORD, phClientHandle: PHANDLE): DWORD {.importc, dynlib: "wlanapi", stdcall.}

proc WlanEnumInterfaces(
  hClientHandle: HANDLE, pReserved: PVOID, ppInterfaceList: ptr PWLAN_INTERFACE_INFO_LIST
): DWORD {.importc, dynlib: "wlanapi", stdcall.}

proc WlanGetProfileList(
  hClientHandle: HANDLE, pInterfaceGuid: ptr GUID, pReserved: PVOID,
  ppInterfaceList: ptr ptr WLAN_PROFILE_INFO_LIST
): DWORD {.importc, dynlib: "wlanapi", stdcall.}

proc WlanGetProfile(
    hClientHandle: HANDLE, pInterfaceGuid: ptr GUID, strProfileName : LPCWSTR, pReserved: PVOID , pstrProfileXml : ptr LPWSTR , pdwFlags : ptr DWORD , pdwGrantedAccess : ptr DWORD): DWORD {.importc, dynlib: "wlanapi", stdcall.}
