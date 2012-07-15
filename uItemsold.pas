unit uItems;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, Buttons, ExtCtrls, StrUtils,
  DB, DBAccess, MyAccess, MemDS;

type
  TfrmItemsOld = class(TForm)
    pnlDetail: TPanel;
    pnlFooter: TPanel;
    pnlMenu: TPanel;
    btnCLOSE: TBitBtn;
    wdbgrdDetail: TwwDBGrid;
    pnlRecordCtr: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure wdbgrdDetailKeyPress(Sender: TObject; var Key: Char);
    procedure btnCLOSEClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure wdbgrdDetailRowChanged(Sender: TObject);
    procedure wdbgrdDetailDblClick(Sender: TObject);
  private
    { Private declarations }
    procedure NewEditItem(Option: Char);
  public
    { Public declarations }
  end;

var
  frmItemsOld: TfrmItemsOld;

implementation

uses modVarType, modPublicVar, modFunctions, dtmData, uItem;

{$R *.dfm}

procedure TfrmItemsOld.btnCLOSEClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmItemsOld.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmItemsOld.FormCreate(Sender: TObject);
begin
  with frmData.qryItemList do
    begin
      if not Active then Active := True;
      Refresh;
    end;
end;

procedure TfrmItemsOld.FormShow(Sender: TObject);
begin
  with frmData.qryItemList do
    begin
      if RecordCount = 0 then
        begin
          NewEditItem('N');
        end;
    end;
end;

procedure TfrmItemsOld.NewEditItem(Option: Char);
begin
  EditItemID := '';
  PerformItem := Option;
  EditItemID := frmData.qryItemListitem_id.AsString;
  with TfrmItem.Create(Self) do
    begin
        try
          ShowModal
        finally
          Free;
        end;
    end;
  with frmData do
    begin
      qryItemList.Refresh;
      qryItemList.Locate('item_id',EditItemID,[]);
    end;
end;

procedure TfrmItemsOld.wdbgrdDetailDblClick(Sender: TObject);
begin
  NewEditItem('E');
end;

procedure TfrmItemsOld.wdbgrdDetailKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #78) or (Key = #110) then
    begin
      NewEditItem('N');
      Key := #0;
    end;
end;

procedure TfrmItemsOld.wdbgrdDetailRowChanged(Sender: TObject);
begin
  DisplayRecordCount(frmData.qryItemList,pnlRecordCtr);
end;

end.
