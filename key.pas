unit key;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,
  keyday,
  StdCtrls;

type
  TForm1 = class(TForm)
    lbl1: TLabel;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  R: TStringList;
  dt,dt1,dt2: string;
  a,a1,a2,a3,a4,
  a5,a6,a7,a8: string;
  t,t1,t2,t3,t4,
  t5,t6,t7,t8,god: Integer;
  kol: Integer;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
const
    Mes: array[1..12] of string = ('������', '�������', '�����', '������',
                                   '���', '����', '����', '�������', '��������', '�������', '������',
                                   '�������');
var
  data: string;
  Year, Month, Day: Word;
  s: TKeyPass;
begin
  s:= TKeyPass.create(s.vz);
  DecodeDate(Now,Year,Month,Day);
  data := IntToStr(day);
  data := data + ' ' + Mes[Month];
  data := data + ' ' + IntToStr(Year) + ' ����';
  lbl1.Caption:=data;
  god := Year;
  R:= TStringList.Create;
  dt:=DateToStr(Now);
  ExtractStrings(['.'],[' '],PChar(dt),R);
  if r.Count > 0 then dt:=r[0];
  if r.Count > 1 then dt1:=r[1];
  if r.Count > 2 then dt2:=r[2];
  if (dt <> '') and (dt1 <> '') and (dt2 <> '') then
  dt:=dt2+dt1+dt;
  kol:=Length(dt);
  if kol > 0 then a1:=dt[1];
  if kol > 1 then a2:=dt[2];
  if kol > 2 then a3:=dt[3];
  if kol > 3 then a4:=dt[4];
  if kol > 4 then a5:=dt[5];
  if kol > 5 then a6:=dt[6];
  if kol > 6 then a7:=dt[7];
  if kol > 7 then a8:=dt[8];
  //////////////////////////
  if a1 = '0' then a1:='9';
  if a2 = '0' then a2:='9';
  if a3 = '0' then a3:='9';
  if a4 = '0' then a4:='9';
  if a5 = '0' then a5:='9';
  if a6 = '0' then a6:='9';
  if a7 = '0' then a7:='9';
  if a8 = '0' then a8:='9';
  //////////////////////////
  if a1 <> '' then t1:=StrToInt(a1);
  if a2 <> '' then t2:=StrToInt(a2);
  if a3 <> '' then t3:=StrToInt(a3);
  if a4 <> '' then t4:=StrToInt(a4);
  if a5 <> '' then t5:=StrToInt(a5);
  if a6 <> '' then t6:=StrToInt(a6);
  if a7 <> '' then t7:=StrToInt(a7);
  if a8 <> '' then t8:=StrToInt(a8);
  //////////////////////////
  t:=t1+t2;
  t3:=t3+t4;
  t5:=t5+t6;
  t7:=t7+t8;
  t:=t+t3;
  t5:=t5+t7;
  t:=t+t5;
  t:=t*god;
  a:=IntToStr(t);
  Caption:=a;
  Label1.Caption:=s.pass;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  R.Free;
end;

end.
