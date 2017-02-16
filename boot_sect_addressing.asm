;Learn about addressing

mov ah, 0x0e
mov al, the_secret
int 0x10		;Try printing the secret. Does not work
			;Attempts to print address instead of value at address

mov al, [the_secret]	
int 0x10		;Try printing the secret. Does not work
			;address [the_secret] is not correctly offset

mov bx, the_secret
add bx, 0x7c00
mov al, [bx]
int 0x10		;Try printing the secret. It works
			;Well, it works as long as this program was loaded
			;at location 0x7c00

mov al, [0x7c1d]
int 0x10		;Try printing the secret. It works.
			;Well it works as long as the program was loaded
			;at location 0x7c00 and the variable [the_secret]
			;is at position 0x1d

jmp $

the_secret:
	db "X"

times 510-($-$$) db 0
dw 0xaa55