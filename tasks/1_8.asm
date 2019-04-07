text segment 'code'
	assume CS:text, DS:data

begin:
	mov	ax,data;
	mov ds,ax;
input:
	mov ah,09h;
	mov	dx,offset promt;
	int	21h;
	mov	bx,0;
pass:
	mov	ah,08h;
	int	21h;
	cmp	al,13;
	je	compare;
	mov	string[bx],al;
	inc	bx;
	jmp	pass;
compare:
	push	ds;
	pop		es;
	mov		si,offset string;
	mov		di,offset password;
	cld;
	mov		cx,bx;
repe	cmpsb
	je		pass2;
error:
	mov		ah,09h;
	mov		dx,offset message;
	int		21h;
	jmp		input;
pass2:
	mov		ah,09h;
	mov		dx,offset passok;
	int		21h;
	mov		ax,4c00h;
	int		21h;
text ends

data	segment
		passok db 10, 13, 'Password accepted!$';
		message db 13, 13, 'Incorrect password!$';
		promt db 10, 13, 'Enter password>$';
		string db 80 dup (?);
		password db 'password';
data ends

stk		segment stack 'stack'
		dw 128 dup(0)
stk	ends
	end begin