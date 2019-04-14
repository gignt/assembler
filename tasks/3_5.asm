; Вывод звукового сигнала на PC speaker

text	segment 'code'
		assume CS:text, DS:data

begin:	
		mov			ax,data			;
		mov			ds,ax			;
		mov			al,0B6h			;
		out			43h,al			;
		in			al,61h			;
		or			al,3			;
		out			61h,al			;
		mov			cx,50			;
snd:	
		push		cx				;
		mov			ax,tone			;
		out			42h,al			;
		mov			al,ah			;
		out			42h,al			;
		mov			cx,15			;
delay:
		push		cx				;
		mov			cx,65535		;
		loop		$				;
		mov			cx,65535		;
		loop		$				;
		pop			cx				;
		add			tone,50			;
		loop		snd				;
		
		in			al,61h			;
		and			al,0FCh			;
		out			61h,al			;
		
		mov			ax,4c00h		;
		int			21h				;
text ends

data	segment
		tone		dw 3000			;
data ends
		
stk		segment stack 'stack'
		dw 128 dup(0)
stk ends
	end begin