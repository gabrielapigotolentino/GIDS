unit uRIS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uTemplate4, StdCtrls, Buttons, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls,
  wwdblook, Mask, wwdbedit, wwdbdatetimepicker, StrUtils, DB, DBAccess,
  MyAccess, MemDS;

type
  TfrmRIS = class(TfrmTemplate4)
    wdblkpcmbSAI_ID: TwwDBLookupCombo;
    pnlSAI1: TPanel;
    edtSAI_Date: TwwDBEdit;
    edtSAI_TG: TwwDBEdit;
    edtSAI_Qty: TwwDBEdit;
    pnlSAI2: TPanel;
    edtSAI_Brgy: TwwDBEdit;
    pnlRIS: TPanel;
    edtris_id: TwwDBEdit;
    wdbdtmpckrRIS_Date: TwwDBDateTimePicker;
    edtSAI_Mun: TwwDBEdit;
    lblGT: TLabel;
    lblCol3: TLabel;
    lblSAI_ID: TLabel;
    lblCol1: TLabel;
    lblSAI_Date: TLabel;
    lblCol2: TLabel;
    lblQty: TLabel;
    lblCol4: TLabel;
    lblRFNo: TLabel;
    lblCol5: TLabel;
    lblDate: TLabel;
    lblCol6: TLabel;
    lblMun: TLabel;
    lblCol7: TLabel;
    lblBrgy: TLabel;
    lblCol8: TLabel;
    qryListOfRISDet: TMyQuery;
    dsqryListOfRISDet: TMyDataSource;
    grpAcceptance: TGroupBox;
    grpIssued: TGroupBox;
    wdblkpcmbarposition: TwwDBLookupCombo;
    wdblkpcmbarsignatory: TwwDBLookupCombo;
    pnlAR: TPanel;
    pnlAE: TPanel;
    wdblkpcmbaeposition: TwwDBLookupCombo;
    wdblkpcmbaesignatory: TwwDBLookupCombo;
    pnlANA: TPanel;
    wdblkpcmbanaposition: TwwDBLookupCombo;
    wdblkpcmbanasignatory: TwwDBLookupCombo;
    pnlIIE: TPanel;
    wdblkpcmbiiePosition: TwwDBLookupCombo;
    wdblkpcmbiieSignatory: TwwDBLookupCombo;
    pnlIICI: TPanel;
    wdblkpcmbiiciPosition: TwwDBLookupCombo;
    wdblkpcmbiiciSignatory: TwwDBLookupCombo;
    pnlIA: TPanel;
    wdblkpcmbiaPosition: TwwDBLookupCombo;
    wdblkpcmbiaSignatory: TwwDBLookupCombo;
    lblEmergency: TLabel;
    mmoEReason: TMemo;
    pnlEReason: TPanel;
    qryTempStorage: TMyQuery;
    qryListOfRISDetsai_id: TStringField;
    qryListOfRISDetgoodstype_id: TIntegerField;
    qryListOfRISDetitem_id: TStringField;
    qryListOfRISDetitem_descriptions: TStringField;
    qryListOfRISDetunit_description: TStringField;
    qryListOfRISDetunit_w: TIntegerField;
    qryListOfRISDetunit_r: TIntegerField;
    qryListOfRISDetsai_qty: TIntegerField;
    qryListOfRISDetris_qty: TIntegerField;
    qryListOfRISDetunit_cost: TFloatField;
    qryListOfRISDetamount: TFloatField;
    qryListOfRISDetunit_whole: TStringField;
    qryListOfRISDetunit_remain: TStringField;
    lblADesignation1: TLabel;
    lblADesignation2: TLabel;
    lblADesignation3: TLabel;
    lblIDesignation1: TLabel;
    lblIDesignation2: TLabel;
    lblIDesignation3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure wdbgrdDetailRowChanged(Sender: TObject);
    procedure wdblkpcmbarpositionChange(Sender: TObject);
    procedure wdblkpcmbarsignatoryChange(Sender: TObject);
    procedure wdblkpcmbaepositionChange(Sender: TObject);
    procedure wdblkpcmbaesignatoryChange(Sender: TObject);
    procedure wdblkpcmbanapositionChange(Sender: TObject);
    procedure wdblkpcmbanasignatoryChange(Sender: TObject);
    procedure wdblkpcmbiiePositionChange(Sender: TObject);
    procedure wdblkpcmbiieSignatoryChange(Sender: TObject);
    procedure wdblkpcmbiiciPositionChange(Sender: TObject);
    procedure wdblkpcmbiiciSignatoryChange(Sender: TObject);
    procedure wdblkpcmbiaPositionChange(Sender: TObject);
    procedure wdblkpcmbiaSignatoryChange(Sender: TObject);
    procedure wdblkpcmbSAI_IDCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure wdblkpcmbSAI_IDExit(Sender: TObject);
    procedure btnCANCELClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure qryListOfRISDetunit_costChange(Sender: TField);
    procedure wdbgrdDetailColExit(Sender: TObject);
    procedure wdbgrdDetailExit(Sender: TObject);
    procedure wdblkpcmbarsignatoryBeforeDropDown(Sender: TObject);
    procedure wdblkpcmbarsignatoryClick(Sender: TObject);
    procedure wdblkpcmbaesignatoryBeforeDropDown(Sender: TObject);
    procedure wdblkpcmbaesignatoryClick(Sender: TObject);
    procedure wdblkpcmbanasignatoryBeforeDropDown(Sender: TObject);
    procedure wdblkpcmbanasignatoryClick(Sender: TObject);
    procedure wdblkpcmbiieSignatoryBeforeDropDown(Sender: TObject);
    procedure wdblkpcmbiieSignatoryClick(Sender: TObject);
    procedure wdblkpcmbiiciSignatoryBeforeDropDown(Sender: TObject);
    procedure wdblkpcmbiiciSignatoryClick(Sender: TObject);
    procedure wdblkpcmbiaSignatoryBeforeDropDown(Sender: TObject);
    procedure wdblkpcmbiaSignatoryClick(Sender: TObject);
    procedure qryListOfRISDetCalcFields(DataSet: TDataSet);
  private
    ARSignID,AESignID,ANASignID,IIESignID,IICISignID,IASignID: Integer;
    CurSAI_ID: string;
    IsButtonClick: Boolean;
    { Private declarations }
    function CheckRISDet(): Boolean;
    function ValidateEntry(): Boolean;

    procedure ComputeRISDet();
    procedure DisplaySAIInfo();
    procedure ListRISDet();
    procedure StoreRecords();
    procedure UpdateUnitCostAmout();
  public
    { Public declarations }
  end;

