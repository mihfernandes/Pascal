Program Sistema_Bibliotecas;
uses crt;

Type
  listagem = array[1..21] of string[100];

  cpfs = array[1..21] of string[20];

  livros = record
    titulo: string[100];
    autor: string[100];
    editora: string[100];
    edicao: string[100];
    quant_exist: integer;
    quant_emprest: integer;
    cpf_emprest: cpfs;
    q: integer; {Identificador de cpfs}
  end;

  leitores = record
    nome: string[100];
    endereco: string[100];
    telefone: string[20];
    cpf: string[20];
    data_nasc: string[10];
    data_cadast: integer;
    data_emprest: integer;
    quant_emprest: integer;
    listagem_emprest: listagem;
    data_devolucao: integer;
    testado: boolean;
    o: integer; {Identificador de emprestimos dos leitores}
  end;

Var
  telainicial, func, func2, sair, i, j, k, l, m, n, o, p, q, r,
  s, t, aux, excluir, teste, teste2, dia, dia2, mes, mes2, ano, ano2: integer;
  modificaleitor, modificaquant, excluirlivro, excluirleitor, nome,
  emprestimo, devolucao, consulta: string[100];
  livro: array[1..21] of livros;
  leitor: array[1..21] of leitores;

procedure LerData;
Begin
  i:= 1;
  j:= 1;
  k:= 1;
  o:= 1;
  q:= 1;
  func:= 0;
  func2:= 0;
  aux:= 0;
  writeln ('Olá¡! Seja bem vindo(a) ao Sistema de Biblioteca. Digite a data de hoje.');
  writeln;
  repeat
    writeln ('Digite o dia (com dois dígitos, de 01 a 30):');
    writeln;
    readln (dia);
    writeln;
    writeln ('Digite o mês (com dois dígitos, de 01 a 12):');
    writeln;
    readln (mes);
    writeln;
    writeln ('Digite o ano (com 4 dígitos):');
    writeln;
    readln (ano);
    writeln;
    if (dia>0) and (mes>0) then
    begin
      if (dia<24) and (mes<13) then
      begin
        dia2 := dia+7;
        mes2 := mes;
        ano2 := ano;
      end
      else if (dia>23) and (dia<31) then
      begin
        if (mes<12) then
        begin
          dia2:= dia-23;
          mes2:= mes+1;
          ano2:= ano;
        end
        else if (mes=12) then
        begin
          dia2:=dia-23;
          mes2:=01;
          ano2:=ano+1;
        end;
      end
      else writeln('Você digitou uma data inválida! Repita o procedimento:');
      writeln;
    end
    else writeln('Você digitou uma data inválida! Repita o procedimento:');
    writeln;
  until (dia>0) and (dia<=30) and (mes>0) and (mes<=12);
end;

procedure NovoLivro;
begin
  writeln ('CADASTRO DE NOVO LIVRO');
  writeln;
  writeln ('Digite o Título do livro a ser cadastrado.');
  writeln;
  readln (livro[i].titulo);
  writeln ('Digite o nome do Autor do livro.');
  writeln;
  readln (livro[i].autor);
  writeln ('Digite o nome da Editora do livro.');
  writeln;
  readln (livro[i].editora);
  writeln ('Digite a Edição do livro.');
  writeln;
  readln (livro[i].edicao);
  writeln ('Digite a Quantidade de exemplares existentes.');
  writeln;
  readln (livro[i].quant_exist);
  i:= i + 1;
  func2:= -1;
end;


procedure NovoLeitor;
begin
  writeln ('CADASTRO DE NOVO LEITOR');
  writeln;
  writeln ('Digite o Nome do novo leitor.');
  writeln;
  readln (leitor[j].nome);
  writeln ('Digite o EndereÃ§o do novo leitor.');
  writeln;
  readln (leitor[j].endereco);
  writeln ('Digite o Telefone do novo leitor.');
  writeln;
  readln (leitor[j].telefone);
  writeln ('Digite o CPF do novo leitor.');
  writeln;
  readln (leitor[j].cpf);
  writeln ('Digite a Data de Nascimento do novo leitor.');
  writeln;
  readln (leitor[j].data_nasc);
  writeln ('Digite a Data do Cadastramento do novo leitor.');
  writeln;
  readln (leitor[j].data_cadast);
  writeln;
  j:= j + 1;
  func2:= -1;
end;

