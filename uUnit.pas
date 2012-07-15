unit uUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uTemplate1, StdCtrls, Buttons, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls,
  StrUtils, MyAccess, DB, DBAccess;

type
  TfrmUnit = class(TfrmTemplate1)
    procedure btnCANCELClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure wdbgrdDetailKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure wdbgrdDetailKeyPress(Sender: TObject; var Key: Char);
    procedure wdbgrdDetailRowChanged(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUnit: TfrmUnit;
  NewUnitID: Integer;
  NewUnitDescription: string;

implementation

uses modVarType, modPublicVar, modFunctions, dtmData;

{$R *.dfm}

procedure TfrmUnit.btnCANCELClick(Sender: TObject);
begin
  inherited;
  DiscardRecord(frmData.tblUnit);
  Close;
end;

procedure TfrmUnit.btnOKClick(Sender: TObject);
begin
  inherited;
  AcceptRecord(frmData.tblUnit);
  NewUnitID := frmData.tblUnitunit_id.AsInteger;
  NewUnitDescription := frmData.tblUnitunit_description.AsString;
  Close;
end;

procedure TfrmUnit.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  with frmData.tblUnit do
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

procedure TfrmUnit.FormCreate(Sender: TObject);
begin
  inherited;
  with frmData.tblUnit do
    begin
      if not Active then Active := True;
      Refresh;
    end;
end;

procedure TfrmUnit.wdbgrdDetailKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_DELETE then
    begin
      if Dialogs.MessageDlg('Are you sure you want to delete ' + #13#10 + 'Unit "Name: ' + wdbgrdDetail.GetFieldValue(0) + '"?',mtInformation , [mbYes, mbNo], 0, mbYes) = mrYes then
        begin
          with frmData do
            begin
              if tblUnit.RecordCount > 0 then
                begin
                  if not IsRecordExist('item','unit_id',tblUnitunit_id.AsString,'N') then
                    begin
                      DeleteRecord('unit','unit_id',tblUnitunit_id.AsString,'N');
                      tblUnit.Refresh;
                    end
                  else
                    begin
                      raise(Exception.Create('Delete Restriction: Unit "Name: ' + wdbgrdDetail.GetFieldValue(0) + '" already exists on Item table.'));
                    end;
                end
              else
                begin
                  raise(Exception.Create('Delete Restriction: No record exists.'));
                end;
              DisplayRecordCount(tblUnit,pnlRecordCtr);
            end;
        end;
      Key := 0;
    end;
end;

procedure TfrmUnit.wdbgrdDetailKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  with frmData.tblUnit do
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

procedure TfrmUnit.wdbgrdDetailRowChanged(Sender: TObject);
begin
  inherited;
  DisplayRecordCount(frmData.tblUnit,pnlRecordCtr);
end;

end.
