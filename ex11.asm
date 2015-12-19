;11.	Find the sum of elements of array {20,21,23,24,25,26}? 10
if 1
include mylib1.lib
endif


mydata segment
aa db 20,21,23,24,25,26
count equ 6
sa dw ?
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
mov ax,sa
back: 
	mov dh,00h
	mov dl,[bx]
	add ax,dx	
	inc bx
	loop back

mov bx,ax
printd
mov ax,4c00h
int 21h
printfd


mycode ends
end start




