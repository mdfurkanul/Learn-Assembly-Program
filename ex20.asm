;20.Get values of time (0-9) from key board, 
;if time is less than 5 show string “good morning”, otherwise  show string “good day” . 
;Get number and show string are defined as macros in separate macro file?



if 1
include nuk.asm
endif


mydata segment
gdm db 'Good morning$'
gdd db 'Good day$'
sa db ?
count equ 5
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
MOV CL,count
scan sa
sub al,30h
cmp al,cl
jle togdm

show gdd
jmp endiff

togdm: show gdm

endiff:




mov ax,4c00h
int 21h


mycode ends
end start




