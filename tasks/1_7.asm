; ввод символа с клавиатуры с обработкой введенного символа

text	segment 'code'
		assume CS:text, DS:data
begin:
		mov		ax,data				;
		mov		ds,ax				;
input:
		mov		ah,09h				;
		mov		dx,offset promt		;
		int		21h					;
		mov		ah,01h				;
		int		21h					;
		cmp		al,'9'				;
		ja		error				;
		cmp		al,'0'				;
		jb		error				;
		mov		si,18				;
		mov		inbuf[si],al		;
		mov		ah,40h				;
		mov		bx,1				;
		mov		cx,19				;
		mov		dx,offset inbuf		;
		int		21h					;
		mov		ax,4c00h			;
		int		21h					;
error:
		mov		ah,09h				;
		mov		dx,offset message	;
		int		21h					;
		jmp		input				;
text ends

data	segment
		message db 10,13,'Incorrect symbol!$'	;
		promt	db 10,13,'Enter Symbol 0-9>$'	;
		inbuf	db 10,13,'Entered symbol >*'	;
data ends

stk		segment stack 'stack'
		dw 128 dup(0)
stk ends
	end begin