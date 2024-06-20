Staging (containers / binaries / configs / etc) for desktop support of Open Crypto Tracker: https://github.com/taoteh1221/Open_Crypto_Tracker


IMPORTANT NOTES...

The below folders had to be compressed into RAR files, to meet github's 100mb limit per-file:

/linux/ => linux.7z
/windows/bin/bbwebkit/ => /windows/bin/bbwebkit.7z


=========================================================================================================================================

  LINUX Desktop Edition Error: "CGI program sent malformed or too big"
  
=========================================================================================================================================

If you are using the LINUX Desktop Edition, and you get an error at startup like "CGI program sent malformed or too big", you probably need to compile a custom "php-cgi" binary file on the system you are using, and replace the "php-cgi-custom" binary in the Desktop Edition main folder. Sometimes compiled PHP binaries aren't very portable between different linux systems. To see if this is really the problem by command-line, open a terminal and use the "cd" (change directory) command to go to the main directory of the Desktop Edition, and then type this command:

./php-cgi-custom INSTALL_CRYPTO_TRACKER_HERE/index.php

If you see an error like this below, you system is NOT compatible with the included "php-cgi-custom" PHP binary, and you'll need to build a new one for your system:

./php-cgi-custom: error while loading shared libraries: XXXXX.so.X: cannot open shared object file: No such file or directory

Try running the script "FIX-LINUX-DESKTOP.bash" in the Desktop Edition main folder, which should fix things automatically for you. Just make sure it's file permissions are set to "executable" (chmod +x, OR chmod 755 should do that). 

Open a terminal and use the "cd" (change directory) command to go to the main directory of the Desktop Edition, and then type this command:

./FIX-LINUX-DESKTOP.bash

If this automated script gives you issues, see manual PHP build instructions below...

Documentation for manually building custom PHP binaries on linux can be found here (as well as the source code to download to build it with):

https://github.com/php/php-src/blob/master/README.md

Here is the SPECIFIC "./configure" command (mentioned in the above documentation link) you will need to build PHP with the REQUIRED extensions that the Desktop Edition of this crypto tracker app NEEDS:

./configure \
  --enable-bcmath \
  --enable-gd \
  --enable-calendar \
  --enable-dba \
  --enable-exif \
  --enable-ftp \
  --enable-fpm \
  --enable-mbstring \
  --enable-shmop \
  --enable-sigchild \
  --enable-soap \
  --enable-sockets \
  --enable-sysvmsg \
  --with-libdir=lib64 \
  --with-zip \
  --with-bz2 \
  --with-curl \
  --with-gettext \
  --with-openssl \
  --with-pdo-mysql \
  --with-zlib \
  --with-libxml \
  --with-freetype \
  --prefix=$HOME/customphp
  
After using the above configuration, and then running "make", when you then run "make install" AFTERWARDS, your custom PHP binaries with be installed to a new directory in your home folder called "customphp". Inside this folder you will find a subdirectory named "bin". Inside this subdirectory you'll find the custom PHP binary named "php-cgi". Copy this file "php-cgi" over into the main directory of your linux Desktop Edition of the crypto tracker app. Now delete the old "php-cgi-custom" file in there, and rename the new "php-cgi" file to be named "php-cgi-custom" instead. The linux Desktop Edition of this crypto tracker app should now work fine, if it was indeed a shared library problem.


=========================================================================================================================================
