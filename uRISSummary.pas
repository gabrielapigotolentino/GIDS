unit uRISSummary;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StrUtils, DB, DBAccess, ppComm, ppRelatv, ppDB, ppDBPipe, ppPrnabl,
  ppClass, ppStrtch, ppCTMain, ppBands, ppCache, ppParameter, ppProd, ppReport,
  MyAccess, MemDS, StdCtrls, wwcheckbox, Mask, wwdbedit, Buttons, ppCtrls,
  ExtCtrls, wwdblook, ppVar, ppSubRpt;

type
  TfrmRISSummary = class(TForm)
    strdprcBegBalance: TMyStoredProc;
    dsspBegBalance: TMyDataSource;
    strdprcListOfRecipient: TMyStoredProc;
    dsspListOfRecipient: TMyDataSource;
    strdprcEndBalance: TMyStoredProc;
    dsspEndBalance: TMyDataSource;
    pdbpplnBB: TppDBPipeline;
    pdbpplnLR: TppDBPipeline;
    pdbpplnEB: TppDBPipeline;
    prprtRISSummary: TppReport;
    ppParameterList1: TppParameterList;
    ppDetailBand1: TppDetailBand;
    ppCrossTab1: TppCrossTab;
    ppCrossTab2: TppCrossTab;
    ppCrossTab3: TppCrossTab;
    lblMonth: TLabel;
    lblCol1: TLabel;
    lblYear: TLabel;
    lblCol2: TLabel;
    qryRS: TMyQuery;
    btnPREVIEW: TBitBtn;
    edtMonth: TEdit;
    edtYear: TEdit;
    plblTitle1: TppLabel;
    plblTitle2: TppLabel;
    ppDBText1: TppDBText;
    chkCurrent: TCheckBox;
    rgItemType: TRadioGroup;
    pnlPSign: TPanel;
    lblDesignation1: TLabel;
    wdblkpcmbPPosition: TwwDBLookupCombo;
    wdblkpcmbPSignatory: TwwDBLookupCombo;
    pnlASign: TPanel;
    lblDesignation3: TLabel;
    wdblkpcmbAPosition: TwwDBLookupCombo;
    wdblkpcmbASignatory: TwwDBLookupCombo;
    qrySign: TMyQuery;
    dsqrySign: TMyDataSource;
    pdbpplnSign: TppDBPipeline;
    ppTitleBand1: TppTitleBand;
    ppSummaryBand1: TppSummaryBand;
    ppSubReport1: TppSubReport;
    ppChildReport1: TppChildReport;
    ppDetailBand2: TppDetailBand;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    procedure chkCurrentClick(Sender: TObject);
    procedure btnPREVIEWClick(Sender: TObject);
    procedure rgItemTypeClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure wdblkpcmbPPositionChange(Sender: TObject);
    procedure wdblkpcmbPSignatoryBeforeDropDown(Sender: TObject);
    procedure wdblkpcmbPSignatoryChange(Sender: TObject);
    procedure wdblkpcmbPSignatoryClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure wdblkpcmbAPositionChange(Sender: TObject);
    procedure wdblkpcmbASignatoryBeforeDropDown(Sender: TObject);
    procedure wdblkpcmbASignatoryChange(Sender: TObject);
    procedure wdblkpcmbASignatoryClick(Sender: TObject);
    procedure wdblkpcmbPPositionKeyPress(Sender: TObject; var Key: Char);
    procedure wdblkpcmbPSignatoryKeyPress(Sender: TObject; var Key: Char);
    procedure wdblkpcmbAPositionKeyPress(Sender: TObject; var Key: Char);
    procedure wdblkpcmbASignatoryKeyPress(Sender: TObject; var Key: Char);
  private
    currMonth,currYear,PSignID,ASignID: Integer;
    iType: string;
    { Private declarations }
    function ValidateEntry(): Boolean;
    function RISSummary(ConditionStatement: string): Boolean;
    procedure RISPreview();
  public
    { Public declarations }
  end;

var
  frmRISSummary: TfrmRISSummary;

implementation

{$R *.dfm}

uses modVarType, modFunctions, modPublicVar, dtmData, uReportsViewer;

procedure TfrmRISSummary.btnPREVIEWClick(Sender: TObject);
begin
  RISPreview;
end;

procedure TfrmRISSummary.chkCurrentClick(Sender: TObject);
var
  sqlqry: string;
  selMonth,selYear: Integer;
