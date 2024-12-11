Sining aanpassen van "C:\Program Files (x86)\Windows Kits\8.1\bin\x64\signtool.exe" sign /as /fd sha256 /f "H:\Certificates\info@microbit_nl\info@microbit_nl.p12"  /tr http://timestamp.digicert.com /td sha256 werk\voorraad.exe
naar "C:\Program Files (x86)\Windows Kits\8.1\bin\x64\signtool.exe" sign /debug /as /fd sha256 /f "H:\Certificates\JMD Microbit Automatisering 2023\har@microbit_nl.pfx" /p superjmd /tr http://timestamp.digicert.com /td sha256 ontw\mbvo.dll



Rem USB in de DESKTOP HAR en deze pporten delene dan zie ik wel een private Key 
"C:\Program Files (x86)\Windows Kits\8.1\bin\x64\signtool.exe" sign /t http://timestamp.digicert.com "c:\maatwerk\c10\MVOWIN\ontw\mbvo.dll"

Kopie oude Post-build even command line 
"C:\Program Files (x86)\Windows Kits\8.1\bin\x64\signtool.exe" sign /t http://timestamp.digicert.com $(SolutionDir)ontw\mbvo.dll
"C:\Program Files (x86)\Windows Kits\8.1\bin\x64\signtool.exe" sign /as /fd sha256 /f "H:\Certificates\JMD Microbit Automatisering 2023\har@microbit_nl.pfx" /p superjmd /tr http://timestamp.digicert.com /td sha256 $(SolutionDir)ontw\mbvo.dll



Get-ChildItem -path cert:\LocalMachine\My


E0BC3171FACF6D85F7E36738575CA67A55C5EC7C

"C:\Program Files (x86)\Windows Kits\8.1\bin\x64\signtool.exe" sign /tr http://timestamp.digicert.com /td sha256 /fd sha256 /sha1 E0BC3171FACF6D85F7E36738575CA67A55C5EC7C "c:\maatwerk\c10\MVOWIN\ontw\mbvo.dll"

.\signtool.exe sign /v /fd sha256 /sha1 E0BC3171FACF6D85F7E36738575CA67A55C5EC7C /sm /as C:\Users\har.JMD2012\Desktop\exec.ps1

"C:\Program Files (x86)\Microsoft Visual Studio\Shared\NuGetPackages\microsoft.windows.sdk.buildtools\10.0.22621.756\bin\10.0.22621.0\x64\signtool.exe" sign /tr http://timestamp.sectigo.com /td sha256 /fd sha256 c:\maatwerk\c10\MVOWIN\ontw\mbvo.dll

"C:\Program Files (x86)\Windows Kits\8.1\bin\x64\signtool.exe" sign /t http://timestamp.digicert.com /n "JMD Microbit Automatisering" "c:\maatwerk\c10\MVOWIN\ontw\mbvo.dll"

"C:\Program Files (x86)\Windows Kits\8.1\bin\x64\signtool.exe" sign /f "H:\Certificates\JMD Microbit Automatisering 2023\JMD Microbit Automatisering.cer" /csp "eToken Base Cryptographic Provider" /k "[{{superjmd}}]=SafeNet Token JC 0" c:\maatwerk\c10\MVOWIN\ontw\mbvo.dll


openssl req -in "H:\Certificates\JMD Microbit Automatisering 2023\JMD Microbit Automatisering.cer" -noout -text
openssl pkcs12 -export -nokeys -in "H:\Certificates\JMD Microbit Automatisering 2023\JMD Microbit Automatisering.cer" -out "H:\Certificates\JMD Microbit Automatisering 2023\JMD Microbit Automatisering.p12"
"C:\Program Files (x86)\Windows Kits\8.1\bin\x64\signtool.exe" sign /debug /f "H:\Certificates\JMD Microbit Automatisering 2023\JMD Microbit Automatisering.p12" /p superjmd ontw\mbvo.dll

"C:\Program Files (x86)\Windows Kits\8.1\bin\x64\signtool.exe" sign /debug /f "H:\Certificates\JMD Microbit Automatisering 2023\har@microbit_nl.pfx" /p superjmd ontw\mbvo.dll



rem "C:\Program Files (x86)\Windows Kits\8.1\bin\x64\signtool.exe" sign /as /fd sha256 /f "H:\Certificates\certificate.pfx" /p D13@q10y /tr http://timestamp.digicert.com /td sha256 werk\voorraad.exe
rem "C:\Program Files (x86)\Windows Kits\8.1\bin\x64\signtool.exe" sign /as /fd sha256 /f "H:\Certificates\jmd2008microbitnl.pfx" /p superjmd /tr http://timestamp.digicert.com /td sha256 werk\voorraad.exe

