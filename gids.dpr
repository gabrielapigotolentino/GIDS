program gids;

uses
  Dialogs,
  Forms,
  SysUtils,
  uMain in 'uMain.pas' {frmMain},
  dtmData in 'dtmData.pas' {frmData: TDataModule},
  modVarType in 'modVarType.pas',
  modFunctions in 'modFunctions.pas',
  modPublicVar in 'modPublicVar.pas',
  uTemplate1 in 'uTemplate1.pas' {frmTemplate1},
  uBrand in 'uBrand.pas' {frmBrand},
  uSize in 'uSize.pas' {frmSize},
  uUnit in 'uUnit.pas' {frmUnit},
  uGoodsType in 'uGoodsType.pas' {frmGoodsType},
  uPosition in 'uPosition.pas' {frmPosition},
  uTemplate2 in 'uTemplate2.pas' {frmTemplate2},
  uSignatory in 'uSignatory.pas' {frmSignatory},
  uTemplate3 in 'uTemplate3.pas' {frmTemplate3},
  uItem in 'uItem.pas' {frmItem},
  uItemsbyGoods in 'uItemsbyGoods.pas' {frmItemsbyGoods},
  uItems in 'uItems.pas' {frmItems},
  uSAI in 'uSAI.pas' {frmSAI},
  uSAIs in 'uSAIs.pas' {frmSAIs},
  uRISs in 'uRISs.pas' {frmRISs},
  uRIS in 'uRIS.pas' {frmRIS},
  uReportsViewer in 'uReportsViewer.pas' {frmReportsViewer},
  iAdjList in 'iAdjList.pas' {frmiAdjList},
  iAdjNew in 'iAdjNew.pas' {frmiAdjNew},
  iRecList in 'iRecList.pas' {frmiRec},
  iRecNew in 'iRecNew.pas' {frmiRecNew},
  iRetList in 'iRetList.pas' {frmiRetList},
  iRetNew in 'iRetNew.pas' {frmiRetNew},
  uInventory_main in 'uInventory_main.pas' {frmInventory},
  uActualStock in 'uActualStock.pas' {frmActualStock},
  uRISSummary in 'uRISSummary.pas' {frmRISSummary},
  uDesignation in 'uDesignation.pas' {frmDesignation},
  uBegBalance in 'uBegBalance.pas' {frmBegBalance},
  uTemplate5 in 'uTemplate5.pas' {frmTemplate5},
  uTemplate4 in 'uTemplate4.pas' {frmTemplate4};

{$R *.res}

function mysqlConnect(Sender: TObject): Boolean; stdcall; external 'mysqlmaintenance.dll';
function mysqlRestore(Sender: TObject): Boolean; stdcall; external 'mysqlmaintenance.dll';

begin
  if not FileExists(ChangeFileExt(Application.ExeName,'.ini')) then
    begin
      if mysqlConnect(Application) then
        begin
          Application.Terminate;
        end
      else
        begin
          if mysqlRestore(Application) then
            begin
              Application.Terminate;
            end
          else
            begin
              Application.Initialize;
              Application.MainFormOnTaskbar := True;
              Application.CreateForm(TfrmData, frmData);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
            end;
        end;
    end
  else
    begin
      Application.Initialize;
      Application.MainFormOnTaskbar := True;
      Application.CreateForm(TfrmData, frmData);
      Application.CreateForm(TfrmMain, frmMain);
      Application.Run;
    end;
end.
