;19.	Get character  “M” or “Y” from key board, 
;if character is “M” show string “month is JULY” otherwise  show string “year is 2013” . 
;Get character and show string are defined as macros in the program?


if 1
include nuk.asm
endif

mydata segment
msg1 db "Month is July",0dh,0ah,24h
msg2 db 'Year is 2013',0dh,0ah,24h
as db ?
chr db ?
mydata ends

mystack segment
db 100 dup(0)
mystack ends

mycode segment
assume cs:mycode, ds:mydata, ss:mystack

start:

mov ax, seg mydata
mov ds, ax
mov ax, seg mystack
mov ss, ax

scan chr
nline as
cmp chr,'m'
jz tomonth
cmp chr,'y'
jz toyear

tomonth: show msg1
	jmp endiff
toyear: show msg2
	jmp endiff
	
endiff:
mov ax,4c00h
int 21h


mycode ends
end start