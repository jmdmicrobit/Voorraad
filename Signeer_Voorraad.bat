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


rem openssl pkcs12 -export -out "C:\share$\Prog\Certificates\info@microbit_nl\info@microbit_nl.pfx" -inkey "C:\share$\Prog\Certificates\info@microbit_nl\privateKey.key" -in "C:\share$\Prog\Certificates\info@microbit_nl\info@microbit_nl.crt" -certfile "C:\share$\Prog\Certificates\info@microbit_nl\Root Certificates\Sectigo_RSA_Code_Signing_CA.crt"

rem Controleer een Certificaat 
rem openssl x509 -in "C:\share$\Prog\Certificates\info@microbit_nl\info@microbit_nl.crt" -text -noout