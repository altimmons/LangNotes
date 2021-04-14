Commands Stripped from gatherNetworkInfo

'-------------------------------------sorted------------------------------------------------
 These are maximally cleaned and sorted and may have errors.
 
 
 RunDumpWcnCache
'c:\Windows\System32>grep "\s*cmd = \"cmd /c " ./gatherNetworkInfo.vbs | clip
'Microsoft-Windows-Windows Firewall With Advanced Security/ConnectionSecurityVerbose
"& commandname &" "& filename &" , RunDumpWcnCache
arp -a 
certutil -v -enterprise -store -silent NTAuth
certutil -v -store -silent -user My
certutil -v -store -silent My
certutil -v -store -silent root
certutil -v -user -store -silent root
dispdiag -out dispdiag_stop.dat
dxdiag /t 
dxdiag /t dxdiag.txt
gpresult /scope:computer /v 
ipconfig /all
ipconfig /displaydns 
nbtstat -c 
nbtstat -n 
net config rdr 
net config srv 
net share 
netcfg -m
netsh advfirewall consec show rule name=all verbose
netsh advfirewall firewall show rule name=all verbose
netsh advfirewall monitor show consec
netsh advfirewall monitor show consec rule name=all
netsh advfirewall monitor show currentprofile
netsh advfirewall monitor show firewall
netsh advfirewall monitor show firewall rule name=all
netsh advfirewall show currentprofile
netsh int ipv6 show neigh 
netsh interface httpstunnel show interface
netsh interface httpstunnel show statistics
netsh interface teredo show state
netsh lan show interfaces
netsh lan show profiles
netsh lan show settings
netsh mbn show capability interface=*
netsh mbn show interfaces
netsh mbn show profile name=* interface=*
netsh mbn show readyinfo interface=*
netsh namespace show effective 
netsh namespace show policy 
netsh wfp show filters file=
netsh wfp show netevents file=
netsh wfp show state file=
netsh wfp show sysports file=
netsh winsock show catalog 
netsh wl show d 
netsh wl show i 
netsh wlan sho net m=b 
netsh wlan show all 
netsh wlan show device
netsh wlan show interfaces 
netsh wlan show wlanreport
netsh.exe winsock show catalog
objShell.Run cmd, 0, True
powercfg.exe /batteryreport /output
reg export 
reg query HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\wcncsvc\Parameters
Reg.exe Export HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\EnterpriseDataProtection\Policies
Reg.exe Export HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PolicyManager\Providers 
Reg.exe Export HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\HomeGroupListener
Reg.exe Export HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\HomeGroupProvider
reg.exe query ""hklm\system\CurrentControlSet\Services\Winsock\Setup Migration"" /v ""Provider List""
reg.exe query hklm\system\CurrentControlSet\Services\Winsock\Parameters /v Transports
route print
sc query eaphost 
sc query fdrespub 
sc query upnphost  
sc query wcncsvc 
sc query wlansvc 
sc.exe qc dhcp
sc.exe qc nativewifip
sc.exe qc wlansvc
sc.exe queryex dhcp
sc.exe queryex nativewifip
sc.exe queryex wlansvc
set processor
set u
systeminfo
tasklist /svc 
time /t 
wevtutil al
wevtutil epl
wevtutil epl ""Microsoft-Windows-Hyper-V-VMMS-Networking""
wevtutil epl ""Microsoft-Windows-Wcmsvc/Operational""
wevtutil epl ""Microsoft-Windows-Windows Firewall With Advanced Security/ConnectionSecurity
wevtutil epl ""Microsoft-Windows-Windows Firewall With Advanced Security/ConnectionSecurityVerbose""
wevtutil epl ""Microsoft-Windows-Windows Firewall With Advanced Security/Firewall""
wevtutil epl ""Microsoft-Windows-Windows Firewall With Advanced Security/FirewallVerbose"" 
wevtutil epl ""Microsoft-Windows-WLAN-AutoConfig/Operational""
wevtutil epl ""Microsoft-Windows-WWAN-SVC-EVENTS/Operational""
wevtutil epl Application
wevtutil epl Microsoft-Windows-Windows Firewall With Advanced Security/Firewall
wevtutil epl System 
wevtutil epl System /q:""*[System[Provider[@Name='Microsoft-Windows-Hyper-V-VmSwitch']]]"" 
wmic qfe


'=================================================================================================
(.*?)(cmd = "cmd /c )(.*?)( >> ".*$)*

