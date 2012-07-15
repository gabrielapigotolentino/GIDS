unit uTemplate5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, Buttons;

type
  TfrmTemplate5 = class(TForm)
    pnlMaster: TPanel;
    pnlDetail: TPanel;
    pnlMenu: TPanel;
    pnlItems: TPanel;
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
  frmTemplate5: TfrmTemplate5;

implementation

{$R *.dfm}

end.
