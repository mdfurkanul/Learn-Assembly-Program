cr equ 0dh
lf equ 0ah
dol equ 24h
mydata segment
tri db 25 dup(' '),cr,lf,dol
nline db cr,lf,dol
msg db "type height of the triangle 1-9 = ", dol
mydata ends
mystack segment
db 100 dup(0)
mystack ends
mycode segment
assume cs:mycode, ds:mydata, ss:mystack
start:
mov ax, seg mydata
mov ds, ax
mov ax, seg mystack
mov ss, ax

mov ah, 09
mov dx, offset msg
int 21h

mov ah, 01
int 21h

and al, 0fh
mov ch, 00
mov cl, al

mov bx, cx
mov si, cx

mov ah, 09
mov dx, offset nline
int 21h

back1:	
	mov [bx+tri], '*'
	mov [si+tri], '*'
	

	mov ah, 09
	mov dx, offset tri
	int 21h

	mov [bx+tri], ' '
	mov [si+tri], ' '

	dec bx
	inc si

	loop back1
back2:
	cmp bx, si
	ja exit
	mov [bx+tri], '*'
	inc bx
	jmp back2
exit:
	mov ah, 09
	mov dx, offset tri
	int 21h
	
mov ax, 4c00h
int 21h

mycode ends
end start 
