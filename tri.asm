IF 1
include mylib1.lib
endif


mydata segment
aa    DB  "* $"      
count   equ  9

mydata ends 

mystack segment
db 100 dup(0)
mystack ends

mycode segment
assume cs:mycode, ds:mydata, ss:mystack
main:  
MOV AX, seg mydata    
MOV DS, AX
mov ax,seg mystack
mov ss,ax   
mov cl,count
mov bl,10


back:
mov ah,02h
mov dl,' '
int 21h
loop back
mov al,11
sub al,bl
mov cl,al

back1:
mov ah,09h
mov dx,offset aa
int 21h
loop back1


mov dl,10d
mov ah,02h
int 21h

dec bl
mov cl,bl

loop back




MOV Ax, 4C00H                  
INT 21H
   
 mycode ends
 END MAIN