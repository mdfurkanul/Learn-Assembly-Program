;8.Find the sum of numbers 1 to 80 ? 10

if 1
include mylib1.lib
endif


mydata segment
aa db 0
count equ 80
sum dw ?
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
mov bl,01
mov ax,sum

back:
	mov dh,00h
	mov dl,bl
	add ax,dx
	inc bl
	loop back

mov bx,ax
printd
mov ax,4c00h
int 21h
printfd

mycode ends
end start




