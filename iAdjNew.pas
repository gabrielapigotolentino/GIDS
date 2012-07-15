unit iAdjNew;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, DBAccess, MyAccess, MemDS, wwdblook, Grids, Wwdbigrd,
  Wwdbgrid, StdCtrls, JvExStdCtrls, JvEdit, JvDBSearchEdit, ExtCtrls, DBCtrls,
  ComCtrls, Mask, wwdbedit, Wwdotdot, Wwdbcomb;

type
  TfrmiAdjNew = class(TForm)
    pgc1: TPageControl;
    ts1: TTabSheet;
    lbl1: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    dbedtadjID: TDBEdit;
    dbedtadjDesc: TDBEdit;
    DTPadj: TDateTimePicker;
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
    QryAdj: TMyQuery;
    DSAdj: TMyDataSource;
    QryAdjDet: TMyQuery;
    DSAdjdet: TMyDataSource;
    pm1: TPopupMenu;
    Delete1: TMenuItem;
    dbQryAdjadjID: TStringField;
    dbQryAdjadjDate: TDateTimeField;
    dbQryAdjadjDescription: TStringField;
    dbQryAdjuserID: TIntegerField;
    dbQryAdjTransDate: TDateTimeField;
    dbQryAdjDetadjID: TStringField;
    dbQryAdjDetitem_id: TStringField;
    dbQryAdjDetqty_onhand: TFloatField;
    dbQryAdjDetunit_id: TIntegerField;
    dbQryAdjDetadjustment_type: TIntegerField;
    dbQryAdjDetitem_description: TStringField;
    dbQryAdjDetbrand_description: TStringField;
    dbQryAdjDetsize_description: TStringField;
    dbQryAdjDetunit_description: TStringField;
    cbb1: TwwDBComboBox;
    dbQryAdjc_signatory_id: TIntegerField;
    dbQryAdjp_signatory_id: TIntegerField;
    dbQryAdjc_position_id: TIntegerField;
    dbQryAdjp_position_id: TIntegerField;
    DEc_position_id: TDBLookupComboBox;
    lbl2: TLabel;
    DEp_position_id: TDBLookupComboBox;
    DEp_signatory_id: TDBLookupComboBox;
    DEc_signatory_id: TDBLookupComboBox;
    procedure FormShow(Sender: TObject);
    procedure dbGridColExit(Sender: TObject);
    procedure dbGridExit(Sender: TObject);
    procedure dbGridRowChanged(Sender: TObject);
    procedure cbb1CloseUp(Sender: TwwDBComboBox; Select: Boolean);
    procedure dblookupIDCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblookupIDExit(Sender: TObject);
    procedure dblookupDescExit(Sender: TObject);
    procedure dblookupDescCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure QryAdjDetBeforeUpdateExecute(Sender: TCustomMyDataSet;
      StatementTypes: TStatementTypes; Params: TDAParams);
    procedure rb1Click(Sender: TObject);
    procedure rb2Click(Sender: TObject);
    procedure rb3Click(Sender: TObject);
    //
    procedure AddRecord(Dtype:Byte);
    procedure QryAdjAfterPost(DataSet: TDataSet);
    procedure btn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Delete1Click(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure DEc_position_idCloseUp(Sender: TObject);
    procedure DEp_position_idCloseUp(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmiAdjNew: TfrmiAdjNew;
  posted : integer;

implementation

uses dtmData, iAdjList, modFunctions, modPublicVar, modVarType, uMain;

{$R *.dfm}

procedure TfrmiAdjNew.AddRecord(Dtype: Byte);
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
       if QryAdjDet.State in [dsInsert, dsEdit] then
       begin
          if frmData.QryAdjDetLoc.Locate('item_id;adjID',VarArrayOf([itemID,currID]),[]) then
            begin
              QryAdjDet.Cancel;
              Dialogs.MessageDlg('Item '+ NotifMsg + ' already exist.',mtError,[mbOK],0);
            end
          else
            begin
              if Dtype = 1 then
              begin
                dblookupID.Value := itemID;
              end;
              QryAdjDet.FieldByName('unit_id').AsInteger := frmData.dbQryItemsunit_id.AsInteger;
              QryAdjDet.FieldByName('adjID').Value := currID;
              QryAdjDet.Refresh;
              frmData.QryAdjDetLoc.Refresh;
            end;
       end;
     end
     else
     begin
       QryAdjDet.Cancel;
       Dialogs.MessageDlg(itemNotLOC+' does not exist',mtError,[mbOK],0);
     end;
     frmData.QryItems.Refresh;
   end
   else
   begin
     QryAdjDet.Cancel;
     Dialogs.MessageDlg('Field must contain a value', mtWarning,[mbOK],0);
   end;
end;

procedure TfrmiAdjNew.btn1Click(Sender: TObject);
begin
Close;
end;

procedure TfrmiAdjNew.btnAddClick(Sender: TObject);
var
  currentItemID,currDateTime : string;
  currentiBalqty, currentiRecqty, finalBal, itemmultiplier, recCount : Integer;
begin
  recCount := QryAdjDet.RecordCount;

  //filter all records to current item received ID
  frmData.QryAdjBalance.Active := False;
  frmData.QryAdjBalance.Params[0].AsString := currID;
  frmData.QryAdjBalance.Active := True;

  if (dbedtadjDesc.Text = '') or (dbedtadjDesc.Text = ' ') or (recCount < 1) or (dbQryAdjc_signatory_id.AsInteger = 0) or (dbQryAdjp_signatory_id.AsInteger = 0) or (dbQryAdjc_position_id.AsInteger = 0) or (dbQryAdjp_position_id.AsInteger = 0) then
  begin
     Dialogs.MessageDlg('Complete all the necessary information required.',mtError,[mbOK],0);
  end
  else if frmData.QryAdjBalance.Locate('qty_onhand',0,[]) then
  begin
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


                    QryAdjBalance.First;
                    while not QryAdjBalance.Eof do //loop to process all items within the selected ID
                    begin

                       currentItemID := QryAdjBalance.FieldByName('item_id').AsString;
        //               dbQryRecBalanceitem_id.AsString;

                       if not tblBalance.Active then tblBalance.Active := True;
                       tblBalance.Refresh;

                       if tblBalance.Locate('item_id', currentItemID,[]) then
                       begin
                        tblUnit.Locate('unit_id',dbQryAdjBalanceunit_id.AsInteger,[]);  //locate unitid to pinpoint unitid description

                        itemmultiplier := GetQuantityPerUnit(tblUnitunit_description.AsString);  //get how many per box/etc i.e 24/box
                        currentiRecqty := dbQryAdjBalanceqty_onhand.AsInteger; //get item received quantity as a whole
                        currentiRecqty := currentiRecqty * itemmultiplier;  //multiply to convert per pc/kg etc.

                        currentiBalqty := dbBalanceqty_onhand.AsInteger; //get current item "balance/stock" in the system

                        if dbQryAdjBalanceadjustment_type.AsInteger = 1 then
                        begin  //minus
                          finalBal := (currentiBalqty - currentiRecqty);  //minus the adjusted quantity
                        end
                        else if dbQryAdjBalanceadjustment_type.AsInteger = 0 then
                        begin  //add
                          finalBal := (currentiBalqty + currentiRecqty);  //add the adjusted quantity
                        end;
                        with QryQuery do
                        begin
                         Close;
                         SQL.Clear;
                         SQL.Text := 'UPDATE iBalance SET qty_onhand = ' + IntToStr(finalBal) + ', TransDate = "' + currDateTime + '" WHERE item_id = "'+ currentItemID +'"';
                         Execute;
                        end;

                       end;
                    QryAdjBalance.Next;
                    end;
                       with QryQuery do
                       begin
                          Close;
                          SQL.Clear;
                          SQL.Text := 'INSERT INTO iHist (trans_type,reference_id,trans_date) VALUES ("A","'+ currID +'","'+ currDateTime +'")';
                          Execute;
                       end;
                 end;

                 QryAdj.FieldByName('adjDate').AsDateTime := DTPadj.DateTime;
                 QryAdj.FieldByName('UserID').AsInteger := CurrUser.USER_ID;
                 QryAdj.FieldByName('TransDate').AsDateTime := Now;
                 QryAdj.Post;
                 posted := 1;
                 Close;
      end
      else
      begin

      end;
  end;
end;

procedure TfrmiAdjNew.cbb1CloseUp(Sender: TwwDBComboBox; Select: Boolean);
begin
  if (dblookupID.Text = '') or (dblookupDesc.Text = '') then
  begin
  QryAdjDet.Cancel;
  Dialogs.MessageDlg('Select an item first',mtError,[mbOK],0);
  end;
end;

procedure TfrmiAdjNew.dbGridColExit(Sender: TObject);
begin
  if (dbGrid.GetFieldValue(0) = '') or (dbGrid.GetFieldValue(2) = '') then
  begin
    QryAdjDet.Cancel;
  end;
end;

procedure TfrmiAdjNew.dbGridExit(Sender: TObject);
begin
  if QryAdjDet.State in [dsEdit] then
  begin
    if dbQryAdjDetqty_onhand.AsString = '' then
    begin
      QryAdjDet.Cancel;
    end
    else
    begin
      QryAdjDet.Post;
    end;
    QryAdjDet.Refresh;
  end;
end;

procedure TfrmiAdjNew.dbGridRowChanged(Sender: TObject);
begin
  if QryAdjDet.State in [dsInsert] then
  begin
    if not ((dbGrid.SelectedIndex = 0) or (dbGrid.SelectedIndex = 2)) then
    begin
     QryAdjDet.Cancel;
    end;
  end;
end;

procedure TfrmiAdjNew.dblookupDescCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
AddRecord(1);
end;

procedure TfrmiAdjNew.dblookupDescExit(Sender: TObject);
begin
//AddRecord(1);
end;

procedure TfrmiAdjNew.dblookupIDCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
AddRecord(0);
end;

procedure TfrmiAdjNew.dblookupIDExit(Sender: TObject);
begin
//AddRecord(0);
//QryAdjDet.Refresh;
end;

procedure TfrmiAdjNew.DEc_position_idCloseUp(Sender: TObject);
begin
if DEc_position_id.KeyValue <> null then
begin
  if not DEc_signatory_id.Enabled then DEc_signatory_id.Enabled := True;
  DEc_signatory_id.KeyValue := -1;
end;
end;

procedure TfrmiAdjNew.Delete1Click(Sender: TObject);
begin
  if Dialogs.MessageDlg('Delete selected record?',
  mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
    begin
       QryAdjDet.Delete;
       QryAdjDet.Refresh;
       frmData.QryAdjDetLoc.Refresh;
    end else begin end;
end;

procedure TfrmiAdjNew.DEp_position_idCloseUp(Sender: TObject);
begin
if DEp_position_id.KeyValue <> null then
begin
  if not DEp_signatory_id.Enabled then DEp_signatory_id.Enabled := True;
  DEp_signatory_id.KeyValue := -1;
end;
end;

procedure TfrmiAdjNew.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if AddTrue = 1 then
   begin
     if posted = 1 then
     begin
        posted := 0;
        frmiAdjList.QryAdj.Refresh;
        Action := caFree;
     end
     else if Dialogs.MessageDlg('Cancel this transaction? All data will be lost.', mtConfirmation,[mbYes,mbNo],0, mbYes) = mrYes then
     begin
       with frmData.QryQuery do
       begin
         Close;
         SQL.Clear;
         SQL.Text := 'DELETE FROM iadjdet WHERE adjID = "'+ currID +'"';
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
   frmData.QryAdjDetLoc.Refresh;
end;

procedure TfrmiAdjNew.FormCreate(Sender: TObject);
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

procedure TfrmiAdjNew.FormShow(Sender: TObject);
begin

  if AddTrue = 1 then
  begin
    if not QryAdj.Active then QryAdj.Active := True;
    QryAdj.Append;

    currID := (SetNewID('iadj','adjID','A-' + FormatDateTime('yyyy',Now) + '-',5));
    dbQryAdjadjID.AsString := currID;

    DTPadj.MaxDate := Now;
    DTPadj.Date := Now;
    btnAdd.Visible := True;

  end
  else if AddTrue = 0 then
  begin
    DEp_position_id.Enabled := False;
    DEc_position_id.Enabled := False;
    btnAdd.Visible := False;
    dbGrid.Enabled := False;
    DTPadj.Enabled := False;
    DTPadj.Date := QryAdj.FieldByName('adjDate').AsDateTime;
  end;
  with QryAdjDet do
  begin
    Active := False;
    Params[0].AsString := currID;
    Active := True;
  end;
end;

procedure TfrmiAdjNew.QryAdjAfterPost(DataSet: TDataSet);
begin
Dialogs.MessageDlg('Record Added Successfully!', mtConfirmation,[mbOK],0);
end;

procedure TfrmiAdjNew.QryAdjDetBeforeUpdateExecute(Sender: TCustomMyDataSet;
  StatementTypes: TStatementTypes; Params: TDAParams);
begin
if dbQryAdjDetqty_onhand.AsString = '' then
begin
  QryAdjDet.Cancel;
  QryAdjDet.Refresh;
end;
end;

procedure TfrmiAdjNew.rb1Click(Sender: TObject);
begin
dbSearch.DataField := 'item_id';
dbSearch.Clear;
dbSearch.SetFocus;
end;

procedure TfrmiAdjNew.rb2Click(Sender: TObject);
begin
dbSearch.DataField := 'item_description';
dbSearch.Clear;
dbSearch.SetFocus;
end;

procedure TfrmiAdjNew.rb3Click(Sender: TObject);
begin
dbSearch.DataField := 'brand_description';
dbSearch.Clear;
dbSearch.SetFocus;
end;

end.
