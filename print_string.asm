;prints a string. 
;The address of the string should be stored in register bx
;The string should be null terminated

print_string:
	pusha
	print_string_start:
		mov cx, [bx]
		cmp byte cl, 0x00
		je print_string_end		;end function if it has reached null value

		mov al, [bx]
		mov ah, 0x0e
		int 0x10			;call print interrupt routine
		inc bx
		jmp print_string_start

	print_string_end:
		popa
		ret