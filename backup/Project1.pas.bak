program Project1;

{$mode objfpc}{$H+}

uses
  crt, sysutils,
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes
  { you can add units after this };

var
  x,y:integer;
  c:char;
  plocha:array[1..7,1..7] of string;
procedure move_num(a:integer;value:string);
begin
     if plocha[a,1]='*' then
        plocha[a,1]:=value
     else if plocha[a,3]='*' then
        plocha[a,3]:=value
        else if plocha[a,5]='*' then
           plocha[a,5]:=value
           else if plocha[a,7]='*' then
              plocha[a,7]:=value
end;

procedure write_area;
begin
     //clrscr;
     for y:= 1 to 7 do
           for x:= 1 to 7 do
           begin
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

procedure find_num;
var
  a,b:integer;
  value:string;
begin
     for a:=1 to 7 do
         for b:=1 to 7 do
             if (plocha[a,b]='*') or (plocha[a,b]='-') or (plocha[a,b]='|') then
             else
                 begin
                     value:=plocha[a,b];
                     plocha[a,b]:='*'; 
                     move_num(a,value);
                     writeln(value+' '+IntToStr(a)+' '+IntToStr(b));
                  end;
end;

procedure up;
begin
     find_num;
     make_num;
     write_area;
end;

procedure down;
begin
     find_num;
     make_num;
     write_area;
end;

procedure left;
begin
     find_num;
     make_num;
     write_area;
end;

procedure right;
begin
     find_num;
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

