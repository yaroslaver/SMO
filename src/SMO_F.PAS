program SMO_F;

uses crt, graph, SMO_F_OBJ, SMO_I, SMO_G;

label BackToInterface;

 var
  istoch: array[1..3] of ist;
  istoch2: ist2;
  bufer1: bufer;
  pribor1: pribor;
  i, j: integer;
  MIN: bufer_el;
  stat: statistic;
  p: real;
  KMIN, count: integer;

  gd, gm: integer;
  B1, B2, B3, B4: button;
  S1, S2, S3, S4: spisok;
  act, act2: char;
  this, this2, y: integer;
  FL, FL2: boolean;
  E1: events;
  TAY2, LAM1, LAM2, DLAM, L1, L3, L4: real;
  infi: boolean;
  times, grafic, N: integer;
  inform: array[1..21] of statistic;

  OX: objOX;
  KOLBR: objKOLBR;
  KOTK: objKOTK;
  TOG: objTOG;
  MTOG: objMTOG;
  BOTK: objBOTK;
  check: integer;
 begin
  TAY2:= 4;
  LAM1:= 1;
  LAM2:= 5;
  DLAM:= 0.4;
  L1:= 1;
  L3:= 3;
  L4:= 4;
  infi:= true;
  grafic:= 1;
  N:= 1;
  check:= 0;
