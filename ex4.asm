;4.Find sa, which is equal to aa-ba (aa>ba), or ba-aa (aa<ba)? Get values of aa, ba (0-9) from key board ?10
if 1
include mylib1.lib
endif


mydata segment
aa db ?
ba db ?
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

mov ah,01h
int 21h
sub al,30h
mov aa,al

mov ah,01h
int 21h
sub al,30h
mov ba,al
mov al,aa


cmp al,ba
jg todo

mov al,ba
sub al,aa
mov sa,al
jmp endiff

todo: 

sub al,ba
mov sa,al 

endiff:

mov ah,00h
mov bx,ax
printd
mov ax,4c00h
int 21h
printfd

mycode ends
end start