procedure AlterarNumeroExemplares;
begin
  writeln ('Digite o Nome do livro cuja quantidade deve ser modificada.');
  writeln;
  readln (modificaquant);
  writeln;
  begin
    l:= 0;
    for k:= 1 to (i-1) do
    begin
      if (livro[k].titulo = modificaquant) then
      begin
        writeln ('Digite a nova quantidade de exemplares.');
        writeln;
        readln (livro[k].quant_exist);
        l:= 1;
      end;
    end;
    writeln;
    func2:= -1;
    if (l <> 1) then
    begin
      writeln ('Nao foram encontrados exemplares com esse titulo.');
      writeln;
      writeln ('Tecle ENTER para voltar.');
      writeln;
      readln;
      writeln;
    end;
  end;
end;

procedure AlterarLeitor;
begin
  writeln ('Digite o Nome do Leitor cujo cadastro sera mudado.');
  writeln;
  readln (modificaleitor);
  writeln;
  begin
    l:= 0;
    for k:= 1 to (j-1) do
    begin
      if (leitor[k].nome = modificaleitor) then
      begin
        writeln ('Digite o novo Nome do leitor.');
        writeln;
        readln (leitor[k].nome);
        writeln ('Digite o novo Endereço do leitor.');
        writeln;
        readln (leitor[k].endereco);
        writeln ('Digite o novo Telefone do leitor.');
        writeln;
        readln (leitor[k].telefone);
        writeln ('Digite o novo CPF do leitor.');
        writeln;
        readln (leitor[k].cpf);
        writeln ('Digite a nova Data de Nascimento do leitor.');
        writeln;
        readln (leitor[k].data_nasc);
        writeln ('Digite a nova Data do Cadastramento do leitor.');
        writeln;
        readln (leitor[k].data_cadast);
        l:= 1;
      end;
    end;
    writeln;
    func2:= -1;
    if (l <> 1) then
    begin
      writeln ('Não foram encontrados leitores com esse nome.');
      writeln;
      writeln ('Tecle ENTER para voltar.');
      writeln;
      readln;
      writeln;
    end;
  end;
end;


procedure ExcluirLivroLeitor;
begin
  l:= 0;
  writeln ('Para excluir um livro digite 1. Para excluir um leitor digite 2.');
  writeln;
  readln (excluir);
  writeln;
  if (excluir = 1) then
  begin
    writeln ('Digite o nome do livro que deseja exluir.');
    writeln;
    readln (excluirlivro);
    writeln;
    for k:= 1 to (i-1) do
    begin
   
      if ((i-1) = 1) or (k = (i-1)) then
      begin
   
        livro[k].titulo:= livro[21].titulo;
        livro[k].autor:= livro[21].autor;
        livro[k].editora:= livro[21].editora;
        livro[k].edicao:= livro[21].edicao;
        livro[k].quant_exist:= livro[21].quant_exist;
        l:= 1;
      end;
      if (livro[k].titulo = excluirlivro) and (k <> (i-1)) then
      begin
        for m:= k to (i-1) do
        begin
          if (k <> i-1) then
          begin
            livro[k].titulo:= livro[k+1].titulo;
            livro[k].autor:= livro[k+1].autor;
            livro[k].editora:= livro[k+1].editora;
            livro[k].edicao:= livro[k+1].edicao;
            livro[k].quant_exist:= livro[k+1].quant_exist;
            l:= 1;
          end
          else
          begin

            livro[k].titulo:= livro[21].titulo;
            livro[k].autor:= livro[21].autor;
            livro[k].editora:= livro[21].editora;
            livro[k].edicao:= livro[21].edicao;
            livro[k].quant_exist:= livro[21].quant_exist;
            l:= 1;
          end;
        end;
      end;
    end;
    writeln;
    func2:= -1;
    if (l <> 1) then
    begin
      writeln ('Nao foram encontrados livros com esse nome.');
      writeln;
      writeln ('Tecle ENTER para voltar.');
      writeln;
      readln;
      writeln;
    end
    else
    begin
      writeln ('Livro excluido com sucesso.');
      writeln;
      writeln ('Tecle ENTER para voltar.');
      writeln;
      readln;
      writeln;
      i:= i - 1;
    end;
  end;
  if (excluir = 2) then
  begin
    writeln ('Digite o nome do leitor que deseja excluir.');
    writeln;
    readln (excluirleitor);
    writeln;
    for k:= 1 to (j-1) do
    begin
      {Se (j-1) = 1, então so ha um leitor.}
      if ((j-1) = 1) or (k = (j-1)) then
      begin
 
        leitor[k].nome:= leitor[21].nome;
        leitor[k].endereco:= leitor[21].endereco;
        leitor[k].telefone:= leitor[21].telefone;
        leitor[k].cpf:= leitor[21].cpf;
        leitor[k].data_nasc:= leitor[21].data_nasc;
        leitor[k].data_cadast:= leitor[21].data_cadast;
        l:= 1;
      end;
      if (leitor[k].nome = excluirleitor) and (k <> (j-1)) then
      begin
        for m:= k to (j-1) do
        begin
          if (k <> j-1) then
          begin
            leitor[k].nome:= leitor[k+1].nome;
            leitor[k].endereco:= leitor[k+1].endereco;
            leitor[k].telefone:= leitor[k+1].telefone;
            leitor[k].cpf:= leitor[k+1].cpf;
            leitor[k].data_nasc:= leitor[k+1].data_nasc;
            leitor[k].data_cadast:= leitor[k+1].data_cadast;
            l:= 1;
          end
          else
          begin
          
            leitor[k].nome:= leitor[21].nome;
            leitor[k].endereco:= leitor[21].endereco;
            leitor[k].telefone:= leitor[21].telefone;
            leitor[k].cpf:= leitor[21].cpf;
            leitor[k].data_nasc:= leitor[21].data_nasc;
            leitor[k].data_cadast:= leitor[21].data_cadast;
            l:= 1;
          end;
        end;
      end;
    end;
    writeln;
    func2:= -1;
    if (l <> 1) then
    begin
        writeln ('Nao foram encontrados leitores com esse nome.');
        writeln;
        writeln ('Tecle ENTER para voltar.');
        writeln;
        readln;
        writeln;
    end
    else
    begin
        writeln ('Leitor excluido com sucesso.');
        writeln;
        writeln ('Tecle ENTER para voltar.');
        writeln;
        readln;
        writeln;
    end;
  end;
