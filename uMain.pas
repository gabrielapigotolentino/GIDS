unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormPolicyDlg, uFormPolicy, uChangePasswordDlg, uSecDlg, uLoginDlg,
  uSecControl, ComCtrls, ToolWin, ActnList, Menus, ImgList, modVarType,
  modPublicVar, modFunctions, FileCtrl;

type
  TfrmMain = class(TForm)
    uilSecurityManager: TuilSecurityManager;
    uilLoginDlg: TuilLoginDlg;
    uilSecurityDlg: TuilSecurityDlg;
    uilChangePasswordDlg: TuilChangePasswordDlg;
    uilFormPolicy: TuilFormPolicy;
    uilFormPolicyDlg: TuilFormPolicyDlg;
    mmMain: TMainMenu;
    actlstMain: TActionList;
    ilMenu: TImageList;
    ilToolbar: TImageList;
    mniFile: TMenuItem;
    mniReferences: TMenuItem;
    mniTransactions: TMenuItem;
    mniReports: TMenuItem;
    mniUtilities: TMenuItem;
    mniAbout: TMenuItem;
    tlbMenu: TToolBar;
    statMain: TStatusBar;
    actItem: TAction;
    actBrand: TAction;
    actSize: TAction;
    actUnit: TAction;
    actLogout: TAction;
    actSI: TAction;
    actExit: TAction;
    actIR: TAction;
    actSAI: TAction;
    actRIS: TAction;
    actAS: TAction;
    actCP: TAction;
    actUAccount: TAction;
    actUPolicy: TAction;
    actBackup: TAction;
    actRestore: TAction;
    mniLogout: TMenuItem;
    mniSI: TMenuItem;
    mniExit: TMenuItem;
    mniItem: TMenuItem;
    mniBrand: TMenuItem;
    mniSize: TMenuItem;
    mniUnit: TMenuItem;
    mniIR: TMenuItem;
    mniSAI: TMenuItem;
    mniRIS: TMenuItem;
    mniAS: TMenuItem;
    mniCP: TMenuItem;
    mniUser: TMenuItem;
    mniBackup: TMenuItem;
    mniRestore: TMenuItem;
    mniUAccount: TMenuItem;
    mniUPolicy: TMenuItem;
    mniFN1: TMenuItem;
    mniRN1: TMenuItem;
    actGT: TAction;
    actPosition: TAction;
    actSignatory: TAction;
    mniGT: TMenuItem;
    mniPosition: TMenuItem;
    mniSignatory: TMenuItem;
    actIG: TAction;
    mniIG: TMenuItem;
    mniTN1: TMenuItem;
    actRI: TAction;
    actAdjustment: TAction;
    mniRI: TMenuItem;
    mniAdjustment: TMenuItem;
    mniFN2: TMenuItem;
    mniImport: TMenuItem;
    actImportSAI: TAction;
    actImportRIS: TAction;
    mniImportSAI: TMenuItem;
    mniImportRIS: TMenuItem;
    dlgOpenDumpFile: TOpenDialog;
    btnExit: TToolButton;
    btnLogout: TToolButton;
    btnSP1: TToolButton;
    btnItem: TToolButton;
    btnSAI: TToolButton;
    btnRIS: TToolButton;
    btnInventory: TToolButton;
    actRISSummary: TAction;
    mniRISSummary: TMenuItem;
    actDesignation: TAction;
    mniRN2: TMenuItem;
    mniDesignation: TMenuItem;
    actBegBalance: TAction;
    mniBegBalance: TMenuItem;
    Action1: TAction;
    actSynchronize: TAction;
    mniSynchronize: TMenuItem;
    UN1: TMenuItem;
    UN2: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure actLogoutExecute(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure actBrandExecute(Sender: TObject);
    procedure actExitExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actSizeExecute(Sender: TObject);
    procedure actUnitExecute(Sender: TObject);
    procedure actGTExecute(Sender: TObject);
    procedure actPositionExecute(Sender: TObject);
    procedure actSignatoryExecute(Sender: TObject);
    procedure actItemExecute(Sender: TObject);
    procedure actIGExecute(Sender: TObject);
    procedure actSAIExecute(Sender: TObject);
    procedure uilSecurityManagerFailedLogin(Sender: TObject);
    procedure actRISExecute(Sender: TObject);
    procedure actIRExecute(Sender: TObject);
    procedure actASExecute(Sender: TObject);
    procedure actRIExecute(Sender: TObject);
    procedure actAdjustmentExecute(Sender: TObject);
    procedure actImportSAIExecute(Sender: TObject);
    procedure actImportRISExecute(Sender: TObject);
    procedure actCPExecute(Sender: TObject);
    procedure actUAccountExecute(Sender: TObject);
    procedure actUPolicyExecute(Sender: TObject);
    procedure actBackupExecute(Sender: TObject);
    procedure actRestoreExecute(Sender: TObject);
    procedure actRISSummaryExecute(Sender: TObject);
    procedure actDesignationExecute(Sender: TObject);
    procedure actBegBalanceExecute(Sender: TObject);
    procedure actSynchronizeExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses dtmData, uBrand, uSize, uUnit, uGoodsType, uPosition, uSignatory, uItems,
  uItemsbyGoods, uSAIs, uRISs, iRecList, uInventory_main, iRetList, iAdjList,
  uActualStock, uRISSummary, uDesignation, uBegBalance;

{$R *.dfm}

procedure mysqlBackup(Sender: TObject); stdcall; external 'mysqlmaintenance.dll';
function mysqlRestore(Sender: TObject): Boolean; stdcall; external 'mysqlmaintenance.dll';
function mysqlSynchronize(Sender: TObject): Boolean; stdcall; external 'mysqlmaintenance.dll';

procedure TfrmMain.actAdjustmentExecute(Sender: TObject);
var
  aComponent: TComponent;
begin
  Screen.Cursor := crHourGlass;
  aComponent := Application.FindComponent('frmiAdjList');
  if not Assigned(aComponent) then
    begin
      frmiAdjList := TfrmiAdjList.Create(Application);
    end;
  frmiAdjList.Show;
  Screen.Cursor := crDefault;
end;

procedure TfrmMain.actASExecute(Sender: TObject);
var
  aComponent: TComponent;
begin
  Screen.Cursor := crHourGlass;
  aComponent := Application.FindComponent('frmActualStock');
  if not Assigned(aComponent) then
    begin
      frmActualStock := TfrmActualStock.Create(Application);
    end;
  frmActualStock.Show;
  Screen.Cursor := crDefault;
end;

procedure TfrmMain.actBackupExecute(Sender: TObject);
begin
  mysqlBackup(Sender);
end;

procedure TfrmMain.actBegBalanceExecute(Sender: TObject);
var
  aComponent: TComponent;
begin
  Screen.Cursor := crHourGlass;
  aComponent := Application.FindComponent('frmBegBalance');
  if not Assigned(aComponent) then
    begin
      frmBegBalance := TfrmBegBalance.Create(Application);
    end;
  frmBegBalance.Show;
  Screen.Cursor := crDefault;
end;

procedure TfrmMain.actBrandExecute(Sender: TObject);
var
  aComponent: TComponent;
begin
  Screen.Cursor := crHourGlass;
  aComponent := Application.FindComponent('frmBrand');
  if not Assigned(aComponent) then
    begin
      frmBrand := TfrmBrand.Create(Application);
    end;
  frmBrand.Show;
  Screen.Cursor := crDefault;
end;

procedure TfrmMain.actCPExecute(Sender: TObject);
begin
  uilChangePasswordDlg.Execute;
end;

procedure TfrmMain.actDesignationExecute(Sender: TObject);
var
  aComponent: TComponent;
begin
  Screen.Cursor := crHourGlass;
  aComponent := Application.FindComponent('frmDesignation');
  if not Assigned(aComponent) then
    begin
      frmDesignation := TfrmDesignation.Create(Application);
    end;
  frmDesignation.Show;
  Screen.Cursor := crDefault;
end;

procedure TfrmMain.actExitExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.actGTExecute(Sender: TObject);
var
  aComponent: TComponent;
begin
  Screen.Cursor := crHourGlass;
  aComponent := Application.FindComponent('frmGoodsType');
  if not Assigned(aComponent) then
    begin
      frmGoodsType := TfrmGoodsType.Create(Application);
    end;
  frmGoodsType.Show;
  Screen.Cursor := crDefault;
end;

procedure TfrmMain.actIGExecute(Sender: TObject);
var
  aComponent: TComponent;
begin
  Screen.Cursor := crHourGlass;
  aComponent := Application.FindComponent('frmItemsbyGoods');
  if not Assigned(aComponent) then
    begin
      frmItemsbyGoods := TfrmItemsbyGoods.Create(Application);
    end;
  frmItemsbyGoods.Show;
  Screen.Cursor := crDefault;
end;

procedure TfrmMain.actImportRISExecute(Sender: TObject);
var
  sqlqry: string;
begin
  sqlqry := '';
  with frmData do
    begin
      sqlqry := '';
      sqlqry := sqlqry + 'SELECT * FROM update_ris WHERE ris_copied = 1';

      qrySelect.Close;
      qrySelect.SQL.Clear;
      qrySelect.SQL.Text := sqlqry;
      qrySelect.Open;

      if qrySelect.RecordCount > 0 then
        begin
          if dlgOpenDumpFile.Execute() then
            begin
              dmpRIS.RestoreFromFile(dlgOpenDumpFile.FileName);
              ImportUpdateRecord('update_ris','update_ris_det','ris','ris_det','ris_id','ris_copied');
              ShowMessage('Importing of RIS Complete...');
            end;
        end
      else
        begin
          ShowMessage('There'+Chr(39)+'s not RIS record to import.');
        end;
    end;
end;

procedure TfrmMain.actImportSAIExecute(Sender: TObject);
var
  sqlqry: string;
begin
  sqlqry := '';
  with frmData do
    begin
      sqlqry := '';
      sqlqry := sqlqry + 'SELECT * FROM update_sai WHERE sai_copied = 1';

      qrySelect.Close;
      qrySelect.SQL.Clear;
      qrySelect.SQL.Text := sqlqry;
      qrySelect.Open;

      if qrySelect.RecordCount > 0 then
        begin
          if dlgOpenDumpFile.Execute() then
            begin
              dmpSAI.RestoreFromFile(dlgOpenDumpFile.FileName);
              ImportUpdateRecord('update_sai','update_sai_det','sai','sai_det','sai_id','sai_copied');
              ShowMessage('Importing of SAI Complete...');
            end;
        end
      else
        begin
          ShowMessage('There'+Chr(39)+'s not SAI record to import.');
        end;
    end;
end;

procedure TfrmMain.actIRExecute(Sender: TObject);
var
  aComponent: TComponent;
begin
  Screen.Cursor := crHourGlass;
  aComponent := Application.FindComponent('frmiRec');
  if not Assigned(aComponent) then
    begin
      frmiRec := TfrmiRec.Create(Application);
    end;
  frmiRec.Show;
  Screen.Cursor := crDefault;
end;

procedure TfrmMain.actItemExecute(Sender: TObject);
var
  aComponent: TComponent;
begin
  Screen.Cursor := crHourGlass;
  aComponent := Application.FindComponent('frmItems');
  if not Assigned(aComponent) then
    begin
      frmItems := TfrmItems.Create(Application);
    end;
  frmItems.Show;
  Screen.Cursor := crDefault;
end;

procedure TfrmMain.actLogoutExecute(Sender: TObject);
begin
  uilSecurityManager.Logout;
  if not uilLoginDlg.Execute then
    begin
      Application.Terminate;
    end
  else
    begin

    end;
end;

procedure TfrmMain.actPositionExecute(Sender: TObject);
var
  aComponent: TComponent;
begin
  Screen.Cursor := crHourGlass;
  aComponent := Application.FindComponent('frmPosition');
  if not Assigned(aComponent) then
    begin
      frmPosition := TfrmPosition.Create(Application);
    end;
  frmPosition.Show;
  Screen.Cursor := crDefault;
end;

procedure TfrmMain.actRestoreExecute(Sender: TObject);
begin
  mysqlRestore(Sender);
end;

procedure TfrmMain.actRIExecute(Sender: TObject);
var
  aComponent: TComponent;
begin
  Screen.Cursor := crHourGlass;
  aComponent := Application.FindComponent('frmiRetList');
  if not Assigned(aComponent) then
    begin
      frmiRetList := TfrmiRetList.Create(Application);
    end;
  frmiRetList.Show;
  Screen.Cursor := crDefault;
end;

procedure TfrmMain.actRISExecute(Sender: TObject);
var
  aComponent: TComponent;
begin
  Screen.Cursor := crHourGlass;
  aComponent := Application.FindComponent('frmRISs');
  if not Assigned(aComponent) then
    begin
      frmRISs := TfrmRISs.Create(Application);
    end;
  frmRISs.Show;
  Screen.Cursor := crDefault;
end;

procedure TfrmMain.actRISSummaryExecute(Sender: TObject);
var
  aComponent: TComponent;
begin
  Screen.Cursor := crHourGlass;
  aComponent := Application.FindComponent('frmRISSummary');
  if not Assigned(aComponent) then
    begin
      frmRISSummary := TfrmRISSummary.Create(Application);
    end;
  frmRISSummary.Show;
  Screen.Cursor := crDefault;
end;

procedure TfrmMain.actSAIExecute(Sender: TObject);
var
  aComponent: TComponent;
begin
  Screen.Cursor := crHourGlass;
  aComponent := Application.FindComponent('frmSAIs');
  if not Assigned(aComponent) then
    begin
      frmSAIs := TfrmSAIs.Create(Application);
    end;
  frmSAIs.Show;
  Screen.Cursor := crDefault;
end;

procedure TfrmMain.actSignatoryExecute(Sender: TObject);
var
  aComponent: TComponent;
begin
  Screen.Cursor := crHourGlass;
  aComponent := Application.FindComponent('frmSignatory');
  if not Assigned(aComponent) then
    begin
      frmSignatory := TfrmSignatory.Create(Application);
    end;
  frmSignatory.Show;
  Screen.Cursor := crDefault;
end;

procedure TfrmMain.actSizeExecute(Sender: TObject);
var
  aComponent: TComponent;
begin
  Screen.Cursor := crHourGlass;
  aComponent := Application.FindComponent('frmSize');
  if not Assigned(aComponent) then
    begin
      frmSize := TfrmSize.Create(Application);
    end;
  frmSize.Show;
  Screen.Cursor := crDefault;
end;

procedure TfrmMain.actSynchronizeExecute(Sender: TObject);
begin
  mysqlSynchronize(Sender)
end;

procedure TfrmMain.actUAccountExecute(Sender: TObject);
begin
  uilSecurityDlg.Execute;
end;

procedure TfrmMain.actUnitExecute(Sender: TObject);
var
  aComponent: TComponent;
begin
  Screen.Cursor := crHourGlass;
  aComponent := Application.FindComponent('frmUnit');
  if not Assigned(aComponent) then
    begin
      frmUnit := TfrmUnit.Create(Application);
    end;
  frmUnit.Show;
  Screen.Cursor := crDefault;
end;

procedure TfrmMain.actUPolicyExecute(Sender: TObject);
begin
  uilFormPolicyDlg.Execute;
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  with frmData do
    begin
      with tblUserBindary do
        begin
          if not Active then Active := True;
          Refresh;
        end;
      with tblUserPermissions do
        begin
          if not Active then Active := True;
          Refresh;
        end;
      with tblPermissionBindary do
        begin
          if not Active then Active := True;
          Refresh;
        end;
      with tblGroupBindary do
        begin
          if not Active then Active := True;
          Refresh;
        end;
      with tblGroupMembershipBindary do
        begin
          if not Active then Active := True;
          Refresh;
        end;
      with tblGroupPermissions do
        begin
          if not Active then Active := True;
          Refresh;
        end;
    end;


  if not uilLoginDlg.Execute then
    begin
      Application.Terminate;
    end
  else
    begin
      SetActiveUser(frmData.tblUserBindaryUserID.AsInteger);
      StatusInformation(statMain, ClientWidth);
    end;

end;

procedure TfrmMain.FormResize(Sender: TObject);
begin
  StatusInformation(statMain, ClientWidth);
end;

procedure TfrmMain.uilSecurityManagerFailedLogin(Sender: TObject);
begin
  if (uilSecurityManager.LoginTriesRemaining > 0) then
    begin
      Dialogs.MessageDlg('Your username or password as incorrect. Please try again!',mtInformation,[mbOK],0);
    end
  else
    begin
      Dialogs.MessageDlg('You must login to this system before using! Program Aborted!',mtInformation,[mbOK],0);
    end;
end;

end.
