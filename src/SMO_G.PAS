unit SMO_G;
interface
uses crt, graph;
type
 objOX = object
 step, posit: integer;
 procedure init(times: integer);
 procedure coordinateline;
 procedure drawpoint(kol: integer);
 end;
 objKOLBR = object
 lfx, lfy, step: integer;
 constructor init(times: integer);
 procedure connect(rty: integer); virtual;
 end;
 objKOTK = object(objKOLBR)
 constructor init(times: integer);
 procedure connect(rty: integer); virtual;
 end;
 objTOG = object
 lfx, lfy, step: integer;
 constructor init(times: integer);
 procedure connect(rty: real); virtual;
 end;
 objMTOG = object(objTOG)
 constructor init(times: integer);
 procedure connect(rty: real); virtual;
 end;
 objBOTK = object(objTOG)
 constructor init(times: integer);
 procedure connect(rty: real); virtual;
 end;
implementation
 constructor objBOTK.init(times: integer);
  begin
   lfx:= 20;
   lfy:= 350;
   step:= round(600 / times);
   line(20, 450, 20, 10);
  end;
 procedure objBOTK.connect(rty: real);
 var
   strbotk: string;
   a: integer;
  begin
   a:= round(rty * 10000);
   line(lfx, lfy, lfx + step, 450 - a mod 9800);
   str(rty:5:3, strbotk);
   line(15, round(450 - a mod 9800), 25, round(450 - a mod 9800));
   outtextXY(28, round(448 - a mod 9800), strbotk);
   lfx:= lfx + step;
   lfy:= round(450 - a mod 9800);
  end;

 constructor objMTOG.init(times: integer);
  begin
   lfx:= 20;
   lfy:= 350;
   step:= round(600 / times);
   line(20, 450, 20, 10);
  end;
 procedure objMTOG.connect(rty: real);
 var
   strmtog: string;
  begin
   line(lfx, lfy, lfx + step, round(450 - rty / 2));
   str(rty:5:3, strmtog);
   line(15, round(450 - rty / 2), 25, round(450 - rty / 2));
   outtextXY(28, round(448 - rty / 2), strmtog);
   lfx:= lfx + step;
   lfy:= round(450 - rty / 2);
  end;
 constructor objTOG.init(times: integer);
  begin
   lfx:= 20;
   lfy:= 350;
   step:= round(600 / times);
   line(20, 450, 20, 10);
  end;
 procedure objTOG.connect(rty: real);
 var
   strtog: string;
  begin
   line(lfx, lfy, lfx + step, round(450 - rty / 50));
   str(rty:5:3, strtog);
   line(15, round(450 - rty / 50), 25, round(450 - rty / 50));
   outtextXY(28, round(448 - rty / 50), strtog);
   lfx:= lfx + step;
   lfy:= round(450 - rty / 50);
  end;
 constructor objKOTK.init(times: integer);
  begin
   lfx:= 20;
   lfy:= 450;
   step:= round(600 / times);
   line(20, 450, 20, 10);
  end;
 procedure objKOTK.connect(rty: integer);
  var
   strkotk: string;
  begin
   line(lfx, lfy, lfx + step, round(450 - rty / 100));
   str(rty, strkotk);
   line(15, round(450 - rty / 100), 25, round(450 - rty / 100));
   outtextXY(28, round(448 - rty / 100), strkotk);
   lfx:= lfx + step;
   lfy:= round(450 - rty / 100);
  end;
 constructor objKOLBR.init(times: integer);
  begin
   lfx:= 20;
   lfy:= 450;
   step:= round(600 / times);
   line(20, 450, 20, 10);
  end;
 procedure objKOLBR.connect(rty: integer);
  var
   strkolbr: string;
  begin
   line(lfx, lfy, lfx + step, 450 - rty * 2);
   str(rty, strkolbr);
   line(15, 450 - rty * 2, 25, 450 - rty * 2);
   outtextXY(28, 448 - rty * 2, strkolbr);
   lfx:= lfx + step;
   lfy:= 450 - rty * 2;
  end;
 procedure objOX.init(times: integer);
  begin
   step:= round(600 / times);
   posit:= 20 + step;
  end;
 procedure objOX.coordinateline;
  begin
   setcolor(darkgray);
   line(20, 450, 630, 450);
  end;
 procedure objOX.drawpoint(kol: integer);
  var
   kstr: string;
  begin
   setcolor(darkgray);
   str(kol, kstr);
   line(posit, 445, posit, 455);
   outtextXY(posit - 15, 460, kstr);
   posit:= posit + step;
  end;
end.