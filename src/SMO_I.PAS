unit SMO_I;
interface
uses crt, graph, SMO_F_OBJ;
type
 button = object
 x1, y1, x2, y2: integer;
 text: string;
 constructor init(n1, m1, n2, m2: integer; text1: string);
 procedure draw; virtual;
 procedure edges;
 end;

 spisok = object(button)
 text2, text3, text4, text5, text6: string;
 N: integer;
 constructor init(n1, m1, n2, m2, K1: integer;
             name1, name2, name3, name4, name5, name6: string);
 procedure draw; virtual;
 procedure edges(k: integer);
 procedure clear;
 end;

 events = object
 procedure check(chk: integer);
 procedure outinf(inf: statistic; var y: integer);
 procedure event11(var TAY2, LAM1, LAM2, DLAM: real);
 procedure event12(var TAY2, LAM1, LAM2, DLAM, L1, L3, L4: real);
 procedure event21(var temp: boolean);
 procedure event26(var grafic, N: integer);
 procedure event31(var chk: integer);
 procedure event41;
 end;

implementation

 procedure events.event41;
  var action: char;
  begin
   setwritemode(xorput);
   line(50, 100, 50, 180);
   outtextxy(60, 150, 'Для изменения стандартых параметров');
   outtextxy(60, 160, 'нажмите на кнопку "Основные параметры и"');
   outtextxy(60, 170, 'выберите переменные, которые хотите изменить.');
   line(260, 180, 260, 250);
   outtextxy(270, 210, 'Для запуска симуляции нажмите на кнопку');
   outtextxy(270, 220, '"Моделирование" и выберите "Пуск". Для выбора');
   outtextxy(270, 230, 'графика выберите соответствующий пункт.');
   line(50, 250, 50, 310);
   outtextxy(60, 270, 'Для отображение результатов симуляции');
   outtextxy(60, 280, 'нажмите на кнопку "Результаты" и выберите');
   outtextxy(60, 290, 'пункт "Статистика" (появится галочка)');
   line(260, 310, 260, 380);
   outtextxy(270, 340, 'Для отображения помощи нажмите на кнопку');
   outtextxy(270, 350, '"Помощь" и выберите соответствующий пункт');
  end;

 procedure events.outinf(inf: statistic; var y: integer);
  var
   strinf: string;
  begin
   str(inf.KOLBR[1], strinf);
   outtextxy(30, y, strinf);
   str(inf.KOTK[1], strinf);
   outtextxy(120, y, strinf);
   str(inf.TOG[1]:5:3, strinf);
   outtextxy(180, y, strinf);
   str(inf.MTOG[1]:5:3, strinf);
   outtextxy(340, y, strinf);
   str(inf.BOTK[1]:5:3, strinf);
   outtextxy(490, y, strinf);

   str(inf.KOLBR[2], strinf);
   outtextxy(30, y + 10, strinf);
   str(inf.KOTK[2], strinf);
   outtextxy(120, y + 10, strinf);
   str(inf.TOG[2]:5:3, strinf);
   outtextxy(180, y + 10, strinf);
   str(inf.MTOG[2]:5:3, strinf);
   outtextxy(340, y + 10, strinf);
   str(inf.BOTK[2]:5:3, strinf);
   outtextxy(490, y + 10, strinf);

   str(inf.KOLBR[3], strinf);
   outtextxy(30, y + 20, strinf);
   str(inf.KOTK[3], strinf);
   outtextxy(120, y + 20, strinf);
   str(inf.TOG[3]:5:3, strinf);
   outtextxy(180, y + 20, strinf);
   str(inf.MTOG[3]:5:3, strinf);
   outtextxy(340, y + 20, strinf);
   str(inf.BOTK[3]:5:3, strinf);
   outtextxy(490, y + 20, strinf);

   str(inf.KOLBR[4], strinf);
   outtextxy(30, y + 30, strinf);
   str(inf.KOTK[4], strinf);
   outtextxy(120, y + 30, strinf);
   str(inf.TOG[4]:5:3, strinf);
   outtextxy(180, y + 30, strinf);
   str(inf.MTOG[4]:5:3, strinf);
   outtextxy(340, y + 30, strinf);
   str(inf.BOTK[4]:5:3, strinf);
   outtextxy(490, y + 30, strinf);

   setlinestyle(0, 0, 3);
   line(0, y + 40, 640, y + 40);
   setcolor(red);
   line(170, 0, 170, 480);
   setcolor(darkgray);
   setlinestyle(0, 0, 1);

   y:= y + 50;
  end;
 procedure events.check(chk: integer);
  begin
   setcolor(green);
   setlinestyle(0, 0, 3);
   if (chk = 1) then
    begin
     line(470, 60, 475, 65);
     line(475, 65, 483, 50);
    end;
  end;

 procedure events.event11(var TAY2, LAM1, LAM2, DLAM: real);
  begin
   restorecrtmode;
   writeln('1. Поток обслуживания равномерный от 0 до __');
   writeln('2. Интенсивность 2 источника от __ до __ ');
   writeln('3. С шагом __');
   readln(TAY2);
   readln(LAM1, LAM2);
   readln(DLAM);
  end;

  procedure events.event12(var TAY2, LAM1, LAM2, DLAM, L1, L3, L4: real);
   begin
    restorecrtmode;
    writeln('1. Поток обслуживания равномерный от 0 до __');
    writeln('2. Интенсивность 2 источника от __ до __ ');
    writeln('3. С шагом __');
    writeln('4. Интенсивность 1, 3, 4 источников');
    readln(TAY2);
    readln(LAM1, LAM2);
    readln(DLAM);
    readln(L1, L3, L4);
   end;

  procedure events.event21(var temp: boolean);
   begin
    temp:= false;
    restorecrtmode;
   end;

   procedure events.event26(var grafic, N: integer);
    begin
     case N of
     1: grafic:= 1;
     2: grafic:= 2;
     3: grafic:= 3;
     4: grafic:= 4;
     5: grafic:= 5;
     end;
    end;

   procedure events.event31(var chk: integer);
    begin
     if (chk = 0) then
      chk:= 1
     else
      chk:= 0;
    end;

 constructor spisok.init(n1, m1, n2, m2, K1: integer;
             name1, name2, name3, name4, name5, name6: string);
  begin
   x1:= n1;
   y1:= m1;
   x2:= n2;
   y2:= m2;
   N:= K1;
   text:= name1;
   text2:= name2;
   text3:= name3;
   text4:= name4;
   text5:= name5;
   text6:= name6;
  end;
 procedure spisok.draw;
  begin
  if (N >= 1) then
   begin
    setwritemode(xorput);
    SetFillStyle(solidfill, lightgray);
    Bar(x1, y1+ 60, x2, y2 + 60);
    setcolor(black);
    OutTextXY(x1 + 10, y1 + 60 + round((y2 - y1) / 2), text);
   end;
   if (N >= 2) then
    begin
     Bar(x1, y1 + 120, x2, y2 + 120);
     OutTextXY(x1 + 10, y1 + 120 + round((y2 - y1) / 2), text2);
    end;
   if (N >= 3) then
    begin
     Bar(x1, y1 + 180, x2, y2 + 180);
     OutTextXY(x1 + 10, y1 + 180 + round((y2 - y1) / 2), text3);
    end;
   if (N >= 4) then
    begin
     Bar(x1, y1 + 240, x2, y2 + 240);
     OutTextXY(x1 + 10, y1 + 240 + round((y2 - y1) / 2), text4);
    end;
   if (N >= 5) then
    begin
     Bar(x1, y1 + 300, x2, y2 + 300);
     OutTextXY(x1 + 10, y1 + 300 + round((y2 - y1) / 2), text5);
    end;
   if (N >= 6) then
    begin
     Bar(x1, y1 + 360, x2, y2 + 360);
     OutTextXY(x1 + 10, y1 + 360 + round((y2 - y1) / 2), text6);
    end;
  end;

 procedure spisok.edges(k: integer);
  begin
   if (k = 1) then
    begin
     Setcolor(yellow);
     SetLineStyle(0, 0, 3);
     Rectangle(x1, y1 + 60, x2, y2 + 60);
    end;
   if (k = 2) then
    begin
     Setcolor(yellow);
     SetLineStyle(0, 0, 3);
     Rectangle(x1, y1 + 120, x2, y2 + 120);
    end;
   if (k = 3) then
    begin
     Setcolor(yellow);
     SetLineStyle(0, 0, 3);
     Rectangle(x1, y1 + 180, x2, y2 + 180);
    end;
   if (k = 4) then
    begin
     Setcolor(yellow);
     SetLineStyle(0, 0, 3);
     Rectangle(x1, y1 + 240, x2, y2 + 240);
    end;
   if (k = 5) then
    begin
     Setcolor(yellow);
     SetLineStyle(0, 0, 3);
     Rectangle(x1, y1 + 300, x2, y2 + 300);
    end;
   if (k = 6) then
    begin
     Setcolor(yellow);
     SetLineStyle(0, 0, 3);
     Rectangle(x1, y1 + 360, x2, y2 + 360);
    end
  end;

 procedure spisok.clear;
  begin
   setwritemode(copyput);
   SetFillStyle(solidfill, red);
   Bar(x1 - 1, y1 + 59, x2 + 1, y2 + 361);
   setwritemode(xorput);
  end;

 constructor button.init(n1, m1, n2, m2: integer; text1: string);
  begin
   x1:= n1;
   y1:= m1;
   x2:= n2;
   y2:= m2;
   text:= text1;
  end;
 procedure button.draw;
  begin
   SetFillStyle(solidfill, darkgray);
   Bar(x1, y1, x2, y2);
   OutTextXY(x1 + 10, y1 + round((y2 - y1) / 2), text);
  end;

  procedure button.edges;
   begin
    Setcolor(magenta);
    SetLineStyle(0, 0, 3);
    Rectangle(x1, y1, x2, y2);
   end;
end.