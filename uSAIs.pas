unit uSAIs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uTemplate3, StdCtrls, Buttons, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls,
  StrUtils, DB, DBAccess, MyAccess, Mask, wwdbedit, Wwdotdot, Wwdbcomb, ppBands,
  ppCache, ppClass, ppParameter, ppProd, ppReport, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppCtrls, ppPrnabl, ppVar, ppStrtch, ppMemo, DADump, MyDump, FileCtrl,
  ComCtrls;

type
  TfrmSAIs = class(TfrmTemplate3)
    cbbCancel: TwwDBComboBox;
    pdbpplnSAI: TppDBPipeline;
    prprtSAI: TppReport;
    ppParameterList1: TppParameterList;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    plblsai_id: TppLabel;
    pdbtxtsai_id: TppDBText;
    plbldate: TppLabel;
    pdbtxtdate: TppDBText;
    plblgoodstype: TppLabel;
    pdbtxtgoodstype: TppDBText;
    plblmunicipality: TppLabel;
    pdbtxtmunicipality: TppDBText;
    plblquantity: TppLabel;
    pdbtxtquantity: TppDBText;
    plblbarangay: TppLabel;
    pdbtxtbarangay: TppDBText;
    plblSAI: TppLabel;
    plblDSWD: TppLabel;
    plblCol1: TppLabel;
    plblCol2: TppLabel;
    plblCol3: TppLabel;
    plblCol4: TppLabel;
    plblCol5: TppLabel;
    plblCol6: TppLabel;
    plnID: TppLine;
    plnDate: TppLine;
    plnTG: TppLine;
    plnQty: TppLine;
    plnMun: TppLine;
    plnBrgy: TppLine;
    plnUpper: TppLine;
    plnLower: TppLine;
    pshpItemID: TppShape;
    pshpItemDesc: TppShape;
    pshpQtyUnit: TppShape;
    pshpCavanBox: TppShape;
    pshpKGPC: TppShape;
    pshpTotal: TppShape;
    plblItemID: TppLabel;
    plblItemDesc: TppLabel;
    plblQtyUnit: TppLabel;
    plblCavanBox: TppLabel;
    plblKGPC: TppLabel;
    plblTotal: TppLabel;
    pshpItemIDList: TppShape;
    pdbtxtitemid: TppDBText;
    pshpItemDescList: TppShape;
    pdbtxtitemdesc: TppDBText;
    pshpCavanBoxList: TppShape;
    pdbtxtunit_w: TppDBText;
    pshpKGPCList: TppShape;
    pdbtxtunit_r: TppDBText;
    pshpTotalList: TppShape;
    pdbtxttotal_qty: TppDBText;
    pdbtxtp_position: TppDBText;
    pdbtxtp_signatory: TppDBText;
    pdbtxtc_position: TppDBText;
    pdbtxtc_signatory: TppDBText;
    pdbtxta_position: TppDBText;
    pdbtxta_signatory: TppDBText;
    plnp_name: TppLine;
    plnc_name: TppLine;
    plna_name: TppLine;
    psystmvrblDate: TppSystemVariable;
    pdbtxtuser: TppDBText;
    plblStatus: TppLabel;
    pdbtxtStatus: TppDBText;
    plblCol10: TppLabel;
    pdbmsai_emergency: TppDBMemo;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    btnEXPORT: TBitBtn;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    procedure FormCreate(Sender: TObject);
    procedure cbbCancelChange(Sender: TObject);
    procedure wdbgrdDetailRowChanged(Sender: TObject);
    procedure wdbgrdDetailKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure btnCLOSEClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure wdbgrdDetailKeyPress(Sender: TObject; var Key: Char);
    procedure wdbgrdDetailColExit(Sender: TObject);
    procedure btnEXPORTClick(Sender: TObject);
    procedure wdbgrdDetailKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    CurState: Char;
    IsSecretKeyPress: Boolean;
    { Private declarations }
    procedure SAIExport();
    procedure SAIPrintPreview();
  public
    { Public declarations }
  end;

var
  frmSAIs: TfrmSAIs;

implementation

uses modVarType, modPublicVar, modFunctions, dtmData, uSAI, uReportsViewer;

{$R *.dfm}

procedure TfrmSAIs.btnCLOSEClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmSAIs.btnEXPORTClick(Sender: TObject);
var
  dumpFile,FolderChoose: string;
begin
  inherited;
  dumpFile := '';
  ExportUpdateRecord('sai','sai_det','update_sai','update_sai_det','sai_id','sai_copied',False);
 	if SelectDirectory('Select Directory', '', FolderChoose, [sdNewFolder, sdNewUI], Self) then
    begin
      dumpFile := FolderChoose+'\';
      dumpFile := dumpFile + 'SAI'+FormatDateTime('yyyymmddhhnnss',Now)+'.sql';
      frmData.dmpSAI.BackupToFile(dumpFile);
      ExportUpdateRecord('sai','sai_det','update_sai','update_sai_det','sai_id','sai_copied',True);
      SAIExport;
      ShowMessage('Exporting of SAI Complete...');
    end;
end;

