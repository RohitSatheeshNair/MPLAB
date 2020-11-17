.model small
.data
num1 db 20h
num2 db 10h
res db ?

.code
mov ax,@data
mov ds,ax

mov al,num1
sub al,num2
mov res,al

mov ah,4ch
int 21h
end
