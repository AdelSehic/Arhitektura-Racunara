make:
	ecc -target mips32r2el-linux -g -O0 zadatak8.s -o testout
	qemu-mipsel -g 1234 testout &
	gdb-multiarch -q testout
