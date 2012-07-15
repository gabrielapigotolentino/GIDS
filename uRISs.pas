unit uRISs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uTemplate3, StdCtrls, Buttons, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls,
  StrUtils, DB, DBAccess, MyAccess, MemDS, ppPrnabl, ppClass, ppCtrls, ppBands,
  ppCache, ppDB, ppParameter, ppProd, ppReport, ppComm, ppRelatv, ppDBPipe,
  ppStrtch, ppMemo, ppVar, DADump, MyDump, FileCtrl;

type
  TfrmRISs = class(TfrmTemplate3)
    qryListOfRIS: TMyQuery;
    dsqryListOfRIS: TMyDataSource;
    qryListOfRISris_id: TStringField;
    qryListOfRISris_date: TDateTimeField;
    qryListOfRISsai_id: TStringField;
    qryListOfRISsai_date: TDateTimeField;
    qryListOfRISgoodstype_description: TStringField;
    qryListOfRISris_qty: TIntegerField;
    qryListOfRISsai_location: TStringField;
    pdbpplnRIS: TppDBPipeline;
    prprtRIS: TppReport;
    ppParameterList1: TppParameterList;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    pgrp1: TppGroup;
    pgrphdrbnd1: TppGroupHeaderBand;
    pgrpftrbnd1: TppGroupFooterBand;
    pdbtxtitemid: TppDBText;
    pshpitemidlist: TppShape;
    pshpcavanboxlist: TppShape;
    pdbtxtunitw: TppDBText;
    pshpkgpclist: TppShape;
    pdbtxtunitr: TppDBText;
    pshpitemdesclist: TppShape;
    pdbtxtitemdesc: TppDBText;
    pshpsaiqtylist: TppShape;
    pdbtxtsaiqty: TppDBText;
    pshprisqtylist: TppShape;
    pdbtxtrisqty: TppDBText;
    pshpunitcostlist: TppShape;
    pdbtxtunitcost: TppDBText;
    pshpamountlist: TppShape;
    pdbtxtamountlist: TppDBText;
    pshpblank: TppShape;
    plbltotal: TppLabel;
    pshptotal: TppShape;
    pdbclctotalamount: TppDBCalc;
    pdbmsai_emergency: TppDBMemo;
    pdbtxtrposition: TppDBText;
    pdbtxtrsignatory: TppDBText;
    pdbtxteposition: TppDBText;
    pdbtxtnaposition: TppDBText;
    pdbtxtesignatory: TppDBText;
    pdbtxtnasignatory: TppDBText;
    pdbtxtieposition: TppDBText;
    pdbtxtiesignatory: TppDBText;
    pdbtxticiposition: TppDBText;
    pdbtxticisignatory: TppDBText;
    pdbtxtaposition: TppDBText;
    pdbtxtasignatory: TppDBText;
    pdbtxtuser: TppDBText;
    psystmvrbldate: TppSystemVariable;
    plnrposition: TppLine;
    plneposition: TppLine;
    plnnaposition: TppLine;
    plnieposition: TppLine;
    plniciposition: TppLine;
    plnaposition: TppLine;
    pshpitemid: TppShape;
    plblitemid: TppLabel;
    pshpqtyunit: TppShape;
    plblqtyunit: TppLabel;
    pshpcavanbox: TppShape;
    plblcavan: TppLabel;
    plblbox: TppLabel;
    pshpkgpc: TppShape;
    plblkgpc: TppLabel;
    pshpitemdesc: TppShape;
    plblitemdesc: TppLabel;
    pshpsaiqty: TppShape;
    plblsaiqty: TppLabel;
    pshprisqty: TppShape;
    plblrisqty: TppLabel;
    pshpunitprice: TppShape;
    plblunitprice: TppLabel;
    pshpamount: TppShape;
    plblamount: TppLabel;
    plnoption: TppLine;
    plnlower: TppLine;
    plndiv: TppLine;
    plblrequest: TppLabel;
    plblissue: TppLabel;
    plblRIS: TppLabel;
    plblGSO: TppLabel;
    plnupper: TppLine;
    plblsai_id: TppLabel;
    pdbtxtsai_id: TppDBText;
    plblsai_date: TppLabel;
    pdbtxtsai_date: TppDBText;
    plblgoodstype: TppLabel;
    pdbtxtgoodstype: TppDBText;
    plblqty: TppLabel;
    pdbtxtqty: TppDBText;
    plblris_id: TppLabel;
    pdbtxtris_id: TppDBText;
    plblris_date: TppLabel;
    pdbtxtris_date: TppDBText;
    plblmun: TppLabel;
    pdbtxtmun: TppDBText;
    plblbrgy: TppLabel;
    pdbtxtbrgy: TppDBText;
    plblCol1: TppLabel;
    plblCol2: TppLabel;
    plblCol3: TppLabel;
    plblCol4: TppLabel;
    plblCol5: TppLabel;
    plblCol6: TppLabel;
    plblCol7: TppLabel;
    plblCol8: TppLabel;
    plnsai_id: TppLine;
    plnsai_date: TppLine;
    plngoodstype: TppLine;
    plnqty: TppLine;
    plnris_id: TppLine;
    plnris_date: TppLine;
    plnmun: TppLine;
    plnbrgy: TppLine;
    btnEXPORT: TBitBtn;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    procedure wdbgrdDetailRowChanged(Sender: TObject);
    procedure btnCLOSEClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure wdbgrdDetailKeyPress(Sender: TObject; var Key: Char);
    procedure btnEXPORTClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure wdbgrdDetailKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure wdbgrdDetailKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    IsSecretKeyPress: Boolean;
    { Private declarations }
    procedure RISExport();
    procedure RISPrintPreview();
  public
    { Public declarations }
  end;

