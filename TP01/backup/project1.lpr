program project1;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, UnitFormMenu, UnitFormPrimes, UnitSolveEquation, unit1
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TFormMenu, FormMenu);
  Application.CreateForm(TformPrimes, formPrimes);
  Application.CreateForm(TFormEquation, FormEquation);
  Application.CreateForm(TFormRegister, FormRegister);
  Application.Run;
end.

