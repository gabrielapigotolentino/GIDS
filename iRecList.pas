unit iRecList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, JvExStdCtrls, JvEdit, JvDBSearchEdit, Grids,
  DBGrids, Buttons, ExtCtrls, DB, DBAccess, MyAccess, MemDS, ppProd, ppClass,
  ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, ppCtrls, ppPrnabl, ppBands,
  ppCache, ppParameter;

type
  TfrmiRec = class(TForm)
    pnl1: TPanel;
    btnNew: TSpeedButton;
    btnView: TSpeedButton;
    btn1: TSpeedButton;
    GridRecList: TDBGrid;
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
    QryREC: TMyQuery;
    DSRec: TMyDataSource;
    QryRecRec: TMyQuery;
    DSRecRec: TMyDataSource;
    btn2: TButton;
    IRdbpipeline: TppDBPipeline;
    ItemRecieverpt: TppReport;
    ppParameterList1: TppParameterList;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel5: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel4: TppLabel;
    ppShape1: TppShape;
    ppShape2: TppShape;
    ppShape3: TppShape;
    ppShape4: TppShape;
    ppShape5: TppShape;
    ppShape6: TppShape;
    ppShape7: TppShape;
    ppShape8: TppShape;
    ppShape9: TppShape;
    ppShape10: TppShape;
    ppDBText1: TppDBText;
    ppDBText3: TppDBText;
    ppDBText2: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText4: TppDBText;
    ppDBText9: TppDBText;
    ppDBText11: TppDBText;
    ppDBText6: TppDBText;
    ppDBText5: TppDBText;
    ppDBText10: TppDBText;
    ppLine1: TppLine;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppLine2: TppLine;
    ppLabel6: TppLabel;
    procedure btnNewClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnViewClick(Sender: TObject);
    procedure QryRECAfterRefresh(DataSet: TDataSet);
    procedure rb2Click(Sender: TObject);
    procedure rb3Click(Sender: TObject);
    procedure rb4Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmiRec: TfrmiRec;


implementation

uses dtmData, iRecNew, modFunctions, modPublicVar, modVarType, uInventory_main,
  uMain, uReportsViewer;

{$R *.dfm}

procedure TfrmiRec.btn1Click(Sender: TObject);
begin
QryREC.Refresh;
frmData.tblBalance.Refresh;
frmData.tblUnit.Refresh;
frmData.QryItems.Refresh;
frmData.QrySignatory1.Refresh;
frmData.QrySignatory2.Refresh;
frmData.QryPosition1.Refresh;
frmData.QryPosition2.Refresh;
end;

procedure TfrmiRec.btn2Click(Sender: TObject);
var
  acomponent : TComponent;
begin
    currID := QryREC.FieldByName('recID').AsString;
    QryRecRec.Active := False;
    QryRecRec.Params[0].AsString := currID;
    QryRecRec.Active := True;

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

procedure TfrmiRec.btnNewClick(Sender: TObject);
begin
Screen.Cursor := crHourGlass;
Application.CreateForm(TfrmiRecNew,frmiRecNew);
AddTrue := 1;
frmiRecNew.ShowModal;
Screen.Cursor := crDefault;
end;

procedure TfrmiRec.btnViewClick(Sender: TObject);
begin
Screen.Cursor := crHourGlass;
Application.CreateForm(TfrmiRecNew,frmiRecNew);
AddTrue := 0;
currID := QryREC.FieldByName('recID').AsString;
frmiRecNew.QryRec.Open;
frmiRecNew.QryRec.Locate('recID',currID,[]);
frmiRecNew.ShowModal;
Screen.Cursor := crDefault;
end;

procedure TfrmiRec.FormClose(Sender: TObject; var Action: TCloseAction);
begin
AddTrue := 0;
currID := '';
end;

procedure TfrmiRec.FormShow(Sender: TObject);
begin
if not QryREC.Active then QryREC.Active := True;


if GridRecList.DataSource.DataSet.RecordCount > 0 then
begin
  btnView.Enabled := True;
end
else
begin
  btnView.Enabled := False;
end;
end;

procedure TfrmiRec.QryRECAfterRefresh(DataSet: TDataSet);
begin
if GridRecList.DataSource.DataSet.RecordCount > 0 then
begin
  btnView.Enabled := True;
end
else
begin
  btnView.Enabled := False;
end;
end;

procedure TfrmiRec.rb2Click(Sender: TObject);
begin
dbSearch.DataField := 'recID';
dbSearch.Clear;
dbSearch.SetFocus;
end;

procedure TfrmiRec.rb3Click(Sender: TObject);
begin
dbSearch.DataField := 'recDescription';
dbSearch.Clear;
dbSearch.SetFocus;
end;

procedure TfrmiRec.rb4Click(Sender: TObject);
begin
dbSearch.DataField := 'Received by';
dbSearch.Clear;
dbSearch.SetFocus;
end;

end.
