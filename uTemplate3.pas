unit uTemplate3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, Buttons, ExtCtrls, StrUtils,
  DB, DBAccess, MyAccess, MemDS;

type
  TfrmTemplate3 = class(TForm)
    pnlDetail: TPanel;
    pnlFooter: TPanel;
    pnlMenu: TPanel;
    btnCLOSE: TBitBtn;
    wdbgrdDetail: TwwDBGrid;
    pnlRecordCtr: TPanel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTemplate3: TfrmTemplate3;

implementation

{$R *.dfm}

end.
