unit iRetList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBAccess, MyAccess, MemDS, Menus, StdCtrls, JvExStdCtrls, JvEdit,
  JvDBSearchEdit, Grids, DBGrids, Buttons, ExtCtrls, ppParameter, ppBands,
  ppCtrls, ppPrnabl, ppClass, ppCache, ppProd, ppReport, ppDB, ppComm, ppRelatv,
  ppDBPipe;

type
  TfrmiRetList = class(TForm)
    pnl1: TPanel;
    btnNew: TSpeedButton;
    btnView: TSpeedButton;
    btn1: TSpeedButton;
    pnl2: TPanel;
    lbl1: TLabel;
    dbSearch: TJvDBSearchEdit;
    rb2: TRadioButton;
    rb3: TRadioButton;
    rb4: TRadioButton;
    pm1: TPopupMenu;
    N1: TMenuItem;
    Edit1: TMenuItem;
    Refresh1: TMenuItem;
    QryRET: TMyQuery;
    DSRet: TMyDataSource;
    QryRetRec: TMyQuery;
    DSRetRec: TMyDataSource;
    IRdbpipeline: TppDBPipeline;
    ItemRecieverpt: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppShape1: TppShape;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel12: TppLabel;
    ppLabel5: TppLabel;
    ppLabel3: TppLabel;
    ppLabel9: TppLabel;
    ppLabel11: TppLabel;
    ppLabel8: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppShape2: TppShape;
    ppFooterBand1: TppFooterBand;
    ppParameterList1: TppParameterList;
    GridRetList: TDBGrid;
    btn2: TButton;
    ppDBText3: TppDBText;
    ppLabel6: TppLabel;
    ppLabel13: TppLabel;
    ppShape3: TppShape;
    ppLabel4: TppLabel;
    ppShape4: TppShape;
    ppLabel10: TppLabel;
    ppLabel14: TppLabel;
    ppShape5: TppShape;
    ppShape6: TppShape;
    ppShape8: TppShape;
    ppLabel15: TppLabel;
    ppShape9: TppShape;
    ppShape10: TppShape;
    ppShape11: TppShape;
    ppLine1: TppLine;
    ppShape13: TppShape;
    ppShape14: TppShape;
    ppShape15: TppShape;
    ppLabel19: TppLabel;
    ppShape16: TppShape;
    ppLabel20: TppLabel;
    ppLine2: TppLine;
    ppDBText13: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText2: TppDBText;
    ppDBText9: TppDBText;
    ppDBText11: TppDBText;
    ppDBText6: TppDBText;
    ppDBText14: TppDBText;
    ppDBText5: TppDBText;
    ppDBText12: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText1: TppDBText;
    ppDBText17: TppDBText;
    ppDBText4: TppDBText;
    procedure rb2Click(Sender: TObject);
    procedure rb3Click(Sender: TObject);
    procedure rb4Click(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnViewClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure QryRETAfterRefresh(DataSet: TDataSet);
    procedure btn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmiRetList: TfrmiRetList;

implementation

uses uMain, iRetNew, dtmData, modFunctions, modPublicVar, modVarType,
  uReportsViewer;

{$R *.dfm}

procedure TfrmiRetList.btn1Click(Sender: TObject);
begin
QryRET.Refresh;
frmData.tblBalance.Refresh;
frmData.tblUnit.Refresh;
frmData.QryItems.Refresh;
frmData.QrySignatory1.Refresh;
frmData.QrySignatory2.Refresh;
frmData.QryPosition1.Refresh;
frmData.QryPosition2.Refresh;
end;

procedure TfrmiRetList.btn2Click(Sender: TObject);
var
  acomponent : TComponent;
begin
    currID := QryRET.FieldByName('retID').AsString;
    QryRetRec.Active := False;
    QryRetRec.Params[0].AsString := currID;
    QryRetRec.Active := True;

    acomponent := Application.FindComponent('frmReportsViewer');
      if not Assigned(acomponent) then
        begin
          frmReportsViewer := TfrmReportsViewer.Create(Application);
        end;
            prprtName := ItemRecieverpt;
            frmReportsViewer.pvwrReportsViewer.Report := prprtName;
            ItemRecieverpt.PrintToDevices;
            frmReportsViewer.Show;
end;

procedure TfrmiRetList.btnNewClick(Sender: TObject);
begin
Screen.Cursor := crHourGlass;
Application.CreateForm(TfrmiRetNew,frmiRetNew);
AddTrue := 1;
frmiRetNew.ShowModal;
Screen.Cursor := crDefault;
end;

procedure TfrmiRetList.btnViewClick(Sender: TObject);
begin
Screen.Cursor := crHourGlass;
Application.CreateForm(TfrmiRetNew,frmiRetNew);
AddTrue := 0;
currID := QryRET.FieldByName('retID').AsString;
frmiRetNew.QryRet.Open;
frmiRetNew.QryRet.Locate('retID',currID,[]);
frmiRetNew.ShowModal;
Screen.Cursor := crDefault;
end;

procedure TfrmiRetList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
AddTrue := 0;
currID := '';
end;

procedure TfrmiRetList.FormShow(Sender: TObject);
begin
if not QryRET.Active then QryRET.Active := True;

if GridRetList.DataSource.DataSet.RecordCount > 0 then
begin
  btnView.Enabled := True;
end
else
begin
  btnView.Enabled := False;
end;
end;

procedure TfrmiRetList.QryRETAfterRefresh(DataSet: TDataSet);
begin
if GridRetList.DataSource.DataSet.RecordCount > 0 then
begin
  btnView.Enabled := True;
end
else
begin
  btnView.Enabled := False;
end;
end;

procedure TfrmiRetList.rb2Click(Sender: TObject);
begin
dbSearch.DataField := 'retID';
dbSearch.Clear;
dbSearch.SetFocus;
end;

procedure TfrmiRetList.rb3Click(Sender: TObject);
begin
dbSearch.DataField := 'retDescription';
dbSearch.Clear;
dbSearch.SetFocus;
end;

procedure TfrmiRetList.rb4Click(Sender: TObject);
begin
dbSearch.DataField := 'Noted/Accepted by';
dbSearch.Clear;
dbSearch.SetFocus;
end;

end.
