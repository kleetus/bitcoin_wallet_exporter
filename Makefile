all: db exporter.o
	gcc -o exporter exporter.o db-4.8.30.NC/build_unix/libdb.a
exporter.o:
	gcc -c -O3 -g exporter.c
exporter: exporter.o
	gcc -o exporter exporter.o db-4.8.30.NC/build_unix/libdb.a
clean:
	rm -fr exporter.o exporter
db: 
	cd ./db-4.8.30.NC/build_unix; ../dist/configure --disable-atomicsupport --disable-mutexsupport
	make -C db-4.8.30.NC/build_unix
PHONY: clean db exporter
.DEFAULT: all
