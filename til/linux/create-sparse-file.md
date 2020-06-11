# How can i create a sparse file ?

Use:
```
truncate -s 100M 100M_file
```

A sparse file has storage allocated only when written to.
It is of size 0 when created.

Storage is allocated per block size (4KiB on my machine).

Empty space between 2 allocated blocks is called a hole.

```
$ ls -lh test_file
-rw-r--r-- 1 xxx xxx 100M juin  11 17:19 100M_file

$ du -h ./100M_file
0	./test_file

# conv=notrunc is needed to stop dd from truncating the file to its output length
$ dd if=/dev/random of=100M_file bs=512 count=8 conv=notrunc
8+0 enregistrements lus
8+0 enregistrements écrits
4096 octets (4,1 kB, 4,0 KiB) copiés, 0,000201351 s, 20,3 MB/s

$ du -h ./100M_file
4,0K	./100M_file

$ dd if=/dev/random of=100M_file bs=512 count=9 conv=notrunc
9+0 enregistrements lus
9+0 enregistrements écrits
4608 octets (4,6 kB, 4,5 KiB) copiés, 0,000195046 s, 23,6 MB/s

$ du -h ./100M_file
8,0K	./100M_file
```
