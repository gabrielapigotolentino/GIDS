unit uInventory_main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBAccess, MyAccess, MemDS, StdCtrls, Grids, Wwdbigrd, Wwdbgrid,
  wwdbdatetimepicker, DBCtrls, ComCtrls, StrUtils, JvExStdCtrls, JvEdit,
  JvDBSearchEdit, ppDB, ppDBPipe, ppParameter, ppBands, ppCtrls, ppPrnabl,
  ppClass, ppCache, ppComm, ppRelatv, ppProd, ppReport;

type
  TfrmInventory = class(TForm)
    pgc1: TPageControl;
    QryInv: TMyQuery;
    DSInv: TMyDataSource;
    dbQryInvitem_id: TStringField;
    dbQryInvitem_description: TStringField;
    dbQryInvunit_description: TStringField;
    dbQryInvbrand_description: TStringField;
    dbQryInvqty_onhand: TIntegerField;
    dbQryInvsize_description: TStringField;
    dbQryInvUserName: TStringField;
    ts1: TTabSheet;
    db2: TwwDBGrid;
    dbQryInvRemainder: TIntegerField;
    dbQryInvWhole: TStringField;
    rb3: TRadioButton;
    rb4: TRadioButton;
    dbSearch: TJvDBSearchEdit;
    rb2: TRadioButton;
    lbl1: TLabel;
    rb1: TRadioButton;
    ItemRecieverpt: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppShape1: TppShape;
    ppShape6: TppShape;
    ppShape5: TppShape;
    ppShape4: TppShape;
    ppShape3: TppShape;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel12: TppLabel;
    ppLabel5: TppLabel;
    ppDBText3: TppDBText;
    ppLabel3: TppLabel;
    ppDBText1: TppDBText;
    ppLabel9: TppLabel;
    ppDBText2: TppDBText;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel8: TppLabel;
    ppLabel4: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppShape2: TppShape;
    ppShape7: TppShape;
    ppShape8: TppShape;
    ppShape10: TppShape;
    ppShape9: TppShape;
    ppFooterBand1: TppFooterBand;
    ppLabel7: TppLabel;
    ppDBText5: TppDBText;
    ppParameterList1: TppParameterList;
    IRdbpipeline: TppDBPipeline;
    btn2: TButton;
    ppDBText10: TppDBText;
    ppDBText6: TppDBText;
    ppDBText4: TppDBText;
    ppDBText9: TppDBText;
    ppDBText8: TppDBText;
    ppShape11: TppShape;
    ppShape12: TppShape;
    ppLabel6: TppLabel;
    ppLabel13: TppLabel;
    ppDBText7: TppDBText;
    ppShape13: TppShape;
    ppShape14: TppShape;
    ppDBText11: TppDBText;
    procedure QryInvCalcFields(DataSet: TDataSet);
    procedure rb2Click(Sender: TObject);
    procedure rb3Click(Sender: TObject);
    procedure rb4Click(Sender: TObject);
    procedure rb1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInventory: TfrmInventory;

implementation

uses dtmData, modFunctions, modPublicVar, modVarType, iRecList, uReportsViewer;

{$R *.dfm}

procedure TfrmInventory.btn2Click(Sender: TObject);
var
  acomponent : TComponent;
begin

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

procedure TfrmInventory.QryInvCalcFields(DataSet: TDataSet);
var
qtyperunit, qtywhole, qtyremain : Integer;
qtyperunitlabel, unitdesc : string;
begin
    unitdesc := QryInv.FieldByName('unit_description').AsString;
    qtyperunit := GetQuantityPerUnit(unitdesc);

    qtyperunitlabel := RightStr(unitdesc, Length(unitdesc) - (Length(IntToStr(qtyperunit)) + 2));

    qtywhole := dbQryInvqty_onhand.AsInteger div qtyperunit;

    if qtywhole > 0 then
    begin
      dbQryInvWhole.AsString := IntToStr(qtywhole) + qtyperunitlabel;
    end
    else
    begin
      dbQryInvWhole.AsString := '0'+ qtyperunitlabel;
    end;
    qtyremain := dbQryInvqty_onhand.AsInteger mod qtyperunit;
    if qtyremain > 0 then
    begin
      dbQryInvRemainder.AsInteger := qtyremain;
    end
    else
    begin
      dbQryInvRemainder.AsInteger := 0;
    end;
end;

procedure TfrmInventory.rb1Click(Sender: TObject);
begin
dbSearch.DataField := 'UserName';
dbSearch.Clear;
dbSearch.SetFocus;
end;

procedure TfrmInventory.rb2Click(Sender: TObject);
begin
dbSearch.DataField := 'item_id';
dbSearch.Clear;
dbSearch.SetFocus;
end;

procedure TfrmInventory.rb3Click(Sender: TObject);
begin
dbSearch.DataField := 'item_description';
dbSearch.Clear;
dbSearch.SetFocus;
end;

procedure TfrmInventory.rb4Click(Sender: TObject);
begin
dbSearch.DataField := 'brand_description';
dbSearch.Clear;
dbSearch.SetFocus;
end;

end.
