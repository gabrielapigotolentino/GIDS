unit uTemplate4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, Buttons;

type
  TfrmTemplate4 = class(TForm)
    pnlMaster: TPanel;
    pnlDetail: TPanel;
    pnlMenu: TPanel;
    pnlItems: TPanel;
    pnlEmergency: TPanel;
    pnlSignatory: TPanel;
    btnOK: TBitBtn;
    btnCANCEL: TBitBtn;
    wdbgrdDetail: TwwDBGrid;
    pnlRecordCtr: TPanel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTemplate4: TfrmTemplate4;

implementation

{$R *.dfm}

end.
