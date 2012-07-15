unit iRetNew;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, DBAccess, MyAccess, MemDS, wwdblook, Grids, Wwdbigrd,
  Wwdbgrid, StdCtrls, JvExStdCtrls, JvEdit, JvDBSearchEdit, ExtCtrls, DBCtrls,
  ComCtrls, Mask, StrUtils;

type
  TfrmiRetNew = class(TForm)
    pgc1: TPageControl;
    ts1: TTabSheet;
    lbl1: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    dbedtrecID: TDBEdit;
    dbedtretDesc: TDBEdit;
    DTPret: TDateTimePicker;
    DEc_signatory_id: TDBLookupComboBox;
    pnl1: TPanel;
    lbl11: TLabel;
    btn1: TButton;
    btnAdd: TButton;
    dbSearch: TJvDBSearchEdit;
    rb1: TRadioButton;
    rb2: TRadioButton;
    rb3: TRadioButton;
    dbGrid: TwwDBGrid;
    dblookupID: TwwDBLookupCombo;
    dblookupDesc: TwwDBLookupCombo;
    QryRet: TMyQuery;
    DSRet: TMyDataSource;
    QryRetDet: TMyQuery;
    DSRetdet: TMyDataSource;
    pm1: TPopupMenu;
    Delete1: TMenuItem;
    dbQryRetretDescription: TStringField;
    dbQryRetretID: TStringField;
    dbQryRetretDate: TDateTimeField;
    dbQryRetuserID: TIntegerField;
    dbQryRetTransDate: TDateTimeField;
    dbQryRetDetretID: TStringField;
    dbQryRetDetitem_id: TStringField;
    dbQryRetDetunit_id: TIntegerField;
    dbQryRetDetitem_description: TStringField;
    dbQryRetDetbrand_description: TStringField;
    dbQryRetDetsize_description: TStringField;
    dbQryRetDetunit_description: TStringField;
    dbQryRetDetqty_onhand: TFloatField;
    DErisid: TDBLookupComboBox;
    dbQryRetris_id: TStringField;
    lbl3: TLabel;
    dbQryRetDetRemainder: TIntegerField;
    dbQryRetDetQuantityboxcavan: TStringField;
    dbQryRetDetqty_distributed: TFloatField;
    dbedtretRIS: TDBEdit;
    DEc_position_id: TDBLookupComboBox;
    dbQryRetc_signatory_id: TIntegerField;
    dbQryRetp_signatory_id: TIntegerField;
    lbl2: TLabel;
    DEp_signatory_id: TDBLookupComboBox;
    DEp_position_id: TDBLookupComboBox;
    dbQryRetc_position_id: TIntegerField;
    dbQryRetp_position_id: TIntegerField;
    procedure btnAddClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbGridColExit(Sender: TObject);
    procedure dbGridExit(Sender: TObject);
    procedure dbGridRowChanged(Sender: TObject);

    procedure AddRecord(Dtype:Byte);

    procedure dblookupIDCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblookupIDExit(Sender: TObject);
    procedure dblookupDescCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblookupDescExit(Sender: TObject);
    procedure Delete1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn1Click(Sender: TObject);
    procedure dbQryRetDetqty_onhandChange(Sender: TField);
    procedure QryRetDetBeforeUpdateExecute(Sender: TCustomMyDataSet;
      StatementTypes: TStatementTypes; Params: TDAParams);
    procedure QryRetAfterPost(DataSet: TDataSet);
    procedure QryRetDetCalcFields(DataSet: TDataSet);
    procedure DEc_position_idCloseUp(Sender: TObject);
    procedure DEp_position_idCloseUp(Sender: TObject);
    procedure rb2Click(Sender: TObject);
    procedure rb3Click(Sender: TObject);
    procedure rb1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmiRetNew: TfrmiRetNew;
  posted : Integer;

implementation

uses iRetList, uMain, dtmData, modFunctions, modPublicVar, modVarType;

{$R *.dfm}

