unit iRecNew;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StrUtils, DB, DBAccess, MyAccess, MemDS, StdCtrls, Grids, Wwdbigrd,
  Wwdbgrid, JvExStdCtrls, JvEdit, JvDBSearchEdit, ExtCtrls, Mask, DBCtrls,
  ComCtrls, wwdblook, Menus;

type
  TfrmiRecNew = class(TForm)
    pgc1: TPageControl;
    ts1: TTabSheet;
    lbl1: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    dbedtrecID: TDBEdit;
    dbedtrecDesc: TDBEdit;
    pnl1: TPanel;
    lbl11: TLabel;
    btn1: TButton;
    btnAdd: TButton;
    dbSearch: TJvDBSearchEdit;
    rb1: TRadioButton;
    rb2: TRadioButton;
    rb3: TRadioButton;
    dbGrid: TwwDBGrid;
    QryRec: TMyQuery;
    DSRec: TMyDataSource;
    dbQryRecrecID: TStringField;
    dbQryRecrecDate: TDateTimeField;
    dbQryRecrecDescription: TStringField;
    dbQryRecUserID: TIntegerField;
    DTPrec: TDateTimePicker;
    QryRecDet: TMyQuery;
    DSRecDet: TMyDataSource;
    dblookupID: TwwDBLookupCombo;
    dblookupDesc: TwwDBLookupCombo;
    dbQryRecDetitem_id: TStringField;
    dbQryRecDetitem_description: TStringField;
    dbQryRecDetbrand_description: TStringField;
    dbQryRecDetsize_description: TStringField;
    pm1: TPopupMenu;
    Delete1: TMenuItem;
    dbQryRecDetunit_description: TStringField;
    dbQryRecDetunit_id: TIntegerField;
    dbQryRecDetrecID: TStringField;
    dbQryRecTransDate: TDateTimeField;
    dbQryRecDetqty_onhand: TFloatField;
    dbQryRecc_signatory_id: TIntegerField;
    dbQryRecp_signatory_id: TIntegerField;
    dbQryRecc_position_id: TIntegerField;
    dbQryRecp_position_id: TIntegerField;
    DEc_position_id: TDBLookupComboBox;
    DEp_position_id: TDBLookupComboBox;
    DEc_signatory_id: TDBLookupComboBox;
    DEp_signatory_id: TDBLookupComboBox;
    lbl2: TLabel;
    dbQryRecDettotal_qty: TIntegerField;
    procedure FormShow(Sender: TObject);
    procedure dbGridColExit(Sender: TObject);
    procedure dbGridRowChanged(Sender: TObject);

    procedure AddRecord(Dtype:Byte);


    procedure dblookupIDCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblookupIDExit(Sender: TObject);
    procedure dblookupDescCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblookupDescExit(Sender: TObject);
    procedure Delete1Click(Sender: TObject);
    procedure rb1Click(Sender: TObject);
    procedure rb2Click(Sender: TObject);
    procedure rb3Click(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryRecAfterPost(DataSet: TDataSet);
    procedure dbGridExit(Sender: TObject);
    procedure dbQryRecDetqty_onhandChange(Sender: TField);
    procedure QryRecDetBeforeUpdateExecute(Sender: TCustomMyDataSet;
      StatementTypes: TStatementTypes; Params: TDAParams);
    procedure DEc_position_idCloseUp(Sender: TObject);
    procedure DEp_position_idCloseUp(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmiRecNew: TfrmiRecNew;

  posted : integer;

implementation

uses dtmData, iRecList, modFunctions, modPublicVar, modVarType, uMain;

{$R *.dfm}

procedure TfrmiRecNew.AddRecord(Dtype: Byte);
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
     if QryRecDet.State in [dsInsert, dsEdit] then
     begin
        if frmData.QryRecDetLoc.Locate('item_id;recID',VarArrayOf([itemID,currID]),[]) then
          begin
            QryRecDet.Cancel;
            Dialogs.MessageDlg('Item '+ NotifMsg + ' already exist.',mtError,[mbOK],0);
          end
        else
          begin
            if Dtype = 1 then
            begin
              dblookupID.Value := itemID;
            end;
            QryRecDet.FieldByName('unit_id').AsInteger := frmData.dbQryItemsunit_id.AsInteger;
            QryRecDet.FieldByName('recID').Value := currID;
            QryRecDet.Refresh;
            frmData.QryRecDetLoc.Refresh;
          end;
     end;
   end
   else
   begin
     QryRecDet.Cancel;
     Dialogs.MessageDlg(itemNotLOC+' does not exist',mtError,[mbOK],0);
   end;
   frmData.QryItems.Refresh;
 end
 else
 begin
   QryRecDet.Cancel;
   Dialogs.MessageDlg('Field must contain a value', mtWarning,[mbOK],0);
 end;
end;

procedure TfrmiRecNew.btn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmiRecNew.btnAddClick(Sender: TObject);
var
  currentItemID,currDateTime : string;
  currentiBalqty, currentiRecqty, finalBal, itemmultiplier, recCount : Integer;
begin
  recCount := QryRecDet.RecordCount;

  if (dbedtrecDesc.Text = '') or (dbedtrecDesc.Text = ' ') or (recCount < 1)  or (dbQryRecc_signatory_id.AsInteger = 0) or (dbQryRecp_signatory_id.AsInteger = 0) or (dbQryRecc_position_id.AsInteger = 0) or (dbQryRecp_position_id.AsInteger = 0)   then
  begin
     Dialogs.MessageDlg('Complete all the necessary information required.',mtError,[mbOK],0);

  end
  else if QryRecDet.Locate('qty_onhand',0,[]) then
  begin
     dbGrid.SetFocus;
     dbGrid.SelectedIndex := 1;
     Dialogs.MessageDlg('Quantity must not be equal to 0',mtError,[mbOK],0);
  end
  else
  begin

      currDateTime :=  FormatDateTime('YYYY-MM-DD HH:NN:SS',Now);
      if Dialogs.MessageDlg('After Saving this transaction, data cannot be edited anymore. are you sure you want to continue?', mtConfirmation, [mbYes,mbNo],0, mbYes) = mrYes then
      begin
                 with frmData do
                 begin

                   //filter all records to current item received ID
                    QryRecBalance.Active := False;
                    QryRecBalance.Params[0].AsString := currID;
                    QryRecBalance.Active := True;

                    QryRecBalance.First;
                    while not QryRecBalance.Eof do //loop to process all items within the selected ID
                    begin
                       currentItemID := QryRecBalance.FieldByName('item_id').AsString;
        //               dbQryRecBalanceitem_id.AsString;

                       if not tblBalance.Active then tblBalance.Active := True;
                       tblBalance.Refresh;

                       if tblBalance.Locate('item_id', currentItemID,[]) then
                       begin
                        tblUnit.Locate('unit_id',dbQryRecBalanceunit_id.AsInteger,[]);  //locate unitid to pinpoint unitid description

                        itemmultiplier := GetQuantityPerUnit(tblUnitunit_description.AsString);  //get how many per box/etc i.e 24/box
                        currentiRecqty := dbQryRecBalanceqty_onhand.AsInteger; //get item received quantity as a whole
                        currentiRecqty := currentiRecqty * itemmultiplier;  //multiply to convert per pc/kg etc.

                        currentiBalqty := dbBalanceqty_onhand.AsInteger; //get current item "balance/stock" in the system
                        finalBal := currentiBalqty + currentiRecqty;  //add current and received quantity

                        with QryQuery do
                        begin
                         Close;
                         SQL.Clear;
                         SQL.Text := 'UPDATE iBalance SET qty_onhand = ' + IntToStr(finalBal) + ', TransDate = "' + currDateTime + '" WHERE item_id = "'+ currentItemID +'"';
                         Execute;
                        end;

                       end
                       else   //add new record (new item in ibalance)
                       begin
                        tblUnit.Locate('unit_id',dbQryRecBalanceunit_id.AsInteger,[]);  //locate unitid to pinpoint unitid description

                        itemmultiplier := GetQuantityPerUnit(tblUnitunit_description.AsString);  //get how many per box/etc i.e 24/box
                        currentiRecqty := dbQryRecBalanceqty_onhand.AsInteger; //get item received quantity as a whole
                        currentiRecqty := currentiRecqty * itemmultiplier;  //multiply to convert per pc/kg etc.

                        with tblBalance do
                        begin
                          Close;
                          SQL.Clear;
                          SQL.Text := 'INSERT INTO iBalance (item_id,qty_onhand,UserID,TransDate) VALUES ("'+ currentItemID +'",'+ inttostr(currentiRecqty) +','+ inttostr(CurrUser.USER_ID) +', "'+ currDateTime +'")';
                          Execute;
                          Close;
                          SQL.Clear;
                          Open;
                        end;
                       end;
                    QryRecBalance.Next;
                    end;
                   with QryQuery do
                   begin
                      Close;
                      SQL.Clear;
                      SQL.Text := 'INSERT INTO iHist (trans_type,reference_id,trans_date) VALUES ("R","'+ currID +'","'+ currDateTime +'")';
                      Execute;
                   end;

                 end;

                 QryRec.FieldByName('recDate').AsDateTime := DTPrec.DateTime;
                 QryRec.FieldByName('UserID').AsInteger := CurrUser.USER_ID;;
                 QryRec.FieldByName('TransDate').AsDateTime := Now;
                 QryRec.Post;
                 posted := 1;
                 Close;
      end
      else
      begin

      end;
  end;
end;

procedure TfrmiRecNew.dbGridColExit(Sender: TObject);
begin

  if (dbGrid.GetFieldValue(0) = '') or (dbGrid.GetFieldValue(2) = '') then
  begin
    QryRecDet.Cancel;
  end;

//  if QryRecDet.State in [dsEdit] then
//  begin
//    if dbQryRecDetqty_onhand.AsString = '' then
//    begin
//      QryRecDet.Cancel;
      QryRecDet.Refresh;
//    end;
//  end;
end;

procedure TfrmiRecNew.dbGridExit(Sender: TObject);
begin
  if QryRecDet.State in [dsEdit] then
  begin
    if dbQryRecDetqty_onhand.AsString = '' then
    begin
      QryRecDet.Cancel;
    end
    else
    begin
      QryRecDet.Post;
    end;
    QryRecDet.Refresh;
  end;
end;

procedure TfrmiRecNew.dbGridRowChanged(Sender: TObject);
begin
  if QryRecDet.State in [dsInsert] then
  begin
    if not ((dbGrid.SelectedIndex = 0) or (dbGrid.SelectedIndex = 2)) then
    begin
     QryRecDet.Cancel;
    end;
  end;
//  QryRecDet.Refresh;

end;

procedure TfrmiRecNew.dblookupDescCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
AddRecord(1);
end;

procedure TfrmiRecNew.dblookupDescExit(Sender: TObject);
begin
//AddRecord(1);
end;

procedure TfrmiRecNew.dblookupIDCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
AddRecord(0);
end;

procedure TfrmiRecNew.dblookupIDExit(Sender: TObject);
begin
//AddRecord(0);
end;

procedure TfrmiRecNew.dbQryRecDetqty_onhandChange(Sender: TField);
begin
 if dbQryRecDetqty_onhand.AsFloat < 0 then
 begin
   dbQryRecDetqty_onhand.Value := 0;
 end
 else
 begin
   dbQryRecDettotal_qty.Value := dbQryRecDetqty_onhand.AsInteger * GetQuantityPerUnit(dbQryRecDetunit_description.AsString);
 end;
end;

procedure TfrmiRecNew.DEc_position_idCloseUp(Sender: TObject);
begin
if DEc_position_id.KeyValue <> null then
begin
  if not DEc_signatory_id.Enabled then DEc_signatory_id.Enabled := True;
  DEc_signatory_id.KeyValue := -1;
end;
end;

procedure TfrmiRecNew.Delete1Click(Sender: TObject);
begin
  if Dialogs.MessageDlg('Delete selected record?',
  mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
    begin
       QryRecDet.Delete;
       QryRecDet.Refresh;
       frmData.QryRecDetLoc.Refresh;
    end else begin end;
end;

procedure TfrmiRecNew.DEp_position_idCloseUp(Sender: TObject);
begin
if DEp_position_id.KeyValue <> null then
begin
  if not DEp_signatory_id.Enabled then DEp_signatory_id.Enabled := True;
  DEp_signatory_id.KeyValue := -1;
end;
end;

procedure TfrmiRecNew.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if AddTrue = 1 then
  begin
    if posted = 1 then
    begin
      posted := 0;
      frmiRec.QryREC.Refresh;
      Action := caFree;
    end
    else if Dialogs.MessageDlg('Cancel this transaction? All data will be lost.', mtConfirmation,[mbYes,mbNo],0, mbYes) = mrYes then
    begin
     with frmData.QryQuery do
     begin
       Close;
       SQL.Clear;
       SQL.Text := 'DELETE FROM irecdet WHERE recID = "'+ currID +'"';
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
  frmData.QryRecDetLoc.Refresh;
end;

procedure TfrmiRecNew.FormCreate(Sender: TObject);
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

procedure TfrmiRecNew.FormShow(Sender: TObject);
begin


 // add new record
 if AddTrue = 1 then
 begin
     if not QryRec.Active then QryRec.Active := True;
    QryRec.Append;

    currID := (SetNewID('irec','recID','R-' + FormatDateTime('yyyy',Now) + '-',5));
    dbQryRecrecID.AsString := currID;


    // Extra validations
    DTPrec.MaxDate := Now;
    DTPrec.Date := Now;
    btnAdd.Visible := True;
    //
 end
 else if AddTrue = 0 then
 begin
   //view record
   DEp_position_id.Enabled := False;
   DEc_position_id.Enabled := False;
   btnAdd.Visible := False;
   dbGrid.Enabled := False;
   DTPrec.Enabled := False;
   DTPrec.Date := QryRec.FieldByName('recDate').AsDateTime;

 end;
 with QryRecDet do
 begin
   Active := False;
   Params[0].AsString := currID;
   Active := True;
 end;
end;

procedure TfrmiRecNew.QryRecAfterPost(DataSet: TDataSet);
begin
Dialogs.MessageDlg('Record Added Successfully!', mtConfirmation,[mbOK],0);
end;

procedure TfrmiRecNew.QryRecDetBeforeUpdateExecute(Sender: TCustomMyDataSet;
  StatementTypes: TStatementTypes; Params: TDAParams);
begin
if dbQryRecDetqty_onhand.AsString = '' then
begin
  QryRecDet.Cancel;
  QryRecDet.Refresh;
end;
end;

procedure TfrmiRecNew.rb1Click(Sender: TObject);
begin
dbSearch.DataField := 'item_id';
dbSearch.Clear;
dbSearch.SetFocus;
end;

procedure TfrmiRecNew.rb2Click(Sender: TObject);
begin
dbSearch.DataField := 'item_description';
dbSearch.Clear;
dbSearch.SetFocus;
end;

procedure TfrmiRecNew.rb3Click(Sender: TObject);
begin
dbSearch.DataField := 'brand_description';
dbSearch.Clear;
dbSearch.SetFocus;
end;

end.
