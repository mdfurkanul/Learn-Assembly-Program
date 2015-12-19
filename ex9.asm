;9. Find sa given by the expression sa = aa*ba; 
;where aa=34h, ba=56h. Variables aa, ba to be passed to procedure through stack. 
;Draw also the stack memory after pushing data ?10

if 1
include mylib1.lib
endif


mydata segment
aa db 34h
ba db 56h
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
mov al,34h
mov ch,00h
mov cl,54h
push ax
push cx

call mull


mov bx,ax
printd
mov ax,4c00h
int 21h
printfd

mull proc

mov bp,sp
mov ax,[bp+2]
mov dx,[bp+4]
mul dx

ret
mull endp

mycode ends
end start

