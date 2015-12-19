;3.Find sa given by the expression sa = aa+ba-ca; where aa=1234h, ba=678h, ca=21h
if 1
include mylib1.lib
endif


mydata segment
aa dw 1234h
ba dw 678h
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


mov ax,aa
mov bx,ba
mov ch,00h
mov cl,21h
add ax,bx
sub ax,cx

mov sa,ax

mov bx,ax
printd
mov ax,4c00h
int 21h
printfd

mycode ends
end start