"C:\Program Files (x86)\Windows Kits\8.1\bin\x64\signtool.exe" sign /as /fd sha256 /f "H:\Certificates\info@microbit_nl\info@microbit_nl.p12"  /tr http://timestamp.digicert.com /td sha256 werk\voorraad.exe
"C:\Program Files (x86)\Windows Kits\8.1\bin\x64\signtool.exe" sign /as /fd sha256 /f "H:\Certificates\info@microbit_nl\info@microbit_nl.p12"  /tr http://timestamp.digicert.com /td sha256 werk\voorrvrd.dll
"C:\Program Files (x86)\Windows Kits\8.1\bin\x64\signtool.exe" sign /as /fd sha256 /f "H:\Certificates\info@microbit_nl\info@microbit_nl.p12"  /tr http://timestamp.digicert.com /td sha256 werk\voorrpln.dll
"C:\Program Files (x86)\Windows Kits\8.1\bin\x64\signtool.exe" sign /as /fd sha256 /f "H:\Certificates\info@microbit_nl\info@microbit_nl.p12" /tr http://timestamp.digicert.com /td sha256 werk\voorrstm.dll
"C:\Program Files (x86)\Windows Kits\8.1\bin\x64\signtool.exe" sign /as /fd sha256 /f "H:\Certificates\info@microbit_nl\info@microbit_nl.p12" /tr http://timestamp.digicert.com /td sha256 werk\voorrRpt.dll
"C:\Program Files (x86)\Windows Kits\8.1\bin\x64\signtool.exe" sign /as /fd sha256 /f "H:\Certificates\info@microbit_nl\info@microbit_nl.p12" /tr http://timestamp.digicert.com /td sha256 werk\voorrdct.dll


rem "C:\Program Files (x86)\Windows Kits\8.1\bin\x64\signtool.exe" sign /as /fd sha256 /f "H:\Certificates\certificate.pfx" /p D13@q10y /tr http://timestamp.digicert.com /td sha256 werk\voorraad.exe
rem "C:\Program Files (x86)\Windows Kits\8.1\bin\x64\signtool.exe" sign /as /fd sha256 /f "H:\Certificates\jmd2008microbitnl.pfx" /p superjmd /tr http://timestamp.digicert.com /td sha256 werk\voorraad.exe
rem "C:\Program Files (x86)\Windows Kits\8.1\bin\x64\signtool.exe" sign /as /fd sha256 /f "H:\Certificates\jmd2008microbitnl.pfx" /p superjmd /tr http://timestamp.digicert.com /td sha256 werk\voorrvrd.dll
rem "C:\Program Files (x86)\Windows Kits\8.1\bin\x64\signtool.exe" sign /as /fd sha256 /f "H:\Certificates\jmd2008microbitnl.pfx" /p superjmd /tr http://timestamp.digicert.com /td sha256 werk\voorrpln.dll
rem "C:\Program Files (x86)\Windows Kits\8.1\bin\x64\signtool.exe" sign /as /fd sha256 /f "H:\Certificates\jmd2008microbitnl.pfx" /p superjmd /tr http://timestamp.digicert.com /td sha256 werk\voorrstm.dll
rem "C:\Program Files (x86)\Windows Kits\8.1\bin\x64\signtool.exe" sign /as /fd sha256 /f "H:\Certificates\jmd2008microbitnl.pfx" /p superjmd /tr http://timestamp.digicert.com /td sha256 werk\voorrRpt.dll
rem "C:\Program Files (x86)\Windows Kits\8.1\bin\x64\signtool.exe" sign /as /fd sha256 /f "H:\Certificates\jmd2008microbitnl.pfx" /p superjmd /tr http://timestamp.digicert.com /td sha256 werk\voorrdct.dll

rem openssl pkcs12 -export -out certificate.pfx -inkey privateKey.key -in certificate.crt -certfile CACert.crt
rem openssl genrsa -out privatekey.pem 1024

rem Converteer een DER file (.crt .cer .der) naar PEM 
rem openssl x509 -inform der -in "C:\share$\Prog\Certificates\info@microbit_nl\info@microbit_nl.crt" -out "C:\share$\Prog\Certificates\info@microbit_nl\info@microbit_nl.pem"

rem Conversie .crt naar .pem bestand

