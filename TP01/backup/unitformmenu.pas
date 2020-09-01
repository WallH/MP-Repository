unit UnitFormMenu;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, UnitFormPrimes, UnitSolveEquation, UnitFormregister;

type

  { TFormMenu }

  TFormMenu = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  FormMenu: TFormMenu;

implementation

{$R *.lfm}

{ TFormMenu }

procedure TFormMenu.Button1Click(Sender: TObject);
begin
  FormRegister.Show
end;

procedure TFormMenu.Button2Click(Sender: TObject);
begin
  formPrimes.Show;
end;

procedure TFormMenu.Button3Click(Sender: TObject);
begin
  FormEquation.Show
end;

procedure TFormMenu.FormCreate(Sender: TObject);
begin

end;

end.

