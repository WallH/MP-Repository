unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls, math,
  Buttons;

type

  { TForm1 }

  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    btnExit: TBitBtn;
    btnInput: TBitBtn;
    edtShowMaxValue: TEdit;
    edtInputNumber: TEdit;
    edtShowMinValue: TEdit;
    edtShowSumValue: TEdit;
    Image1: TImage;
    lblMaxValue: TLabel;
    lblInputNumber: TLabel;
    lblMinValue: TLabel;
    lblSumValue: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure btnInputClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Image1Click(Sender: TObject);
  private

  public
    minValue, maxValue, sumValue:integer;
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Image1Click(Sender: TObject);
begin

end;
function isValidValue(N : integer) : boolean;
begin
     isValidValue:= (N > 0) and (N < 100);
end;

procedure TForm1.btnInputClick(Sender: TObject);
var
  inputValue:integer;
begin
     if not string(edtInputNumber.Text).IsEmpty and isValidValue(StrToInt(edtInputNumber.Text)) then
     begin
       inputValue:= StrToInt(edtInputNumber.Text);
       minValue := min(inputValue, minValue);
       maxValue := max(inputValue, maxValue);
       edtShowMinValue.Text := IntToStr(minValue);
       edtShowMaxValue.Text := IntToStr(maxValue);
       sumValue += inputValue;
       edtShowSumValue.Text := IntToStr(sumValue);
     end
     else ShowMessage('Valor fuera de rango, solo valores entre 0 y 100');

end;

procedure TForm1.btnExitClick(Sender: TObject);
begin
     Close;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  minValue:= 100;
  maxValue:= 0;
  sumValue:= 0;
  edtShowMinValue.Text := EmptyStr;
  edtShowMaxValue.Text := EmptyStr;
  edtShowSumValue.Text := EmptyStr;

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  minValue:= 100;
  maxValue:= 0;
  sumValue:= 0;
end;

end.

