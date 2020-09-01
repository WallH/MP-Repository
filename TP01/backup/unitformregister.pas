unit UnitFormRegister;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TFormRegister }

  TFormRegister = class(TForm)
    Button1: TButton;
    Button2: TButton;
    ComboStatus: TComboBox;
    inputName: TEdit;
    inputLName: TEdit;
    inputEmail: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  FormRegister: TFormRegister;

implementation

{$R *.lfm}



{ TFormRegister }

procedure TFormRegister.FormCreate(Sender: TObject);
begin

end;

procedure TFormRegister.Button1Click(Sender: TObject);
begin
  if (string(inputName.Text).isEmpty) or (string(inputLName.Text).isEmpty) or ((ComboStatus.Text = 'Seleccionar')) or (string(inputEmail.Text).isEmpty) then ShowMessage('Todos los campos son requeridos.')
  else
    begin
      ShowMessage("Datos ingresados correctamente");
      inputName.Text := String.Empty;
      inputLName.Text := String.Empty;
      inputEmail.Text := String.Empty;
      ComboStatus.Text := 'Seleccionar';
      ComboStatus.ItemIndex:= -1;
    end;
end;

procedure TFormRegister.Button2Click(Sender: TObject);
begin
  FormRegister.Hide;

end;

end.




