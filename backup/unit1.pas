unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

var
  x,y:integer;
  c:char;
  plocha:array[0..3,0..3] of string;

implementation

procedure move_num_up(a:integer;value:string);
begin
     if plocha[a,0]='*' then
        plocha[a,0]:=value
     else if plocha[a,1]='*' then
             plocha[a,1]:=value
        else if plocha[a,2]='*' then
                plocha[a,2]:=value
           else if plocha[a,3]='*' then
                   plocha[a,3]:=value
end;
procedure move_num_down(a:integer;value:string);
begin
     if plocha[a,3]='*' then
        plocha[a,3]:=value
     else if plocha[a,2]='*' then
             plocha[a,2]:=value
        else if plocha[a,1]='*' then
                plocha[a,1]:=value
           else if plocha[a,0]='*' then
                   plocha[a,0]:=value
end;
procedure move_num_left(b:integer;value:string);
begin
     if plocha[0,b]='*' then
        plocha[0,b]:=value
     else if plocha[1,b]='*' then
             plocha[1,b]:=value
        else if plocha[2,b]='*' then
                plocha[2,b]:=value
           else if plocha[3,b]='*' then
                   plocha[3,b]:=value
end;
procedure move_num_right(b:integer;value:string);
begin
     if plocha[3,b]='*' then
        plocha[3,b]:=value
     else if plocha[2,b]='*' then
             plocha[2,b]:=value
        else if plocha[1,b]='*' then
                plocha[1,b]:=value
           else if plocha[0,b]='*' then
                   plocha[0,b]:=value
end;
procedure find_num_up;
var
  a,b:integer;
  value:string;
begin
     for a:=0 to 3 do
         for b:=0 to 3 do
             if (plocha[a,b]='*') then
             else
                 begin
                     value:=plocha[a,b];
                     plocha[a,b]:='*';
                     move_num_up(a,value);
                  end;
end;
procedure find_num_down;
var
  a,b:integer;
  value:string;
begin
     for a:=3 downto 0 do
         for b:=3 downto 0 do
             if (plocha[a,b]='*') then
             else
                 begin
                     value:=plocha[a,b];
                     plocha[a,b]:='*';
                     move_num_down(a,value);
                  end;
end;
procedure find_num_left;
var
  a,b:integer;
  value:string;
begin
     for b:=0 to 3 do
         for a:=0 to 3 do
             if (plocha[a,b]='*') then
             else
                 begin
                     value:=plocha[a,b];
                     plocha[a,b]:='*';
                     move_num_left(b,value);
                  end;
end;
procedure find_num_right;
var
  a,b:integer;
  value:string;
begin
     for b:=3 downto 0 do
         for a:=3 downto 0 do
             if (plocha[a,b]='*') then
             else
                 begin
                     value:=plocha[a,b];
                     plocha[a,b]:='*';
                     move_num_right(b,value);
                  end;
end;

procedure write_area;
begin
     //clrscr;
     for y:=0 to 3 do
     begin
          for x:=0 to 3 do
              if x = 3 then
                 writeln(plocha[x,y])
              else
                  write(plocha[x,y]+'|');
          writeln('-------');
     end;
end;

procedure make_num;
var
  rand:integer;
begin
     x:=random(4);
     y:=random(4);

     if plocha[x,y]<>'*' then
          exit;   //vyskočí z aktuálnej procedúry

     rand:=random(100);

     if rand<40 then
        plocha[x,y]:='4'
     else if rand<90 then
             plocha[x,y]:='2'
end;

end.

