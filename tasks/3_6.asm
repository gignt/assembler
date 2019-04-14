; Управление курсором с помощью клавиатуры

text	segment 'code'
		assume CS:text, DS:data

cursor	proc
		mov		cx,16		;
		mov		si,curx		;
line1:
		push	cx			;
		mov		ah,0ch		;
		mov		al,color	;
		mov		bh,0		;
		mov		cx,si		;
		sub		cx,8		;
		mov		dx,cury		;
		int		10h			;
		inc		si			;
		pop		cx			;
		loop	line1		;
		
		mov		cx,16		;
		mov		si,cury		;
line2:
		push	cx			;
		mov		ah,0ch		;
		mov		al,color	;
		mov		bh,0		;
		mov		cx,curx		;
		mov		dx,si		;
		sub		dx,8		;
		int		10h			;
		inc		si			;
		pop		cx			;
		loop	line2		;
		ret					;
cursor endp

main	proc	
		mov		ax,data		;
		mov		ds,ax		;
		mov		ah,00h		;
		mov		al,10h		;
		int		10h			;
		
		mov		curx,600	;
		mov		cury,300	;
		call	cursor		;
readkey:
		mov		ah,08h		;
		int		21h			;
		cmp		al,4bh		;
		je		left		;
		cmp		al,4dh		;
		je		right		;
		cmp		al,48h		;
		je		up			;
		cmp		al,50h		;
		je		down		;
		cmp		al,27		;
		jne		readkey		;
exit:
		mov		ah,00h		;
		mov		al,03h		;
		int		10h			;
		mov		ax,4c00h	;
		int		21h			;
left:
		mov		color,0		;
		call	cursor		;
		cmp		curx,8		;
		je		nocorr		;
		dec		curx		;
nocorr:
		mov		color,4		;
		call	cursor		;
		jmp		readkey		;
right:
		mov		color,0		;
		call	cursor		;
		cmp		curx,630	;
		je		nocorr1		;
		inc		curx		;
nocorr1:
		mov		color,4		;
		call	cursor		;
		jmp		readkey		;
up:
		mov		color,0		;
		call	cursor		;
		cmp		cury,8		;
		je		nocorr2		;
		dec		cury		;
nocorr2:
		mov		color,4		;
		call	cursor		;
		jmp		readkey		;
down:
		mov		color,0		;
		call	cursor		;
		cmp		cury,300	;
		je		nocorr3		;
		inc		cury		;
nocorr3:
		mov		color,4		;
		call	cursor		;
		jmp		readkey		;
		
main endp
text ends

data	segment
		curx	dw ?
		cury	dw ?
		color	db 4
data ends
		
stk		segment stack 'stack'
		dw 128 dup(0)
stk ends
	end main