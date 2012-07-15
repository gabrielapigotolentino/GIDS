unit iAdjList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBAccess, MyAccess, MemDS, Menus, StdCtrls, JvExStdCtrls, JvEdit,
  JvDBSearchEdit, Grids, DBGrids, Buttons, ExtCtrls, ppParameter, ppBands,
  ppCtrls, ppPrnabl, ppClass, ppCache, ppProd, ppReport, ppComm, ppRelatv, ppDB,
  ppDBPipe;

type
  TfrmiAdjList = class(TForm)
    pnl1: TPanel;
    btnNew: TSpeedButton;
    btnView: TSpeedButton;
    btn1: TSpeedButton;
    GridAdjList: TDBGrid;
    pnl2: TPanel;
    lbl1: TLabel;
    dbSearch: TJvDBSearchEdit;
    rb2: TRadioButton;
    rb3: TRadioButton;
    pm1: TPopupMenu;
    N1: TMenuItem;
    Edit1: TMenuItem;
    Refresh1: TMenuItem;
    QryAdj: TMyQuery;
    DSAdj: TMyDataSource;
    DSAdjRec: TMyDataSource;
    QryAdjRec: TMyQuery;
    btn2: TButton;
    IRdbpipeline: TppDBPipeline;
    ItemRecieverpt: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppShape1: TppShape;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel4: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppParameterList1: TppParameterList;
    ppLabel5: TppLabel;
    ppLabel7: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppShape3: TppShape;
    ppShape4: TppShape;
    ppShape5: TppShape;
    ppShape6: TppShape;
    ppShape7: TppShape;
    ppShape8: TppShape;
    ppShape9: TppShape;
    ppShape10: TppShape;
    ppShape11: TppShape;
    ppShape12: TppShape;
    ppShape13: TppShape;
    ppShape14: TppShape;
    ppDBText10: TppDBText;
    ppDBText8: TppDBText;
    ppDBText4: TppDBText;
    ppDBText9: TppDBText;
    ppDBText7: TppDBText;
    ppDBText1: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText12: TppDBText;
    ppLine1: TppLine;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText11: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppLine2: TppLine;
    ppDBText16: TppDBText;
    procedure FormShow(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure rb2Click(Sender: TObject);
    procedure rb3Click(Sender: TObject);
    procedure rb4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryAdjAfterRefresh(DataSet: TDataSet);
    procedure btnViewClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmiAdjList: TfrmiAdjList;

implementation

uses dtmData, iAdjNew, modFunctions, modPublicVar, modVarType, uMain,
  uReportsViewer;

{$R *.dfm}

procedure TfrmiAdjList.btn1Click(Sender: TObject);
begin
QryAdj.Refresh;
frmData.tblBalance.Refresh;
frmData.tblUnit.Refresh;
frmData.QryItems.Refresh;
frmData.QrySignatory1.Refresh;
frmData.QrySignatory2.Refresh;
frmData.QryPosition1.Refresh;
frmData.QryPosition2.Refresh;
end;

procedure TfrmiAdjList.btn2Click(Sender: TObject);
var
  acomponent : TComponent;
begin
    currID := QryAdj.FieldByName('adjID').AsString;
    QryAdjRec.Active := False;
    QryAdjRec.Params[0].AsString := currID;
    QryAdjRec.Active := True;

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

procedure TfrmiAdjList.btnNewClick(Sender: TObject);
begin
Screen.Cursor := crHourGlass;
Application.CreateForm(TfrmiAdjNew,frmiAdjNew);
AddTrue := 1;
frmiAdjNew.ShowModal;
Screen.Cursor := crDefault;
end;

procedure TfrmiAdjList.btnViewClick(Sender: TObject);
begin
Screen.Cursor := crHourGlass;
Application.CreateForm(TfrmiAdjNew,frmiAdjNew);
AddTrue := 0;
currID := QryAdj.FieldByName('adjID').AsString;
frmiAdjNew.QryAdj.Open;
frmiAdjNew.QryAdj.Locate('adjID',currID,[]);
frmiAdjNew.ShowModal;
Screen.Cursor := crDefault;
end;

procedure TfrmiAdjList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
AddTrue := 0;
currID := '';
end;

procedure TfrmiAdjList.FormShow(Sender: TObject);
begin

if not QryAdj.Active then QryAdj.Active := True;

//QryAdj.Active := False;
//QryAdj.Params[0].AsInteger := CurrUser.USER_ID;
//QryAdj.Active := True;

if GridAdjList.DataSource.DataSet.RecordCount > 0 then
begin
  btnView.Enabled := True;
end
else
begin
  btnView.Enabled := False;
end;
end;

procedure TfrmiAdjList.QryAdjAfterRefresh(DataSet: TDataSet);
begin
if GridAdjList.DataSource.DataSet.RecordCount > 0 then
begin
  btnView.Enabled := True;
end
else
begin
  btnView.Enabled := False;
end;
end;

procedure TfrmiAdjList.rb2Click(Sender: TObject);
begin
dbSearch.DataField := 'adjID';
dbSearch.Clear;
dbSearch.SetFocus;
end;

procedure TfrmiAdjList.rb3Click(Sender: TObject);
begin
dbSearch.DataField := 'adjDescription';
dbSearch.Clear;
dbSearch.SetFocus;
end;

procedure TfrmiAdjList.rb4Click(Sender: TObject);
begin
dbSearch.DataField := 'Adjusted By';
dbSearch.Clear;
dbSearch.SetFocus;
end;

end.
