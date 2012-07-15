object frmTemplate3: TfrmTemplate3
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'frmTemplate3'
  ClientHeight = 275
  ClientWidth = 792
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pnlDetail: TPanel
    Left = 0
    Top = 0
    Width = 792
    Height = 235
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 0
    DesignSize = (
      792
      235)
    object wdbgrdDetail: TwwDBGrid
      Left = 10
      Top = 12
      Width = 772
      Height = 192
      DisableThemes = True
      DisableThemesInTitle = True
      Selected.Strings = (
        'item_id'#9'20'#9'ID'
        'item_description'#9'50'#9'Description'
        'brand_description'#9'25'#9'Brand'#9'F'
        'size_description'#9'25'#9'Size')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Anchors = [akLeft, akTop, akRight, akBottom]
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect]
      TabOrder = 0
      TitleAlignment = taCenter
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      TitleLines = 1
      TitleButtons = True
    end
    object pnlRecordCtr: TPanel
      Left = 9
      Top = 204
      Width = 773
      Height = 21
      Anchors = [akLeft, akRight, akBottom]
      BevelInner = bvLowered
      TabOrder = 1
    end
  end
  object pnlFooter: TPanel
    Left = 0
    Top = 235
    Width = 792
    Height = 40
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 1
    object pnlMenu: TPanel
      Left = 698
      Top = 2
      Width = 92
      Height = 36
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object btnCLOSE: TBitBtn
        Left = 9
        Top = 6
        Width = 75
        Height = 25
        Caption = '&CLOSE'
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 0
      end
    end
  end
end
