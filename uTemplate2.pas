unit uTemplate2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, wwdblook, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, Buttons;

type
  TfrmTemplate2 = class(TForm)
    pnlMaster: TPanel;
    pnlDetail: TPanel;
    pnlMenu: TPanel;
    pnlLabel: TPanel;
    pnlSelection: TPanel;
    wdblkpcmbSelection: TwwDBLookupCombo;
    wdbgrdDetail: TwwDBGrid;
    pnlRecordCtr: TPanel;
    btnOK: TBitBtn;
    btnCANCEL: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTemplate2: TfrmTemplate2;

implementation

{$R *.dfm}

end.
