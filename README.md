
# 📡 WlanAPI.nim
Most Of The Nim Bindings For **WlanAPI**, Can be Used to Make Things Like **Wifi Information Extractors** in **Nim**.
## 👀 Examples
```nim
var WLAN_PROFILE_GET_PLAINTEXT_KEY : DWORD = 0x04.DWORD
var negVersion: DWORD = 0.DWORD
var hClient: HANDLE
var res = WlanOpenHandle(
  1.DWORD, NULL, addr negVersion, addr hClient
)
var interfacesList: ptr WLAN_INTERFACE_INFO_LIST
var res2 = WlanEnumInterfaces(
  hClient, NULL, addr interfacesList
)
......
```