procedure TfrmiRetNew.AddRecord(Dtype: Byte);
var
itemID, itemDesc, itemFName, itemNotLOC, itemValue, NotifMsg : string;
notblank : integer;
begin
 itemID := frmData.QryItems.FieldByName('item_id').AsString;
 itemDesc := frmData.QryItems.FieldByName('item_description').AsString;
 notblank := 0;
 if (Dtype = 0) and (dblookupID.Value <> '') then
 begin
   notblank := 1;
 end
 else if (Dtype = 1) and (dblookupDesc.Value <> '') then
 begin
   notblank := 1;
 end;

 if notblank = 1 then
 begin
   if Dtype = 0 then  //itemID
   begin
     itemFName := 'item_id';
     itemValue := dblookupID.Value;
     itemNotLOC := 'Item ID: "'+ dblookupID.Value + '"';
     NotifMsg := 'ID: '+ itemID;
   end
   else if Dtype = 1 then  //itemDesc
   begin
     itemFName := 'item_description';
     itemValue := dblookupDesc.Value;
     itemNotLOC := 'Item Name: "'+ dblookupDesc.Value + '"';
     NotifMsg := 'Name: '+ itemDesc;
   end;

   if frmData.QryItems.Locate(itemFName,itemValue,[]) then
   begin
     if QryRetDet.State in [dsInsert, dsEdit] then
     begin
        if frmData.QryRetDetLoc.Locate('item_id;retID',VarArrayOf([itemID,currID]),[]) then
          begin
            QryRetDet.Cancel;
            Dialogs.MessageDlg('Item '+ NotifMsg + ' already exist.',mtError,[mbOK],0);
          end
        else
          begin
            if Dtype = 1 then
            begin
              dblookupID.Value := itemID;
            end;
            QryRetDet.FieldByName('unit_id').AsInteger := frmData.dbQryItemsunit_id.AsInteger;
            QryRetDet.FieldByName('retID').Value := currID;
            QryRetDet.Refresh;
            frmData.QryRetDetLoc.Refresh;
          end;
     end;
   end
   else
   begin
     QryRetDet.Cancel;
     Dialogs.MessageDlg(itemNotLOC+' does not exist',mtError,[mbOK],0);
   end;
   frmData.QryItems.Refresh;
 end
 else
 begin
   QryRetDet.Cancel;
   Dialogs.MessageDlg('Field must contain a value', mtWarning,[mbOK],0);
 end;
end;

procedure TfrmiRetNew.btn1Click(Sender: TObject);
begin
Close;
end;

procedure TfrmiRetNew.btnAddClick(Sender: TObject);
var
  currentItemID,currDateTime : string;
  currentiBalqty, currentiRecqty, finalBal, itemmultiplier, recCount : Integer;
begin
  recCount := QryRetDet.RecordCount;

  //filter all records to current item received ID
  frmData.QryRetBalance.Active := False;
  frmData.QryRetBalance.Params[0].AsString := currID;
  frmData.QryRetBalance.Active := True;

  if (dbedtretDesc.Text = '') or (dbedtretDesc.Text = ' ') or (recCount < 1) or (dbQryRetris_id.AsString = '')  or (dbQryRetc_signatory_id.AsInteger = 0) or (dbQryRetp_signatory_id.AsInteger = 0) or (dbQryRetc_position_id.AsInteger = 0) or (dbQryRetp_position_id.AsInteger = 0)  then
  begin
     Dialogs.MessageDlg('Complete all the necessary information required.',mtError,[mbOK],0);
  end
  else if frmData.QryRetBalance.Locate('qty_onhand',0,[]) then
  begin
     dbGrid.SelectedIndex := 1;
     Dialogs.MessageDlg('Quantity Returned must not be equal to 0',mtError,[mbOK],0);
  end
  else if frmData.QryRetBalance.Locate('qty_distributed',0,[]) then
  begin
     dbGrid.SelectedIndex := 8;
     Dialogs.MessageDlg('Quantity Distributed must not be equal to 0',mtError,[mbOK],0);
  end
  else
  begin

      currDateTime :=  FormatDateTime('YYYY-MM-DD HH:NN:SS',Now);
      if Dialogs.MessageDlg('After Saving this transaction, data cannot be edited anymore. are you sure you want to continue?', mtConfirmation, [mbYes,mbNo],0, mbYes) = mrYes then
      begin
                 with frmData do
                 begin


                    QryRetBalance.First;
                    while not QryRetBalance.Eof do //loop to process all items within the selected ID
                    begin

                       currentItemID := QryRetBalance.FieldByName('item_id').AsString;
        //               dbQryRecBalanceitem_id.AsString;

                       if not tblBalance.Active then tblBalance.Active := True;
                       tblBalance.Refresh;

                       if tblBalance.Locate('item_id', currentItemID,[]) then
                       begin

                       // tblUnit.Locate('unit_id',dbQryRetBalanceunit_id.AsInteger,[]);  //locate unitid to pinpoint unitid description

                       // itemmultiplier := GetQuantityPerUnit(dbUnitunit_description.AsString);  //get how many per box/etc i.e 24/box
                        currentiRecqty := dbQryRetBalanceqty_onhand.AsInteger; //get item received quantity as a whole
                       // currentiRecqty := currentiRecqty * itemmultiplier;  //multiply to convert per pc/kg etc.

                        currentiBalqty := dbBalanceqty_onhand.AsInteger; //get current item "balance/stock" in the system
                        finalBal := currentiBalqty + currentiRecqty;  //add current and received quantity

                        with QryQuery do
                        begin
                         Close;
                         SQL.Clear;
                         SQL.Text := 'UPDATE iBalance SET qty_onhand = ' + IntToStr(finalBal) + ', TransDate = "' + currDateTime + '" WHERE item_id = "'+ currentItemID +'"';
                         Execute;
                        end;

                       end;
                       with QryQuery do
                       begin
                          Close;
                          SQL.Clear;
                          SQL.Text := 'INSERT INTO iHist (trans_type,reference_id,trans_date) VALUES ("U","'+ currID +'","'+ currDateTime +'")';
                          Execute;
                       end;
                    QryRetBalance.Next;
                    end;

                    with QryQuery do
                    begin
                      Close;
                      SQL.Clear;
                      SQL.Text := 'UPDATE ris SET ris_returned = 1 WHERE ris_id = "' + DErisid.KeyValue + '"';
                      Execute;
                    end;

                 end;

                 QryRet.FieldByName('retDate').AsDateTime := DTPret.DateTime;
                 QryRet.FieldByName('UserID').AsInteger := CurrUser.USER_ID;
                 QryRet.FieldByName('TransDate').AsDateTime := Now;
                 QryRet.Post;
                 posted := 1;
                 Close;
      end
      else
      begin

      end;
  end;

