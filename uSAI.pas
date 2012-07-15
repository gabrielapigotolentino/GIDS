unit uSAI;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uTemplate4, StdCtrls, Buttons, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls,
  StrUtils, DB, DBAccess, MyAccess, wwdblook, wwdbdatetimepicker, Mask, wwdbedit,
  wwcheckbox, DBCtrls;

type
  TfrmSAI = class(TfrmTemplate4)
    edtsai_id: TwwDBEdit;
    wdbdtmpckrsai_date: TwwDBDateTimePicker;
    wdblkpcmbGoodsType: TwwDBLookupCombo;
    edtQuantity: TwwDBEdit;
    wdblkpcmbMun: TwwDBLookupCombo;
    wdblkpcmbBrgy: TwwDBLookupCombo;
    lblRN: TLabel;
    lblGT: TLabel;
    lblQty: TLabel;
    lblDate: TLabel;
    lblMun: TLabel;
    lblBrgy: TLabel;
    lblCol1: TLabel;
    lblCol2: TLabel;
    lblCol3: TLabel;
    lblCol4: TLabel;
    lblCol5: TLabel;
    lblCol6: TLabel;
    pnlRN: TPanel;
    chkEmergency: TwwCheckBox;
    mmoEReason: TMemo;
    pnlPSign: TPanel;
    wdblkpcmbPPosition: TwwDBLookupCombo;
    wdblkpcmbPSignatory: TwwDBLookupCombo;
    pnlCSign: TPanel;
    wdblkpcmbCPosition: TwwDBLookupCombo;
    wdblkpcmbCSignatory: TwwDBLookupCombo;
    pnlASign: TPanel;
    wdblkpcmbAPosition: TwwDBLookupCombo;
    wdblkpcmbASignatory: TwwDBLookupCombo;
    lblDesignation1: TLabel;
    lblDesignation2: TLabel;
    lblDesignation3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure wdblkpcmbGoodsTypeExit(Sender: TObject);
    procedure edtQuantityKeyPress(Sender: TObject; var Key: Char);
    procedure wdblkpcmbGoodsTypeCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure edtQuantityExit(Sender: TObject);
    procedure wdbgrdDetailRowChanged(Sender: TObject);
    procedure wdblkpcmbMunChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure chkEmergencyClick(Sender: TObject);
    procedure wdblkpcmbGoodsTypeKeyPress(Sender: TObject; var Key: Char);
    procedure wdblkpcmbMunKeyPress(Sender: TObject; var Key: Char);
    procedure wdblkpcmbBrgyKeyPress(Sender: TObject; var Key: Char);
    procedure wdblkpcmbPSignKeyPress(Sender: TObject; var Key: Char);
    procedure wdblkpcmbCSignKeyPress(Sender: TObject; var Key: Char);
    procedure wdblkpcmbASignKeyPress(Sender: TObject; var Key: Char);
    procedure btnCANCELClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOKClick(Sender: TObject);
    procedure wdblkpcmbPPositionChange(Sender: TObject);
    procedure wdblkpcmbPSignatoryChange(Sender: TObject);
    procedure wdblkpcmbCPositionChange(Sender: TObject);
    procedure wdblkpcmbCSignatoryChange(Sender: TObject);
    procedure wdblkpcmbAPositionChange(Sender: TObject);
    procedure wdblkpcmbASignatoryChange(Sender: TObject);
    procedure wdblkpcmbPSignatoryClick(Sender: TObject);
    procedure wdblkpcmbPSignatoryBeforeDropDown(Sender: TObject);
    procedure wdblkpcmbCSignatoryBeforeDropDown(Sender: TObject);
    procedure wdblkpcmbCSignatoryClick(Sender: TObject);
    procedure wdblkpcmbASignatoryBeforeDropDown(Sender: TObject);
    procedure wdblkpcmbASignatoryClick(Sender: TObject);
  private
    IsButtonClick: Boolean;
    GoodsTypeID,PSignID,CSignID,ASignID: Integer;
    { Private declarations }
    function ValidateEntry(): Boolean;

    procedure CleanTempTable();
    procedure PostItems();
    procedure StoreRecords();
  public
    { Public declarations }
  end;