set processor
systeminfo
set u
dxdiag /t dxdiag.txt
dispdiag -out dispdiag_stop.dat
time /t 
netsh wl show i 
netsh wl show d 
netsh wlan show interfaces 
netsh wlan sho net m=b 
sc query wcncsvc 
sc query wlansvc 
sc query eaphost 
sc query fdrespub 
sc query upnphost  
sc query eaphost 
ipconfig /all
netsh wlan show device
reg query HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\wcncsvc\Parameters
"& commandname &" "& filename &" , RunDumpWcnCache
netsh advfirewall show currentprofile
tasklist /svc 
wevtutil epl ""Microsoft-Windows-WLAN-AutoConfig/Operational"" 
wevtutil al
wevtutil epl ""Microsoft-Windows-WWAN-SVC-EVENTS/Operational""
wevtutil epl ""Microsoft-Windows-Wcmsvc/Operational"" 
wevtutil al 
netsh wlan show all 
netsh lan show interfaces
netsh lan show settings
netsh lan show profiles
netsh mbn show interfaces
netsh mbn show profile name=* interface=*
netsh mbn show readyinfo interface=*
netsh mbn show capability interface=*
ipconfig /all
certutil -v -store -silent My
certutil -v -store -silent -user My
certutil -v -store -silent root
certutil -v -enterprise -store -silent NTAuth
certutil -v -user -store -silent root
reg export
netsh winsock show catalog 
echo Current Profiles: 
echo ------------------------------------------------------------------------
netsh advfirewall monitor show currentprofile
echo Firewall Configuration:
echo ------------------------------------------------------------------------
netsh advfirewall monitor show firewall
echo Connection Security  Configuration:
echo ------------------------------------------------------------------------
netsh advfirewall monitor show consec
echo Firewall Rules :
echo ------------------------------------------------------------------------
netsh advfirewall firewall show rule name=all verbose
echo Connection Security  Rules :
echo ------------------------------------------------------------------------
netsh advfirewall consec show rule name=all verbose
echo Firewall Rules currently enforced : 
echo ------------------------------------------------------------------------
netsh advfirewall monitor show firewall rule name=all
echo Connection Security Rules currently enforced :
echo ------------------------------------------------------------------------
netsh advfirewall monitor show consec rule name=all
wevtutil epl Microsoft-Windows-Windows Firewall With Advanced Security/Firewall
wevtutil al
wevtutil epl ""Microsoft-Windows-Windows Firewall With Advanced Security/ConnectionSecurity
wevtutil al 
wevtutil al 
wevtutil epl
'Microsoft-Windows-Windows Firewall With Advanced Security/ConnectionSecurityVerbose
wevtutil al 
netsh wfp show filters file=
netsh interface teredo show state
netsh interface httpstunnel show interface
netsh interface httpstunnel show statistics
gpresult /scope:computer /v 
netsh wfp show netevents file=
netsh wfp show state file=
netsh wfp show sysports file=
wevtutil epl System /q:""*[System[Provider[@Name='Microsoft-Windows-Hyper-V-VmSwitch']]]""
wevtutil al 
wevtutil epl ""Microsoft-Windows-Hyper-V-VMMS-Networking""
wevtutil al
wevtutil epl Application
wevtutil al  
wevtutil epl System
wevtutil al  
wevtutil al 


wevtutil epl System /q:""*[System[Provider[@Name='Microsoft-Windows-Hyper-V-VmSwitch']]]""
wevtutil al
objShell.Run cmd, 0, True
wmic qfe
netcfg -m
reg.exe query hklm\system\CurrentControlSet\Services\Winsock\Parameters /v Transports
reg.exe query ""hklm\system\CurrentControlSet\Services\Winsock\Setup Migration"" /v ""Provider List""
netsh.exe winsock show catalog
Reg.exe Export HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\EnterpriseDataProtection\Policies
Reg.exe Export HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PolicyManager\Providers
Reg.exe Export HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\HomeGroupListener
Reg.exe Export HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\HomeGroupProvider
sc.exe queryex nativewifip
sc.exe qc nativewifip
sc.exe queryex wlansvc
sc.exe qc wlansvc
sc.exe queryex dhcp
sc.exe qc dhcp
netsh wlan show wlanreport
powercfg.exe /batteryreport /output

'c:\Windows\System32>grep "\s*cmd = \"cmd /c " ./gatherNetworkInfo.vbs | clip

set processor
systeminfo
set u
dxdiag /t 
dispdiag -out dispdiag_stop.dat
time /t 
netsh wl show i 
netsh wl show d 
netsh wlan show interfaces 
netsh wlan sho net m=b 
sc query wcncsvc 
sc query wlansvc 
sc query eaphost 
sc query fdrespub 
sc query upnphost  
sc query eaphost 
ipconfig /all
netsh wlan show device
reg query HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\wcncsvc\Parameters
 RunDumpWcnCache
