unit uBegBalance;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uTemplate3, StdCtrls, Buttons, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls,
  StrUtils, DB, DBAccess, MyAccess, MemDS;

type
  TfrmBegBalance = class(TfrmTemplate3)
    qryBegBalance: TMyQuery;
    btnGENERATE: TBitBtn;
    dsqryBegBalance: TMyDataSource;
    qryBegBalancecmonth: TIntegerField;
    qryBegBalancecyear: TIntegerField;
    qryBegBalanceitem_id: TStringField;
    qryBegBalanceitem_descriptions: TStringField;
    qryBegBalanceunit_description: TStringField;
    qryBegBalancebeg_qty: TIntegerField;
    qryBegBalancecactive: TSmallintField;
    qryiBalance: TMyQuery;
    qryBB: TMyQuery;
    qryBegBalanceunit_whole: TStringField;
    qryBegBalanceunit_remain: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure btnCLOSEClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure wdbgrdDetailRowChanged(Sender: TObject);
    procedure btnGENERATEClick(Sender: TObject);
    procedure qryBegBalanceCalcFields(DataSet: TDataSet);
    procedure wdbgrdDetailKeyPress(Sender: TObject; var Key: Char);
    procedure wdbgrdDetailFieldChanged(Sender: TObject; Field: TField);
    procedure wdbgrdDetailKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure wdbgrdDetailExit(Sender: TObject);
    procedure wdbgrdDetailColExit(Sender: TObject);
  private
    currMonth,currYear: Integer;
    { Private declarations }
    procedure GenerateBegBalance(cmonth,cyear: Integer; bbType: Byte);
    procedure ListBegBalance(cmonth,cyear,cactive: Integer);
    procedure UpdateBegQuantity(cMonth,cYear,itemID, begQty: string);
  public
    { Public declarations }
  end;

var
  frmBegBalance: TfrmBegBalance;

implementation

uses modVarType, modFunctions, modPublicVar, dtmData;

{$R *.dfm}

procedure TfrmBegBalance.btnCLOSEClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmBegBalance.btnGENERATEClick(Sender: TObject);
var
  sqlqry: string;
begin
  inherited;
  ListBegBalance(currMonth,currYear,1);
  if qryBegBalance.RecordCount > 0 then
    begin
      ShowMessage('Beginning Balance for this month already exists.');
    end
  else
    begin
      GenerateBegBalance(currMonth,currYear,1);
    end;
end;

procedure TfrmBegBalance.FormCreate(Sender: TObject);
begin
  inherited;
  currMonth := 0;
  currYear := 0;

  if StrToInt(FormatDateTime('mm',Now)) = 1 then
    begin
      currMonth := 12;
      currYear := StrToInt(FormatDateTime('yyyy',Now)) - 1;
    end
  else
    begin
      currMonth := StrToInt(FormatDateTime('mm',Now)) - 1;
      currYear := StrToInt(FormatDateTime('yyyy',Now))
    end;
end;

procedure TfrmBegBalance.FormShow(Sender: TObject);
begin
  inherited;
  ListBegBalance(currMonth,currYear,1);
  if qryBegBalance.RecordCount = 0 then
    begin
      GenerateBegBalance(currMonth,currYear,0);
    end;
  ListBegBalance(currMonth,currYear,1);
end;

procedure TfrmBegBalance.GenerateBegBalance(cmonth, cyear: Integer;
  bbType: Byte);
var
  sqlqry,currTimeStamp: string;
begin
  sqlqry := '';
  currTimeStamp := '';
  currTimeStamp := FormatDateTime('yyyy-mm-dd hh:nn:ss',Now);
  sqlqry := sqlqry + 'SELECT * FROM ibalance';

  qryiBalance.Close;
  qryiBalance.SQL.Clear;
  qryiBalance.SQL.Text := sqlqry;
  qryiBalance.Open;

  if qryiBalance.RecordCount > 0 then
    begin
      qryiBalance.First;
      while not qryiBalance.Eof do
        begin
          sqlqry := '';
          sqlqry := sqlqry + 'INSERT INTO beg_balance (cmonth, cyear, item_id, beg_qty, cactive, UserID, TransDate) VALUES';
          sqlqry := sqlqry + '(';
          sqlqry := sqlqry + IntToStr(cmonth);
          sqlqry := sqlqry + ',';
          sqlqry := sqlqry + IntToStr(cyear);
          sqlqry := sqlqry + ',"';
          sqlqry := sqlqry + qryiBalance.FieldByName('item_id').AsString;
          sqlqry := sqlqry + '",';
          if bbType = 0 then
            begin
              sqlqry := sqlqry + '0';
            end
          else
            begin
              sqlqry := sqlqry + qryiBalance.FieldByName('qty_onhand').AsString;
            end;
          sqlqry := sqlqry + ',1,';
          sqlqry := sqlqry + IntToStr(CurrUser.USER_ID);
          sqlqry := sqlqry + ',"';
          sqlqry := sqlqry + currTimeStamp;
          sqlqry := sqlqry + '")';

          with qryBB do
            begin
              Close;
              SQL.Clear;
              SQL.Text := sqlqry;
              Execute;
            end;

          qryiBalance.Next;
        end;
    end;
