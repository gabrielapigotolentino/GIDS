inherited frmDesignation: TfrmDesignation
  Caption = 'Designation'
  ClientWidth = 348
  OnClose = FormClose
  OnCreate = FormCreate
  ExplicitWidth = 354
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlDetail: TPanel
    Width = 348
    inherited wdbgrdDetail: TwwDBGrid
      Width = 338
      Selected.Strings = (
        'designation_name'#9'50'#9'Name'#9'F')
      OnRowChanged = wdbgrdDetailRowChanged
      DataSource = frmData.dstblDesignation
    end
    inherited pnlRecordCtr: TPanel
      Width = 339
    end
  end
  inherited pnlMenu: TPanel
    Width = 348
    inherited btnOK: TBitBtn
      Left = 194
      OnClick = btnOKClick
    end
    inherited btnCANCEL: TBitBtn
      Left = 269
      OnClick = btnCANCELClick
    end
  end
end
