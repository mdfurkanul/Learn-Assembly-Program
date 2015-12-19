mydata segment


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

mov ah,0
mov al,3
int 10h

mov ah,6
mov cx,0h
mov dx,184Fh
mov bh, 43h
mov al,0
int 10h





MOV AH, 4CH                  
INT 21H
   
 mycode ends
 END MAIN