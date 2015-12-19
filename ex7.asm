;7.Get values of time (0-9) from key board, 
;if time is less than 5 show string “good morning”, otherwise  show string “good day” ?10


if 1
include mylib1.lib
endif


mydata segment
msg1 db 'Good morning$'
msg2 db 'Good day$'
time equ 5
chr db ?
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

mov ah,01h
int 21h
sub al,30h

cmp al,time
jle togm

mov ah,09h
mov dx, offset msg2
int 21h
jmp endiff			

togm: mov ah,09h
      mov dx, offset msg1
      int 21h
endiff:


mov ax,4c00h
int 21h
printfd

mycode ends
end start