end;

procedure TfrmBegBalance.ListBegBalance(cmonth, cyear, cactive: Integer);
begin
  with qryBegBalance do
    begin
      Active := False;
      Params[0].AsInteger := cmonth;
      Params[1].AsInteger := cyear;
      Params[2].AsInteger := cactive;
      Active := True;
    end;
end;

procedure TfrmBegBalance.qryBegBalanceCalcFields(DataSet: TDataSet);
var
  unit_whole,unit_remain: string;
begin
  inherited;
  unit_whole := '';
  unit_remain := '';

  unit_whole := IntToStr(qryBegBalancebeg_qty.AsInteger div GetQuantityPerUnit(qryBegBalanceunit_description.AsString));
  unit_whole := unit_whole + GetUnitAsWhole(qryBegBalanceunit_description.AsString);

  unit_remain := IntToStr(qryBegBalancebeg_qty.AsInteger mod GetQuantityPerUnit(qryBegBalanceunit_description.AsString));
  unit_remain := unit_remain + GetUnitAsRemain(qryBegBalanceunit_description.AsString);

  qryBegBalanceunit_whole.Value := unit_whole;
  qryBegBalanceunit_remain.Value := unit_remain;
end;

procedure TfrmBegBalance.UpdateBegQuantity(cMonth, cYear, itemID, begQty: string);
var
  sqlqry: string;
begin
  with qryBB do
    begin
      sqlqry := '';
      sqlqry := sqlqry + 'UPDATE beg_balance SET beg_qty = ';
      sqlqry := sqlqry + begQty;
      sqlqry := sqlqry + ', UserID = ';
      sqlqry := sqlqry + IntToStr(CurrUser.USER_ID);
      sqlqry := sqlqry + ', TransDate = "';
      sqlqry := sqlqry + FormatDateTime('yyyy-mm-dd hh:nn:ss',Now);
      sqlqry := sqlqry + '" WHERE cmonth = ';
      sqlqry := sqlqry + cMonth;
      sqlqry := sqlqry + ' AND cyear = ';
      sqlqry := sqlqry + cYear;
      sqlqry := sqlqry + ' AND item_id = "';
      sqlqry := sqlqry + itemID;
      sqlqry := sqlqry + '"';

      Close;
      SQL.Clear;
      SQL.Text := sqlqry;
      Execute;
    end;
  ListBegBalance(StrToInt(cMonth),StrToInt(cYear),1);
  qryBegBalance.Locate('cmonth;cyear;item_id',VarArrayOf([cMonth,cYear,itemID]),[]);
end;

procedure TfrmBegBalance.wdbgrdDetailColExit(Sender: TObject);
begin
  inherited;
  with qryBegBalance do
    begin
      if State = dsEdit then
        begin
          Post;
        end;
    end;
end;

procedure TfrmBegBalance.wdbgrdDetailExit(Sender: TObject);
begin
  inherited;
  with qryBegBalance do
    begin
      if State = dsEdit then
        begin
          Post;
        end;
    end;
end;

procedure TfrmBegBalance.wdbgrdDetailFieldChanged(Sender: TObject;
  Field: TField);
begin
  inherited;
  with qryBegBalance do
    begin
      if State = dsEdit then
        begin
          UpdateBegQuantity(wdbgrdDetail.GetFieldValue(0),wdbgrdDetail.GetFieldValue(1),wdbgrdDetail.GetFieldValue(2),wdbgrdDetail.GetFieldValue(6));
          Edit;
          setGridOption(wdbgrdDetail,0);
        end;
    end;
end;

procedure TfrmBegBalance.wdbgrdDetailKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  with qryBegBalance do
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

procedure TfrmBegBalance.wdbgrdDetailKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if (Key = #69) or (Key = #101) then
    begin
      setGridOption(wdbgrdDetail,1);
      wdbgrdDetail.SelectedIndex := 6;
      Key := #0;
    end;
end;

procedure TfrmBegBalance.wdbgrdDetailRowChanged(Sender: TObject);
begin
  inherited;
  with qryBegBalance do
    begin
      if State = dsInsert then
        begin
          Cancel;
        end;
      if State = dsBrowse then
        begin
          DisplayRecordCount(qryBegBalance,pnlRecordCtr);
        end;
    end;
end;

end.
