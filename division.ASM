.model small

.data
num1 dw 1234
num2 db 67
quotient db ?
rem db ?

.code
mov ax,@data
mov ds,ax

mov ax,num1
div num2
mov quotient ,al
mov rem , ah

mov ah,4ch
int 21h
end
