unit uItems;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uTemplate3, StdCtrls, Buttons, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls,
  StrUtils, DB, DBAccess, MyAccess;

type
  TfrmItems = class(TfrmTemplate3)
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCLOSEClick(Sender: TObject);
    procedure wdbgrdDetailKeyPress(Sender: TObject; var Key: Char);
    procedure wdbgrdDetailDblClick(Sender: TObject);
    procedure wdbgrdDetailRowChanged(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure NewEditItem(Option: Char);
  public
    { Public declarations }
  end;

var
  frmItems: TfrmItems;

implementation

uses modVarType, modPublicVar, modFunctions, dtmData, uItem;

{$R *.dfm}

{ TfrmItems }

procedure TfrmItems.btnCLOSEClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmItems.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmItems.FormCreate(Sender: TObject);
begin
  inherited;
  with frmData.qryItemList do
    begin
      if not Active then Active := True;
      Refresh;
    end;
end;

procedure TfrmItems.FormShow(Sender: TObject);
begin
  inherited;
  with frmData.qryItemList do
    begin
      if RecordCount = 0 then
        begin
          NewEditItem('N');
        end;
    end;
end;

procedure TfrmItems.NewEditItem(Option: Char);
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

procedure TfrmItems.wdbgrdDetailDblClick(Sender: TObject);
begin
  inherited;
  NewEditItem('E');
end;

procedure TfrmItems.wdbgrdDetailKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if (Key = #78) or (Key = #110) then
    begin
      NewEditItem('N');
      Key := #0;
    end;
end;

procedure TfrmItems.wdbgrdDetailRowChanged(Sender: TObject);
begin
  inherited;
  DisplayRecordCount(frmData.qryItemList,pnlRecordCtr);
end;

end.