end;

procedure TfrmiRetNew.dbGridColExit(Sender: TObject);
begin
  if (dbGrid.GetFieldValue(0) = '') or (dbGrid.GetFieldValue(1) = '') then
  begin
    QryRetDet.Cancel;
  end;

//  if QryRetDet.State in [dsEdit] then
//  begin
//    if dbQryRetDetqty_onhand.AsString = '' then
//    begin
//      QryRetDet.Cancel;
      QryRetDet.Refresh;
//    end;
//  end;
end;

procedure TfrmiRetNew.dbGridExit(Sender: TObject);
begin
  if QryRetDet.State in [dsEdit] then
  begin
    if dbQryRetDetqty_onhand.AsString = '' then
    begin
      QryRetDet.Cancel;
    end
    else
    begin
      QryRetDet.Post;
    end;
    QryRetDet.Refresh;
  end;
end;

procedure TfrmiRetNew.dbGridRowChanged(Sender: TObject);
begin
  if QryRetDet.State in [dsInsert] then
  begin
    if not ((dbGrid.SelectedIndex = 0) or (dbGrid.SelectedIndex = 1)) then
    begin
     QryRetDet.Cancel;
    end;
  end;
//  QryRetDet.Refresh;
end;

procedure TfrmiRetNew.dblookupDescCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
AddRecord(1);
end;

procedure TfrmiRetNew.dblookupDescExit(Sender: TObject);
begin
//AddRecord(1);
end;

procedure TfrmiRetNew.dblookupIDCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
AddRecord(0);
end;

procedure TfrmiRetNew.dblookupIDExit(Sender: TObject);
begin
//AddRecord(0);
end;

procedure TfrmiRetNew.dbQryRetDetqty_onhandChange(Sender: TField);
begin



   if dbQryRetDetqty_onhand.AsFloat < 0 then
   begin
     dbQryRetDetqty_onhand.Value := 0;
   end;

end;

procedure TfrmiRetNew.DEc_position_idCloseUp(Sender: TObject);
begin
if DEc_position_id.KeyValue <> null then
begin
  if not DEc_signatory_id.Enabled then DEc_signatory_id.Enabled := True;
  DEc_signatory_id.KeyValue := -1;
end;
end;

