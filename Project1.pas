program Project1;

{$mode objfpc}{$H+}

uses
  crt,
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes
  { you can add units after this };

var
  x,y:integer;
  c:char;
  plocha:array[1..7,1..7] of char;

function num(a,b:integer):integer;
begin
         num:=random(a)+b;
end;

function bool(f,g:integer):boolean;
begin
         bool:= f>g;
end;

procedure write_area;
begin
     //clrscr;
     for y:= 1 to 7 do
           for x:= 1 to 7 do
           begin
               gotoxy(50+x,2+y);
               if x = 7 then
               begin
                  writeln(plocha[x,y]);
               end else
               begin
                   write(plocha[x,y]);
               end;
           end;
end;

procedure make_num;
var
  rand:integer;
begin
     case random(4)+1 of
          1: x:=1;
          2: x:=3;
          3: x:=5;
          4: x:=7;
     end;
     case random(4)+1 of
          1: y:=1;
          2: y:=3;
          3: y:=5;
          4: y:=7;
     end;
     if plocha[x,y]<>'*' then
     begin
          exit;   //vyskočí z aktuálnej procedúry
     end;
     rand:=random(100);
     if rand<40 then
     begin
        plocha[x,y]:='4';
     end else if rand<90 then
     begin
        plocha[x,y]:='2';
     end;
end;

procedure move;
var
  a,b:integer;
  value:char;
begin
     for a:=1 to 7 do
         for b:=1 to 7 do
         begin
             if (plocha[a,b]<>'*') or (plocha[a,b]<>'-') then
             begin
                  value:=plocha[a,b];
                  if (b>1) and (plocha[a,b]='*') then
                  begin
                       plocha[a,b]:='*';
                       //treba dokončiť
                  end;
             end;
         end;
end;

procedure up;
begin
     make_num;
     write_area;
end;

procedure down;
begin  
     make_num;
     write_area;
end;

procedure left;
begin  
     make_num;
     write_area;
end;

procedure right;
begin  
     make_num;
     write_area;
end;

begin
 randomize;
  (*koment*) {koment} //koment
  for y:= 1 to 7 do
      for x:= 1 to 7 do
      begin
          if (y = 2) or (y = 4) or (y = 6) then
          begin
               plocha[x,y]:='-';
          end else
          begin
              if ((x = 2) or (x = 4) or (x = 6)) then
                 begin
                      plocha[x,y]:='|';
                 end
                 else begin
                      plocha[x,y]:='*';
                 end;
          end;
      end;
  for y:= 1 to 7 do
           for x:= 1 to 7 do
           begin
               gotoxy(50+x,2+y);
               if x = 7 then
               begin
                  writeln(plocha[x,y]);
               end else
               begin
                   write(plocha[x,y]);
               end;
           end;

while TRUE do
 begin
   c:=readkey;
   writeln(c);
   case c of
        'w':up;
        'a':left;
        's':down;
        'd':right;
        else writeln('Use w,a,s,d');
   end;
 end;
end.