netsh advfirewall show currentprofile
tasklist /svc 
wevtutil epl ""Microsoft-Windows-WLAN-AutoConfig/Operational""
wevtutil al
wevtutil epl ""Microsoft-Windows-WWAN-SVC-EVENTS/Operational""
wevtutil al
wevtutil epl ""Microsoft-Windows-Wcmsvc/Operational""
wevtutil al
netsh wlan show all 
netsh lan show interfaces
netsh lan show settings
netsh lan show profiles
netsh mbn show interfaces
netsh mbn show profile name=* interface=*
netsh mbn show readyinfo interface=*
netsh mbn show capability interface=*
ipconfig /all
certutil -v -store -silent My
certutil -v -store -silent -user My
certutil -v -store -silent root
certutil -v -enterprise -store -silent NTAuth
certutil -v -user -store -silent root
reg export 
netsh winsock show catalog  
echo ------------------------------------------------------------------------
netsh advfirewall monitor show currentprofile
echo Firewall Configuration:
echo ------------------------------------------------------------------------
netsh advfirewall monitor show firewall
echo Connection Security  Configuration:
echo ------------------------------------------------------------------------
netsh advfirewall monitor show consec
echo Firewall Rules :
echo ------------------------------------------------------------------------
netsh advfirewall firewall show rule name=all verbose
echo Connection Security  Rules :
echo ------------------------------------------------------------------------
netsh advfirewall consec show rule name=all verbose
echo Firewall Rules currently enforced : 
echo ------------------------------------------------------------------------
netsh advfirewall monitor show firewall rule name=all
echo Connection Security Rules currently enforced :
echo ------------------------------------------------------------------------
netsh advfirewall monitor show consec rule name=all


wevtutil epl ""Microsoft-Windows-WLAN-AutoConfig/Operational"" 
wevtutil epl ""Microsoft-Windows-WWAN-SVC-EVENTS/Operational""
wevtutil epl ""Microsoft-Windows-Wcmsvc/Operational"" 
wevtutil epl ""Microsoft-Windows-Windows Firewall With Advanced Security/Firewall""
wevtutil epl ""Microsoft-Windows-Windows Firewall With Advanced Security/ConnectionSecurity"" 
wevtutil epl ""Microsoft-Windows-Windows Firewall With Advanced Security/FirewallVerbose"" 
wevtutil epl ""Microsoft-Windows-Windows Firewall With Advanced Security/ConnectionSecurityVerbose""
wevtutil epl System /q:""*[System[Provider[@Name='Microsoft-Windows-Hyper-V-VmSwitch']]]"" 
wevtutil epl ""Microsoft-Windows-Hyper-V-VMMS-Networking"" 
wevtutil epl Application 
wevtutil epl System 
wevtutil al 

wmic qfe
netcfg -m
reg.exe query hklm\system\CurrentControlSet\Services\Winsock\Parameters /v Transports
reg.exe query ""hklm\system\CurrentControlSet\Services\Winsock\Setup Migration"" /v ""Provider List""
netsh.exe winsock show catalog
Reg.exe Export HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\EnterpriseDataProtection\Policies
Reg.exe Export HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PolicyManager\Providers 
Reg.exe Export HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\HomeGroupListener
Reg.exe Export HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\HomeGroupProvider 
sc.exe queryex nativewifip
sc.exe qc nativewifip
sc.exe queryex wlansvc
sc.exe qc wlansvc
sc.exe queryex dhcp
sc.exe qc dhcp
netsh wlan show wlanreport
powercfg.exe /batteryreport /output

echo ROUTE PRINT:
route print
echo IPCONFIG /DISPLAYDNS:  
ipconfig /displaydns 
echo.  
echo NETSH NAMESPACE SHOW EFFECTIVE: 
netsh namespace show effective 
echo. 
echo NETSH NAMESPACE SHOW POLICY: 
netsh namespace show policy 
echo ARP -A: 
arp -a 
echo. 
echo NETSH INT IPV6 SHOW NEIGHBORS: 
netsh int ipv6 show neigh 
echo NBTSTAT -N: 
nbtstat -n 
echo. 
echo NBTSTAT -C: 
nbtstat -c 
echo. 
echo NET CONFIG RDR: 
net config rdr 
echo. 
echo NET CONFIG SRV: 
net config srv 
echo The Server service is not running. 
echo. 
echo NET SHARE: 
net share 
echo The Server service is not running. 

 








'-------------------------------------RAW------------------------------------------------


grep "\s*cmd = \"cmd /c " ./gatherNetworkInfo.vbs
    cmd = "cmd /c " + CommandString + " >> " + OutputFile
    cmd = "cmd /c set processor >> " & outputFileName
    cmd = "cmd /c systeminfo >> " & outputFileName
    cmd = "cmd /c set u >> " & outputFileName
    cmd = "cmd /c dxdiag /t dxdiag.txt"
    cmd = "cmd /c dispdiag -out dispdiag_stop.dat"
    cmd = "cmd /c time /t  >> " & outputFileName
    cmd = "cmd /c netsh wl show i  >> " & outputFileName
    cmd = "cmd /c netsh wl show d  >> " & outputFileName
    cmd = "cmd /c netsh wlan show interfaces  >> " & outputFileName
    cmd = "cmd /c netsh wlan sho net m=b  >> " & outputFileName
    cmd = "cmd /c sc query wcncsvc  >> " & outputFileName
    cmd = "cmd /c sc query wlansvc  >> " & outputFileName
    cmd = "cmd /c sc query eaphost  >> " & outputFileName
    cmd = "cmd /c sc query fdrespub  >> " & outputFileName
    cmd = "cmd /c sc query upnphost   >> " & outputFileName
    cmd = "cmd /c sc query eaphost  >> " & outputFileName
    cmd = "cmd /c ipconfig /all >> " & outputFileName
    cmd = "cmd /c netsh wlan show device >> " & outputFileName
    cmd = "cmd /c reg query HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\wcncsvc\Parameters >> " & outputFileName
