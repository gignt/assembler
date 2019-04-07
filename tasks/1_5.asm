;вывод на экран последовательности символов с использованием цикла

text	segment 'code'
		assume CS:text, DS:data
begin:
		mov		ax,data				;
		mov		ds,ax				;
		mov		cx,223				;
		mov		si,0				;
		mov		al,32				;
fill:
		mov		symbols[si],al		;
		inc		al					;
		inc		si					;
		loop 	fill				;
		mov		ah,40h				;
		mov		bx,1				;
		mov		cx,223				;
		mov		dx,offset symbols	;
		int		21h					;
		mov		ax,4c00h			;
		int		21h					;
text ends
data	segment
		symbols db 223 dup ('*')	;
data end
stk		segment stack 'stack'
		dw 128 dup(0)
stk ends
	end begin