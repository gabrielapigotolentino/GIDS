unit uDesignation;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uTemplate1, StdCtrls, Buttons, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls,
  StrUtils, DB, DBAccess, MyAccess;

type
  TfrmDesignation = class(TfrmTemplate1)
    procedure btnOKClick(Sender: TObject);
    procedure btnCANCELClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure wdbgrdDetailRowChanged(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDesignation: TfrmDesignation;

implementation

uses modVarType, modFunctions, modPublicVar, dtmData;

{$R *.dfm}

procedure TfrmDesignation.btnCANCELClick(Sender: TObject);
begin
  inherited;
  DiscardRecord(frmData.tblDesignation);
end;

procedure TfrmDesignation.btnOKClick(Sender: TObject);
begin
  inherited;
  AcceptRecord(frmData.tblDesignation);
  Close;
end;

procedure TfrmDesignation.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  with frmData.tblDesignation do
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

procedure TfrmDesignation.FormCreate(Sender: TObject);
begin
  inherited;
  with frmData.tblDesignation do
    begin
      if not Active then Active := True;
      Refresh;
    end;
end;

procedure TfrmDesignation.wdbgrdDetailRowChanged(Sender: TObject);
begin
  inherited;
  DisplayRecordCount(frmData.tblDesignation,pnlRecordCtr);
end;

end.