'    cmd = "cmd /c "& commandname &" "& filename &" , RunDumpWcnCache >> " & outputFileName
    cmd = "cmd /c netsh advfirewall show currentprofile >> " & outputFileName
    cmd = "cmd /c tasklist /svc > " & processes
    cmd = "cmd /c wevtutil epl ""Microsoft-Windows-WLAN-AutoConfig/Operational"" " & logFileName
    cmd = "cmd /c wevtutil al " & logFileName
    cmd = "cmd /c wevtutil epl ""Microsoft-Windows-WWAN-SVC-EVENTS/Operational"" " & logFileName
    cmd = "cmd /c wevtutil al " & logFileName
    cmd = "cmd /c wevtutil epl ""Microsoft-Windows-Wcmsvc/Operational"" " & logFileName
    cmd = "cmd /c wevtutil al " & logFileName
    cmd = "cmd /c netsh wlan show all > " & outputFileName
    cmd = "cmd /c netsh lan show interfaces >> " & outputFileName
    cmd = "cmd /c netsh lan show settings >> " & outputFileName
    cmd = "cmd /c netsh lan show profiles >> " & outputFileName
    cmd = "cmd /c netsh mbn show interfaces >> " & outputFileName
    cmd = "cmd /c netsh mbn show profile name=* interface=* >> " & outputFileName
    cmd = "cmd /c netsh mbn show readyinfo interface=* >> " & outputFileName
    cmd = "cmd /c netsh mbn show capability interface=* >> " & outputFileName
    cmd = "cmd /c ipconfig /all >> " & outputFileName
    cmd = "cmd /c certutil -v -store -silent My >> " & outputFileName
    cmd = "cmd /c certutil -v -store -silent -user My >> " & outputFileName
    cmd = "cmd /c certutil -v -store -silent root >> " & outputFileName
    cmd = "cmd /c certutil -v -enterprise -store -silent NTAuth >> " & outputFileName
    cmd = "cmd /c certutil -v -user -store -silent root >> " & outputFileName
    cmd = "cmd /c reg export " & regpath & "  " & outputFileName & " /y"
    cmd = "cmd /c netsh winsock show catalog > " & outputFileName
    cmd = "cmd /c echo Current Profiles: > " & configFileName
    cmd = "cmd /c echo ------------------------------------------------------------------------ >> " & configFileName
    cmd = "cmd /c netsh advfirewall monitor show currentprofile >> " & configFileName
    cmd = "cmd /c echo Firewall Configuration: >> " & configFileName
    cmd = "cmd /c echo ------------------------------------------------------------------------ >> " & configFileName
    cmd = "cmd /c netsh advfirewall monitor show firewall >> " & configFileName
    cmd = "cmd /c echo Connection Security  Configuration: >> " & configFileName
    cmd = "cmd /c echo ------------------------------------------------------------------------ >> " & configFileName
    cmd = "cmd /c netsh advfirewall monitor show consec >> " & configFileName
    cmd = "cmd /c echo Firewall Rules : >> " & configFileName
    cmd = "cmd /c echo ------------------------------------------------------------------------ >> " & configFileName
    cmd = "cmd /c netsh advfirewall firewall show rule name=all verbose >> " & configFileName
    cmd = "cmd /c echo Connection Security  Rules : >> " & configFileName
    cmd = "cmd /c echo ------------------------------------------------------------------------ >> " & configFileName
    cmd = "cmd /c netsh advfirewall consec show rule name=all verbose >> " & configFileName
    cmd = "cmd /c echo Firewall Rules currently enforced : > " & effectiveRulesFileName
    cmd = "cmd /c echo ------------------------------------------------------------------------ >> " & effectiveRulesFileName
    cmd = "cmd /c netsh advfirewall monitor show firewall rule name=all >> " & effectiveRulesFileName
    cmd = "cmd /c echo Connection Security Rules currently enforced : >> " & effectiveRulesFileName
    cmd = "cmd /c echo ------------------------------------------------------------------------ >> " & effectiveRulesFileName
    cmd = "cmd /c netsh advfirewall monitor show consec rule name=all >> " & effectiveRulesFileName
    cmd = "cmd /c wevtutil epl ""Microsoft-Windows-Windows Firewall With Advanced Security/Firewall"" " & logFileName
    cmd = "cmd /c wevtutil al " & logFileName
    cmd = "cmd /c wevtutil epl ""Microsoft-Windows-Windows Firewall With Advanced Security/ConnectionSecurity"" " & consecLogFileName
    cmd = "cmd /c wevtutil al " & consecLogFileName
    cmd = "cmd /c wevtutil epl ""Microsoft-Windows-Windows Firewall With Advanced Security/FirewallVerbose"" " & logFileNameVerbose
    cmd = "cmd /c wevtutil al " & logFileNameVerbose
    cmd = "cmd /c wevtutil epl ""Microsoft-Windows-Windows Firewall With Advanced Security/ConnectionSecurityVerbose"" " & consecLogFileNameVerbose
    cmd = "cmd /c wevtutil al " & consecLogFileNameVerbose
    cmd = "cmd /c netsh wfp show filters file=" & outputFileName & " > " & logFileName
    cmd = "cmd /c netsh interface teredo show state > " & outputFileName
    cmd = "cmd /c netsh interface httpstunnel show interface >> " & outputFileName
    cmd = "cmd /c netsh interface httpstunnel show statistics >> " & outputFileName
    cmd = "cmd /c gpresult /scope:computer /v 1> " & logFileName & " 2>&1"
    cmd = "cmd /c netsh wfp show netevents file=" & outputFileName & " 1> " & logFileName & " 2>&1"
    cmd = "cmd /c netsh wfp show state file=" & outputFileName & " 1> " & logFileName & " 2>&1"
    cmd = "cmd /c netsh wfp show sysports file=" & outputFileName & " 1> " & logFileName & " 2>&1"
    cmd = "cmd /c wevtutil epl System /q:""*[System[Provider[@Name='Microsoft-Windows-Hyper-V-VmSwitch']]]"" " & vmswitchlogFileName
    cmd = "cmd /c wevtutil al " & vmswitchlogFileName
    cmd = "cmd /c wevtutil epl ""Microsoft-Windows-Hyper-V-VMMS-Networking"" " & vmmslogFileName
    cmd = "cmd /c wevtutil al " & vmmslogFileName
    cmd = "cmd /c wevtutil epl Application " & logFileName
    cmd = "cmd /c wevtutil al " & logFileName
    cmd = "cmd /c wevtutil epl System " & logFileName
    cmd = "cmd /c wevtutil al " & logFileName
    cmd = "cmd /c wmic qfe >> " & outputFileName
    cmd = "cmd /c netcfg -m >> " & outputFileName
    cmd = "cmd /c reg.exe query hklm\system\CurrentControlSet\Services\Winsock\Parameters /v Transports >> " & outputFileName
    cmd = "cmd /c reg.exe query ""hklm\system\CurrentControlSet\Services\Winsock\Setup Migration"" /v ""Provider List"" >> " & outputFileName
    cmd = "cmd /c netsh.exe winsock show catalog >> " & outputFileName
    cmd = "cmd /c Reg.exe Export HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\EnterpriseDataProtection\Policies " & outputFileName & " /y /Reg:64"
    cmd = "cmd /c Reg.exe Export HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PolicyManager\Providers " & outputFileName & " /y /Reg:64"
    cmd = "cmd /c Reg.exe Export HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\HomeGroupListener " & outputFileName & " /y /Reg:64"
    cmd = "cmd /c Reg.exe Export HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\HomeGroupProvider " & outputFileName & " /y /Reg:64"
    cmd = "cmd /c sc.exe queryex nativewifip >> " & outputFileName
    cmd = "cmd /c sc.exe qc nativewifip >> " & outputFileName
    cmd = "cmd /c sc.exe queryex wlansvc >> " & outputFileName
    cmd = "cmd /c sc.exe qc wlansvc >> " & outputFileName
    cmd = "cmd /c sc.exe queryex dhcp >> " & outputFileName
    cmd = "cmd /c sc.exe qc dhcp >> " & outputFileName
    cmd = "cmd /c netsh wlan show wlanreport"
    cmd = "cmd /c powercfg.exe /batteryreport /output " & batteryReportFilename

