unit uSignatories;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StrUtils, DB, uTemplate1, StdCtrls, Buttons, Grids, Wwdbigrd,
  Wwdbgrid, DBAccess, ExtCtrls, MyAccess;

type
  TfrmSignatories = class(TfrmTemplate1)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSignatories: TfrmSignatories;

implementation

uses modVarType, modFunctions, modPublicVar, dtmData;
{$R *.dfm}

end.
