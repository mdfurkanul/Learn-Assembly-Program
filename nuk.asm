
scan macro ch
mov ah,01h
int 21h
mov ch,al

endm


show macro str
mov ah,09h
mov dx, offset str
int 21h

endm