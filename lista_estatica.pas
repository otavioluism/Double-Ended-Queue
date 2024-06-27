program FilaEstatica;

uses
  crt; // Importa a unidade crt para acesso às funções de controle de terminal

const
  MaxSize = 5; // Tamanho máximo da lista

type
  DequeList = record
    items: array[1..MaxSize] of Integer;
    init, last, size: Integer;
  end;

var
  i: Integer;
  deque_list: DequeList;

// Inicializa a lista
procedure StartStaticList(var deque_list: DequeList);
begin
  deque_list.init := -1;
  deque_list.last := -1;
  deque_list.size := 0;
end;

// Verifica se a fila está vazia
function IsEmptyList(var deque_list: DequeList): Boolean;
begin
  IsEmptyList := (deque_list.size = 0);
end;

// Verifica se há espaço no final da lista
function IsEmptyListInLast(var deque_list: DequeList): Boolean;
begin
  IsEmptyListInLast := deque_list.last < MaxSize - 1;
end;

// Verifica se há espaço no início da lista
function IsEmptyListInit(var deque_list: DequeList): Boolean;
begin
  IsEmptyListInit := deque_list.init > 0;
end;

// Verifica se a fila está cheia
function ListIsFull(var deque_list: DequeList): Boolean;
begin
  ListIsFull := deque_list.size = MaxSize;
end;

// Insere um valor no início da lista
procedure InsertInBeginList(var deque_list: DequeList; value: Integer);
var
  i: Integer;
begin

  if ListIsFull(deque_list) then
  begin
    WriteLn('Erro: A lista está cheia');
    Exit;
  end;

    // If deque is initially empty
    if (deque_list.init = -1) then  
    begin
        deque_list.init := 0;
        deque_list.last := 0;
    end 
    else if deque_list.init = 0 then 
    begin 
        deque_list.init := MaxSize - 1;  // wrap around
    end
    else
    begin
        deque_list.init := deque_list.init - 1;
    end;

    deque_list.items[deque_list.init] := value;
    deque_list.size := deque_list.size + 1;
    WriteLn('Inserted at the front. ', value);
end;

// Exibe os elementos da lista
procedure PrintList(var deque_list: DequeList);
var 
  i: Integer;
begin 
    if (IsEmptyList(deque_list)) then
    begin 
        WriteLn('Deque is empty.....');
        Exit
    end;

    WriteLn('The elements DEQUE are: ');
    i := deque_list.init;
    while True do 
    begin
        Write('[',deque_list.items[i], ']');
        if (i = deque_list.last) then
            break;
        i := (i + 1) mod MaxSize;
    end;
end;

begin
  StartStaticList(deque_list);

  // Inserindo elementos no início da lista
  InsertInBeginList(deque_list, 66);
  InsertInBeginList(deque_list, 30);
  InsertInBeginList(deque_list, 40);

  // Exibindo a lista
  PrintList(deque_list);
  
  WriteLn();
  WriteLn('Elemento inicial ', deque_list.items[deque_list.init]);
  WriteLn('Elemento final ', deque_list.items[deque_list.last]);


end.
