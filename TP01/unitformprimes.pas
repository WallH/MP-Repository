unit UnitFormPrimes;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TformPrimes }

  TformPrimes = class(TForm)
    btnProccess: TButton;
    btnFinish: TButton;
    Label2: TLabel;
    Label3: TLabel;
    ResultNotInterval: TEdit;
    ResultNoPrimes: TEdit;
    InputNumber: TEdit;
    Label1: TLabel;
    procedure btnFinishClick(Sender: TObject);
    procedure btnProccessClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure InputNumberChange(Sender: TObject);
  private

  public

  end;

var
  formPrimes: TformPrimes;
  primes: array [0..1000] of Integer;
  countOutInterval, countNoPrimes:integer;
implementation

{$R *.lfm}

{ TformPrimes }

procedure preCalculateCribe();
var
  i,j:integer;

begin
     primes[0]:= 1;
     primes[1]:= 1;
     for i:= 2 to 101 do
     begin
          if primes[i] = 0 then
          begin
             j:= i*i;
             while j < 1001 do
             begin
                  primes[j]:=1;
                  j:= j+i;
             end;
          end;
     end;

end;
procedure proccessNumber(N:integer);
begin
     if (N > 0) and (N < 1001) then
        countNoPrimes:= countNoPrimes+ primes[N]
     else Inc(countOutInterval);

end;

procedure TformPrimes.FormCreate(Sender: TObject);
begin
     preCalculateCribe();
end;

procedure TformPrimes.InputNumberChange(Sender: TObject);
begin

end;

procedure TformPrimes.btnProccessClick(Sender: TObject);
begin
     proccessNumber(StrToInt(InputNumber.Text));

end;

procedure TformPrimes.btnFinishClick(Sender: TObject);
begin
     ResultNoPrimes.Text := IntToStr(countNoPrimes);
     ResultNotInterval.Text := IntToStr(countOutInterval);
end;

end.