c:\Windows\System32>grep "\s*cmd = \"cmd /c " ./gatherNetworkInfo.vbs | clip
./gatherNetworkInfo.vbs:    cmd = "cmd /c " + CommandString + " >> " + OutputFile
./gatherNetworkInfo.vbs:    cmd = "cmd /c set processor >> " & outputFileName
./gatherNetworkInfo.vbs:    cmd = "cmd /c systeminfo >> " & outputFileName
./gatherNetworkInfo.vbs:    cmd = "cmd /c set u >> " & outputFileName
./gatherNetworkInfo.vbs:    cmd = "cmd /c dxdiag /t dxdiag.txt"
./gatherNetworkInfo.vbs:    cmd = "cmd /c dispdiag -out dispdiag_stop.dat"
./gatherNetworkInfo.vbs:    cmd = "cmd /c time /t  >> " & outputFileName
./gatherNetworkInfo.vbs:    cmd = "cmd /c netsh wl show i  >> " & outputFileName
./gatherNetworkInfo.vbs:    cmd = "cmd /c netsh wl show d  >> " & outputFileName
./gatherNetworkInfo.vbs:    cmd = "cmd /c netsh wlan show interfaces  >> " & outputFileName
./gatherNetworkInfo.vbs:    cmd = "cmd /c netsh wlan sho net m=b  >> " & outputFileName
./gatherNetworkInfo.vbs:    cmd = "cmd /c sc query wcncsvc  >> " & outputFileName
./gatherNetworkInfo.vbs:    cmd = "cmd /c sc query wlansvc  >> " & outputFileName
./gatherNetworkInfo.vbs:    cmd = "cmd /c sc query eaphost  >> " & outputFileName
./gatherNetworkInfo.vbs:    cmd = "cmd /c sc query fdrespub  >> " & outputFileName
./gatherNetworkInfo.vbs:    cmd = "cmd /c sc query upnphost   >> " & outputFileName
./gatherNetworkInfo.vbs:    cmd = "cmd /c sc query eaphost  >> " & outputFileName
./gatherNetworkInfo.vbs:    cmd = "cmd /c ipconfig /all >> " & outputFileName
./gatherNetworkInfo.vbs:    cmd = "cmd /c netsh wlan show device >> " & outputFileName
./gatherNetworkInfo.vbs:    cmd = "cmd /c reg query HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\wcncsvc\Parameters >> " & outputFileName
./gatherNetworkInfo.vbs:'    cmd = "cmd /c "& commandname &" "& filename &" , RunDumpWcnCache >> " & outputFileName
./gatherNetworkInfo.vbs:    cmd = "cmd /c netsh advfirewall show currentprofile >> " & outputFileName
./gatherNetworkInfo.vbs:    cmd = "cmd /c tasklist /svc > " & processes
./gatherNetworkInfo.vbs:    cmd = "cmd /c wevtutil epl ""Microsoft-Windows-WLAN-AutoConfig/Operational"" " & logFileName
./gatherNetworkInfo.vbs:    cmd = "cmd /c wevtutil al " & logFileName
./gatherNetworkInfo.vbs:    cmd = "cmd /c wevtutil epl ""Microsoft-Windows-WWAN-SVC-EVENTS/Operational"" " & logFileName
./gatherNetworkInfo.vbs:    cmd = "cmd /c wevtutil al " & logFileName
./gatherNetworkInfo.vbs:    cmd = "cmd /c wevtutil epl ""Microsoft-Windows-Wcmsvc/Operational"" " & logFileName
./gatherNetworkInfo.vbs:    cmd = "cmd /c wevtutil al " & logFileName
./gatherNetworkInfo.vbs:    cmd = "cmd /c netsh wlan show all > " & outputFileName
./gatherNetworkInfo.vbs:    cmd = "cmd /c netsh lan show interfaces >> " & outputFileName
./gatherNetworkInfo.vbs:    cmd = "cmd /c netsh lan show settings >> " & outputFileName
./gatherNetworkInfo.vbs:    cmd = "cmd /c netsh lan show profiles >> " & outputFileName
./gatherNetworkInfo.vbs:    cmd = "cmd /c netsh mbn show interfaces >> " & outputFileName
./gatherNetworkInfo.vbs:    cmd = "cmd /c netsh mbn show profile name=* interface=* >> " & outputFileName
./gatherNetworkInfo.vbs:    cmd = "cmd /c netsh mbn show readyinfo interface=* >> " & outputFileName
./gatherNetworkInfo.vbs:    cmd = "cmd /c netsh mbn show capability interface=* >> " & outputFileName
./gatherNetworkInfo.vbs:    cmd = "cmd /c ipconfig /all >> " & outputFileName
./gatherNetworkInfo.vbs:    cmd = "cmd /c certutil -v -store -silent My >> " & outputFileName
./gatherNetworkInfo.vbs:    cmd = "cmd /c certutil -v -store -silent -user My >> " & outputFileName
./gatherNetworkInfo.vbs:    cmd = "cmd /c certutil -v -store -silent root >> " & outputFileName
./gatherNetworkInfo.vbs:    cmd = "cmd /c certutil -v -enterprise -store -silent NTAuth >> " & outputFileName
./gatherNetworkInfo.vbs:    cmd = "cmd /c certutil -v -user -store -silent root >> " & outputFileName
./gatherNetworkInfo.vbs:    cmd = "cmd /c reg export " & regpath & "  " & outputFileName & " /y"
./gatherNetworkInfo.vbs:    cmd = "cmd /c netsh winsock show catalog > " & outputFileName
./gatherNetworkInfo.vbs:    cmd = "cmd /c echo Current Profiles: > " & configFileName
./gatherNetworkInfo.vbs:    cmd = "cmd /c echo ------------------------------------------------------------------------ >> " & configFileName
./gatherNetworkInfo.vbs:    cmd = "cmd /c netsh advfirewall monitor show currentprofile >> " & configFileName
./gatherNetworkInfo.vbs:    cmd = "cmd /c echo Firewall Configuration: >> " & configFileName
./gatherNetworkInfo.vbs:    cmd = "cmd /c echo ------------------------------------------------------------------------ >> " & configFileName
./gatherNetworkInfo.vbs:    cmd = "cmd /c netsh advfirewall monitor show firewall >> " & configFileName
./gatherNetworkInfo.vbs:    cmd = "cmd /c echo Connection Security  Configuration: >> " & configFileName
./gatherNetworkInfo.vbs:    cmd = "cmd /c echo ------------------------------------------------------------------------ >> " & configFileName
./gatherNetworkInfo.vbs:    cmd = "cmd /c netsh advfirewall monitor show consec >> " & configFileName
./gatherNetworkInfo.vbs:    cmd = "cmd /c echo Firewall Rules : >> " & configFileName
./gatherNetworkInfo.vbs:    cmd = "cmd /c echo ------------------------------------------------------------------------ >> " & configFileName
./gatherNetworkInfo.vbs:    cmd = "cmd /c netsh advfirewall firewall show rule name=all verbose >> " & configFileName
./gatherNetworkInfo.vbs:    cmd = "cmd /c echo Connection Security  Rules : >> " & configFileName
./gatherNetworkInfo.vbs:    cmd = "cmd /c echo ------------------------------------------------------------------------ >> " & configFileName
./gatherNetworkInfo.vbs:    cmd = "cmd /c netsh advfirewall consec show rule name=all verbose >> " & configFileName
./gatherNetworkInfo.vbs:    cmd = "cmd /c echo Firewall Rules currently enforced : > " & effectiveRulesFileName
./gatherNetworkInfo.vbs:    cmd = "cmd /c echo ------------------------------------------------------------------------ >> " & effectiveRulesFileName
./gatherNetworkInfo.vbs:    cmd = "cmd /c netsh advfirewall monitor show firewall rule name=all >> " & effectiveRulesFileName
./gatherNetworkInfo.vbs:    cmd = "cmd /c echo Connection Security Rules currently enforced : >> " & effectiveRulesFileName
./gatherNetworkInfo.vbs:    cmd = "cmd /c echo ------------------------------------------------------------------------ >> " & effectiveRulesFileName
./gatherNetworkInfo.vbs:    cmd = "cmd /c netsh advfirewall monitor show consec rule name=all >> " & effectiveRulesFileName
./gatherNetworkInfo.vbs:    cmd = "cmd /c wevtutil epl ""Microsoft-Windows-Windows Firewall With Advanced Security/Firewall"" " & logFileName
./gatherNetworkInfo.vbs:    cmd = "cmd /c wevtutil al " & logFileName
./gatherNetworkInfo.vbs:    cmd = "cmd /c wevtutil epl ""Microsoft-Windows-Windows Firewall With Advanced Security/ConnectionSecurity"" " & consecLogFileName
./gatherNetworkInfo.vbs:    cmd = "cmd /c wevtutil al " & consecLogFileName
./gatherNetworkInfo.vbs:    cmd = "cmd /c wevtutil epl ""Microsoft-Windows-Windows Firewall With Advanced Security/FirewallVerbose"" " & logFileNameVerbose
./gatherNetworkInfo.vbs:    cmd = "cmd /c wevtutil al " & logFileNameVerbose
./gatherNetworkInfo.vbs:    cmd = "cmd /c wevtutil epl ""Microsoft-Windows-Windows Firewall With Advanced Security/ConnectionSecurityVerbose"" " & consecLogFileNameVerbose
./gatherNetworkInfo.vbs:    cmd = "cmd /c wevtutil al " & consecLogFileNameVerbose
./gatherNetworkInfo.vbs:    cmd = "cmd /c netsh wfp show filters file=" & outputFileName & " > " & logFileName
./gatherNetworkInfo.vbs:    cmd = "cmd /c netsh interface teredo show state > " & outputFileName
./gatherNetworkInfo.vbs:    cmd = "cmd /c netsh interface httpstunnel show interface >> " & outputFileName
./gatherNetworkInfo.vbs:    cmd = "cmd /c netsh interface httpstunnel show statistics >> " & outputFileName
./gatherNetworkInfo.vbs:    cmd = "cmd /c gpresult /scope:computer /v 1> " & logFileName & " 2>&1"
./gatherNetworkInfo.vbs:    cmd = "cmd /c netsh wfp show netevents file=" & outputFileName & " 1> " & logFileName & " 2>&1"
./gatherNetworkInfo.vbs:    cmd = "cmd /c netsh wfp show state file=" & outputFileName & " 1> " & logFileName & " 2>&1"
./gatherNetworkInfo.vbs:    cmd = "cmd /c netsh wfp show sysports file=" & outputFileName & " 1> " & logFileName & " 2>&1"
./gatherNetworkInfo.vbs:    cmd = "cmd /c wevtutil epl System /q:""*[System[Provider[@Name='Microsoft-Windows-Hyper-V-VmSwitch']]]"" " & vmswitchlogFileName
./gatherNetworkInfo.vbs:    cmd = "cmd /c wevtutil al " & vmswitchlogFileName
./gatherNetworkInfo.vbs:    cmd = "cmd /c wevtutil epl ""Microsoft-Windows-Hyper-V-VMMS-Networking"" " & vmmslogFileName
./gatherNetworkInfo.vbs:    cmd = "cmd /c wevtutil al " & vmmslogFileName
./gatherNetworkInfo.vbs:    cmd = "cmd /c wevtutil epl Application " & logFileName
./gatherNetworkInfo.vbs:    cmd = "cmd /c wevtutil al " & logFileName
./gatherNetworkInfo.vbs:    cmd = "cmd /c wevtutil epl System " & logFileName
./gatherNetworkInfo.vbs:    cmd = "cmd /c wevtutil al " & logFileName
./gatherNetworkInfo.vbs:    cmd = "cmd /c wmic qfe >> " & outputFileName
./gatherNetworkInfo.vbs:    cmd = "cmd /c netcfg -m >> " & outputFileName
./gatherNetworkInfo.vbs:    cmd = "cmd /c reg.exe query hklm\system\CurrentControlSet\Services\Winsock\Parameters /v Transports >> " & outputFileName
./gatherNetworkInfo.vbs:    cmd = "cmd /c reg.exe query ""hklm\system\CurrentControlSet\Services\Winsock\Setup Migration"" /v ""Provider List"" >> " & outputFileName
./gatherNetworkInfo.vbs:    cmd = "cmd /c netsh.exe winsock show catalog >> " & outputFileName
./gatherNetworkInfo.vbs:    cmd = "cmd /c Reg.exe Export HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\EnterpriseDataProtection\Policies " & outputFileName & " /y /Reg:64"
./gatherNetworkInfo.vbs:    cmd = "cmd /c Reg.exe Export HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PolicyManager\Providers " & outputFileName & " /y /Reg:64"
./gatherNetworkInfo.vbs:    cmd = "cmd /c Reg.exe Export HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\HomeGroupListener " & outputFileName & " /y /Reg:64"
./gatherNetworkInfo.vbs:    cmd = "cmd /c Reg.exe Export HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\HomeGroupProvider " & outputFileName & " /y /Reg:64"
./gatherNetworkInfo.vbs:    cmd = "cmd /c sc.exe queryex nativewifip >> " & outputFileName
./gatherNetworkInfo.vbs:    cmd = "cmd /c sc.exe qc nativewifip >> " & outputFileName
./gatherNetworkInfo.vbs:    cmd = "cmd /c sc.exe queryex wlansvc >> " & outputFileName
./gatherNetworkInfo.vbs:    cmd = "cmd /c sc.exe qc wlansvc >> " & outputFileName
./gatherNetworkInfo.vbs:    cmd = "cmd /c sc.exe queryex dhcp >> " & outputFileName
./gatherNetworkInfo.vbs:    cmd = "cmd /c sc.exe qc dhcp >> " & outputFileName
./gatherNetworkInfo.vbs:    cmd = "cmd /c netsh wlan show wlanreport"
./gatherNetworkInfo.vbs:    cmd = "cmd /c powercfg.exe /batteryreport /output " & batteryReportFilename


 grep "RunCmd" ./gatherNetworkInfo.vbs
