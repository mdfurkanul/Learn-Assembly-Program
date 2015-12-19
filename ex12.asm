;12.Find sa given by the expression sa(quotient, remainder) = ba/ca; where aa=1234h, ba=78h.
;Variables aa, ba to be passed to procedure through stack. 
;Draw also the stack memory after pushing data ?10


if 1
include mylib1.lib
endif

mydata segment
aa dw 1234h
ba db 78h
rem db ?
quo db ?
mydata ends

mystack segment
db 100 dup(0)
mystack ends


mycode segment
assume ds:mydata, cs:mycode, ss:mystack
start:
mov ax,seg mydata
mov ds,ax
mov ax,seg mystack
mov ss,ax
mov ax,aa
mov ch,00h
mov cl,ba
push cx
push ax

call divv

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

divv proc
mov bp,sp
mov ax,[bp+2]

mov dl,[bp+4]
div dl
ret
divv endp

mycode ends
end start
