all: pinpog
	qemu-system-i386 pinpog


pinpog: pinpog.asm
	nasm pinpog.asm -o pinpog