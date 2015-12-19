;Find sa given by the expression sa = aa+ba*ca; where aa=1234h, ba=78h, ca=21h ?

if 1
include mylib1.lib
endif


mydata segment
aa dw 1234h
ba db 78h
ca db 21h
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


mov ah,00h
mov al,ba
mov bh,00h
mov bl,ca
mul bx

add ax,aa

mov sa,ax

mov bx,ax
printd
mov ax,4c00h
int 21h
printfd

mycode ends
end start




