inherited frmBrand: TfrmBrand
  Caption = 'Brand'
  ClientHeight = 262
  OnClose = FormClose
  OnCreate = FormCreate
  ExplicitHeight = 290
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlDetail: TPanel
    Height = 226
    ExplicitHeight = 226
    DesignSize = (
      239
      226)
    inherited wdbgrdDetail: TwwDBGrid
      Height = 194
      Selected.Strings = (
        'brand_description'#9'32'#9'Name'#9'F'#9)
      OnRowChanged = wdbgrdDetailRowChanged
      DataSource = frmData.dstblBrand
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
