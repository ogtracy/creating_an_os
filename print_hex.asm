[org 0x7c00]         

print_hex:
	pusha
	mov cx, 5		;Since the hex is six characters long, the last character is at index 5

print_hex_start:
      	mov ax, dx
  	and ax, 0x0f		;Mask last four bits. Hex 16 (f) = 1111   
  	mov bx, HEX_OUT   
  	add bx, cx        	;Move to the end of the string
  	
	cmp ax, 0x0a		;Compare digit to hex a (0xa)
	jl set_value		;If digit is less than a, it's a number. Skip next line
	add byte [bx], 7	;Else it's a letter. Add 7 to convert to ascii letter 

	
set_value:
	add byte [bx], al  	;Add masked digit to the string
	cmp cx, 1		;If cx contains 1, you're reached the x part of the hex (e.g. 0x5555)
	je print_hex_string	;Jump to end
	dec cx			; Else, decrement cx so you can fix the next part of the string
	shr dx, 4		;shift dx to next digit of hex value
	
	jmp print_hex_start

	
print_hex_string:
	mov bx, HEX_OUT		;move string to bx for printing
  	call my_print_function

popa
ret

HEX_OUT: db '0x0000',0