end;


procedure ListaLivrosExistentes;
begin
  for k:= 1 to (i-1) do
    writeln ('Livro ', k, ': ', livro[k].titulo);
  writeln;
  func2:= -1;
  writeln ('Tecle ENTER para voltar.');
  writeln;
  readln;
  writeln;
end;


procedure ListaLivrosEmprestados;
begin
  for k:= 1 to (i-1) do
    if (livro[k].quant_emprest <> 0) then
    begin
      for m:= 1 to (j-1) do
        for p:= 1 to livro[k].q do
        begin
          if (livro[k].cpf_emprest[p] = leitor[m].cpf) then
          begin
            writeln ('Livro "', livro[k].titulo, '" emprestado a ', leitor[m].nome);
            writeln;
          end;
        end;
    end
    else if (k = (i-1)) then
    begin
      writeln ('Nao há livros emprestados.');
      writeln;
    end;
    writeln ('Tecle ENTER para voltar.');
    writeln;
    readln;
    writeln;
    func2:= -1;
end;


procedure ListaLeitores;
begin
  if (livro[k].q = 0) then
  begin
    t:= livro[k].q;
    livro[k].q:= 1;
  end;
  writeln ('Digite o titulo do livro a consultar.');
  writeln;
  readln (consulta);
  writeln;
  for k:= 1 to (i-1) do
    if (consulta = livro[k].titulo) then
    begin
      for m:= 1 to (j-1) do
        for p:= 1 to livro[k].q do
          if (livro[k].cpf_emprest[p] = leitor[m].cpf) then
          begin
            writeln (leitor[m].nome);
            writeln;
          end
          else if (((m = (j-1)) and (k = (i-1))) and (p = livro[k].q)) then
          begin
            writeln ('Nao há emprestimos para esse livro.');
            writeln;
          end;
    end;
    if ((k = (i-1)) and (consulta <> livro[k].titulo)) then
    begin
      writeln ('Não há livros com este título.');
      writeln;
    end;
    writeln ('Tecle ENTER para voltar.');
    writeln;
    readln;
    writeln;
    livro[k].q:= t;
    func2:= -1;
end;


