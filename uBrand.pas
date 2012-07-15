unit uBrand;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uTemplate1, StdCtrls, Buttons, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls,
  StrUtils, MyAccess, DB, DBAccess;

type
  TfrmBrand = class(TfrmTemplate1)
    procedure FormCreate(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnCANCELClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure wdbgrdDetailRowChanged(Sender: TObject);
    procedure wdbgrdDetailKeyPress(Sender: TObject; var Key: Char);
    procedure wdbgrdDetailKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBrand: TfrmBrand;
  NewBrandID: Integer;
  NewBrandDescription: String;

implementation

uses modVarType, modPublicVar, modFunctions, dtmData;

{$R *.dfm}

procedure TfrmBrand.btnCANCELClick(Sender: TObject);
begin
  inherited;
  DiscardRecord(frmData.tblBrand);
  Close;
end;

procedure TfrmBrand.btnOKClick(Sender: TObject);
begin
  inherited;
  AcceptRecord(frmData.tblBrand);
  NewBrandID := frmData.tblBrandbrand_id.AsInteger;
  NewBrandDescription := frmData.tblBrandbrand_description.AsString;
  Close;
end;

procedure TfrmBrand.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  with frmData.tblBrand do
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

procedure TfrmBrand.FormCreate(Sender: TObject);
begin
  inherited;
  with frmData.tblBrand do
    begin
      if not Active then Active := True;
      Refresh;
    end;
end;

procedure TfrmBrand.wdbgrdDetailKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_DELETE then
    begin
      if Dialogs.MessageDlg('Are you sure you want to delete ' + #13#10 + 'Brand "Name: ' + wdbgrdDetail.GetFieldValue(0) + '"?',mtInformation , [mbYes, mbNo], 0, mbYes) = mrYes then
        begin
          with frmData do
            begin
              if tblBrand.RecordCount > 0 then
                begin
                  if not IsRecordExist('item','brand_id',tblBrandbrand_id.AsString,'N') then
                    begin
                      DeleteRecord('brand','brand_id',tblBrandbrand_id.AsString,'N');
                      tblBrand.Refresh;
                    end
                  else
                    begin
                      raise(Exception.Create('Delete Restriction: Brand "Name: ' + wdbgrdDetail.GetFieldValue(0) + '" already exists on Item table.'));
                    end;
                end
              else
                begin
                  raise(Exception.Create('Delete Restriction: No record exists.'));
                end;
              DisplayRecordCount(tblBrand,pnlRecordCtr);
            end;
        end;
      Key := 0;
    end;
end;

procedure TfrmBrand.wdbgrdDetailKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  with frmData.tblBrand do
    begin
      if State = dsBrowse then
        begin
          if (Key = #78) or (Key = #110) then
            begin
              Append;
            end;
        end;
    end;
end;

procedure TfrmBrand.wdbgrdDetailRowChanged(Sender: TObject);
begin
  inherited;
  DisplayRecordCount(frmData.tblBrand,pnlRecordCtr);
end;

end.
