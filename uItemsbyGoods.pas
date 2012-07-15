unit uItemsbyGoods;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uTemplate2, StdCtrls, Buttons, Grids, Wwdbigrd, Wwdbgrid, wwdblook,
  ExtCtrls, StrUtils, DB, DBAccess, MyAccess, Wwdbdlg;

type
  TfrmItemsbyGoods = class(TfrmTemplate2)
    wdblkpcmbItem: TwwDBLookupCombo;
    procedure FormCreate(Sender: TObject);
    procedure wdblkpcmbSelectionCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure FormShow(Sender: TObject);
    procedure wdblkpcmbItemCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure btnOKClick(Sender: TObject);
    procedure btnCANCELClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure wdbgrdDetailKeyPress(Sender: TObject; var Key: Char);
    procedure wdbgrdDetailRowChanged(Sender: TObject);
    procedure wdbgrdDetailKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure wdblkpcmbSelectionExit(Sender: TObject);
    procedure btnCANCELMouseEnter(Sender: TObject);
    procedure btnCANCELMouseLeave(Sender: TObject);
    procedure wdbgrdDetailFieldChanged(Sender: TObject; Field: TField);
  private
    { Private declarations }
    goodstypeID: Integer;
    IsButtonClick,ItemSelect: Boolean;
    CurItemID,NewItemID,IGTable: string;
    CurState,ItemState: Char;
    procedure ButtonMenu(bmOption: Byte);
    procedure GoodsRefresh();
    procedure ItemsbyGoodsRefresh();
    procedure TempRecords(trOption: Char);
    procedure UpdateRecords();
  public
    { Public declarations }
  end;

var
  frmItemsbyGoods: TfrmItemsbyGoods;

implementation

uses modVarType, modPublicVar, modFunctions, dtmData;

{$R *.dfm}

procedure TfrmItemsbyGoods.btnCANCELClick(Sender: TObject);
begin
  inherited;
  if btnCANCEL.Caption = '&CLOSE' then
    begin
      Close;
    end
  else
    begin
      DiscardRecord(frmData.qryItemsbyGoods);
      TempRecords('R');
      ItemsbyGoodsRefresh;
      frmData.qryItemsbyGoods.Locate('item_id',CurItemID,[loCaseInsensitive]);
      setGridOption(wdbgrdDetail,0);
      ButtonMenu(0);
    end;
end;

procedure TfrmItemsbyGoods.btnCANCELMouseEnter(Sender: TObject);
begin
  inherited;
  IsButtonClick := True;
end;

procedure TfrmItemsbyGoods.btnCANCELMouseLeave(Sender: TObject);
begin
  inherited;
  IsButtonClick := False;
end;

procedure TfrmItemsbyGoods.btnOKClick(Sender: TObject);
var
  ItemID: string;
begin
  inherited;
  ItemID := '';
  AcceptRecord(frmData.qryItemsbyGoods);
  TempRecords('B');
  if (ItemState = 'N') or (ItemState = 'E') then
    begin
      ItemID := NewItemID;
    end
  else
    begin
      ItemID := CurItemID;
    end;
  ItemsbyGoodsRefresh;
  frmData.qryItemsbyGoods.Locate('item_id',ItemID,[loCaseInsensitive]);
  setGridOption(wdbgrdDetail,0);
  ButtonMenu(0);
  wdbgrdDetail.SetFocus;
end;

procedure TfrmItemsbyGoods.ButtonMenu(bmOption: Byte);
begin
  if bmOption = 0 then
    begin
      btnOK.Visible := False;
      btnOK.Enabled := False;
      btnCANCEL.Caption := '&CLOSE';
      setGridOption(wdbgrdDetail,0);
    end;
  if bmOption = 1 then
    begin
      btnOK.Visible := True;
      btnCANCEL.Caption := 'CA&NCEL';
      setGridOption(wdbgrdDetail,1);
    end;
  CurItemID := '';
  NewItemID := '';
  CurState := ' ';
  ItemState := ' ';
end;

procedure TfrmItemsbyGoods.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  with frmData.qryItemsbyGoods do
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
  if Action = caFree then
    begin
      TempRecords('D');
    end;

end;

procedure TfrmItemsbyGoods.FormCreate(Sender: TObject);
begin
  inherited;
  IGTable := '';
  IGTable := IGTable + 'DROP TABLE IF EXISTS `temp_itemsbygoods`;';
  IGTable := IGTable + 'CREATE TABLE `temp_itemsbygoods` (';
  IGTable := IGTable + '  `goodstype_id` int(11) NOT NULL DEFAULT "0",';
  IGTable := IGTable + '  `item_id` varchar(20) NOT NULL DEFAULT "",';
  IGTable := IGTable + '  `itemsbygoods_qty` decimal(10,2) NOT NULL DEFAULT "0.00",';
  IGTable := IGTable + '  `UserID` int(11) NOT NULL DEFAULT "0",';
  IGTable := IGTable + '  `TransDate` timestamp NOT NULL DEFAULT "0000-00-00 00:00:00" ON UPDATE CURRENT_TIMESTAMP,';
  IGTable := IGTable + 'KEY `goodstype_id` (`goodstype_id`),';
  IGTable := IGTable + 'KEY `item_id` (`item_id`),';
  IGTable := IGTable + 'KEY `UserID` (`UserID`)';
  IGTable := IGTable + ') ENGINE=MyISAM DEFAULT CHARSET=latin1;';

  with frmData do
    begin
      if not tblGoodsType.Active then tblGoodsType.Active := True;
      tblGoodsType.Refresh;
      if not tblUnit.Active then tblUnit.Active := True;
      tblUnit.Refresh;
      if not tblItem.Active then tblItem.Active := True;
      tblItem.Refresh;
    end;
  TempRecords('B');
  goodstypeID := 0;
  wdblkpcmbSelection.Text := '';
  ItemsbyGoodsRefresh;
  ButtonMenu(0);
