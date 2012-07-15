inherited frmSize: TfrmSize
  Caption = 'Size'
  ClientHeight = 262
  OnClose = FormClose
  OnCreate = FormCreate
  ExplicitHeight = 290
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlDetail: TPanel
    Height = 226
    inherited wdbgrdDetail: TwwDBGrid
      Height = 194
      Selected.Strings = (
        'size_description'#9'32'#9'Name'#9'F')
      OnRowChanged = wdbgrdDetailRowChanged
      DataSource = frmData.dstblSize
      OnKeyDown = wdbgrdDetailKeyDown
      OnKeyPress = wdbgrdDetailKeyPress
    end
    inherited pnlRecordCtr: TPanel
      Top = 199
    end
  end
  inherited pnlMenu: TPanel
    Top = 226
    inherited btnOK: TBitBtn
      OnClick = btnOKClick
    end
    inherited btnCANCEL: TBitBtn
      OnClick = btnCANCELClick
    end
  end
end