procedure TfrmSAIs.cbbCancelChange(Sender: TObject);
begin
  inherited;
  CurState := ' ';
  frmData.qryListofSAIs.Refresh;
  setGridOption(wdbgrdDetail,0);
end;

procedure TfrmSAIs.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmSAIs.FormCreate(Sender: TObject);
begin
  inherited;
  with frmData do
    begin
      if not qryListofSAIs.Active then qryListofSAIs.Active := True;
      qryListofSAIs.Refresh;
      if not qryAGT.Active then qryAGT.Active := True;
      qryAGT.Refresh;
    end;
  SAIExport;
end;

procedure TfrmSAIs.FormShow(Sender: TObject);
begin
  inherited;
  IsSecretKeyPress := False;
  CurState := ' ';
  setGridOption(wdbgrdDetail,0);
end;

procedure TfrmSAIs.SAIExport;
begin
  with frmData do
    begin
      with qrySelect do
        begin
          Close;
          SQL.Clear;
          SQL.Text := 'SELECT * FROM sai WHERE sai_copied = 0';
          Open;

          btnEXPORT.Enabled := False;
          if RecordCount > 0 then
            begin
              btnEXPORT.Enabled := True;
            end;
        end;
    end;
end;

procedure TfrmSAIs.SAIPrintPreview;
var
  aComponent: TComponent;
begin
  with frmData do
    begin
      strdprcListOfSAI.Active := False;
      strdprcListOfSAI.Params[0].AsString := ' WHERE `sai`.`sai_id` = "' + wdbgrdDetail.GetFieldValue(0) + '"';
      strdprcListOfSAI.Active := True;
    end;
  Screen.Cursor := crHourGlass;
  aComponent := Application.FindComponent('frmReportsViewer');
  if not Assigned(aComponent) then
    begin
      frmReportsViewer := TfrmReportsViewer.Create(Application);
    end;
  prprtName := prprtSAI;
  frmReportsViewer.Caption := 'Goods Inventory and Distribution System';
  frmReportsViewer.pvwrReportsViewer.Report := prprtName;
  prprtSAI.PrintToDevices;
  frmReportsViewer.Show;
  Screen.Cursor := crDefault;
end;

procedure TfrmSAIs.wdbgrdDetailColExit(Sender: TObject);
begin
  inherited;
  if wdbgrdDetail.SelectedIndex = 6 then
    begin
      CurState := ' ';
      frmData.qryListofSAIs.Refresh;
      setGridOption(wdbgrdDetail,0);
    end;
end;

procedure TfrmSAIs.wdbgrdDetailKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if CurState = 'E' then
    begin
      if (Key = VK_UP) or (Key = VK_DOWN) or (Key = VK_RIGHT) or (Key = VK_LEFT) then
        begin
          Key := 0;
        end;
    end;
  if frmData.qryListofSAIs.State = dsBrowse then
    begin
      if Key = VK_NUMLOCK then
        begin
          IsSecretKeyPress := True;
          Key := 0;
        end;
    end;
end;

procedure TfrmSAIs.wdbgrdDetailKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  with frmData do
    begin
      if (qryListofSAIs.State = dsBrowse) then
        begin
          if qryAGT.RecordCount > 0 then
            begin
              if (Key = #78) or (Key = #110) then
                begin
                  CurSAIID := '';
                  CurSAIID := qryListofSAIssai_id.Text;
                  with TfrmSAI.Create(Self) do
                    begin
                        try
                          ShowModal;
                        finally
                          Free;
                        end;
                    end;
                  qryListofSAIs.Refresh;
                  qryListofSAIs.Locate('sai_id',CurSAIID,[loCaseInsensitive]);
                  qryAGT.Refresh;
                  SAIExport;
                  Key := #0;
                end;
              if IsSecretKeyPress then
                begin
                  if (Key = #82) or (Key = #114) then
                    begin
                      CancelUpdateRecord('update_sai','sai','sai_id','sai_copied');
                      SAIExport;
                      IsSecretKeyPress := False;
                      Key := #0;
                    end;
                end;
            end
          else
            begin
              raise(Exception.Create('List of Items By Goods does not exists.'));
            end;
          if qryListofSAIs.RecordCount > 0 then
            begin
              if qryListofSAIssai_issued.AsString = 'No' then
                begin
                  if (Key = #69) or (Key = #101) then
                    begin
                      CurState := 'E';
                      setGridOption(wdbgrdDetail,1);
                      wdbgrdDetail.SelectedIndex := 6;
                      Key := #0;
                    end;
                end;
              if (Key = #80) or (Key = #112) then
                begin
                  SAIPrintPreview;
                  Key := #0;
                end;
            end;
        end;
    end;
end;

procedure TfrmSAIs.wdbgrdDetailKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if frmData.qryListofSAIs.State = dsBrowse then
    begin
      if Key = VK_NUMLOCK then
        begin
          IsSecretKeyPress := False;
          Key := 0;
        end;
    end;
end;

procedure TfrmSAIs.wdbgrdDetailRowChanged(Sender: TObject);
begin
  inherited;
  with frmData do
    begin
      DisplayRecordCount(qryListofSAIs,pnlRecordCtr);
    end;
end;

end.
