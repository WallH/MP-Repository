unit UnitDealershipRegistration;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,StrUtils,
  Buttons;

type

  { TfrmDealership }

  TfrmDealership = class(TForm)
    btnShowValues: TBitBtn;
    btnExitApp: TBitBtn;
    cmbBrandSelector: TComboBox;
    edtInputOdometer: TEdit;
    edtInputNumberPlate: TEdit;
    edtInputModelYear: TEdit;
    Image1: TImage;
    lblBrand: TLabel;
    lblModelYear: TLabel;
    lblOdometer: TLabel;
    lblAddOns: TLabel;
    lblType: TLabel;
    lblNumberPlate: TLabel;
    lsbAddOnsSelector: TListBox;
    rdbTypeVehicleCar: TRadioButton;
    rdbTypeVehicleVan: TRadioButton;
    rdbTypeVehicleUtility: TRadioButton;
    procedure btnShowValuesClick(Sender: TObject);
    procedure cmbBrandSelectorChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lblBrandClick(Sender: TObject);
    procedure rdbTypeVehicleCarChange(Sender: TObject);
  private

  public

  end;

var
  frmDealership: TfrmDealership;

implementation

{$R *.lfm}

{ TfrmDealership }


function CheckRequiredFields():boolean;
begin

  CheckRequiredFields:= (frmDealership.cmbBrandSelector.ItemIndex = -1) or ((frmDealership.rdbTypeVehicleCar.Checked = false) and (frmDealership.rdbTypeVehicleVan.Checked = false) and (frmDealership.rdbTypeVehicleUtility.Checked = false)) or (string(frmDealership.edtInputNumberPlate.Text).IsEmpty) or string(frmDealership.edtInputOdometer.Text).IsEmpty or string(frmDealership.edtInputModelYear.Text).IsEmpty;
end;

function TypeVehicleToString():string;
begin
  TypeVehicleToString:= IfThen(frmDealership.rdbTypeVehicleCar.Checked, 'Auto', '');
  TypeVehicleToString:= IfThen(frmDealership.rdbTypeVehicleVan.Checked, 'Camioneta', TypeVehicleToString);
  TypeVehicleToString:= IfThen(frmDealership.rdbTypeVehicleUtility.Checked, 'Utilitario', TypeVehicleToString);
end;

function AddOnsToString(): string;
var
  i:integer;
begin
  AddOnsToString:= '';
  for i:= 0 to frmDealership.lsbAddOnsSelector.Count-1 do
  begin
    AddOnsToString+= IfThen(frmDealership.lsbAddOnsSelector.Selected[i], sLineBreak+ '-'+ frmDealership.lsbAddOnsSelector.Items[i], '');
  end;
end;


function RegisterToString(): string;
begin
     RegisterToString:='Marca: '+ frmDealership.cmbBrandSelector.Text + sLineBreak + 'Tipo: ' + TypeVehicleToString() + sLineBreak + 'Dominio: ' + frmDealership.edtInputNumberPlate.Text + sLineBreak + 'Modelo: ' + frmDealership.edtInputModelYear.Text+ sLineBreak + 'Kilometraje'+
          frmDealership.edtInputOdometer.Text + sLineBreak + 'Adicionales:' + AddOnsToString();
end;
procedure TfrmDealership.FormCreate(Sender: TObject);
begin

end;

procedure TfrmDealership.btnShowValuesClick(Sender: TObject);
begin
  if(CheckRequiredFields()) then ShowMessage('Revise los campos obligatorios a cargar.')
  else ShowMessage(RegisterToString());
end;

procedure TfrmDealership.cmbBrandSelectorChange(Sender: TObject);
begin
end;

procedure TfrmDealership.lblBrandClick(Sender: TObject);
begin

end;

procedure TfrmDealership.rdbTypeVehicleCarChange(Sender: TObject);
begin

end;

end.

