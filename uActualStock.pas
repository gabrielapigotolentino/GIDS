unit uActualStock;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uTemplate3, StdCtrls, Buttons, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls,
  StrUtils, DB, DBAccess, MyAccess, MemDS, DateUtils;

type
  TfrmActualStock = class(TfrmTemplate3)
    qryActualStock: TMyQuery;
    dsqryActualStock: TMyDataSource;
    qryActualStockitem_id: TStringField;
    qryActualStockqty_onhand: TIntegerField;
    qryActualStockqty_whole: TStringField;
    qryActualStockqty_remain: TStringField;
    qryActualStockitem_descriptions: TStringField;
    qryActualStockunit_description: TStringField;
    qryiBal: TMyQuery;
    procedure qryActualStockCalcFields(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnCLOSEClick(Sender: TObject);
    procedure wdbgrdDetailRowChanged(Sender: TObject);
    procedure wdbgrdDetailKeyPress(Sender: TObject; var Key: Char);
    procedure wdbgrdDetailKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure wdbgrdDetailExit(Sender: TObject);
    procedure wdbgrdDetailFieldChanged(Sender: TObject; Field: TField);
  private
    { Private declarations }
    procedure UpdateQtyOnHand(itemID,qtyOnHand: string);
  public
    { Public declarations }
  end;

var
  frmActualStock: TfrmActualStock;

implementation

{$R *.dfm}

uses modVarType, modFunctions, modPublicVar, dtmData;

procedure TfrmActualStock.btnCLOSEClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmActualStock.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmActualStock.FormCreate(Sender: TObject);
var
  sqlqry: string;
  itemRecCount,ibalRecCount: Integer;
begin
  inherited;
  with qryiBal do
    begin
      sqlqry := '';
      sqlqry := sqlqry + 'SELECT * FROM ibalance';
      Close;
      SQL.Clear;
      SQL.Text := sqlqry;
      Open;

      if RecordCount = 0 then
        begin
          sqlqry := '';
          sqlqry := sqlqry + 'INSERT INTO ibalance (item_id, UserID, TransDate) ';
          sqlqry := sqlqry + 'SELECT item_id, UserID, TransDate FROM item';

          Close;
          SQL.Clear;
          SQL.Text := sqlqry;
          Execute;
        end
      else
        begin
          sqlqry := '';
          sqlqry := sqlqry + 'SELECT * FROM ibalance';
          Close;
          SQL.Clear;
          SQL.Text := sqlqry;
          Open;

          ibalRecCount := RecordCount;

          sqlqry := '';
          sqlqry := sqlqry + 'SELECT * FROM item';
          Close;
          SQL.Clear;
          SQL.Text := sqlqry;
          Open;

          itemRecCount := RecordCount;

          if ibalRecCount < itemRecCount then
            begin
              sqlqry := '';
              sqlqry := sqlqry + 'INSERT INTO ibalance (item_id, UserID, TransDate) ';
              sqlqry := sqlqry + 'SELECT item_id, UserID, TransDate FROM item';

              Close;
              SQL.Clear;
              SQL.Text := sqlqry;
              Execute;
            end;
        end;
    end;
  if not qryActualStock.Active then qryActualStock.Active := True;
  qryActualStock.Refresh;
end;

procedure TfrmActualStock.qryActualStockCalcFields(DataSet: TDataSet);
var
  unit_whole,unit_remain: string;
begin
  inherited;
  unit_whole := '';
  unit_remain := '';

  unit_whole := IntToStr(qryActualStockqty_onhand.AsInteger div GetQuantityPerUnit(qryActualStockunit_description.AsString));
  unit_whole := unit_whole + GetUnitAsWhole(qryActualStockunit_description.AsString);

  unit_remain := IntToStr(qryActualStockqty_onhand.AsInteger mod GetQuantityPerUnit(qryActualStockunit_description.AsString));
  unit_remain := unit_remain + GetUnitAsRemain(qryActualStockunit_description.AsString);

  qryActualStockqty_whole.Value := unit_whole;
  qryActualStockqty_remain.Value := unit_remain;
end;

procedure TfrmActualStock.UpdateQtyOnHand(itemID, qtyOnHand: string);
var
  sqlqry: string;
begin
  with qryiBal do
    begin
      sqlqry := '';
      sqlqry := sqlqry + 'UPDATE ibalance SET qty_onhand = ';
      sqlqry := sqlqry + qtyOnHand;
      sqlqry := sqlqry + ', UserID = ';
      sqlqry := sqlqry + IntToStr(CurrUser.USER_ID);
      sqlqry := sqlqry + ', TransDate = "';
      sqlqry := sqlqry + FormatDateTime('yyyy-mm-dd hh:nn:ss',Now);
      sqlqry := sqlqry + '" WHERE item_id = "';
      sqlqry := sqlqry + itemID;
      sqlqry := sqlqry + '"';

      Close;
      SQL.Clear;
      SQL.Text := sqlqry;
      Execute;
    end;
end;

procedure TfrmActualStock.wdbgrdDetailExit(Sender: TObject);
begin
  inherited;
  with qryActualStock do
    begin
      if State = dsEdit then
        begin
          Post;
        end;
    end;
end;

procedure TfrmActualStock.wdbgrdDetailFieldChanged(Sender: TObject;
  Field: TField);
begin
  inherited;
  with qryActualStock do
    begin
      if State = dsEdit then
        begin
          UpdateQtyOnHand(wdbgrdDetail.GetFieldValue(0),wdbgrdDetail.GetFieldValue(4));
          Edit;
          setGridOption(wdbgrdDetail,0);
        end;
    end;
end;

procedure TfrmActualStock.wdbgrdDetailKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  with qryActualStock do
    begin
      if State = dsEdit then
        begin
          if Key = VK_RETURN then
            begin
              Post;
              Key := 0;
            end;
          if (Key = VK_LEFT) or (Key = VK_RIGHT) then
            begin
              Key := 0;
            end;
        end;
    end;
end;

procedure TfrmActualStock.wdbgrdDetailKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if qryActualStock.RecordCount > 0 then
    begin
      if (Key = #69) or (Key = #101) then
        begin
          setGridOption(wdbgrdDetail,1);
          wdbgrdDetail.SelectedIndex := 4;
          Key := #0;
        end;
    end;
end;

procedure TfrmActualStock.wdbgrdDetailRowChanged(Sender: TObject);
begin
  inherited;
  with qryActualStock do
    begin
      if State = dsInsert then
        begin
          Cancel;
        end;
      if State = dsBrowse then
        begin
          DisplayRecordCount(qryActualStock,pnlRecordCtr);
        end;
    end;
end;

end.
