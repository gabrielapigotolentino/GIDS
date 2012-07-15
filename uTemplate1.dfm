object frmTemplate1: TfrmTemplate1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  ClientHeight = 301
  ClientWidth = 239
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
    Width = 239
    Height = 265
    Align = alClient
    TabOrder = 0
    DesignSize = (
      239
      265)
    object wdbgrdDetail: TwwDBGrid
      Left = 4
      Top = 5
      Width = 229
      Height = 233
      DisableThemes = True
      DisableThemesInTitle = True
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Anchors = [akLeft, akTop, akRight, akBottom]
      Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
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
      Left = 3
      Top = 238
      Width = 230
      Height = 21
      Anchors = [akLeft, akRight, akBottom]
      BevelInner = bvLowered
      TabOrder = 1
    end
  end
  object pnlMenu: TPanel
    Left = 0
    Top = 265
    Width = 239
    Height = 36
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 1
    DesignSize = (
      239
      36)
    object btnOK: TBitBtn
      Left = 85
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&OK'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 0
    end
    object btnCANCEL: TBitBtn
      Left = 160
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'CA&NCEL'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 1
    end
  end
end
