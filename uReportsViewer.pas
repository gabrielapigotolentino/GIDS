unit uReportsViewer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, ComCtrls, ToolWin, Menus, StdCtrls, ExtCtrls,
  StrUtils, ppTypes, ppViewr, ppPrintr, ppReport;

type
  TfrmReportsViewer = class(TForm)
    tlbPrintPreview: TToolBar;
    ilPrintPreview: TImageList;
    pmZoom: TPopupMenu;
    btnPrint: TToolButton;
    btn1: TToolButton;
    btnPrior: TToolButton;
    btnNext: TToolButton;
    btn2: TToolButton;
    btn100Zoom: TToolButton;
    btnMinus: TToolButton;
    pmZoom25: TMenuItem;
    pmZoom50: TMenuItem;
    pmZoom75: TMenuItem;
    pmZoom100: TMenuItem;
    pmZoom150: TMenuItem;
    pmZoom200: TMenuItem;
    pmZoom250: TMenuItem;
    btnPlus: TToolButton;
    btnZoomPercent: TToolButton;
    clbrPrintPreview: TCoolBar;
    pvwrReportsViewer: TppViewer;
    pnlPageTotal: TPanel;
    pnlZoomPercent: TPanel;
    edtZoomPercent: TEdit;
    pnlPageCounter: TPanel;
    edtPageCounter: TEdit;
    btn3: TToolButton;
    btnPageWidth: TToolButton;
    btnWholePage: TToolButton;
    btn4: TToolButton;
    btn5: TToolButton;
    btn6: TToolButton;
    procedure pmZoom200Click(Sender: TObject);
    procedure pmZoom25Click(Sender: TObject);
    procedure pmZoom50Click(Sender: TObject);
    procedure pmZoom75Click(Sender: TObject);
    procedure pmZoom100Click(Sender: TObject);
    procedure pmZoom150Click(Sender: TObject);
    procedure pmZoom250Click(Sender: TObject);
    procedure btnPlusClick(Sender: TObject);
    procedure btnMinusClick(Sender: TObject);
    procedure edtZoomPercentExit(Sender: TObject);
    procedure edtZoomPercentKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtZoomPercentEnter(Sender: TObject);
    procedure btnPriorClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btn100ZoomClick(Sender: TObject);
    procedure edtPageCounterKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtPageCounterEnter(Sender: TObject);
    procedure edtPageCounterExit(Sender: TObject);
    procedure edtPageCounterClick(Sender: TObject);
    procedure edtZoomPercentClick(Sender: TObject);
    procedure edtZoomPercentKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure btnPageWidthClick(Sender: TObject);
    procedure btnWholePageClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure btn6Click(Sender: TObject);
  private
    { Private declarations }
    CurrentPageNumber: Byte;
    CurrentPercentValue: Byte;
    PercentChange: Boolean;

    procedure PageNumber;
    procedure ZoomPercent(zpOption: Char; zpValue: Byte);
  public
    { Public declarations }
  end;

var
  frmReportsViewer: TfrmReportsViewer;
  prprtName: TppReport;

implementation

{$R *.dfm}

procedure TfrmReportsViewer.btn100ZoomClick(Sender: TObject);
begin
  pvwrReportsViewer.ZoomSetting := zs100Percent;
  ZoomPercent('O',pvwrReportsViewer.CalculatedZoom);
end;

procedure TfrmReportsViewer.btn5Click(Sender: TObject);
begin
	Close;
end;

procedure TfrmReportsViewer.btn6Click(Sender: TObject);
var
	myPrinter: TppPrinter;
begin
	myPrinter := TppPrinter.Create;
  if myPrinter.ShowSetupDialog then
  	begin
  		prprtName.PrinterSetup := myPrinter.PrinterSetup;
    end;
end;

procedure TfrmReportsViewer.btnMinusClick(Sender: TObject);
begin
  ZoomPercent('M',5);
end;

procedure TfrmReportsViewer.btnNextClick(Sender: TObject);
begin
  pvwrReportsViewer.NextPage;
  PageNumber;
end;

procedure TfrmReportsViewer.btnPageWidthClick(Sender: TObject);
begin
  pvwrReportsViewer.ZoomSetting := zsPageWidth;
  ZoomPercent('O',pvwrReportsViewer.CalculatedZoom);
end;

procedure TfrmReportsViewer.btnPlusClick(Sender: TObject);
begin
  ZoomPercent('P',5);
end;

procedure TfrmReportsViewer.btnPrintClick(Sender: TObject);
begin
  pvwrReportsViewer.Print;
end;

procedure TfrmReportsViewer.btnPriorClick(Sender: TObject);
begin
  pvwrReportsViewer.PriorPage;
  PageNumber;
end;

procedure TfrmReportsViewer.btnWholePageClick(Sender: TObject);
begin
  pvwrReportsViewer.ZoomSetting := zsWholePage;
  ZoomPercent('O',pvwrReportsViewer.CalculatedZoom);
end;

procedure TfrmReportsViewer.edtPageCounterClick(Sender: TObject);
begin
  edtPageCounter.SelectAll;
end;

procedure TfrmReportsViewer.edtPageCounterEnter(Sender: TObject);
begin
  CurrentPageNumber := StrToInt(edtPageCounter.Text);
end;

