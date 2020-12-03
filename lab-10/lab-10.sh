rm lab_10_lib.so
gcc -shared -s -O3 -Wall -fPIC lab-10.c -o lab_10_lib.so -llua5.3 -I/usr/include/lua5.3
