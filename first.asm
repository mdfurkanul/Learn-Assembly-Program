if 1
include mylib1.lib
endif
mydata segment

aa  db  05 
ba  db  06 
ca  db  07
sa  db  ?

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

mov al, aa
mov bl, ba
mov cl, ca
add al, bl
sub al, cl
mov sa, al

mov ah, 00
mov bx, ax
printd 
mov ax, 4c00h
int 21h
printfd

mycode ends
end start 
