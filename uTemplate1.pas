unit uTemplate1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, Buttons;

type
  TfrmTemplate1 = class(TForm)
    pnlDetail: TPanel;
    pnlMenu: TPanel;
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
  frmTemplate1: TfrmTemplate1;

implementation

{$R *.dfm}

end.