var
  frmSAI: TfrmSAI;
  CurSAIID: string;

implementation

uses modVarType, modPublicVar, modFunctions, dtmData;

{$R *.dfm}

procedure TfrmSAI.btnCANCELClick(Sender: TObject);
begin
  inherited;
  IsButtonClick := True;
  Close;
end;

procedure TfrmSAI.btnOKClick(Sender: TObject);
begin
  inherited;
  if ValidateEntry then
    begin
      IsButtonClick := False;
      if Dialogs.MessageDlg('Save SAI Entry?'  + #13#10 + '[Yes] Modification for this SAI is not allowed!',mtInformation , [mbYes, mbNo], 0, mbNo) = mrYes then
        begin
          IsButtonClick := True;
          StoreRecords;
          CurSAIID := edtsai_id.Text;
          Close;
        end
    end;
end;

procedure TfrmSAI.chkEmergencyClick(Sender: TObject);
begin
  inherited;
  mmoEReason.Enabled := False;
  if chkEmergency.Checked then
    begin
      mmoEReason.Enabled := True;
      mmoEReason.SetFocus;
    end;
end;

procedure TfrmSAI.CleanTempTable;
begin
  with frmData do
    begin
      tblTempSAIDet.EmptyTable;
      tblTempSAIDet.Refresh;
      qryListofSAIDet.Refresh;
    end;
end;

procedure TfrmSAI.edtQuantityExit(Sender: TObject);
begin
  inherited;
  PostItems;
end;

procedure TfrmSAI.edtQuantityKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key <> #8 then
    begin
      if not IsNumeric(Key) then
        begin
          Beep;
          Key := #0;
        end;
    end;
end;

procedure TfrmSAI.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if not IsButtonClick then
    begin
        case Application.MessageBox(PChar('Do you want to save changes?'), PChar(Application.Title), mb_YESNOCANCEL + mb_DefButton1 + mb_IconWarning) of
          IDYES:
            begin
              btnOKClick(Sender);
              Action := caFree;
            end;
          IDNO:
            begin
              btnCANCELClick(Sender);
              Action := caFree;
            end;
          IDCANCEL:
            begin
              Action := caNone;
            end;
        end;
    end;
  if (Action = caFree) or IsButtonClick then
    begin
      CleanTempTable;
    end;
end;

procedure TfrmSAI.FormCreate(Sender: TObject);
begin
  inherited;
  with frmData do
    begin
      if not qryAGT.Active then qryAGT.Active := True;
      qryAGT.Refresh;
      if not tblMunicipality.Active then tblMunicipality.Active := True;
      tblMunicipality.Refresh;
      if not tblBarangay.Active then tblBarangay.Active := True;
      tblBarangay.Refresh;
      if not qryListOfPosition.Active then qryListOfPosition.Active := True;
      qryListOfPosition.Refresh;
      if not qryListofSAIDet.Active then qryListofSAIDet.Active := True;
      qryListofSAIDet.Refresh;
      if not tblTempSAIDet.Active then tblTempSAIDet.Active := True;
    end;
end;

procedure TfrmSAI.FormShow(Sender: TObject);
begin
  inherited;
  edtsai_id.Text := SetNewID('sai','sai_id','S-'+FormatDateTime('yyyy',Now)+'-',5);
  GoodsTypeID := 0;
  IsButtonClick := False;
  wdbdtmpckrsai_date.DateTime := Now;
  wdblkpcmbGoodsType.Text := '';
  edtQuantity.Text := '0';
  wdblkpcmbMun.Text := '';
  wdblkpcmbBrgy.Text := '';
  chkEmergency.Checked := False;
  mmoEReason.Lines.Text := '';
  wdblkpcmbPPosition.Text := 'Prepared By';
  wdblkpcmbPSignatory.Text := '';
  wdblkpcmbCPosition.Text := 'Checked By';
  wdblkpcmbCSignatory.Text := '';
  wdblkpcmbAPosition.Text := 'Approved By';
  wdblkpcmbASignatory.Text := '';
  wdblkpcmbGoodsType.SetFocus;
  PSignID := 0;
  CSignID := 0;
  ASignID := 0;
end;

procedure TfrmSAI.PostItems;
var
  outofstockmsg,sqlqry,unitw_desc,unitr_desc: string;
  unitw_request,unitr_request,qtyrequest: Integer;
  unitw_onhand,unitr_onhand,qtyonhand:Integer;
begin
  sqlqry := '';
  if (wdblkpcmbGoodsType.Text <> '') and ((edtQuantity.Text <> '') and (StrToInt(edtQuantity.Text) > 0)) then
    begin
      with frmData do
        begin
          tblTempSAIDet.EmptyTable;
          tblTempSAIDet.Refresh;

          qryListofIG.Active := False;
          qryListofIG.Params[0].AsInteger := GoodsTypeID;
          qryListofIG.Active := True;

          qryListofIG.First;
          while not qryListofIG.Eof do
            begin
              outofstockmsg := '';
              unitw_request := 0;
              unitr_request := 0;
              qtyrequest := 0;
              unitw_onhand := 0;
              unitr_onhand := 0;
              qtyonhand := 0;
              unitw_desc := '';
              unitr_desc := '';
              qtyrequest := StrToInt(edtQuantity.Text) * qryListofIGitemsbygoods_qty.AsInteger;
              unitw_request := qtyrequest div GetQuantityPerUnit(qryListofIGunit_description.AsString);
              unitr_request := qtyrequest mod GetQuantityPerUnit(qryListofIGunit_description.AsString);

              sqlqry := '';
              sqlqry := sqlqry + 'SELECT qty_onhand FROM ibalance WHERE item_id = "' + qryListofIGitem_id.AsString + '"';

              with qryPost do
                begin
                  Close;
                  SQL.Clear;
                  SQL.Text := sqlqry;
                  Open;

                  if RecordCount > 0 then
                    begin
                      qtyonhand := FieldByName('qty_onhand').AsInteger;
                    end;
                end;

              if qtyonhand < qtyrequest then
                begin
                  unitw_onhand := qtyonhand div GetQuantityPerUnit(qryListofIGunit_description.AsString);
                  unitr_onhand := qtyonhand mod GetQuantityPerUnit(qryListofIGunit_description.AsString);
                  unitw_desc := GetUnitAsWhole(qryListofIGunit_description.AsString);
                  unitr_desc := GetUnitAsRemain(qryListofIGunit_description.AsString);

                  outofstockmsg := '';
                  outofstockmsg := outofstockmsg + 'Item with ID : "';
                  outofstockmsg := outofstockmsg + qryListofIGitem_id.AsString;
                  outofstockmsg := outofstockmsg + '" no enough stock to accommodate the request!';
                  outofstockmsg := outofstockmsg + #13#10;
                  outofstockmsg := outofstockmsg + 'Total Quantity On Hand : ';
                  outofstockmsg := outofstockmsg + IntToStr(unitw_onhand);
                  outofstockmsg := outofstockmsg + unitw_desc;
                  if unitr_onhand > 0 then
                    begin
                      outofstockmsg := outofstockmsg + ' and ';
                      outofstockmsg := outofstockmsg + IntToStr(unitr_onhand);
                      outofstockmsg := outofstockmsg + unitr_desc;
                    end;
                  outofstockmsg := outofstockmsg + '.';
                  outofstockmsg := outofstockmsg + #13#10;
                  outofstockmsg := outofstockmsg + 'Quantity Request : ';
                  outofstockmsg := outofstockmsg + IntToStr(unitw_request);
                  outofstockmsg := outofstockmsg + unitw_desc;
                  if unitr_request > 0 then
                    begin
                      outofstockmsg := outofstockmsg + ' and ';
                      outofstockmsg := outofstockmsg + IntToStr(unitr_request);
                      outofstockmsg := outofstockmsg + unitr_desc;
                    end;
                  outofstockmsg := outofstockmsg + '.';
                  ShowMessage(outofstockmsg);
                end
              else
                begin
                  sqlqry := '';
                  sqlqry := sqlqry + 'INSERT INTO `temp_sai_det` (sai_id, goodstype_id, item_id, unit_w, unit_r, total_quantity) ';
                  sqlqry := sqlqry + 'VALUES ("' + edtsai_id.Text + '",';
                  sqlqry := sqlqry + qryListofIGgoodstype_id.AsString;
                  sqlqry := sqlqry + ',"' + qryListofIGitem_id.AsString + '",';
                  sqlqry := sqlqry + IntToStr(unitw_request);
                  sqlqry := sqlqry + ',' + IntToStr(unitr_request);
                  sqlqry := sqlqry + ',' + IntToStr(qtyrequest) + ')';

                  with qryPost do
                    begin
                      Close;
                      SQL.Clear;
                      SQL.Text := sqlqry;
                      Execute;
                    end;
                end;
              qryListofIG.Next;
            end;
          qryListofSAIDet.Refresh;
        end;
    end;
end;

procedure TfrmSAI.StoreRecords;
var
  I: Integer;
  sqlqry: string;
begin
  sqlqry := '';
  with frmData do
    begin
      sqlqry := '';
      sqlqry := sqlqry + 'INSERT INTO sai (sai_id, sai_status, sai_datetime, goodstype_id, sai_qty, m_code, bcode, sai_cancelled, is_emergency, emergency_reason, p_signatory_id, c_signatory_id, a_signatory_id, UserID, TransDate) VALUES';
      sqlqry := sqlqry + '("';
      sqlqry := sqlqry + edtsai_id.Text;
      sqlqry := sqlqry + '",0,"';
      sqlqry := sqlqry + FormatDateTime('yyyy-mm-dd hh:nn:ss',wdbdtmpckrsai_date.DateTime);
      sqlqry := sqlqry + '",';
      sqlqry := sqlqry + qryAGTgoodstype_id.AsString;
      sqlqry := sqlqry + ',';
      sqlqry := sqlqry + edtQuantity.Text;
      sqlqry := sqlqry + ',"';
      sqlqry := sqlqry + tblMunicipalityM_Code.AsString;
      sqlqry := sqlqry + '","';
      if wdblkpcmbBrgy.Text <> '' then
        begin
          sqlqry := sqlqry + tblBarangayBCode.AsString;
        end;
      sqlqry := sqlqry + '",0';
      sqlqry := sqlqry + ',';
      sqlqry := sqlqry + IntToStr(Abs(StrToInt(BoolToStr(chkEmergency.Checked))));
      sqlqry := sqlqry + ',"';
      sqlqry := sqlqry + mmoEReason.Lines.Text;
      sqlqry := sqlqry + '",';
      sqlqry := sqlqry + IntToStr(PSignID);
      sqlqry := sqlqry + ',';
      sqlqry := sqlqry + IntToStr(CSignID);
      sqlqry := sqlqry + ',';
      sqlqry := sqlqry + IntToStr(ASignID);
      sqlqry := sqlqry + ',';
      sqlqry := sqlqry + IntToStr(CurrUser.USER_ID);
      sqlqry := sqlqry + ',"';
      sqlqry := sqlqry + FormatDateTime('yyyy-mm-dd hh:nn:ss',Now);
      sqlqry := sqlqry + '")';
      with qryPost do
        begin
          Close;
          SQL.Clear;
          SQL.Text := sqlqry;
          Execute;
        end;

      sqlqry := '';
      sqlqry := sqlqry + 'INSERT INTO sai_det SELECT * FROM temp_sai_det';
      with qryPost do
        begin
          Close;
          SQL.Clear;
          SQL.Text := sqlqry;
          Execute;
        end;

      sqlqry := '';
      sqlqry := sqlqry + 'INSERT INTO ihist (trans_type, reference_id, trans_date) VALUES';
      sqlqry := sqlqry + '(';
      sqlqry := sqlqry + '"S"';
      sqlqry := sqlqry + ',"';
      sqlqry := sqlqry + edtsai_id.Text;
      sqlqry := sqlqry + '","';
      sqlqry := sqlqry + FormatDateTime('yyyy-mm-dd hh:nn:ss',wdbdtmpckrsai_date.DateTime);
      sqlqry := sqlqry + '")';
      with qryPost do
        begin
          Close;
          SQL.Clear;
          SQL.Text := sqlqry;
          Execute;
        end;
    end;
end;

function TfrmSAI.ValidateEntry: Boolean;
var
  emergency: Boolean;
begin
  emergency := False;
  Result := False;
  if wdbdtmpckrsai_date.DateTime > Now then
    begin
      wdbdtmpckrsai_date.SetFocus;
      raise(Exception.Create('Field "Date" must not be greater than today'+Chr(9)+'s date.'));
    end
  else if wdblkpcmbGoodsType.Text = '' then
    begin
      wdblkpcmbGoodsType.SetFocus;
      raise(Exception.Create('Field "Type of Goods" must have a value.'));
    end
  else if edtQuantity.Text = '' then
    begin
      edtQuantity.SetFocus;
      raise(Exception.Create('Field "Quantity" must have a value.'));
    end
  else if StrToInt(edtQuantity.Text) < 1 then
    begin
      edtQuantity.SetFocus;
      raise(Exception.Create('Field "Quantity" must have a value greater than zero.'));
    end
  else if wdblkpcmbMun.Text = '' then
    begin
      wdblkpcmbMun.SetFocus;
      raise(Exception.Create('Field "Municipality" must have a value.'));
    end
  else if chkEmergency.Checked then
    begin
      if mmoEReason.Lines.Text = '' then
        begin
          emergency := True;
          mmoEReason.SetFocus;
          raise(Exception.Create('Field "Emergency Reason" must have a value.'));
        end;
    end;
  if not emergency then
    begin
      if wdblkpcmbPPosition.Text = '' then
        begin
          wdblkpcmbPPosition.SetFocus;
          raise(Exception.Create('Field "Closing" must have a value.'));
        end
      else if wdblkpcmbPSignatory.Text = '' then
        begin
          wdblkpcmbPSignatory.SetFocus;
          raise(Exception.Create('Field ' + wdblkpcmbPPosition.Text + ' "Signatory" must have a value.'));
        end
      else if wdblkpcmbCPosition.Text = '' then
        begin
          wdblkpcmbCPosition.SetFocus;
          raise(Exception.Create('Field "Closing" must have a value.'));
        end
      else if wdblkpcmbCSignatory.Text = '' then
        begin
          wdblkpcmbCSignatory.SetFocus;
          raise(Exception.Create('Field ' + wdblkpcmbCPosition.Text + ' "Signatory" must have a value.'));
        end
      else if wdblkpcmbAPosition.Text = '' then
        begin
          wdblkpcmbAPosition.SetFocus;
          raise(Exception.Create('Field "Closing" must have a value.'));
        end
      else if wdblkpcmbASignatory.Text = '' then
        begin
          wdblkpcmbASignatory.SetFocus;
          raise(Exception.Create('Field ' + wdblkpcmbAPosition.Text + ' "Signatory" must have a value.'));
        end
      else
        begin
          Result := True;
        end;
    end;
end;

procedure TfrmSAI.wdbgrdDetailRowChanged(Sender: TObject);
begin
  inherited;
  DisplayRecordCount(frmData.qryListofSAIDet,pnlRecordCtr);
end;

procedure TfrmSAI.wdblkpcmbAPositionChange(Sender: TObject);
begin
  inherited;
  ListSignatory(wdblkpcmbAPosition,wdblkpcmbASignatory);
end;

procedure TfrmSAI.wdblkpcmbASignatoryBeforeDropDown(Sender: TObject);
begin
  inherited;
  ListSignatory(wdblkpcmbAPosition,wdblkpcmbASignatory);
end;

procedure TfrmSAI.wdblkpcmbASignatoryChange(Sender: TObject);
begin
  inherited;
  ASignID := SignatoryID(wdblkpcmbASignatory);
  lblDesignation3.Caption := '';
  if wdblkpcmbASignatory.Text <> '' then
    begin
      lblDesignation3.Caption := frmData.qryListOfSignatorydesignation_name.AsString;
    end;
end;

procedure TfrmSAI.wdblkpcmbASignatoryClick(Sender: TObject);
begin
  inherited;
  ListSignatory(wdblkpcmbAPosition,wdblkpcmbASignatory);
end;

procedure TfrmSAI.wdblkpcmbASignKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key <> #8 then
    begin
      if not IsName(Key) then
        begin
          Beep;
          Key := #0;
        end;
    end;
end;

procedure TfrmSAI.wdblkpcmbBrgyKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key <> #8 then
    begin
      if not IsLetter(Key) then
        begin
          Beep;
          Key := #0;
        end;
    end;
end;

procedure TfrmSAI.wdblkpcmbCPositionChange(Sender: TObject);
begin
  inherited;
  ListSignatory(wdblkpcmbCPosition,wdblkpcmbCSignatory);
end;

procedure TfrmSAI.wdblkpcmbCSignatoryBeforeDropDown(Sender: TObject);
begin
  inherited;
  ListSignatory(wdblkpcmbCPosition,wdblkpcmbCSignatory);
end;

procedure TfrmSAI.wdblkpcmbCSignatoryChange(Sender: TObject);
begin
  inherited;
  CSignID := SignatoryID(wdblkpcmbCSignatory);
  lblDesignation2.Caption := '';
  if wdblkpcmbCSignatory.Text <> '' then
    begin
      lblDesignation2.Caption := frmData.qryListOfSignatorydesignation_name.AsString;
    end;
end;

procedure TfrmSAI.wdblkpcmbCSignatoryClick(Sender: TObject);
begin
  inherited;
  ListSignatory(wdblkpcmbCPosition,wdblkpcmbCSignatory);
end;

procedure TfrmSAI.wdblkpcmbCSignKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key <> #8 then
    begin
      if not IsName(Key) then
        begin
          Beep;
          Key := #0;
        end;
    end;
end;

procedure TfrmSAI.wdblkpcmbGoodsTypeCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  GoodsTypeID := frmData.qryAGTgoodstype_id.AsInteger;
  PostItems;
end;

procedure TfrmSAI.wdblkpcmbGoodsTypeExit(Sender: TObject);
begin
  inherited;
  PostItems;
end;

procedure TfrmSAI.wdblkpcmbGoodsTypeKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key <> #8 then
    begin
      if not IsLetter(Key) then
        begin
          Beep;
          Key := #0;
        end;
    end;
end;

procedure TfrmSAI.wdblkpcmbMunChange(Sender: TObject);
begin
  inherited;
  wdblkpcmbBrgy.Text := '';
  wdblkpcmbBrgy.Enabled := False;
  if wdblkpcmbMun.Text <> '' then
    begin
      wdblkpcmbBrgy.Enabled := True;
    end;
end;

procedure TfrmSAI.wdblkpcmbMunKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key <> #8 then
    begin
      if not IsLetter(Key) then
        begin
          Beep;
          Key := #0;
        end;
    end;
end;

procedure TfrmSAI.wdblkpcmbPPositionChange(Sender: TObject);
begin
  inherited;
  ListSignatory(wdblkpcmbPPosition,wdblkpcmbPSignatory);
end;

procedure TfrmSAI.wdblkpcmbPSignatoryBeforeDropDown(Sender: TObject);
begin
  inherited;
  ListSignatory(wdblkpcmbPPosition,wdblkpcmbPSignatory);
end;

procedure TfrmSAI.wdblkpcmbPSignatoryChange(Sender: TObject);
begin
  inherited;
  PSignID := SignatoryID(wdblkpcmbPSignatory);
  lblDesignation1.Caption := '';
  if wdblkpcmbPSignatory.Text <> '' then
    begin
      lblDesignation1.Caption := frmData.qryListOfSignatorydesignation_name.AsString;
    end;
end;

procedure TfrmSAI.wdblkpcmbPSignatoryClick(Sender: TObject);
begin
  inherited;
  ListSignatory(wdblkpcmbPPosition,wdblkpcmbPSignatory);
end;

procedure TfrmSAI.wdblkpcmbPSignKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key <> #8 then
    begin
      if not IsName(Key) then
        begin
          Beep;
          Key := #0;
        end;
    end;
end;

end.