procedure TfrmReportsViewer.edtPageCounterExit(Sender: TObject);
begin
  with pvwrReportsViewer do
    begin
      if edtPageCounter.Text <> '' then
        begin
          if (StrToInt(edtPageCounter.Text) > 0) and (StrToInt(edtPageCounter.Text) <= CurrentPage.PageCount) then
            begin
              GotoPage(StrToInt(edtPageCounter.Text));
            end
          else
            begin
              GotoPage(CurrentPage.PageCount);
            end;
          PageNumber;
        end
      else
        begin
          GotoPage(CurrentPageNumber);
          PageNumber;
          edtPageCounter.SetFocus;
          edtPageCounter.SelectAll;
        end;
    end;
end;

procedure TfrmReportsViewer.edtPageCounterKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    begin
      pvwrReportsViewer.SetFocus;
      Key := 0;
    end;
end;

procedure TfrmReportsViewer.edtZoomPercentClick(Sender: TObject);
begin
  PercentChange := False;
  edtZoomPercent.SelectAll;
end;

procedure TfrmReportsViewer.edtZoomPercentEnter(Sender: TObject);
var
  zoomLen: Byte;
begin
  zoomLen := Length(edtZoomPercent.Text) - 1;
  CurrentPercentValue := StrToInt(LeftStr(edtZoomPercent.Text,zoomLen));
end;

procedure TfrmReportsViewer.edtZoomPercentExit(Sender: TObject);
var
  zoomNewValue: Byte;
  zoomPercentValue: Integer;
begin
  if PercentChange then
    begin
      PercentChange := False;
      zoomPercentValue := StrToInt(Trim(edtZoomPercent.Text));
      with pvwrReportsViewer do
        begin
          if edtZoomPercent.Text <> '' then
            begin
              if (zoomPercentValue >= 25) and (zoomPercentValue <= 250) then
                begin
                  zoomNewValue := zoomPercentValue;
                end
              else if zoomPercentValue < 25 then
                begin
                  zoomNewValue := 25;
                end
              else if zoomPercentValue > 250 then
                begin
                  zoomNewValue := 250;
                end;
              ZoomPercent('O',zoomNewValue);
            end
          else
            begin
              ZoomPercent('O',CurrentPercentValue);
              edtZoomPercent.SetFocus;
              edtZoomPercent.SelectAll;
            end;
        end;
    end;
end;

procedure TfrmReportsViewer.edtZoomPercentKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    begin
      pvwrReportsViewer.SetFocus;
      Key := 0;
    end;
end;

procedure TfrmReportsViewer.edtZoomPercentKeyPress(Sender: TObject;
  var Key: Char);
begin
  PercentChange := True;
end;

procedure TfrmReportsViewer.FormShow(Sender: TObject);
begin
  with pvwrReportsViewer do
    begin
      FirstPage;
      PageNumber;
      ZoomPercent('O',pvwrReportsViewer.CalculatedZoom);
      SetFocus;
      if CurrentPage.PageCount = 1 then
        begin
          btnPrior.Enabled := False;
          btnNext.Enabled := False;
          edtPageCounter.Enabled := False;
        end;
    end;
end;

procedure TfrmReportsViewer.PageNumber;
begin
  with pvwrReportsViewer.CurrentPage do
    begin
      edtPageCounter.Text := IntToStr(PageNo);
      pnlPageTotal.Caption := ' of ' + IntToStr(PageCount);
    end;
end;

procedure TfrmReportsViewer.pmZoom100Click(Sender: TObject);
begin
  ZoomPercent('O',100);
end;

procedure TfrmReportsViewer.pmZoom150Click(Sender: TObject);
begin
  ZoomPercent('O',150);
end;

procedure TfrmReportsViewer.pmZoom200Click(Sender: TObject);
begin
  ZoomPercent('O',200);
end;

procedure TfrmReportsViewer.pmZoom250Click(Sender: TObject);
begin
  ZoomPercent('O',250);
end;

procedure TfrmReportsViewer.pmZoom25Click(Sender: TObject);
begin
  ZoomPercent('O',25);
end;

procedure TfrmReportsViewer.pmZoom50Click(Sender: TObject);
begin
  ZoomPercent('O',50);
end;

procedure TfrmReportsViewer.pmZoom75Click(Sender: TObject);
begin
  ZoomPercent('O',75);
end;

procedure TfrmReportsViewer.ZoomPercent(zpOption: Char; zpValue: Byte);
var
  rightValue,modValue: Byte;
begin
  with pvwrReportsViewer do
    begin
      modValue := ZoomPercentage mod zpValue;
      if zpOption = 'M' then
        begin
          if modValue <> 0 then
            begin
              rightValue := StrToInt(RightStr(IntToStr(ZoomPercentage),1));
              ZoomPercentage := ZoomPercentage - (zpValue + rightValue);
            end
          else
            begin
              ZoomPercentage := ZoomPercentage - zpValue;
            end;
        end;
      if zpOption = 'P' then
        begin
          if modValue <> 0 then
            begin
              rightValue := StrToInt(RightStr(IntToStr(ZoomPercentage),1));
              ZoomPercentage := ZoomPercentage + (zpValue - rightValue);
            end
          else
            begin
              ZoomPercentage := ZoomPercentage + zpValue;
            end;
        end;
      if zpOption = 'O' then
        begin
          ZoomPercentage := zpValue;
        end;
      edtZoomPercent.Text := IntToStr(ZoomPercentage) + '%';
    end;
end;

end.
