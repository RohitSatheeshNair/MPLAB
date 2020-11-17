.model small
.data

a dw 245h
b dw 25h
c dw 34h
d dw 50h
r1 dw ?
r2 dw ?
quo dw ?
rem dw ?

.code

mov ax,@data
mov ds,ax

mov ax,a
add ax,b
mov r1,ax
mov ax,c
add ax,d
mul r1
mov bx,b
add bx,d
div bx
mov quo,ax
mov rem,dx

mov ah,4ch
int 21h
end

mov ah,4ch
int 21h
end
