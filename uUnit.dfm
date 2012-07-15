inherited frmUnit: TfrmUnit
  Caption = 'Unit'
  ClientHeight = 262
  OnClose = FormClose
  OnCreate = FormCreate
  ExplicitHeight = 290
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlDetail: TPanel
    Height = 226
    ExplicitHeight = 226
    inherited wdbgrdDetail: TwwDBGrid
      Height = 194
      Selected.Strings = (
        'unit_description'#9'32'#9'Name'#9'F')
      OnRowChanged = wdbgrdDetailRowChanged
      DataSource = frmData.dstblUnit
      OnKeyDown = wdbgrdDetailKeyDown
      OnKeyPress = wdbgrdDetailKeyPress
      ExplicitHeight = 194
    end
    inherited pnlRecordCtr: TPanel
      Top = 199
      ExplicitTop = 199
    end
  end
  inherited pnlMenu: TPanel
    Top = 226
    ExplicitTop = 226
    inherited btnOK: TBitBtn
      OnClick = btnOKClick
    end
    inherited btnCANCEL: TBitBtn
      OnClick = btnCANCELClick
    end
  end
end
