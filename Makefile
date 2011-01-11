vk.so : vk.c
	gcc -shared -o vk.so vk.c -I/usr/include/python2.5/ -L/usr/bin/ -lpython2.5 -lX11