BackToInterface:
  Initgraph(gd, gm, 'c:\tp\bgi');
  SetBkColor(red);
  Setwritemode(xorput);
  B1.init(40, 20, 240, 70, 'Установка параметров');
  B1.draw;
  S1.init(40, 20, 240, 70, 2, 'Основные', 'Все', '', '', '', '');
  B2.init(250, 20, 370, 70, 'Моделирование');
  B2.draw;
  S2.init(250, 20, 370, 70, 6, 'Пуск', 'KOLBR', 'KOTK', 'TOG', 'MTOG', 'BOTK');
  B3.init(380, 20, 480, 70, 'Результаты');
  B3.draw;
  S3.init(380, 20, 480, 70, 1, 'Статистика', '', '', '', '', '');
  B4.init(490, 20, 590, 70, 'Помощь');
  B4.draw;
  S4.init(490, 20, 590, 70, 1, 'В программе', '', '', '', '', '');
  E1.check(check);
  act:= #0;
  this:= 1;
  FL:= false;
  B1.edges;
  while (infi <> false) do
   begin
    act:= readkey;
    case act of
    #75: if (this > 1) then this:= this - 1;
    #77: if (this < 4) then this:= this + 1;
    #13: FL:= true;
    end;
    case this of
    1: B1.edges;
    2: B2.edges;
    3: B3.edges;
    4: B4.edges;
    end;
    if (FL = true) then
     case this of
     1:
      begin
      S1.draw;
      S1.edges(1);
      this2:= 1;
      FL2:= false;
      act2:= #0;
       while (act2 <> #27) do
        begin
         act2:= readkey;
         case act2 of
         #72: if (this2 = 2) then this2:= 1;
         #80: if (this2 = 1) then this2:= 2;
         #13: FL2:= true;
         end;
         case this2 of
         1: S1.edges(1);
         2: S1.edges(2);
         end;
         if (FL2 = true) then
          case this2 of
          1:
           begin
            E1.event11(TAY2, LAM1, LAM2, DLAM);
            FL2:= false;
            goto BackToInterface;
           end;
          2:
           begin
            E1.event12(TAY2, LAM1, LAM2, DLAM, L1, L3, L4);
            FL2:= false;
            goto BackToInterface;
           end;
          end;
        end;
       S1.clear;
       FL:= false;
       B1.edges;
      end;
     2:
      begin
      S2.draw;
      S2.edges(1);
      this2:= 1;
      FL2:= false;
      act2:= #0;
       while (act2 <> #27) do
        begin
         act2:= readkey;
         case act2 of
         #72: if (this2 > 1) then this2:= this2 - 1;
         #80: if (this2 < 6) then this2:= this2 + 1;
         #13: FL2:= true;
         end;
         case this2 of
         1: S2.edges(1);
         2: S2.edges(2);
         3: S2.edges(3);
         4: S2.edges(4);
         5: S2.edges(5);
         6: S2.edges(6);
         end;
         if (FL2 = true) then
          case this2 of
          1:
           begin
            E1.event21(infi);
            FL2:= false;
            goto BackToInterface;
           end;
          2:
           begin
            N:= 1;
            E1.event26(grafic, N);
            FL2:= false;
            goto BackToInterface;
           end;
          3:
           begin
            N:= 2;
            E1.event26(grafic, N);
            FL2:= false;
            goto BackToInterface;
           end;
          4:
           begin
            N:= 3;
            E1.event26(grafic, N);
            FL2:= false;
            goto BackToInterface;
           end;
          5:
           begin
            N:= 4;
            E1.event26(grafic, N);
            FL2:= false;
            goto BackToInterface;
           end;
          6:
           begin
            N:= 5;
            E1.event26(grafic, N);
            FL2:= false;
            goto BackToInterface;
           end;
          end;
        end;
       S2.clear;
       FL:= false;
       B2.edges;
      end;
     3:
      begin
      S3.draw;
      S3.edges(1);
      this2:= 1;
      FL2:= false;
      act2:= #0;
       while (act2 <> #27) do
        begin
         act2:= readkey;
         case act2 of
         #13: FL2:= true;
         end;
         case this2 of
         1: S3.edges(1);
         end;
         if (FL2 = true) then
          case this2 of
          1:
           begin
            E1.event31(check);
            FL2:= false;
            goto BackToInterface;
           end;
          end;
        end;
       S3.clear;
       FL:= false;
       B3.edges;
      end;
     4:
      begin
      S4.draw;
      S4.edges(1);
      this2:= 1;
      FL2:= false;
      act2:= #0;
       while (act2 <> #27) do
        begin
         act2:= readkey;
         case act2 of
         #13: FL2:= true;
         end;
         case this2 of
         1: S4.edges(1);
         end;
         if (FL2 = true) then
          case this2 of
          1:
           begin
            E1.event41;
            S4.edges(1);
            act2:= readkey;
            E1.event41;
            FL2:= false;
            goto BackToInterface;
           end;
          end;
        end;
       S4.clear;
       FL:= false;
       B4.edges;
      end;
     end;
   end;



 ClearDevice;
 SetBkColor(yellow);
 setwritemode(copyput);
 {
 restorecrtmode;
 }

 times:= round((LAM2 - LAM1) / DLAM) + 1;

 OX.init(times);
 OX.coordinateline;



 case grafic of
 1: KOLBR.init(times);
 2: KOTK.init(times);
 3: TOG.init(times);
 4: MTOG.init(times);
 5: BOTK.init(times);
 end;

 count:= 1;
 while (count <= times) do begin
  for i:= 1 to 4 do
   begin
    stat.KOL[i]:= 0;
    stat.KOLBR[i]:= 0;
    stat.KOTK[i]:= 0;
    stat.TOG[i]:= 0.0;
    stat.MTOG[i]:= 0.0;
    stat.BOTK[i]:= 0.0;
   end;

      istoch[1].init(1, L1);
      istoch[1].generation;

      istoch[2].init(3, L3);
      istoch[2].generation;

      istoch[3].init(4, L4);
      istoch[3].generation;

  istoch2.init(2, LAM1, LAM2, DLAM);
  if (count > 1) then
   begin
    for i:= 1 to count - 1 do
     istoch2.add;
   end;

  istoch2.generation;
  bufer1.init;
  pribor1.init(0, TAY2);

  KMIN:= 1;
  while (KMIN <= 2970) do begin
    if (istoch[1].TPOST > istoch[2].TPOST) then
     if (istoch[2].TPOST > istoch[3].TPOST) then
      begin
       MIN.N:= 4;
       MIN.T:= istoch[3].TPOST;
      end
     else
      begin
       MIN.N:= 3;
       MIN.T:= istoch[2].TPOST;
      end
    else
     if (istoch[1].TPOST > istoch[3].TPOST) then
      begin
       MIN.N:= 4;
       MIN.T:= istoch[3].TPOST;
      end
     else
      begin
       MIN.N:= 1;
       MIN.T:= istoch[1].TPOST;
      end;

      if (MIN.T > istoch2.TPOST) then
       begin
        MIN.N:= 2;
        MIN.T:= istoch2.TPOST;
       end;

      if (MIN.T < pribor1.TOSV) then
       begin
        if (bufer1.INDBUF = 5) then
         begin
          stat.KOTK[MIN.N]:= stat.KOTK[MIN.N] + 1;
          case MIN.N of
           1: istoch[MIN.N].generation;
           2: istoch2.generation;
          else istoch[MIN.N - 1].generation;
          end;
          stat.KOL[MIN.N]:= stat.KOL[MIN.N] + 1;
         end
        else
         begin
          bufer1.inbuf(MIN.T, MIN.N);
          case MIN.N of
           1: istoch[MIN.N].generation;
           2: istoch2.generation;
          else istoch[MIN.N - 1].generation;
          end;
          stat.KOL[MIN.N]:= stat.KOL[MIN.N] + 1;
         end;
       end
      else
       begin
        if (bufer1.INDBUF <> 0) then
         begin
          bufer1.outbuf;
          pribor1.work(bufer1.TOB);
          stat.TOG[bufer1.NOMOB]:= stat.TOG[bufer1.NOMOB] + pribor1.TOSV - bufer1.TOB;
          stat.KOLBR[bufer1.NOMOB]:= stat.KOLBR[bufer1.NOMOB] + 1;
         end
        else
         begin
          pribor1.work(MIN.T);
          case MIN.N of
           1: istoch[MIN.N].generation;
           2: istoch2.generation;
          else istoch[MIN.N - 1].generation;
          end;
          stat.KOLBR[MIN.N]:= stat.KOLBR[MIN.N] + 1;
         end;
       end;
        KMIN:= stat.KOL[1];
     end;


     {
     writeln(stat.KOTK[2], ' ', stat.KOL[2], ' ', stat.KOLBR[2]);
     }

       for i:= 1 to 4 do
        begin
         stat.BOTK[i]:= stat.KOTK[i]/stat.KOL[i];
         if (stat.KOLBR[i] <> 0) then
         stat.MTOG[i]:= stat.TOG[i]/stat.KOLBR[i]
         else
         stat.MTOG[i]:= 0;
        end;
    {
    writeln(stat.TOG[2], ' ',stat.BOTK[2], ' ', stat.MTOG[2]);
    }
    OX.drawpoint(stat.KOL[2]);
    if (count < 22) then
    case grafic of
    1: KOLBR.connect(stat.KOLBR[2]);
    2: KOTK.connect(stat.KOTK[2]);
    3: TOG.connect(stat.TOG[2]);
    4: MTOG.connect(stat.MTOG[2]);
    5: BOTK.connect(stat.BOTK[2]);
    end;

    if (count < 19) then
    for i:= 1 to 4 do
     begin
      inform[count].KOLBR[i]:= stat.KOLBR[i];
      inform[count].KOTK[i]:= stat.KOTK[i];
      inform[count].TOG[i]:= stat.TOG[i];
      inform[count].MTOG[i]:= stat.MTOG[i];
      inform[count].BOTK[i]:= stat.BOTK[i];
     end;

   count:= count + 1;
  end;
  if (count > 18) then
   times:= 18
  else
  times:= count - 1;
  act:= readkey;
  if (check = 1) then
   begin
    cleardevice;
    outtextxy(30, 20, 'KOLBR');
    outtextxy(120, 20, 'KOTK');
    outtextxy(200, 20, 'TOG');
    outtextxy(350, 20, 'MTOG');
    outtextxy(500, 20, 'BOTK');
    setlinestyle(0, 0, 3);
    line(0, 30, 640, 30);
    setlinestyle(0, 0, 1);
    y:= 40;
    if (times <= 9) then
     begin
      for i:= 1 to times do
       E1.outinf(inform[i], y);
     end
    else
     begin
      for i:= 1 to 9 do
       E1.outinf(inform[i], y);
      act:= readkey;
      cleardevice;
      outtextxy(30, 20, 'KOLBR');
      outtextxy(120, 20, 'KOTK');
      outtextxy(200, 20, 'TOG');
      outtextxy(350, 20, 'MTOG');
      outtextxy(500, 20, 'BOTK');
      setlinestyle(0, 0, 3);
      line(0, 30, 640, 30);
      setlinestyle(0, 0, 1);
      y:= 40;
      for i:= 10 to times do
       E1.outinf(inform[i], y);
     end;
   end;
  act:= readkey;
  infi:= true;
  goto BackToInterface;
  closegraph;
 end.
