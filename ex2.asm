;2.Find sa given by the expression sa(quotient, remainder) = aa/ba; where aa=1234h, ba=78h ?
if 1
include mylib1.lib
endif


mydata segment
aa dw 1234h
ba db 78h
sa db ?
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


mov ax,aa
mov bh,00h
mov bl,ba
div bl

mov sa,al

mov ah,00h

mov bx,ax
printd
mov ax,4c00h
int 21h
printfd

mycode ends
end start




