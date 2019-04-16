; вводстроки с клавиатуры и вывод на экран

text	segment 'code'
		assume CS:text, DS:data
begin:
		mov		ax,data				;
		mov		ds,ax				;
		mov		ah,02h				;
		mov		dl,'>'				;
		int		21h					;
		mov		ah,3fh				;
		mov		bx,0				;
		mov		cx,128				;
		mov		dx,offset inbuf		;
		int		21h					;
		mov		actlen,ax			;
		mov		ah,40h				;
		mov		bx,1				;
		mov		cx,actlen			;
		mov		dx,offset inbuf		;
		int		21h					;
		mov		ax,4c00h			;
		int		21h					;
text ends
data	segment
		actlen 	dw 0				;
		inbuf	db 128 dup('*')		;
data ends
stk		segment stack 'stack'
		dw 128 dup(0)
stk ends
	end begin