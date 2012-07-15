unit uSignatory;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uTemplate2, StdCtrls, Buttons, Grids, Wwdbigrd, Wwdbgrid, wwdblook,
  ExtCtrls, StrUtils, DB, DBAccess, MyAccess;

type
  TfrmSignatory = class(TfrmTemplate2)
    wdblkpcmbDesignation: TwwDBLookupCombo;
    procedure btnCANCELClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure wdbgrdDetailKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure wdbgrdDetailKeyPress(Sender: TObject; var Key: Char);
    procedure wdbgrdDetailRowChanged(Sender: TObject);
    procedure wdblkpcmbSelectionExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure wdblkpcmbSelectionCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure wdblkpcmbDesignationCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure wdblkpcmbDesignationExit(Sender: TObject);
  private
    PositionID: Integer;
    { Private declarations }
    procedure SignatoryList();
    procedure ValidateDesignation();
    procedure ValidatePosition();
  public
    { Public declarations }
  end;

var
  frmSignatory: TfrmSignatory;

implementation

uses modVarType, modPublicVar, modFunctions, dtmData;

{$R *.dfm}

procedure TfrmSignatory.btnCANCELClick(Sender: TObject);
begin
  inherited;
  DiscardRecord(frmData.qryListOfSignatory);
  Close;
end;

procedure TfrmSignatory.btnOKClick(Sender: TObject);
begin
  inherited;
  AcceptRecord(frmData.qryListOfSignatory);
  Close;
end;

procedure TfrmSignatory.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  with frmData.qryListOfSignatory do
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

procedure TfrmSignatory.FormCreate(Sender: TObject);
begin
  inherited;
  with frmData do
    begin
      if not tblPosition.Active then tblPosition.Active := True;
      tblPosition.Refresh;
      if not tblSignatory.Active then tblSignatory.Active := True;
      tblSignatory.Refresh;
      if not tblDesignation.Active then tblDesignation.Active := True;
      tblDesignation.Refresh;
    end;
end;

procedure TfrmSignatory.FormShow(Sender: TObject);
begin
  inherited;
  PositionID := 0;
  SignatoryList;
  setGridOption(wdbgrdDetail,0);
end;

procedure TfrmSignatory.SignatoryList;
begin
  with frmData do
    begin
      qryListOfSignatory.Active := False;
      qryListOfSignatory.Params[0].AsInteger := PositionID;
      qryListOfSignatory.Active := True;
    end;
end;

procedure TfrmSignatory.ValidateDesignation;
begin
  with frmData do
    begin
      if qryListOfSignatory.State in [dsEdit, dsInsert] then
        begin
          qryListOfSignatorydesignation_id.Value := tblDesignationdesignation_id.AsInteger;
          qryListOfSignatoryposition_id.Value := tblPositionposition_id.AsInteger;
        end;
    end;
end;

procedure TfrmSignatory.ValidatePosition;
begin
  with frmData do
    begin
      setGridOption(wdbgrdDetail,0);
      PositionID := 0;
      if wdblkpcmbSelection.Text <> '' then
        begin
          if not tblPosition.Locate('position_description',wdblkpcmbSelection.Text,[]) then
            begin
              raise(Exception.Create('Position "Name" does not exist'));
            end
          else
            begin
              PositionID := tblPositionposition_id.AsInteger;
              setGridOption(wdbgrdDetail,1);
            end;
        end;
      SignatoryList;
      wdbgrdDetail.SetFocus;
    end;
end;

procedure TfrmSignatory.wdbgrdDetailKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_DELETE then
    begin
      if Dialogs.MessageDlg('Are you sure you want to delete ' + #13#10 + 'Signatory "Name: ' + wdbgrdDetail.GetFieldValue(0) + '"?',mtInformation , [mbYes, mbNo], 0, mbYes) = mrYes then
        begin
//          with frmData do
//            begin
//              if tblSignatory.RecordCount > 0 then
//                begin
//                  if not IsRecordExist('item','signatory_id',tblSignatorysignatory_id.AsString,'N') then
//                    begin
//                      DeleteRecord('signatory','signatory_id',tblSignatorysignatory_id.AsString,'N');
//                      tblSignatory.Refresh;
//                    end
//                  else
//                    begin
//                      raise(Exception.Create('Delete Restriction: Signatory "Name: ' + wdbgrdDetail.GetFieldValue(0) + '" already exists on Item table.'));
//                    end;
//                end
//              else
//                begin
//                  raise(Exception.Create('Delete Restriction: No record exists.'));
//                end;
//              DisplayRecordCount(tblSignatory,pnlRecordCtr);
//            end;
        end;
      Key := 0;
    end;
end;

procedure TfrmSignatory.wdbgrdDetailKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  with frmData.qryListOfSignatory do
    begin
      if State = dsBrowse then
        begin
          if (Key = #78) or (Key = #110) then
            begin
              Append;
              Key := #0;
            end;
        end;
      if State in [dsInsert,dsEdit] then
        begin
          if Key <> #8 then
            begin
              if not IsName(Key) then
                begin
                  Beep;
                  Key := #0;
                end;
            end;
        end;
    end;
end;

procedure TfrmSignatory.wdbgrdDetailRowChanged(Sender: TObject);
begin
  inherited;
  DisplayRecordCount(frmData.qryListOfSignatory,pnlRecordCtr);
end;

procedure TfrmSignatory.wdblkpcmbDesignationCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if wdblkpcmbDesignation.Text <> '' then
    begin
      ValidateDesignation;
    end;
end;

procedure TfrmSignatory.wdblkpcmbDesignationExit(Sender: TObject);
begin
  inherited;
  if wdblkpcmbDesignation.Text <> '' then
    begin
      ValidateDesignation;
    end;
end;

procedure TfrmSignatory.wdblkpcmbSelectionCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  ValidatePosition;
end;

procedure TfrmSignatory.wdblkpcmbSelectionExit(Sender: TObject);
begin
  inherited;
  ValidatePosition;
end;

end.
