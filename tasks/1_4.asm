;вывод форматированного текста на экран с предварительной его очисткой

text	segment 'code'
		assume CS:text, DS:data
		
begin:
		mov		ax,data				;
		mov		ds,ax				;
		mov		ah,09h				;
		mov		dx,offset message	;
		int		21h					;
		mov		ax,4c00h			;
		int		21h					;
text ends

data	segment
		message db 80*25 dup(' '),10,13					;
				db 9,'Hello world!',10,13				;
				db 9,'This is a multiline',10,13		;
				db 9,'formatted text',10,13				;
				db 9,'displaying program',10,13			;
				db 9,'with screen clearing$'
data ends

stk		segment stack 'stack'
		dw 128 dup(0)
stk ends
	end begin