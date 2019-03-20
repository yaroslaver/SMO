unit SMO_F_OBJ;
interface
type
 ist = object
 N: integer;
 TPOST, LAM: real;
 procedure generation;
 procedure init(k: integer; l: real);
 end;

 ist2 = object(ist)
 DLAM: real;
 MAXL: real;
 procedure add;
 procedure init(k: integer; l, ml, dl: real);
 end;

 bufer_el = record
 N: integer;
 T: real;
 end;

 bufer = object
 INDBUF, NOMBUF, NOMOB, MAX: integer;
 TOB: real;
 BUF: array[1..5] of bufer_el;
 procedure init;
 procedure inbuf(t: real; n: integer);
 procedure outbuf;
 end;

 pribor = object
 THO, TOSV, TAYOB, TAY: real;
 procedure init(t1, t2: real);
 procedure work(t: real);
 end;

 statistic = record
 KOL: array[1..4] of longint;
 KOLBR: array[1..4] of longint;
 KOTK: array[1..4] of longint;
 TOG: array[1..4] of real;
 MTOG: array[1..4] of real;
 BOTK: array[1..4] of real;
 end;
implementation
  procedure pribor.init(t1, t2: real);
 begin
  THO:= 0;
  TOSV:= 0;
  TAYOB:= 0;
  TAY:= t1 + (t2 - t1);
 end;

 procedure pribor.work(t: real);
 begin
 THO:= t;

 randomize;

 TAYOB:= TAY * (RANDOM(100) + 1);
 TOSV:= THO + TAYOB;
 end;

 procedure bufer.init;
 begin
  INDBUF:= 0;
  MAX:= 5;
  NOMBUF:= 0;
  NOMOB:= 0;
  TOB:= 0;
 end;

 procedure bufer.inbuf(t: real; n: integer);
 begin
  INDBUF:= INDBUF + 1;
  BUF[INDBUF].T:= t;
  BUF[INDBUF].N:= n;
 end;

 procedure bufer.outbuf;
 var
  i, j: integer;
 begin
  for i:= 4 downto 1 do
   begin
    for j:= 1 to MAX do
     begin
      if (BUF[j].N = i) then
       NOMBUF:= j;
     end;
   end;
  NOMOB:= BUF[NOMBUF].N;
  TOB:= BUF[NOMBUF].T;
  i:= NOMBUF;
  while (i + 1 <= INDBUF) do
   begin
    BUF[i].N:= BUF[i + 1].N;
    BUF[i].T:= BUF[i + 1].T;
    i:= i + 1;
   end;
  INDBUF:= INDBUF - 1;
 end;

 procedure ist.generation;
  var
   TAY: real;
  begin

   randomize;

   TAY:= 1.0/LAM*LN(RANDOM(100) + 1);
   TPOST:= TPOST + TAY;
  end;

  procedure ist.init(k: integer; l: real);
   begin
    N:= k;
    LAM:= l;
    TPOST:= 0;
   end;

  procedure ist2.add;
   begin
    if (LAM < MAXL) then
     LAM:= LAM + DLAM;
   end;

  procedure ist2.init(k: integer; l, ml, dl: real);
   begin
    N:= k;
    LAM:= l;
    MAXL:= ml;
    DLAM:= dl;
    TPOST:= 0;
   end;
end.