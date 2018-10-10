unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls,Unit2;

type

  { TForm1 }

  TForm1 = class(TForm)
    S1: TShape;
    S10: TShape;
    S11: TShape;
    S12: TShape;
    S13: TShape;
    S14: TShape;
    S15: TShape;
    S16: TShape;
    S2: TShape;
    S3: TShape;
    S4: TShape;
    S5: TShape;
    S6: TShape;
    S7: TShape;
    S8: TShape;
    S9: TShape;
    ST00: TStaticText;
    ST10: TStaticText;
    ST11: TStaticText;
    ST12: TStaticText;
    ST13: TStaticText;
    ST14: TStaticText;
    ST15: TStaticText;
    ST16: TStaticText;
    ST01: TStaticText;
    ST3: TStaticText;
    ST4: TStaticText;
    ST5: TStaticText;
    ST6: TStaticText;
    ST7: TStaticText;
    ST8: TStaticText;
    ST9: TStaticText;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: char);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;
  x,y:integer;
  c:char;
  plocha:array[0..3,0..3] of string;
implementation

{$R *.lfm}

{ TForm1 }

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

procedure sum_up;
var
  a,b:integer;
begin
     for a:=0 to 3 do
         for b:=0 to 3 do
             if (plocha[a,b]=plocha[a,b+1]) and (plocha[a,b]<>'*') then
             begin
                 plocha[a,b]:=IntToStr(StrToInt(plocha[a,b])+StrToInt(plocha[a,b+1]));
                 plocha[a,b+1]:='*';
             end;
end;
procedure sum_down;
var
  a,b:integer;
begin
     for a:=3 downto 0 do
         for b:=4 downto 1 do
             if (plocha[a,b]=plocha[a,b-1]) and (plocha[a,b]<>'*') then
             begin
                 plocha[a,b]:=IntToStr(StrToInt(plocha[a,b])+StrToInt(plocha[a,b-1]));
                 plocha[a,b-1]:='*';
             end;
end;
procedure sum_left;
var
  a,b:integer;
begin
     for b:=0 to 3 do
         for a:=0 to 3 do
             if (plocha[a,b]=plocha[a+1,b]) and (plocha[a,b]<>'*') then
             begin
                 plocha[a,b]:=IntToStr(StrToInt(plocha[a,b])+StrToInt(plocha[a+1,b]));
                 plocha[a+1,b]:='*';
             end;
end;
procedure sum_right;
var
  a,b:integer;
begin
     for b:=3 downto 0 do
         for a:=4 downto 1 do
             if (plocha[a,b]=plocha[a-1,b]) and (plocha[a,b]<>'*') then
             begin
                 plocha[a,b]:=IntToStr(StrToInt(plocha[a,b])+StrToInt(plocha[a-1,b]));
                 plocha[a-1,b]:='*';
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

function oskar():boolean;
var
  a,b:integer;
begin
     for a:=0 to 3 do
         for b:=0 to 3 do
             if plocha[a,b]='2048' then
                oskar:=FALSE
             else
                oskar:=TRUE;
end;

procedure up;
begin
     find_num_up;
     sum_up;
     make_num;
     write_area;
end;

procedure down;
begin
     find_num_down;
     sum_down;
     make_num;
     write_area;
end;

procedure left;
begin
     find_num_left;
     sum_left;
     make_num;
     write_area;
end;

procedure right;
begin
     find_num_right;
     sum_right;
     make_num;
     write_area;
end;

procedure TForm1.FormKeyPress(Sender: TObject; var Key: char);
begin
  case Key of
        'w':up;
        'a':;
        's':down;
        'd':right;
        else writeln('Use w,a,s,d');
   end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  for y:=0 to 3 do
      for x:=0 to 3 do
          plocha[x,y]:='*';
  ST00.caption:=plocha[0,0];
  ST01.caption:=plocha[0,1];
end;

end.