var
  frmRISs: TfrmRISs;

implementation

uses modVarType, modPublicVar, modFunctions, dtmData, uRIS, uReportsViewer;

{$R *.dfm}

procedure TfrmRISs.btnCLOSEClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmRISs.btnEXPORTClick(Sender: TObject);
var
  dumpFile,FolderChoose: string;
begin
  inherited;
  dumpFile := '';
  ExportUpdateRecord('ris','ris_det','update_ris','update_ris_det','ris_id','ris_copied',False);
 	if SelectDirectory('Select Directory', '', FolderChoose, [sdNewFolder, sdNewUI], Self) then
    begin
      dumpFile := FolderChoose+'\';
      dumpFile := dumpFile + 'RIS'+FormatDateTime('yyyymmddhhnnss',Now)+'.sql';
      frmData.dmpRIS.BackupToFile(dumpFile);
      ExportUpdateRecord('ris','ris_det','update_ris','update_ris_det','ris_id','ris_copied',True);
      RISExport;
      ShowMessage('Exporting of RIS Complete...');
    end;
end;

procedure TfrmRISs.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmRISs.FormCreate(Sender: TObject);
begin
  inherited;
  if not qryListOfRIS.Active then qryListOfRIS.Active := True;
  qryListOfRIS.Refresh;
  with frmData do
    begin
      if not qryASAIs.Active then qryASAIs.Active := True;
      qryASAIs.Refresh;
    end;
  RISExport;
end;

procedure TfrmRISs.FormShow(Sender: TObject);
begin
  inherited;
  IsSecretKeyPress := False;
end;

procedure TfrmRISs.RISExport;
begin
  with frmData do
    begin
      with qrySelect do
        begin
          Close;
          SQL.Clear;
          SQL.Text := 'SELECT * FROM ris WHERE ris_copied = 0';
          Open;

          btnEXPORT.Enabled := False;
          if RecordCount > 0 then
            begin
              btnEXPORT.Enabled := True;
            end;
        end;
    end;
end;

procedure TfrmRISs.RISPrintPreview;
var
  aComponent: TComponent;
begin
  with frmData do
    begin
      strdprcListOfRIS.Active := False;
      strdprcListOfRIS.Params[0].AsString := ' WHERE `ris`.`ris_id` = "' + wdbgrdDetail.GetFieldValue(0) + '"';
      strdprcListOfRIS.Active := True;
    end;
  Screen.Cursor := crHourGlass;
  aComponent := Application.FindComponent('frmReportsViewer');
  if not Assigned(aComponent) then
    begin
      frmReportsViewer := TfrmReportsViewer.Create(Application);
    end;
  prprtName := prprtRIS;
  frmReportsViewer.Caption := 'Goods Inventory and Distribution System';
  frmReportsViewer.pvwrReportsViewer.Report := prprtName;
  prprtRIS.PrintToDevices;
  frmReportsViewer.Show;
  Screen.Cursor := crDefault;
end;

procedure TfrmRISs.wdbgrdDetailKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if qryListOfRIS.State = dsBrowse then
    begin
      if Key = VK_NUMLOCK then
        begin
          IsSecretKeyPress := True;
          Key := 0;
        end;
    end;
end;

procedure TfrmRISs.wdbgrdDetailKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if (Key = #78) or (Key = #110) then
    begin
      if frmData.qryASAIs.RecordCount > 0 then
        begin
          CurRISID := '';
          CurRISID := qryListOfRISris_id.AsString;
          with TfrmRIS.Create(Self) do
            begin
                try
                  ShowModal;
                finally
                  Free;
                end;
            end;
          qryListOfRIS.Refresh;
          qryListOfRIS.Locate('ris_id',CurRISID,[loCaseInsensitive]);
          frmData.qryASAIs.Refresh;
          RISExport;
        end
      else
        begin
          raise(Exception.Create('No request for SAI'));
        end;
      Key := #0;
    end
  else
    begin
      if qryListOfRIS.RecordCount > 0 then
        begin
          if (Key = #80) or (Key = #112) then
            begin
              RISPrintPreview;
              Key := #0;
            end;
        end;
    end;
  if qryListOfRIS.State = dsBrowse then
    begin
      if (Key = #82) or (Key = #114) then
        begin
          CancelUpdateRecord('update_ris','ris','ris_id','ris_copied');
          RISExport;
          IsSecretKeyPress := False;
          Key := #0;
        end;
    end;
end;

procedure TfrmRISs.wdbgrdDetailKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if qryListOfRIS.State = dsBrowse then
    begin
      if Key = VK_NUMLOCK then
        begin
          IsSecretKeyPress := False;
          Key := 0;
        end;
    end;
end;

procedure TfrmRISs.wdbgrdDetailRowChanged(Sender: TObject);
begin
  inherited;
  DisplayRecordCount(qryListOfRIS,pnlRecordCtr);
end;

end.
