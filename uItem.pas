unit uItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, wwdblook, Mask, wwdbedit, ExtCtrls, StrUtils, DBAccess,
  DB, MyAccess, Buttons, MemDS, wwclearbuttongroup, wwradiogroup;

type
  TfrmItem = class(TForm)
    pnlDetail: TPanel;
    pnlMenu: TPanel;
    edtItemID: TwwDBEdit;
    edtItemDescription: TwwDBEdit;
    wdblkpcmbBrand: TwwDBLookupCombo;
    wdblkpcmbSize: TwwDBLookupCombo;
    lblItemID: TLabel;
    lblItemDescription: TLabel;
    lblItemBrand: TLabel;
    lblItemSize: TLabel;
    lblCol1: TLabel;
    lblCol2: TLabel;
    lblCol3: TLabel;
    lblCol4: TLabel;
    btnOK: TBitBtn;
    btnCANCEL: TBitBtn;
    btnBrand: TSpeedButton;
    btnSize: TSpeedButton;
    lblUnit: TLabel;
    lblCol5: TLabel;
    wdblkpcmbUnit: TwwDBLookupCombo;
    btnUnit: TSpeedButton;
    pnlItemID: TPanel;
    qryiBalanceItem: TMyQuery;
    wrdgrpType: TwwRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure btnCANCELClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnBrandClick(Sender: TObject);
    procedure btnSizeClick(Sender: TObject);
    procedure btnUnitClick(Sender: TObject);
    procedure edtItemDescriptionExit(Sender: TObject);
    procedure wrdgrpTypeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmItem: TfrmItem;
  PerformItem: Char;
  EditItemID: string;

implementation

uses modVarType, modPublicVar, modFunctions, dtmData, uBrand, uSize, uUnit;

{$R *.dfm}

{ TfrmItem }

procedure TfrmItem.btnBrandClick(Sender: TObject);
begin
  NewBrandID := 0;
  NewBrandDescription := '';
  with TfrmBrand.Create(Self) do
    begin
        try
          ShowModal;
        finally
          Free;
        end;
    end;
  with frmData do
    begin
      tblBrand.Refresh;
      wdblkpcmbBrand.Text := NewBrandDescription;
      tblItembrand_id.Value := NewBrandID;
      wdblkpcmbBrand.SetFocus;
    end;
end;

procedure TfrmItem.btnCANCELClick(Sender: TObject);
begin
  DiscardRecord(frmData.tblItem);
  Close;
end;

procedure TfrmItem.btnOKClick(Sender: TObject);
var
  sqlqry: string;
begin
  AcceptRecord(frmData.tblItem);
  EditItemID := frmData.tblItemitem_id.AsString;
  if PerformItem = 'N' then
    begin
      sqlqry := '';
      sqlqry := sqlqry + 'INSERT INTO ibalance (item_id, qty_onhand, UserID, TransDate) VALUES';
      sqlqry := sqlqry + '("';
      sqlqry := sqlqry + EditItemID;
      sqlqry := sqlqry + '",0,';
      sqlqry := sqlqry + IntToStr(CurrUser.USER_ID);
      sqlqry := sqlqry + ',"';
      sqlqry := sqlqry + FormatDateTime('yyyy-mm-dd hh:nn:ss',Now);
      sqlqry := sqlqry + '")';
      with qryiBalanceItem do
        begin
          Close;
          SQL.Clear;
          SQL.Text := sqlqry;
          Execute;

          Close;
          SQL.Clear;
          SQL.Text := 'SELECT * FROM ibalance';
          Open;

          Close;
        end;
    end;
  Close;
end;

procedure TfrmItem.btnSizeClick(Sender: TObject);
begin
  NewSizeID := 0;
  NewSizeDescription := '';
  with TfrmSize.Create(Self) do
    begin
        try
          ShowModal;
        finally
          Free;
        end;
    end;
  with frmData do
    begin
      tblSize.Refresh;
      wdblkpcmbSize.Text := NewSizeDescription;
      tblItemsize_id.Value := NewSizeID;
      wdblkpcmbSize.SetFocus;
    end;
end;

procedure TfrmItem.btnUnitClick(Sender: TObject);
begin
  NewUnitID := 0;
  NewUnitDescription := '';
  with TfrmUnit.Create(Self) do
    begin
        try
          ShowModal;
        finally
          Free;
        end;
    end;
  with frmData do
    begin
      tblUnit.Refresh;
      wdblkpcmbUnit.Text := NewUnitDescription;
      tblItemunit_id.Value := NewUnitID;
      wdblkpcmbUnit.SetFocus;
    end;
end;

procedure TfrmItem.edtItemDescriptionExit(Sender: TObject);
begin
  edtItemDescription.Text := Trim(edtItemDescription.Text);
end;

procedure TfrmItem.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with frmData.tblItem do
    begin
      if State in [dsInsert, dsEdit] then
        begin
          if (State = dsInsert) and (Modified <> True) then
            begin
              btnCANCELClick(Sender);
              Action := caFree;
            end
          else
            begin
              case Application.MessageBox(PChar('Do you want to save changes?'), PChar(Application.Title), mb_YESNOCANCEL + mb_DefButton1 + mb_IconWarning) of
                IDYES:
                  begin
                    btnOKClick(Sender);
                    Action := caFree;
                  end;
                IDNO:
                  begin
                    btnCANCELClick(Sender);
                    Action := caFree;
                  end;
                IDCANCEL:
                  begin
                    Action := caNone;
                  end;
              end;
            end;
        end
      else
        begin
          Action := caFree;
        end;
    end;
end;

procedure TfrmItem.FormCreate(Sender: TObject);
var
  NewID: string;
begin
  if PerformItem = 'N' then
    begin
      Caption := 'Item (New)';
      NewID := '';
      NewID := SetNewID('item','item_id','G-',5);
    end
  else if PerformItem = 'E' then
    begin
      Caption := 'Item (Edit)';
    end;
  with frmData do
    begin
      if not tblItem.Active then tblItem.Active := True;
      tblItem.Refresh;
      if not tblBrand.Active then tblBrand.Active := True;
      tblBrand.Refresh;
      if not tblSize.Active then tblSize.Active := True;
      tblSize.Refresh;
      if not tblUnit.Active then tblUnit.Active := True;
      tblUnit.Refresh;
      if PerformItem = 'N' then
        begin
          tblItem.Append;
          edtItemID.Text := NewID;
        end
      else if PerformItem = 'E' then
        begin
          if tblItem.Locate('item_id',EditItemID,[]) then
            begin
              tblItem.Edit;
            end;
        end;
    end;
end;

procedure TfrmItem.FormShow(Sender: TObject);
begin
  edtItemDescription.SetFocus;
end;

procedure TfrmItem.wrdgrpTypeClick(Sender: TObject);
begin
//  ShowMessage(wrdgrpType.Items[wrdgrpType.ItemIndex]);
//  ShowMessage(wrdgrpType.Values[wrdgrpType.ItemIndex]);
end;

end.