procedure Menu1;
begin
  repeat
    clrscr;
    writeln ('1 para CADASTRAR NOVO LIVRO.');
    writeln;
    writeln ('2 para CADASTRAR NOVO LEITOR.');
    writeln;
    writeln ('3 para MODIFICAR A QUANTIDADE DE EXEMPLARES DE UM LIVRO JÁ CADASTRADO.');
    writeln;
    writeln ('4 para MODIFICAR O CADASTRO DE UM LEITOR.');
    writeln;
    writeln ('5 para EXCLUIR CADASTRO DE UM LIVRO OU DE UM LEITOR.');
    writeln;
    writeln ('6 para CONSULTAR LISTAGEM DE LIVROS EXISTENTES NA BIBLIOTECA.');
    writeln;
    writeln ('7 para CONSULTAR LISTAGEM DE LIVROS EMPRESTADOS COM SEUS RESPECTIVOS LEITORES.');
    writeln;
    writeln ('8 para CONSULTAR LISTAGEM DE LEITORES DE DETERMINADO LIVRO (A PARTIR DO TÍTULO).');
    writeln;
    writeln ('-1 para VOLTAR.');
    writeln;
    readln (func);
    writeln;
    func2:= func;
    while (func2 <> -1) do
    begin
      if (func = 1) then NovoLivro
      else if (func = 2) then NovoLeitor
      else if (func = 3) then AlterarNumeroExemplares
      else if (func = 4) then AlterarLeitor
      else if (func = 5) then ExcluirLivroLeitor
      else if (func = 6) then ListaLivrosExistentes
      else if (func = 7) then ListaLivrosEmprestados
      else if (func = 8) then ListaLeitores;
    end;
  until (func = -1);
end;


procedure PegaLivro;
begin
  if (leitor[n].testado = false) then
  begin
    o:= 1;
    leitor[n].o:= o;
  end
  else if (leitor[n].testado = true) then o:= leitor[n].o;
  writeln ('Digite o nome do livro que deseja pegar.');
  writeln;
  readln (emprestimo);
  writeln;
  for k:= 1 to (i-1) do
    if (emprestimo = livro[k].titulo) and (livro[k].q = 0) then
    begin
      livro[k].q:= 1;
      if (livro[k].quant_exist > livro[k].quant_emprest) and (o <= 5) then
      begin
        livro[k].quant_emprest:= livro[k].quant_emprest + 1;
        livro[k].cpf_emprest[livro[k].q]:= leitor[n].cpf;
        writeln ('Empréstimo efetuado com sucesso.');
        writeln;
        leitor[n].quant_emprest:= leitor[n].quant_emprest + 1;
        leitor[n].listagem_emprest[leitor[n].o]:= livro[k].titulo;
        o:= o + 1;
        q:= q + 1;
        livro[k].q:= q;
        leitor[n].o:= o;
        leitor[n].data_emprest:= dia;
        leitor[n].data_devolucao:= dia2;
      end
      else  writeln ('Empréstimo nao efetuado.');
      writeln;
    end;
    if (emprestimo = livro[k].titulo) and (livro[k].q <> 0) then
    begin
      if (livro[k].quant_exist > livro[k].quant_emprest) and (o <= 5) then
      begin
        livro[k].quant_emprest:= livro[k].quant_emprest + 1;
        livro[k].cpf_emprest[livro[k].q]:= leitor[n].cpf;
        writeln ('Empréstimo efetuado com sucesso.');
        writeln;
        leitor[n].quant_emprest:= leitor[n].quant_emprest + 1;
        leitor[n].listagem_emprest[leitor[n].o]:= livro[k].titulo;
        o:= o + 1;
        q:= q + 1;
        livro[k].q:= q;
        leitor[n].o:= o;
        leitor[n].data_emprest:= dia;
        leitor[n].data_devolucao:= dia2;
      end
      else
      begin
        writeln ('Empréstimo não efetuado.');
        writeln;
      end;
    end
    else if (k = (i-1)) then
    begin
      writeln ('Nao foram encontrados exemplares com esse titulo.');
      writeln;
    end;
    writeln ('Tecle ENTER para voltar.');
    writeln;
    readln;
    writeln;
    leitor[n].testado:= true;
    func2:= -1;
end;

procedure DevolverLivro;
begin
  if (leitor[n].testado = false) then o:= 1
  else o:= leitor[n].o;
  writeln ('Digite o nome do livro que deseja devolver.');
  writeln;
  readln (devolucao);
  writeln;
  for k:= 1 to (i-1) do
    for s:= 1 to leitor[n].o do
      if (devolucao = livro[k].titulo) and (devolucao = leitor[n].listagem_emprest[s]) then
      begin
        livro[k].quant_emprest:= livro[k].quant_emprest - 1;
        for m:= 1 to livro[k].q do
        begin
          if (livro[k].q = 1) or (m = livro[k].q) then
            livro[k].cpf_emprest[m]:= livro[k].cpf_emprest[21];
          if (m <> livro[k].q) then
          begin
            for p:= m to livro[k].q do
              if (p <> livro[k].q) then
                livro[k].cpf_emprest[p]:= livro[k].cpf_emprest[p+1]
              else
                livro[k].cpf_emprest[p]:= livro[k].cpf_emprest[21];
          end;
        end;
        writeln ('Devolução efetuada com sucesso.');
        writeln;
        leitor[n].quant_emprest:= leitor[n].quant_emprest - 1;
        for m:= 1 to leitor[n].o do
        begin
          if (leitor[n].o = 1) or (m = leitor[n].o) then
            leitor[n].listagem_emprest[m]:= leitor[n].listagem_emprest[21];
          if (m <> leitor[n].o) then
          begin
            for p:= m to leitor[n].o do
              if (m <> leitor[n].o) then
                leitor[n].listagem_emprest[p]:= leitor[n].listagem_emprest[p+1]
              else
                leitor[n].listagem_emprest[p]:= leitor[n].listagem_emprest[21];
          end;
        end;
        o:= o - 1;
        q:= q - 1;
        livro[k].q:= q;
        leitor[n].o:= o;
        if (leitor[n].quant_emprest = 0) then
        begin
          leitor[n].data_emprest:= leitor[21].data_emprest;
          leitor[n].data_devolucao:= leitor[21].data_devolucao;
        end;
      end
      else if (k = (i-1)) then
      begin
        writeln ('Devolução nao efetuada.');
        writeln;
      end;
      writeln ('Tecle ENTER para voltar.');
      writeln;
      readln;
      writeln;
      func2:= -1;
