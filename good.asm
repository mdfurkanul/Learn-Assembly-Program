if 1
include mylib1.lib
endif

mydata segment
time db ?
gdm db "Good morning$"
gdd db "Good day$"
clock db " O clock$"
eght equ 8
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

back: 
	mov ah,08h
	int 21h
	mov time,al

Iff: 	cmp al,30h
	jb endiff

	cmp al,3Ah
	jb num09
	
	cmp al,41h
	jb endiff

	cmp al,47h
	jb numAf

Endiff: jmp back

num09: sub al,30h
	jmp if_

numAf: sub al,37h

if_: cmp al, eght
	jb else_

then_: mov dx, offset gdd
	jmp endif_

else_:mov dx,offset gdm

endif_: mov ah,09h
	int 21h

mov ah,02h
mov dl,time
int 21h

mov ah,09h
mov dx,offset clock
int 21h


mov bx,ax
mov ax,4c00h
int 21h

mycode ends
end start 




