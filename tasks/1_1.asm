;вывод строки на экран
text	segment 'code'
		assume CS:text, DS:text
		
begin:
		mov		ax,text				;
		mov		ds,ax				;
		mov		ah,09h				;
		mov		dx,offset message	;
		int		21h					;
		mov		ax,4ch				;
		mov		al,00h				;
		int		21h					;
		
		message db 'Hello world!$'	;
	
text ends
	end begin	