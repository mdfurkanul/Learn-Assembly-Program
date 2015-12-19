if 1
include mylib1.lib
endif


mydata segment
msg1 db 'This year is 2013$'
msg2 db 'This month is July$'
chr db ?
mydata ends

mystack segment
db 100 dup(0)
mystack ends

extrn show:far
mycode segment
assume ds:mydata, cs:mycode, ss:mystack
start:

mov ax, seg mydata
mov ds, ax
mov ax, seg mystack
mov ss,ax

mov ah,01h
int 21h
mov chr,al
cmp chr,'m'
jz tomonth

cmp chr,'y'
jz toyear

toyear:
mov dx,offset msg1
call show
jmp endiff

tomonth: mov dx,offset msg2
	call show
endiff:
mov ax,4c00h
int 21h
mycode ends
end start