Sub RunCmd(CommandString, OutputFile)
    RunCmd "echo.", outputFileName
    RunCmd "echo ROUTE PRINT:", outputFileName
    RunCmd "route print", outputFileName
    RunCmd "echo IPCONFIG /DISPLAYDNS: ", logFileName
    RunCmd "ipconfig /displaydns", logFileName
    RunCmd "echo. ", logFileName
    RunCmd "echo NETSH NAMESPACE SHOW EFFECTIVE:", logFileName
    RunCmd "netsh namespace show effective", logFileName
    RunCmd "echo.", logFileName
    RunCmd "echo NETSH NAMESPACE SHOW POLICY:", logFileName
    RunCmd "netsh namespace show policy", logFileName
    RunCmd "echo ARP -A:", logFileName
    RunCmd "arp -a", logFileName
    RunCmd "echo.", logFileName
    RunCmd "echo NETSH INT IPV6 SHOW NEIGHBORS:", logFileName
    RunCmd "netsh int ipv6 show neigh", logFileName
    RunCmd "echo NBTSTAT -N:", logFileName
    RunCmd "nbtstat -n", logFileName
    RunCmd "echo.", logFileName
    RunCmd "echo NBTSTAT -C:", logFileName
    RunCmd "nbtstat -c", logFileName
    RunCmd "echo.", logFileName
    RunCmd "echo NET CONFIG RDR:", logFileName
    RunCmd "net config rdr", logFileName
    RunCmd "echo.", logFileName
    RunCmd "echo NET CONFIG SRV:", logFileName
        RunCmd "net config srv", logFileName
        RunCmd "echo The Server service is not running.", logFileName
    RunCmd "echo.", logFileName
    RunCmd "echo NET SHARE:", logFileName
        RunCmd "net share", logFileName
        RunCmd "echo The Server service is not running.", logFileName