;6.Find sa given by the expression sa = aa-ba; where aa=1234h, ba=56h. 
;Variables aa, ba to be passed to procedure through stack. 
;Draw also the stack memory after pushing data ?10
if 1
include mylib1.lib
endif


mydata segment
aa dw 1234h
ba dw 56h
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
mov cx,ba
push cx
push ax

call subb



mov bx,ax
printd
mov ax,4c00h
int 21h
printfd

subb proc

mov bp,sp
mov ax,[bp+2]
add ax,[bp+4]
ret
subb endp
mycode ends
end start