rem openssl x509 -in "C:\share$\Prog\Certificates\info@microbit_nl\info@microbit_nl.crt" -out "C:\share$\Prog\Certificates\info@microbit_nl\info@microbit_nl.der" -outform DER
rem openssl x509 -in "C:\share$\Prog\Certificates\info@microbit_nl\info@microbit_nl.der" -inform DER -out "C:\share$\Prog\Certificates\info@microbit_nl\info@microbit_nl.pem" -outform PEM


rem Generate a new private key and Certificate Signing Request
rem openssl req -out "C:\share$\Prog\Certificates\info@microbit_nl\info@microbit_nl.csr" -new -newkey rsa:2048 -nodes -keyout "C:\share$\Prog\Certificates\info@microbit_nl\privateKey.key"
rem 2023 versie uitvoeren op de JMD2012 daar draai openssl-win 64
rem cmd in Administor mode
rem cd \ Program File\OpenSSL Win64

Rem stap 1 generatei Private Key
Rem stap 1 generatei Private Key
Country NL
State Limburg
Organisation Name: JMD Microbit Automatisering 
Organization Unit Name
Common Name: har@microbit.NL
EmailAdres Har@microbit.NL

challenge password: superjmd
rem dit werkt niet dus welke moet ik kiezen
rem openssl req -out "C:\share$\Prog\Certificates\JMD Microbit Automatisering 2023\har@microbit_nl.csr" -new -newkey rsa:2048 -nodes -keyout "C:\share$\Prog\Certificates\JMD Microbit Automatisering 2023\privateKey.key"

rem Stap 2 omzetten naar DER en dan naar PEM
rem openssl x509 -in "C:\share$\Prog\Certificates\JMD Microbit Automatisering 2023\har@microbit_nl.crt" -out "C:\share$\Prog\Certificates\JMD Microbit Automatisering 2023\har@microbit_nl.der" -outform DER
rem openssl x509 -in "C:\share$\Prog\Certificates\JMD Microbit Automatisering 2023\har@microbit_nl.der" -inform DER -out "C:\share$\Prog\Certificates\JMD Microbit Automatisering 2023\har@microbit_nl.pem" -outform PEM

Rem Stap 3 maak een pfx
rem openssl pkcs12 -export -out "C:\share$\Prog\Certificates\JMD Microbit Automatisering 2023\har@microbit_nl.p12" -inkey "C:\share$\Prog\Certificates\JMD Microbit Automatisering 2023\privateKey.key" -in "C:\share$\Prog\Certificates\JMD Microbit Automatisering 2023\har@microbit_nl.pem" -certfile "C:\share$\Prog\Certificates\JMD Microbit Automatisering 2023\Root Certificates\Sectigo Public Code Signing CA R36.crt"

rem Controleer een Certificaat 
rem openssl x509 -in "C:\share$\Prog\Certificates\JMD Microbit Automatisering 2023\har@microbit_nl.crt" -text -noout
rem openssl pkey -text_pub -in "C:\share$\Prog\Certificates\JMD Microbit Automatisering 2023\privateKey.key"  -noout
rem openssl req -in "C:\share$\Prog\Certificates\JMD Microbit Automatisering 2023\har@microbit_nl.crt" -text -noout

Use these commands to compare the RSA Public-Key component of your CSR to that of the private key.

Key: openssl pkey -text_pub -in file.key -noout

CSR: openssl req -in file.csr -noout -text

These must match for 'openssl pkcs12' to create the export file.

"C:\Program Files (x86)\Windows Kits\10\App Certification Kit\signtool.exe" sign /as /fd sha256 /f "H:\Certificates\administrator@microbit_nl\administrator@microbit_nl.pfx" /p superjmd /tr http://timestamp.digicert.com /td sha256 $(SolutionDir)werk\JMDSRAP.DLL

"C:\Program Files (x86)\Windows Kits\10\App Certification Kit\signtool.exe" sign /as /fd sha256 /f "H:\Certificates\administrator@microbit_nl\administrator@microbit_nl.pfx" /p superjmd   /tr http://timestamp.digicert.com /td sha256 C:\maatwerk\C10\Koelvers\JMDPDM\werk\JMDPDM.EXE"

Deze werken !!!!

openssl pkcs12 -export -nokeys -in "C:\share$\Prog\Certificates\JMD Microbit Automatisering 2023\har@microbit_nl.crt" -out "C:\share$\Prog\Certificates\JMD Microbit Automatisering 2023\har@microbit_nl.pfx"
openssl pkcs12 -export -nokeys -in "C:\share$\Prog\Certificates\JMD Microbit Automatisering 2023\har@microbit_nl.crt" -out "C:\share$\Prog\Certificates\JMD Microbit Automatisering 2023\har@microbit_nl.p12"
Aanpassen Clarion Projecten


