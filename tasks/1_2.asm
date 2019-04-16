; вывод строки на экран

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
		message db 'Hello world!$'	;
data ends
	end begin