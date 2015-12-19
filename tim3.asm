mydata segment
hour db ?
min db ?
sec db ?
time db "00h00m00s      press any key to exit",0Dh, 24h
char db ?
num dw ?
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

mov ah, 09
mov dx, offset time
int 21h

back:
mov ah, 2ch; 	get time
int 21h  ; 		ch-hour, cl-min, dh-sec

mov hour, ch
mov min, cl
mov sec, dh

mov ch, 00
mov cl, hour
mov al, 00

back0:
inc al
daa
loop back0
mov hour, al

mov ch, 00
mov cl, min
mov al, 00
back1:
inc al
daa
loop back1
mov min, al

mov ch, 00
mov cl, sec
mov al, 00
back2:
inc al
daa
loop back2
mov sec, al

; hour
mov bl, hour
and bl, 0f0h
shr bl,1
shr bl,1
shr bl,1
shr bl,1
or bl, 30h
mov time, bl

mov bl, hour
and bl, 0fh
or bl, 30h
mov [time+1], bl
mov [time+2], 'h'

; min
mov bl, min
and bl, 0f0h
shr bl,1
shr bl,1
shr bl,1
shr bl,1
or bl, 30h
mov [time+3], bl

mov bl, min
and bl, 0fh
or bl, 30h
mov [time+4], bl
mov [time+5], 'm'

; sec
mov bl, sec
and bl, 0f0h
shr bl,1
shr bl,1
shr bl,1
shr bl,1
or bl, 30h
mov [time+6], bl

mov bl, sec
and bl, 0fh
or bl, 30h
mov [time+7], bl
mov [time+8], 's'

mov ah, 09h
mov dx, offset time
int 21h 

mov ah, 01
int 16h  
jnz keyp
jmp back

keyp:
mov ax, 4c00h
int 21h

mycode ends
end start 
