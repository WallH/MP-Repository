unit UnitSolveEquation;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, math;

type

  { TFormEquation }

  TFormEquation = class(TForm)
    btnSolve: TButton;
    Result1: TEdit;
    Result2: TEdit;
    ValueA: TEdit;
    ValueB: TEdit;
    ValueC: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure btnSolveClick(Sender: TObject);
  private

  public

  end;

var
  FormEquation: TFormEquation;

implementation

{$R *.lfm}

{ TFormEquation }

function D_Radical(a, b, c:real):real;
begin
     D_Radical:=((b**2)-(4*a*c));
     if D_Radical <=0 then D_Radical:=0;
end;

procedure TFormEquation.btnSolveClick(Sender: TObject);
var
  rad, n1, n2, n3, a, b,c:real;
begin
  if (string(ValueA.Text).IsEmpty = true) or (string(ValueB.Text).IsEmpty = true) or (string(ValueC.Text).IsEmpty = true) then ShowMessage('No se cargaron los datos necesarios.')
  else
  begin
    a:= StrToFloat(ValueA.Text);
    b:= StrToFloat(ValueB.Text);
    c:= StrToFloat(ValueC.Text);
    rad:= D_Radical(a, b, c);
    if rad = 0 then ShowMessage('La ecuación no tiene solución.')
    else
        begin
          n1:= (-b+sqrt(rad));
          n2:= (-b-sqrt(rad));
          n3:= 2*a;
          Result1.Text:= FloatToStr(n1/n3);
          Result2.Text:= FloatToStr(n2/n3);

        end;
  end;
end;
end.