end;


procedure MeusEmprestimos;
begin
  writeln ('A quantidade de empréstimos vigentes no seu nome e: ', (leitor[n].quant_emprest));
  writeln;
  writeln ('Tecle ENTER para voltar.');
  writeln;
  readln;
  writeln;
  func2:= -1;
end;


procedure ListarLivrosEmprestados;
begin
  for k:= 1 to 5 do
  begin
    l:= 0;
    if (leitor[n].listagem_emprest[k] <> leitor[21].listagem_emprest[k]) then
    begin
      writeln (leitor[n].listagem_emprest[k]);
      l:= 1;
    end
    else if (l <> 1) and (k = 5) then
    begin
      writeln ('Não há emprestimos no seu nome.');
      writeln;
    end;
  end;
  writeln ('Tecle ENTER para voltar.');
  writeln;
  readln;
  writeln;
  func2:= -1;
end;

procedure Menu2;
begin
  teste2:= -1;
  repeat
    writeln ('Digite o seu nome conforme o cadastro.');
    writeln;
    readln (nome);
    writeln;
    for k:= 1 to (j-1) do
    begin
      if (nome = leitor[k].nome) then
      begin
        n:= k;
      //  k:= j-1;
        teste2:= 1;
      end
      else if (k = (j-1)) then
      begin
        writeln ('Nome nao encontrado no cadastro.');
        writeln;
      end;
    end;
  until (teste2 <> -1);
  repeat
    writeln ('Digite 1 para PEGAR UM LIVRO EMPRESTADO.');
    writeln;
    writeln ('Digite 2 para DEVOLVER UM LIVRO.');
    writeln;
    writeln ('Digite 3 para CONSULTAR QUANTOS EMPRESTIMOS estÃ£o VIGENTES NO SEU NOME.');
    writeln;
    writeln ('Digite 4 para CONSULTAR QUAIS LIVROS estÃ£o EMPRESTADOS.');
    writeln;
    writeln ('Digite -1 para VOLTAR.');
    writeln;
    readln (func);
    writeln;
    func2:= func;
    while (func2 <> -1) do
    begin
      if (func = 1) then PegaLivro
      else if (func = 2) then DevolverLivro
      else if (func = 3) then MeusEmprestimos
      else if (func = 4) then ListarLivrosEmprestados;
    end;
  until (func = -1);
end;


begin
  repeat
    clrscr;
    writeln ('Digite 1 para um Funcionário ou 2 para um Leitor.');
    writeln;
    readln (telainicial);
    writeln;
    if (telainicial = 1) then Menu1
    else if (telainicial = 2) then
    begin
      teste2:= -1;
      repeat
        writeln ('Digite o seu nome conforme o cadastro.');
        writeln;
        readln (nome);
        writeln;
        for k:= 1 to (j-1) do
        begin
          if (nome = leitor[k].nome) then
          begin
            n:= k;
          //  k:= j-1;
            teste2:= 1;
          end
          else if (k = (j-1)) then
          begin
            writeln ('Nome nao encontrado no cadastro.');
            writeln;
          end;
        end;
      until (teste2 <> -1);
      Menu2;
    end;
  until (aux = -1);
end.
begin (teste2) then
      var
         quantidadeLivros := integer;
      limLivro = 5
               writeln('Informe quantos livros você possui');
              until(limLivro > 5);
                             writeln('Você não pode ter mais que 5 livros');
                      loop while(limLivro <= 4);
