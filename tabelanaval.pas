program Procura;
	label 99;

	const 
	Zero = 0;
	Ultimo = 10;
	Tam = 11;

type 
	Indice = 1 .. Tam;
		Tabela = array[Indice] of integer; 

	var 

Tab : Tabela;
I : integer;
Num : integer;
Achou : boolean;

begin 
	for I : = 1 to Ultimo do
		begin
	read(Tab[I]);
		if Tab [I] <= Zero
		then
			begin
	writeln("Valor Invalido", Tab[I]);
	goto 99
	end
end; 
	readln (Num);
	while Num > Zero do
		begin
			Tab[Tam] := Num;
	I := Zero;
Achou := false;
	while not Achou do
begin
	I := I+1;
		Achou := Tab[I] = Num
end;

if I < Tam //valor de *do (algoritmo) while [I] ...(algoritmo)*
		then
	writeln("Achei! ", Num, "na posição ", I); 
		else
	writeln("Nao achei :c", Num, "na tabela");
		readln(Num);
	end;
99;
end