begin
  edtMonth.Text := '';
  edtYear.Text := '';
  edtMonth.Enabled := True;
  edtYear.Enabled := True;
  selMonth := 0;
  selYear := 0;
  currMonth := 0;
  currYear := 0;
  sqlqry := '';
  if chkCurrent.Checked then
    begin
      edtMonth.Enabled := False;
      edtYear.Enabled := False;
      with qryRS do
        begin
          sqlqry := '';
          sqlqry := sqlqry + 'SELECT * FROM beg_balance WHERE cactive = 1';

          Close;
          SQL.Clear;
          SQL.Text := sqlqry;
          Open;

          if RecordCount > 0 then
            begin
              selMonth := FieldByName('cmonth').AsInteger;
              selYear := FieldByName('cyear').AsInteger;

              if selMonth = 12 then
                begin
                  currMonth := 1;
                  currYear := selYear + 1;
                end
              else
                begin
                  currMonth := selMonth + 1;
                  currYear := selYear;
                end;
              edtMonth.Text := IntToStr(currMonth);
              edtYear.Text := IntToStr(currYear);
            end;
        end;
    end
  else
    begin
      edtMonth.SetFocus;
    end;
end;

procedure TfrmRISSummary.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmRISSummary.FormCreate(Sender: TObject);
begin
  with frmData do
    begin
      if not qryListOfPosition.Active then qryListOfPosition.Active := True;
      qryListOfPosition.Refresh;
    end;
  PSignID := 0;
  ASignID := 0;
  wdblkpcmbPPosition.Text := 'Prepared By';
  wdblkpcmbAPosition.Text := 'Approved By';
end;

procedure TfrmRISSummary.rgItemTypeClick(Sender: TObject);
begin
  iType := '';
  if rgItemType.ItemIndex = 0 then
    begin
      iType := 'G';
    end
  else if rgItemType.ItemIndex = 1 then
    begin
      iType := 'S';
    end;
end;

procedure TfrmRISSummary.RISPreview;
var
  aComponent: TComponent;
  sqlqry: string;
begin
  if ValidateEntry then
    begin
      sqlqry := '';
      if chkCurrent.Checked then
        begin
          sqlqry := sqlqry + ' WHERE beg_balance.cactive = 1';
        end
      else
        begin
          sqlqry := sqlqry + ' WHERE beg_balance.cactive = 0';
        end;
      sqlqry := sqlqry + ' AND item.item_type = "';
      sqlqry := sqlqry + iType;
      sqlqry := sqlqry + '" AND MONTH(ris.ris_date) = ';
      sqlqry := sqlqry + edtMonth.Text;
      sqlqry := sqlqry + ' AND YEAR(ris.ris_date) = ';
      sqlqry := sqlqry + edtYear.Text;
      sqlqry := sqlqry + ' ';

      if RISSummary(sqlqry) then
        begin
          Screen.Cursor := crHourGlass;
          aComponent := Application.FindComponent('frmReportsViewer');
          if not Assigned(aComponent) then
            begin
              frmReportsViewer := TfrmReportsViewer.Create(Application);
            end;
          prprtName := prprtRISSummary;
          frmReportsViewer.Caption := 'Requisition and Issuance Slip - Summary Report';
          frmReportsViewer.pvwrReportsViewer.Report := prprtName;
          prprtRISSummary.PrintToDevices;
          frmReportsViewer.Show;
          Screen.Cursor := crDefault;
        end;
    end;
end;

function TfrmRISSummary.RISSummary(ConditionStatement: string): Boolean;
begin
  Result := True;
  with strdprcBegBalance do
    begin
      Active := False;
      Params[0].AsString := ConditionStatement;
      Active := True;
      if RecordCount = 0 then
        begin
          Result := False;
          ShowMessage('Record does not exists.');
        end;
    end;

  with strdprcListOfRecipient do
    begin
      Active := False;
      Params[0].AsString := ConditionStatement;
      Active := True;
    end;

   with strdprcEndBalance do
    begin
      Active := False;
      Params[0].AsString := ConditionStatement;
      Active := True;
    end;

   with qrySign do
    begin
      Active := False;
      ParamByName('gtype').AsString := iType;
      ParamByName('signpp').AsString := IntToStr(PSignID);
      ParamByName('signps').AsString := IntToStr(PSignID);
      ParamByName('signpd').AsString := IntToStr(PSignID);
      ParamByName('signap').AsString := IntToStr(ASignID);
      ParamByName('signas').AsString := IntToStr(ASignID);
      ParamByName('signad').AsString := IntToStr(ASignID);
      ParamByName('uID').AsString := IntToStr(CurrUser.USER_ID);
      Active := True;
    end;
