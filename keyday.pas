unit keyday;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs;

type
  TForm1 = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TKeyPass = class
  private
    function password : string;
  public
    pass: string;
    function vz: string;
    constructor create(newpass: string);
    destructor destroy; override;
  end;

var
  Form1: TForm1;

implementation

//{$R *.dfm}

constructor TKeyPass.create(newpass: string);
begin
  pass:=newpass;
end;

destructor TKeyPass.destroy;
begin
  destroy;
  inherited;
end;

function TKeyPass.password: string;
const
  Mes: array[1..12] of string = ('01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12');
var
  i:integer;
  d,m,y,s,x: string;
  Year, Month, Day: Word;
begin
  DecodeDate(Now,Year,Month,Day);
  d := IntToStr(day);
  if Length(d) > 1 then begin
     s:=d[1];
     if s = '0' then begin
        i:= 9+StrToInt(d[2]);
        d:=IntToStr(i);
     end;
     s:=d[2];
     if s = '0' then begin
        i:= StrToInt(d[1])+9;
        d:=IntToStr(i);
     end;
  end else begin
     i:= StrToInt(d)+9;
     d:=IntToStr(i);
  end;
  m := Mes[Month];
  if Length(m) > 1 then begin
     s:=m[1];
     if s = '0' then begin
        i:= 9+StrToInt(m[2]);
        m:=IntToStr(i);
     end;
     s:=m[2];
     if s = '0' then begin
        i:= StrToInt(m[1])+9;
        m:=IntToStr(i);
     end;
  end else begin
     i:= StrToInt(m)+9;
     m:=IntToStr(i);
  end;
  y := IntToStr(Year);
  if Length(y) > 3 then begin
     s:=y[1];
     if s = '0' then begin
        i:= 9+StrToInt(y[2]);
        x:=IntToStr(i);
     end;
     s:=y[2];
     if s = '0' then begin
        i:= StrToInt(y[1])+9;
        x:=IntToStr(i);
     end;
     s:=y[3];
     if s = '0' then begin
        i:= StrToInt(y[2])+9;
        x:=IntToStr(i);
     end;
     s:=y[4];
     if s = '0' then begin
        i:= StrToInt(y[3])+9;
        x:=IntToStr(i);
     end;
     i:=StrToInt(x)+StrToInt(y);
     y:=IntToStr(i);
  end else begin
     i:= StrToInt(y)+9;
     y:=IntToStr(i);
  end;
  i:=StrToInt(d)+StrToInt(m);
  i:=i+StrToInt(m);
  i:=StrToInt(y)+i;
  i:=i*StrToInt(y);
  Result:=IntToStr(i);
end;

function TKeyPass.vz: string;
begin
   Result:=password;
end;

end.
 