var
  frmRIS: TfrmRIS;
  CurRISID: string;

implementation


uses modVarType, modPublicVar, modFunctions, dtmData;

{$R *.dfm}

procedure TfrmRIS.btnCANCELClick(Sender: TObject);
begin
  inherited;
  IsButtonClick := True;
  Close;
end;

procedure TfrmRIS.btnOKClick(Sender: TObject);
begin
  inherited;
  if ValidateEntry then
    begin
      if Dialogs.MessageDlg('Save RIS Entry?'  + #13#10 + '[Yes] Modification for this SAI is not allowed!',mtInformation , [mbYes, mbNo], 0, mbNo) = mrYes then
        begin
          IsButtonClick := True;
          StoreRecords;
          CurRISID := edtris_id.Text;
          Close;
        end;
    end;
end;

function TfrmRIS.CheckRISDet: Boolean;
var
  I: Integer;
begin
  Result := True;
  with frmData do
    begin
      tblTempRISDet.Refresh;
      tblTempRISDet.First;
      for I := 1 to tblTempRISDet.RecordCount do
        begin
          if tblTempRISDetamount.AsFloat <= 0 then
            begin
              Result := False;
              Break;
            end;
          tblTempRISDet.Next;
        end;
    end;
end;

procedure TfrmRIS.ComputeRISDet;
begin
  if qryListOfRISDet.State = dsEdit then
    begin
      if (qryListOfRISDetunit_cost.AsFloat > 0) then
        begin
          qryListOfRISDetamount.Value := qryListOfRISDetris_qty.AsInteger * qryListOfRISDetunit_cost.AsFloat;
          UpdateUnitCostAmout;
        end;
    end;
end;

procedure TfrmRIS.DisplaySAIInfo;
begin
  if wdblkpcmbSAI_ID.Text <> '' then
    begin
      with frmData do
        begin
          if qryASAIs.Locate('sai_id',wdblkpcmbSAI_ID.Text,[loPartialKey,loCaseInsensitive]) then
            begin
              edtSAI_Date.Text := qryASAIssai_datetime.AsString;
              edtSAI_TG.Text := qryASAIsgoodstype_description.AsString;
              edtSAI_Qty.Text := qryASAIssai_qty.AsString;
              edtSAI_Mun.Text := qryASAIsDescription.AsString;
              edtSAI_Brgy.Text := qryASAIssai_brgy.AsString;
              CurSAI_ID := Trim(wdblkpcmbSAI_ID.Value);
              ListRISDet;
            end
          else
            begin
              raise(Exception.Create('Field "SAI ID" does not exist!'));
            end;
        end;
    end;
end;

procedure TfrmRIS.FormClose(Sender: TObject; var Action: TCloseAction);
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
        with frmData.tblTempRISDet do
          begin
            EmptyTable;
            Refresh;
          end;
        Action := caFree;
    end;
end;

procedure TfrmRIS.FormCreate(Sender: TObject);
begin
  inherited;
  with frmData do
    begin
      if not qryASAIs.Active then qryASAIs.Active := True;
      qryASAIs.Refresh;
      if not tblTempRISDet.Active then tblTempRISDet.Active := True;
      tblTempRISDet.Refresh;
      if not qryListOfPosition.Active then qryListOfPosition.Active := True;
      qryListOfPosition.Refresh;
    end;
end;

procedure TfrmRIS.FormShow(Sender: TObject);
begin
  inherited;
  setGridOption(wdbgrdDetail,0);
  edtris_id.Text := SetNewID('ris','ris_id','I-'+FormatDateTime('yyyy',Now)+'-',5);
  wdbdtmpckrRIS_Date.DateTime := Now;
  CurSAI_ID := '';
  ListRISDet;
  IsButtonClick := False;
  wdblkpcmbSAI_ID.Text := '';
  edtSAI_Date.Text := '';
  edtSAI_TG.Text := '';
  edtSAI_Qty.Text := '';
  edtSAI_Mun.Text := '';
  edtSAI_Brgy.Text := '';
  wdblkpcmbarposition.Text := 'Received By';
  wdblkpcmbarsignatory.Text := '';
  wdblkpcmbaeposition.Text := 'Encoded By';
  wdblkpcmbaesignatory.Text := '';
  wdblkpcmbanaposition.Text := 'Noted/Accepted By';
  wdblkpcmbanasignatory.Text := '';
  wdblkpcmbiiePosition.Text := 'Items Encoded By';
  wdblkpcmbiieSignatory.Text := '';
  wdblkpcmbiiciPosition.Text := 'Items Checked/Issued By';
  wdblkpcmbiiciSignatory.Text := '';
  wdblkpcmbiaPosition.Text := 'Approved By';
  wdblkpcmbiaSignatory.Text := '';
  ARSignID := 0;
  AESignID := 0;
  ANASignID := 0;
  IIESignID := 0;
  IICISignID := 0;
  IASignID := 0;
end;

procedure TfrmRIS.ListRISDet;
var
  sqlqry,outofstockmsg,unitw_desc: string;
  unitw_onhand,unitr_onhand,qtyonhand:Integer;
begin
  sqlqry := '';
  mmoEReason.Lines.Text := '';
  setGridOption(wdbgrdDetail,0);
  with frmData do
    begin
      if not tblTempRISDet.Active then tblTempRISDet.Active := True;
      tblTempRISDet.EmptyTable;
      tblTempRISDet.Refresh;
    end;

  qryListOfRISDet.Active := False;
  qryListOfRISDet.Params[0].AsString := CurSAI_ID;
  qryListOfRISDet.Active := True;

  if qryListOfRISDet.RecordCount > 0 then
    begin
      qryListOfRISDet.First;
      while not qryListOfRISDet.Eof do
        begin
          outofstockmsg := '';
          unitw_desc := '';
          unitw_onhand := 0;
          unitr_onhand := 0;
          qtyonhand := 0;
          sqlqry := '';
          sqlqry := sqlqry + 'SELECT qty_onhand FROM ibalance WHERE item_id = "' + qryListOfRISDetitem_id.AsString + '"';

          with qryTempStorage do
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

          if qtyonhand < qryListOfRISDetsai_qty.AsInteger then
            begin
              unitw_onhand := qtyonhand div GetQuantityPerUnit(qryListOfRISDetunit_description.AsString);
              unitr_onhand := qtyonhand mod GetQuantityPerUnit(qryListOfRISDetunit_description.AsString);
              unitw_desc := RightStr(qryListOfRISDetunit_description.AsString,(Length(qryListOfRISDetunit_description.AsString)-(Length(IntToStr(unitw_onhand))+2)));
              outofstockmsg := '';
              outofstockmsg := outofstockmsg + 'Item with ID : "';
              outofstockmsg := outofstockmsg + qryListOfRISDetitem_id.AsString;
              outofstockmsg := outofstockmsg + '" no enough stock to accommodate the request!';
              outofstockmsg := outofstockmsg + #13#10;
              outofstockmsg := outofstockmsg + 'Total Quantity On Hand : ';
              outofstockmsg := outofstockmsg + IntToStr(unitw_onhand);
              outofstockmsg := outofstockmsg + unitw_desc;
              if unitr_onhand > 0 then
                begin
                  outofstockmsg := outofstockmsg + ' and ';
                  outofstockmsg := outofstockmsg + IntToStr(unitr_onhand);
                  outofstockmsg := outofstockmsg + ' kg/pc';
                end;
              outofstockmsg := outofstockmsg + '.';
              outofstockmsg := outofstockmsg + #13#10;
              outofstockmsg := outofstockmsg + 'Quantity Request : ';
              outofstockmsg := outofstockmsg + qryListOfRISDetunit_w.AsString;
              outofstockmsg := outofstockmsg + unitw_desc;
              if qryListOfRISDetunit_r.AsInteger > 0 then
                begin
                  outofstockmsg := outofstockmsg + ' and ';
                  outofstockmsg := outofstockmsg + qryListOfRISDetunit_r.AsString;
                  outofstockmsg := outofstockmsg + ' kg/pc';
                end;
              outofstockmsg := outofstockmsg + '.';
              raise(Exception.Create(outofstockmsg));
            end
          else
            begin
              sqlqry := '';
              sqlqry := sqlqry + 'INSERT INTO temp_ris_det (ris_id, goodstype_id, item_id, total_quantity) VALUES';
              sqlqry := sqlqry + '("';
              sqlqry := sqlqry + Trim(edtris_id.Text);
              sqlqry := sqlqry + '",';
              sqlqry := sqlqry + qryListOfRISDetgoodstype_id.AsString;
              sqlqry := sqlqry + ',"';
              sqlqry := sqlqry + qryListOfRISDetitem_id.AsString;
              sqlqry := sqlqry + '",';
              sqlqry := sqlqry + qryListOfRISDetsai_qty.AsString;
              sqlqry := sqlqry + ')';
              with qryTempStorage do
                begin
                  Close;
                  SQL.Clear;
                  SQL.Text := sqlqry;
                  Execute;
                end;
            end;
          qryListOfRISDet.Next;
        end;
      frmData.tblTempRISDet.Refresh;
      qryListOfRISDet.Refresh;
      setGridOption(wdbgrdDetail,1);
      with frmData do
        begin
          if not tblSAI.Active then tblSAI.Active := True;
          tblSAI.Refresh;
          if tblSAI.Locate('sai_id',CurSAI_ID,[loPartialKey,loCaseInsensitive]) then
            begin
              mmoEReason.Lines.Text := tblSAIemergency_reason.AsString;
            end;
        end;
    end;
end;

procedure TfrmRIS.qryListOfRISDetCalcFields(DataSet: TDataSet);
var
  unit_whole,unit_remain: string;
begin
  inherited;
  unit_whole := '';
  unit_remain := '';

  unit_whole := IntToStr(qryListOfRISDetsai_qty.AsInteger div GetQuantityPerUnit(qryListOfRISDetunit_description.AsString));
  unit_whole := unit_whole + GetUnitAsWhole(qryListOfRISDetunit_description.AsString);

  unit_remain := IntToStr(qryListOfRISDetsai_qty.AsInteger mod GetQuantityPerUnit(qryListOfRISDetunit_description.AsString));
  unit_remain := unit_remain + GetUnitAsRemain(qryListOfRISDetunit_description.AsString);

  qryListOfRISDetunit_whole.Value := unit_whole;
  qryListOfRISDetunit_remain.Value := unit_remain;
end;

procedure TfrmRIS.qryListOfRISDetunit_costChange(Sender: TField);
begin
  inherited;
  ComputeRISDet;
end;

procedure TfrmRIS.StoreRecords;
var
  I,new_qtyonhand,cur_qtyonhand: Integer;
  sqlqry: string;
begin
  new_qtyonhand := 0;
  sqlqry := '';
  sqlqry := sqlqry + 'INSERT INTO ris (ris_id, ris_date, sai_id, sai_date, goodstype_id, ris_qty, ris_returned, r_signatory_id, e_signatory_id, na_signatory_id, ie_signatory_id, ici_signatory_id, a_signatory_id, UserID, TransDate) VALUES';
  sqlqry := sqlqry + '("';
  sqlqry := sqlqry + edtris_id.Text;
  sqlqry := sqlqry + '","';
  sqlqry := sqlqry + FormatDateTime('yyyy-mm-dd hh:nn:ss',wdbdtmpckrRIS_Date.DateTime);
  sqlqry := sqlqry + '","';
  sqlqry := sqlqry + Trim(wdblkpcmbSAI_ID.Text);
  sqlqry := sqlqry + '","';
  sqlqry := sqlqry + FormatDateTime('yyyy-mm-dd hh:nn:ss',StrToDateTime(edtSAI_Date.Text));
  sqlqry := sqlqry + '",';
  sqlqry := sqlqry + qryListOfRISDetgoodstype_id.AsString;
  sqlqry := sqlqry + ',';
  sqlqry := sqlqry + Trim(edtSAI_Qty.Text);
  sqlqry := sqlqry + ',0,';
  sqlqry := sqlqry + IntToStr(ARSignID);
  sqlqry := sqlqry + ',';
  sqlqry := sqlqry + IntToStr(AESignID);
  sqlqry := sqlqry + ',';
  sqlqry := sqlqry + IntToStr(ANASignID);
  sqlqry := sqlqry + ',';
  sqlqry := sqlqry + IntToStr(IIESignID);
  sqlqry := sqlqry + ',';
  sqlqry := sqlqry + IntToStr(IICISignID);
  sqlqry := sqlqry + ',';
  sqlqry := sqlqry + IntToStr(IASignID);
  sqlqry := sqlqry + ',';
  sqlqry := sqlqry + IntToStr(CurrUser.USER_ID);
  sqlqry := sqlqry + ',"';
  sqlqry := sqlqry + FormatDateTime('yyyy-mm-dd hh:nn:ss',Now);
  sqlqry := sqlqry + '")';
  with qryTempStorage do
    begin
      Close;
      SQL.Clear;
      SQL.Text := sqlqry;
      Execute;
    end;

  sqlqry := '';
  sqlqry := sqlqry + 'INSERT INTO ris_det SELECT * FROM temp_ris_det';
  with qryTempStorage do
    begin
      Close;
      SQL.Clear;
      SQL.Text := sqlqry;
      Execute;
    end;

  sqlqry := '';
  sqlqry := sqlqry + 'INSERT INTO ihist (trans_type, reference_id, trans_date) VALUES';
  sqlqry := sqlqry + '("I","';
  sqlqry := sqlqry + Trim(edtris_id.Text);
  sqlqry := sqlqry + '","';
  sqlqry := sqlqry + FormatDateTime('yyyy-mm-dd hh:nn:ss',wdbdtmpckrRIS_Date.DateTime);
  sqlqry := sqlqry + '")';
  with qryTempStorage do
    begin
      Close;
      SQL.Clear;
      SQL.Text := sqlqry;
      Execute;
    end;

  frmData.tblTempRISDet.Refresh;
  frmData.tblTempRISDet.First;
  while not frmData.tblTempRISDet.Eof do
    begin
      sqlqry := '';
      sqlqry := sqlqry + 'SELECT qty_onhand FROM ibalance WHERE item_id = "';
      sqlqry := sqlqry + frmData.tblTempRISDetitem_id.AsString;
      sqlqry := sqlqry + '"';
      with qryTempStorage do
        begin
          Close;
          SQL.Clear;
          SQL.Text := sqlqry;
          Open;

          if RecordCount > 0 then
            begin
              cur_qtyonhand := FieldByName('qty_onhand').AsInteger;
            end;
        end;

      new_qtyonhand := cur_qtyonhand - frmData.tblTempRISDettotal_quantity.AsInteger;

      sqlqry := '';
      sqlqry := sqlqry + 'UPDATE ibalance SET qty_onhand = ';
      sqlqry := sqlqry + IntToStr(new_qtyonhand);
      sqlqry := sqlqry + ', UserID = ';
      sqlqry := sqlqry + IntToStr(CurrUser.USER_ID);
      sqlqry := sqlqry + ', TransDate = "';
      sqlqry := sqlqry + FormatDateTime('yyyy-mm-dd hh:nn:ss',Now);
      sqlqry := sqlqry + '" WHERE item_id = "';
      sqlqry := sqlqry + frmData.tblTempRISDetitem_id.AsString;
      sqlqry := sqlqry + '"';
      with qryTempStorage do
        begin
          Close;
          SQL.Clear;
          SQL.Text := sqlqry;
          Execute;
        end;

      frmData.tblTempRISDet.Next;
    end;

  sqlqry := '';
  sqlqry := sqlqry + 'UPDATE sai SET sai_status = 1 WHERE sai_id = "';
  sqlqry := sqlqry + Trim(wdblkpcmbSAI_ID.Text);
  sqlqry := sqlqry + '"';
  with qryTempStorage do
    begin
      Close;
      SQL.Clear;
      SQL.Text := sqlqry;
      Execute;
    end;
end;

procedure TfrmRIS.UpdateUnitCostAmout;
var
  sqlqry: string;
begin
  sqlqry := '';
  sqlqry := sqlqry + 'UPDATE temp_ris_det SET ';
  sqlqry := sqlqry + 'unit_cost = ';
  sqlqry := sqlqry + qryListOfRISDetunit_cost.AsString;
  sqlqry := sqlqry + ', amount = ';
  sqlqry := sqlqry + qryListOfRISDetamount.AsString;
  sqlqry := sqlqry + ' WHERE ris_id = "';
  sqlqry := sqlqry + edtris_id.Text;
  sqlqry := sqlqry + '" AND item_id = "';
  sqlqry := sqlqry + qryListOfRISDetitem_id.AsString;
  sqlqry := sqlqry + '"';
  with qryTempStorage do
    begin
      Close;
      SQL.Clear;
      SQL.Text := sqlqry;
      Execute;
    end;
end;

function TfrmRIS.ValidateEntry: Boolean;
begin
  Result := False;
  if wdblkpcmbSAI_ID.Text = '' then
    begin
      wdblkpcmbSAI_ID.SetFocus;
      raise(Exception.Create('Field "SAI ID" must have a value.'));
    end
  else if wdbdtmpckrRIS_Date.DateTime > Now then
    begin
      wdbdtmpckrRIS_Date.SetFocus;
      raise(Exception.Create('Field "Date" must not be greater than today'+Chr(9)+'s date.'));
    end
  else if not CheckRISDet then
    begin
      wdbgrdDetail.SetFocus;
      raise(Exception.Create('RIS Entry must be complete.'));
    end
  else if wdblkpcmbarposition.Text = '' then
    begin
      wdblkpcmbarposition.SetFocus;
      raise(Exception.Create('Field "Closing" must have a value.'));
    end
  else if wdblkpcmbarsignatory.Text = '' then
    begin
      wdblkpcmbarsignatory.SetFocus;
      raise(Exception.Create('Field ' + wdblkpcmbarposition.Text + ' "Signatory" must have a value.'));
    end
  else if wdblkpcmbaeposition.Text = '' then
    begin
      wdblkpcmbaeposition.SetFocus;
      raise(Exception.Create('Field "Closing" must have a value.'));
    end
  else if wdblkpcmbaesignatory.Text = '' then
    begin
      wdblkpcmbaesignatory.SetFocus;
      raise(Exception.Create('Field ' + wdblkpcmbaeposition.Text + ' "Signatory" must have a value.'));
    end
  else if wdblkpcmbanaposition.Text = '' then
    begin
      wdblkpcmbanaposition.SetFocus;
      raise(Exception.Create('Field "Closing" must have a value.'));
    end
  else if wdblkpcmbanasignatory.Text = '' then
    begin
      wdblkpcmbanasignatory.SetFocus;
      raise(Exception.Create('Field ' + wdblkpcmbanaposition.Text + ' "Signatory" must have a value.'));
    end
  else if wdblkpcmbiiePosition.Text = '' then
    begin
      wdblkpcmbiiePosition.SetFocus;
      raise(Exception.Create('Field "Closing" must have a value.'));
    end
  else if wdblkpcmbiieSignatory.Text = '' then
    begin
      wdblkpcmbiieSignatory.SetFocus;
      raise(Exception.Create('Field ' + wdblkpcmbiiePosition.Text + ' "Signatory" must have a value.'));
    end
  else if wdblkpcmbiiciPosition.Text = '' then
    begin
      wdblkpcmbiiciPosition.SetFocus;
      raise(Exception.Create('Field "Closing" must have a value.'));
    end
  else if wdblkpcmbiiciSignatory.Text = '' then
    begin
      wdblkpcmbiiciSignatory.SetFocus;
      raise(Exception.Create('Field ' + wdblkpcmbiiciPosition.Text + ' "Signatory" must have a value.'));
    end
  else if wdblkpcmbiaPosition.Text = '' then
    begin
      wdblkpcmbiaPosition.SetFocus;
      raise(Exception.Create('Field "Closing" must have a value.'));
    end
  else if wdblkpcmbiaSignatory.Text = '' then
    begin
      wdblkpcmbiaSignatory.SetFocus;
      raise(Exception.Create('Field ' + wdblkpcmbiaPosition.Text + ' "Signatory" must have a value.'));
    end
  else
    begin
      Result := True;
    end;
end;

procedure TfrmRIS.wdbgrdDetailColExit(Sender: TObject);
begin
  inherited;
  with qryListOfRISDet do
    begin
      if State = dsEdit then
        begin
          Post;
        end;
    end;
end;

procedure TfrmRIS.wdbgrdDetailExit(Sender: TObject);
begin
  inherited;
  with qryListOfRISDet do
    begin
      if State = dsEdit then
        begin
          Post;
        end;
    end;
end;

procedure TfrmRIS.wdbgrdDetailRowChanged(Sender: TObject);
begin
  inherited;
  with qryListOfRISDet do
    begin
      if State = dsInsert then
        begin
          Cancel;
        end;
    end;
  DisplayRecordCount(qryListOfRISDet,pnlRecordCtr);
end;

procedure TfrmRIS.wdblkpcmbaepositionChange(Sender: TObject);
begin
  inherited;
  ListSignatory(wdblkpcmbaeposition,wdblkpcmbaesignatory);
end;

procedure TfrmRIS.wdblkpcmbaesignatoryBeforeDropDown(Sender: TObject);
begin
  inherited;
  ListSignatory(wdblkpcmbaeposition,wdblkpcmbaesignatory);
end;

procedure TfrmRIS.wdblkpcmbaesignatoryChange(Sender: TObject);
begin
  inherited;
  AESignID := SignatoryID(wdblkpcmbaesignatory);
  lblADesignation2.Caption := '';
  if wdblkpcmbaesignatory.Text <> '' then
    begin
      lblADesignation2.Caption := frmData.qryListOfSignatorydesignation_name.AsString;
    end;
end;

procedure TfrmRIS.wdblkpcmbaesignatoryClick(Sender: TObject);
begin
  inherited;
  ListSignatory(wdblkpcmbaeposition,wdblkpcmbaesignatory);
end;

procedure TfrmRIS.wdblkpcmbanapositionChange(Sender: TObject);
begin
  inherited;
  ListSignatory(wdblkpcmbanaposition,wdblkpcmbanasignatory);
end;

procedure TfrmRIS.wdblkpcmbanasignatoryBeforeDropDown(Sender: TObject);
begin
  inherited;
  ListSignatory(wdblkpcmbanaposition,wdblkpcmbanasignatory);
end;

procedure TfrmRIS.wdblkpcmbanasignatoryChange(Sender: TObject);
begin
  inherited;
  ANASignID := SignatoryID(wdblkpcmbanasignatory);
  lblADesignation3.Caption := '';
  if wdblkpcmbanasignatory.Text <> '' then
    begin
      lblADesignation3.Caption := frmData.qryListOfSignatorydesignation_name.AsString;
    end;
end;

procedure TfrmRIS.wdblkpcmbanasignatoryClick(Sender: TObject);
begin
  inherited;
  ListSignatory(wdblkpcmbanaposition,wdblkpcmbanasignatory);
end;

procedure TfrmRIS.wdblkpcmbarpositionChange(Sender: TObject);
begin
  inherited;
  ListSignatory(wdblkpcmbarposition,wdblkpcmbarsignatory);
end;

procedure TfrmRIS.wdblkpcmbarsignatoryBeforeDropDown(Sender: TObject);
begin
  inherited;
  ListSignatory(wdblkpcmbarposition,wdblkpcmbarsignatory);
end;

procedure TfrmRIS.wdblkpcmbarsignatoryChange(Sender: TObject);
begin
  inherited;
  ARSignID := SignatoryID(wdblkpcmbarsignatory);
  lblADesignation1.Caption := '';
  if wdblkpcmbarsignatory.Text <> '' then
    begin
      lblADesignation1.Caption := frmData.qryListOfSignatorydesignation_name.AsString;
    end;
end;

procedure TfrmRIS.wdblkpcmbarsignatoryClick(Sender: TObject);
begin
  inherited;
  ListSignatory(wdblkpcmbarposition,wdblkpcmbarsignatory);
end;

procedure TfrmRIS.wdblkpcmbiaPositionChange(Sender: TObject);
begin
  inherited;
  ListSignatory(wdblkpcmbiaPosition,wdblkpcmbiaSignatory);
end;

procedure TfrmRIS.wdblkpcmbiaSignatoryBeforeDropDown(Sender: TObject);
begin
  inherited;
  ListSignatory(wdblkpcmbiaPosition,wdblkpcmbiaSignatory);
end;

procedure TfrmRIS.wdblkpcmbiaSignatoryChange(Sender: TObject);
begin
  inherited;
  IASignID := SignatoryID(wdblkpcmbiaSignatory);
  lblIDesignation3.Caption := '';
  if wdblkpcmbiaSignatory.Text <> '' then
    begin
      lblIDesignation3.Caption := frmData.qryListOfSignatorydesignation_name.AsString;
    end;
end;

procedure TfrmRIS.wdblkpcmbiaSignatoryClick(Sender: TObject);
begin
  inherited;
  ListSignatory(wdblkpcmbiaPosition,wdblkpcmbiaSignatory);
end;

procedure TfrmRIS.wdblkpcmbiiciPositionChange(Sender: TObject);
begin
  inherited;
  ListSignatory(wdblkpcmbiiciPosition,wdblkpcmbiiciSignatory);
end;

procedure TfrmRIS.wdblkpcmbiiciSignatoryBeforeDropDown(Sender: TObject);
begin
  inherited;
  ListSignatory(wdblkpcmbiiciPosition,wdblkpcmbiiciSignatory);
end;

procedure TfrmRIS.wdblkpcmbiiciSignatoryChange(Sender: TObject);
begin
  inherited;
  IICISignID := SignatoryID(wdblkpcmbiiciSignatory);
  lblIDesignation2.Caption := '';
  if wdblkpcmbiiciSignatory.Text <> '' then
    begin
      lblIDesignation2.Caption := frmData.qryListOfSignatorydesignation_name.AsString;
    end;
end;

procedure TfrmRIS.wdblkpcmbiiciSignatoryClick(Sender: TObject);
begin
  inherited;
  ListSignatory(wdblkpcmbiiciPosition,wdblkpcmbiiciSignatory);
end;

procedure TfrmRIS.wdblkpcmbiiePositionChange(Sender: TObject);
begin
  inherited;
  ListSignatory(wdblkpcmbiiePosition,wdblkpcmbiieSignatory);
end;

procedure TfrmRIS.wdblkpcmbiieSignatoryBeforeDropDown(Sender: TObject);
begin
  inherited;
  ListSignatory(wdblkpcmbiiePosition,wdblkpcmbiieSignatory);
end;

procedure TfrmRIS.wdblkpcmbiieSignatoryChange(Sender: TObject);
begin
  inherited;
  IIESignID := SignatoryID(wdblkpcmbiieSignatory);
  lblIDesignation1.Caption := '';
  if wdblkpcmbiieSignatory.Text <> '' then
    begin
      lblIDesignation1.Caption := frmData.qryListOfSignatorydesignation_name.AsString;
    end;
end;

procedure TfrmRIS.wdblkpcmbiieSignatoryClick(Sender: TObject);
begin
  inherited;
  ListSignatory(wdblkpcmbiiePosition,wdblkpcmbiieSignatory);
end;

procedure TfrmRIS.wdblkpcmbSAI_IDCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  DisplaySAIInfo;
end;

procedure TfrmRIS.wdblkpcmbSAI_IDExit(Sender: TObject);
begin
  inherited;
  DisplaySAIInfo;
end;

end.