procedure TfrmiRetNew.Delete1Click(Sender: TObject);
begin
  if Dialogs.MessageDlg('Delete selected record?',
  mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
    begin
       QryRetDet.Delete;
       QryRetDet.Refresh;
       frmData.QryRetDetLoc.Refresh;
    end else begin end;
end;

procedure TfrmiRetNew.DEp_position_idCloseUp(Sender: TObject);
begin
if DEp_position_id.KeyValue <> null then
begin
  if not DEp_signatory_id.Enabled then DEp_signatory_id.Enabled := True;
  DEp_signatory_id.KeyValue := -1;
end;
end;

procedure TfrmiRetNew.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if AddTrue = 1 then
   begin
     if posted = 1 then
     begin
        posted := 0;
        frmiRetList.QryRET.Refresh;
        Action := caFree;
     end
     else if Dialogs.MessageDlg('Cancel this transaction? All data will be lost.', mtConfirmation,[mbYes,mbNo],0, mbYes) = mrYes then
     begin
       with frmData.QryQuery do
       begin
         Close;
         SQL.Clear;
         SQL.Text := 'DELETE FROM iretdet WHERE retID = "'+ currID +'"';
         Execute;
       end;
       Action := caFree;
     end
     else
     begin
       Action := caNone;
     end;
   end
   else
   begin
     Action := caFree;
   end;
   frmData.QryRetDetLoc.Refresh;
end;

procedure TfrmiRetNew.FormCreate(Sender: TObject);
begin
  with frmData do
    begin
      if not QryPosition1.Active then QryPosition1.Active := True;
      QryPosition1.Refresh;
      if not QrySignatory1.Active then QrySignatory1.Active := True;
      QrySignatory1.Refresh;
      if not QryPosition2.Active then QryPosition2.Active := True;
      QryPosition2.Refresh;
      if not QrySignatory2.Active then QrySignatory2.Active := True;
      QrySignatory2.Refresh;
      if not QryItems.Active then QryItems.Active := True;
      QryItems.Refresh;
      if not tblBalance.Active then tblBalance.Active := True;
      tblBalance.Refresh;
      if not tblUnit.Active then tblUnit.Active := True;
      tblUnit.Refresh;
    end;
end;

procedure TfrmiRetNew.FormShow(Sender: TObject);
begin

  if AddTrue = 1 then
  begin
    if not QryRet.Active then QryRet.Active := True;
    if not frmData.QryRisID.Active then frmData.QryRisID.Active := True;
    frmData.QryRisID.Refresh;

    QryRet.Append;

    currID := (SetNewID('iret','retID','U-' + FormatDateTime('yyyy',Now) + '-',5));
    dbQryRetretID.AsString := currID;

    DTPret.MaxDate := Now;
    DTPret.Date := Now;
    btnAdd.Visible := True;
  end
  else if AddTrue = 0 then
  begin
    DEp_position_id.Enabled := False;
    DEc_position_id.Enabled := False;
    DErisid.Visible := False;
    dbedtretRIS.Visible := True;
    btnAdd.Visible := False;
    dbGrid.Enabled := False;
    DTPret.Enabled := False;
    DTPret.Date := QryRet.FieldByName('retDate').AsDateTime;
  end;
  with QryRetDet do
  begin
    Active := False;
    Params[0].AsString := currID;
    Active := True;
  end;
end;

procedure TfrmiRetNew.QryRetAfterPost(DataSet: TDataSet);
begin
Dialogs.MessageDlg('Record Added Successfully!', mtConfirmation,[mbOK],0);
end;

procedure TfrmiRetNew.QryRetDetBeforeUpdateExecute(Sender: TCustomMyDataSet;
  StatementTypes: TStatementTypes; Params: TDAParams);
begin
if dbQryRetDetqty_onhand.AsString = '' then
begin
  QryRetDet.Cancel;
  QryRetDet.Refresh;
end;
end;

procedure TfrmiRetNew.QryRetDetCalcFields(DataSet: TDataSet);
var
qtyperunit, qtywhole, qtyremain : Integer;
qtyperunitlabel, unitdesc : string;
begin

    unitdesc := QryRetDet.FieldByName('unit_description').AsString;
    qtyperunit := GetQuantityPerUnit(unitdesc);

    qtyperunitlabel := RightStr(unitdesc, Length(unitdesc) - (Length(IntToStr(qtyperunit)) + 2));

    if qtyperunit > 0 then
    begin
    qtyremain := dbQryRetDetqty_onhand.AsInteger mod qtyperunit;
    qtywhole := dbQryRetDetqty_onhand.AsInteger div qtyperunit;
    end;

    if qtywhole > 0 then
    begin
      dbQryRetDetQuantityboxcavan.AsString := IntToStr(qtywhole) + qtyperunitlabel;
    end
    else
    begin
      dbQryRetDetQuantityboxcavan.AsString := '0'+ qtyperunitlabel;
    end;

    if qtyremain > 0 then
    begin
      dbQryRetDetRemainder.AsInteger := qtyremain;
    end
    else
    begin
      dbQryRetDetRemainder.AsInteger := 0;
    end;
end;

procedure TfrmiRetNew.rb1Click(Sender: TObject);
begin
dbSearch.DataField := 'item_id';
dbSearch.Clear;
dbSearch.SetFocus;
end;

procedure TfrmiRetNew.rb2Click(Sender: TObject);
begin
dbSearch.DataField := 'item_description';
dbSearch.Clear;
dbSearch.SetFocus;
end;

procedure TfrmiRetNew.rb3Click(Sender: TObject);
begin
dbSearch.DataField := 'brand_description';
dbSearch.Clear;
dbSearch.SetFocus;
end;

end.