end;

procedure TfrmItemsbyGoods.FormShow(Sender: TObject);
begin
  inherited;
  IsButtonClick := False;
  ItemSelect := False;
  wdblkpcmbSelection.SetFocus;
end;

procedure TfrmItemsbyGoods.GoodsRefresh;
begin
  inherited;
  goodstypeID := 0;
  if wdblkpcmbSelection.Text <> '' then
    begin
      goodstypeID := frmData.tblGoodsTypegoodstype_id.AsInteger;
      wdbgrdDetail.SetFocus;
    end
  else
    begin
      if not IsButtonClick then
        begin
          wdblkpcmbSelection.SetFocus;
        end;
    end;
  setGridOption(wdbgrdDetail,0);
  ItemsbyGoodsRefresh;
end;

procedure TfrmItemsbyGoods.UpdateRecords;
var
  ctr: Byte;
begin
  with frmData do
    begin
      ItemSelect := True;
      NewItemID := qryAIitem_id.AsString;
      if qryItemsbyGoods.State in [dsInsert, dsEdit] then
        begin
          if not tblItem.Locate('item_id',NewItemID,[loCaseInsensitive]) then
            begin
              qryItemsbyGoods.Cancel;
              Dialogs.MessageDlg(NewItemID + '" does not exist.',mtError,[mbOK],0);
            end
          else if not qryAI.Locate('item_id',NewItemID,[loCaseInsensitive]) then
            begin
              qryItemsbyGoods.Cancel;
              Dialogs.MessageDlg(NewItemID + '" already exist.',mtError,[mbOK],0);
            end
          else
            begin
              if qryItemsbyGoods.State = dsInsert then
                begin
                  ItemState := 'N';
                  qryItemsbyGoodsgoodstype_id.Value := goodstypeID;
                  qryItemsbyGoodsitem_id.Value := NewItemID;
                  qryItemsbyGoodsitemsbygoods_qty.Value := 1;
                end
              else if qryItemsbyGoods.State = dsEdit then
                begin
                  ItemState := 'E';
                  qryItemsbyGoodsgoodstype_id.Value := goodstypeID;
                  qryItemsbyGoodsitem_id.Value := NewItemID;
                  qryItemsbyGoodsitemsbygoods_qty.Value := 1;
                end;
              qryItemsbyGoods.Refresh;
              ItemsbyGoodsRefresh;
              qryItemsbyGoods.Locate('item_id',NewItemID,[loCaseInsensitive]);
              qryItemsbyGoods.Edit;
              if (qryItemsbyGoods.State = dsEdit) and (ItemSelect) then
                begin
                  ItemSelect := False;
                  CurState := 'E';
                end;
            end;
        end;
    end;
end;

procedure TfrmItemsbyGoods.ItemsbyGoodsRefresh;
begin
  with frmData do
    begin
      qryItemsbyGoods.Active := False;
      qryItemsbyGoods.Params[0].AsInteger := goodstypeID;
      qryItemsbyGoods.Active := True;

      qryAI.Active := False;
      qryAI.Params[0].AsInteger := goodstypeID;
      qryAI.Active := True;
    end;
end;

procedure TfrmItemsbyGoods.TempRecords(trOption: Char);
begin
  BRDRecords(trOption,frmData.qrytemp,IGTable,'itemsbygoods','temp_itemsbygoods');
end;

procedure TfrmItemsbyGoods.wdbgrdDetailFieldChanged(Sender: TObject;
  Field: TField);
begin
  inherited;
  btnOK.Enabled := True;
end;

procedure TfrmItemsbyGoods.wdbgrdDetailKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  with frmData.qryItemsbyGoods do
    begin
      if State in [dsInsert, dsEdit] then
        begin
          if (Key = VK_UP) or (Key = VK_DOWN) then
            begin
              Key := 0;
            end;
        end;
    end;
end;

procedure TfrmItemsbyGoods.wdbgrdDetailKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  with frmData do
    begin
      if (qryItemsbyGoods.State = dsBrowse) and (wdblkpcmbSelection.Text <> '') then
        begin
          if (Key = #78) or (Key = #110) then
            begin
              ButtonMenu(1);
              CurState := 'N';
              CurItemID := wdbgrdDetail.GetFieldValue(0);
              qryItemsbyGoods.Append;
              Key := #0;
            end;
          if qryItemsbyGoods.RecordCount > 0 then
            begin
              if (Key = #69) or (Key = #101) then
                begin
                  ButtonMenu(1);
                  CurState := 'E';
                  CurItemID := wdbgrdDetail.GetFieldValue(0);
                  qryItemsbyGoods.Edit;
                  Key := #0;
                end;
            end;
        end;
    end;
end;

procedure TfrmItemsbyGoods.wdbgrdDetailRowChanged(Sender: TObject);
begin
  inherited;
  with frmData do
    begin
      DisplayRecordCount(qryItemsbyGoods,pnlRecordCtr);
      with qryItemsbyGoods do
        begin
          if not IsButtonClick then
            begin
              if (State = dsBrowse) and ((CurState = 'E') or (CurState = 'N')) and (not ItemSelect) then
                begin
                  CurState := ' ';
                  btnCANCELClick(Sender);
                end;
            end;
        end;
    end;
end;

procedure TfrmItemsbyGoods.wdblkpcmbItemCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  UpdateRecords;
end;

procedure TfrmItemsbyGoods.wdblkpcmbSelectionCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  GoodsRefresh;
end;

procedure TfrmItemsbyGoods.wdblkpcmbSelectionExit(Sender: TObject);
begin
  inherited;
  GoodsRefresh;
end;

end.
