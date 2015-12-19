;5.Find the sum of string “IUBAT” and its average ? 10


if 1
include mylib1.lib
endif


mydata segment
aa db 'IUBAT$'
count equ 5
sum dw ?
rem db ?
quo db ?
mydata ends

mystack segment
db 100 dup(0)
mystack ends

mycode segment
assume cs:mycode, ds: mydata, ss:mystack

start:

mov ax, seg mydata
mov ds, ax
mov ax, seg mystack
mov ss,ax
mov cl,count
mov bl, offset aa
mov ax,sum

back:
	mov dh,00h
	mov dl,[bx]
	add ax,dx
	inc bx
	loop back



mov sum,ax 
mov bx,ax
printd
mov ax,sum
mov cl,count
div cl
mov quo,al
mov rem,ah

mov bh,00h
mov bl,quo
printd
mov bh,00h
mov bl,rem
printd


mov ax,4c00h
int 21h
printfd

mycode ends
end start




