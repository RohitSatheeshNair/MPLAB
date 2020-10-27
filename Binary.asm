. model small
display macro msg
lea dx,msg
mov ah,09h
int 21h
endm

.data
list db 01h, 05h, 07h, 10h, 12h, 14h
number equ ($-list)
key db 10h
msg1 0dh,0ah, "Element found in the list....$"
msg2 0dh,0ah, "Search failed! Element not found in the list $"

.code
start: mov ax,@data
       mov ds,ax
       
       mov ch, number-1
       mov cl, 00h
       
again: mov si, offset list
       xor ax,ax
       cmp cl,ch
       jc next
       jnc failed
       
next: mov al,cl
      add al,ch
      shr al,01h
      mov bl,al
      xor ah,ah
      mov bp,ax
      mov al,ds:[bp][si]
      cmp al,key
      je success
      jc inflow
      mov ch,bl
      dec ch
      jmp again
      
inclow: mov cl,bl
        inc cl
        jmp again
        
success: display msg1
         jmp final
   
failed: display msg2

final: mov ah,4ch
       int 21h
       
end start