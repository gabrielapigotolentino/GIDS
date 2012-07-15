inherited frmGoodsType: TfrmGoodsType
  Caption = 'Goods'
  ClientHeight = 262
  OnClose = FormClose
  OnCreate = FormCreate
  ExplicitHeight = 290
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlDetail: TPanel
    Height = 226
    ExplicitHeight = 265
    inherited wdbgrdDetail: TwwDBGrid
      Height = 194
      Selected.Strings = (
        'goodstype_description'#9'32'#9'Type'#9'F')
      OnRowChanged = wdbgrdDetailRowChanged
      DataSource = frmData.dstblGoodsType
      OnKeyDown = wdbgrdDetailKeyDown
      OnKeyPress = wdbgrdDetailKeyPress
      ExplicitHeight = 233
    end
    inherited pnlRecordCtr: TPanel
      Top = 199
      ExplicitTop = 238
    end
  end
  inherited pnlMenu: TPanel
    Top = 226
    ExplicitTop = 265
    inherited btnOK: TBitBtn
      OnClick = btnOKClick
    end
    inherited btnCANCEL: TBitBtn
      OnClick = btnCANCELClick
    end
  end
end
