@echo off

set OPENSSL_CONF="%BBHOME%bin\apache\conf\openssl.conf"
set OPENSSL_BIN="%BBHOME%bin\apache\bin\openssl.exe"
set DOMAIN=server
set KEYFILE="%BBHOME%bin\%DOMAIN%.key"
set CSRFILE="%BBHOME%bin\%DOMAIN%.csr"
set CRTFILE="%BBHOME%bin\curl-ca-bundle.crt"

echo Generating private key...
%OPENSSL_BIN% genrsa -out %KEYFILE% 2048

echo Generating CSR...
%OPENSSL_BIN% req -new -key %KEYFILE% -out %CSRFILE% -subj "/CN=%DOMAIN%"

echo Generating self-signed certificate...
%OPENSSL_BIN% x509 -req -days 365 -in %CSRFILE% -signkey %KEYFILE% -out %CRTFILE%

echo Done.