end;

function TfrmRISSummary.ValidateEntry: Boolean;
var
  MonYear: Boolean;
begin
  MonYear := False;
  Result := False;
  if chkCurrent.Checked = False then
    begin
      if edtMonth.Text = '' then
        begin
          edtMonth.SetFocus;
          ShowMessage('Field "Month" must have a value.');
        end
      else if edtYear.Text = '' then
        begin
          edtYear.SetFocus;
          ShowMessage('Field "Year" must have a value.');
        end
      else
        begin
          MonYear := True;
        end;
    end
  else
    begin
      MonYear := True;
    end;
  if MonYear then
    begin
      if rgItemType.ItemIndex = -1 then
        begin
          rgItemType.SetFocus;
          ShowMessage('Field "Item Type" must have a value.');
        end
      else if wdblkpcmbPPosition.Text = '' then
        begin
          wdblkpcmbPPosition.SetFocus;
          ShowMessage('Field "Position" must have a value.');
        end
      else if wdblkpcmbPSignatory.Text = '' then
        begin
          wdblkpcmbPSignatory.SetFocus;
          ShowMessage('Field "Signatory" must have a value.');
        end
      else if wdblkpcmbAPosition.Text = '' then
        begin
          wdblkpcmbAPosition.SetFocus;
          ShowMessage('Field "Position" must have a value.');
        end
      else if wdblkpcmbASignatory.Text = '' then
        begin
          wdblkpcmbASignatory.SetFocus;
          ShowMessage('Field "Signatory" must have a value.');
        end
      else
        begin
          Result := True;
        end;
    end;
end;

procedure TfrmRISSummary.wdblkpcmbAPositionChange(Sender: TObject);
begin
  ListSignatory(wdblkpcmbAPosition,wdblkpcmbASignatory);
end;

procedure TfrmRISSummary.wdblkpcmbAPositionKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key <> #8 then
    begin
      if not IsLetter(Key) then
        begin
          Beep;
          Key := #0;
        end;
    end;
end;

procedure TfrmRISSummary.wdblkpcmbASignatoryBeforeDropDown(Sender: TObject);
begin
  ListSignatory(wdblkpcmbAPosition,wdblkpcmbASignatory);
end;

procedure TfrmRISSummary.wdblkpcmbASignatoryChange(Sender: TObject);
begin
  ASignID := SignatoryID(wdblkpcmbASignatory);
  lblDesignation3.Caption := '';
  if wdblkpcmbASignatory.Text <> '' then
    begin
      lblDesignation3.Caption := frmData.qryListOfSignatorydesignation_name.AsString;
    end;
end;

procedure TfrmRISSummary.wdblkpcmbASignatoryClick(Sender: TObject);
begin
  ListSignatory(wdblkpcmbPPosition,wdblkpcmbPSignatory);
end;

procedure TfrmRISSummary.wdblkpcmbASignatoryKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key <> #8 then
    begin
      if not IsName(Key) then
        begin
          Beep;
          Key := #0;
        end;
    end;
end;

procedure TfrmRISSummary.wdblkpcmbPPositionChange(Sender: TObject);
begin
  ListSignatory(wdblkpcmbPPosition,wdblkpcmbPSignatory);
end;

procedure TfrmRISSummary.wdblkpcmbPPositionKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key <> #8 then
    begin
      if not IsLetter(Key) then
        begin
          Beep;
          Key := #0
        end;
    end;
end;

procedure TfrmRISSummary.wdblkpcmbPSignatoryBeforeDropDown(Sender: TObject);
begin
  ListSignatory(wdblkpcmbPPosition,wdblkpcmbPSignatory);
end;

procedure TfrmRISSummary.wdblkpcmbPSignatoryChange(Sender: TObject);
begin
  PSignID := SignatoryID(wdblkpcmbPSignatory);
  lblDesignation1.Caption := '';
  if wdblkpcmbPSignatory.Text <> '' then
    begin
      lblDesignation1.Caption := frmData.qryListOfSignatorydesignation_name.AsString;
    end;
end;

procedure TfrmRISSummary.wdblkpcmbPSignatoryClick(Sender: TObject);
begin
  ListSignatory(wdblkpcmbPPosition,wdblkpcmbPSignatory);
end;

procedure TfrmRISSummary.wdblkpcmbPSignatoryKeyPress(Sender: TObject;
  var Key: Char);
begin
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
