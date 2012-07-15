object frmTemplate5: TfrmTemplate5
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  ClientHeight = 412
  ClientWidth = 781
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pnlMaster: TPanel
    Left = 0
    Top = 0
    Width = 781
    Height = 70
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
  end
  object pnlDetail: TPanel
    Left = 0
    Top = 70
    Width = 781
    Height = 304
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 1
    ExplicitTop = 115
    ExplicitHeight = 400
    object pnlItems: TPanel
      Left = 2
      Top = 2
      Width = 777
      Height = 220
      Align = alClient
      TabOrder = 0
      ExplicitHeight = 221
      DesignSize = (
        777
        220)
      object wdbgrdDetail: TwwDBGrid
        Left = 5
        Top = 5
        Width = 766
        Height = 192
        DisableThemes = True
        DisableThemesInTitle = True
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        TitleAlignment = taCenter
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        TitleLines = 1
        TitleButtons = True
        ExplicitHeight = 274
      end
      object pnlRecordCtr: TPanel
        Left = 4
        Top = 197
        Width = 767
        Height = 18
        Anchors = [akLeft, akRight, akBottom]
        BevelInner = bvLowered
        TabOrder = 1
        ExplicitTop = 279
      end
    end
    object pnlSignatory: TPanel
      Left = 2
      Top = 222
      Width = 777
      Height = 80
      Align = alBottom
      TabOrder = 1
      ExplicitTop = 359
    end
  end
  object pnlMenu: TPanel
    Left = 0
    Top = 374
    Width = 781
    Height = 38
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 2
    ExplicitTop = 515
    DesignSize = (
      781
      38)
    object btnOK: TBitBtn
      Left = 625
      Top = 7
      Width = 75
      Height = 25
      Anchors = [akTop, akRight, akBottom]
      Caption = '&OK'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 0
    end
    object btnCANCEL: TBitBtn
      Left = 700
      Top = 7
      Width = 75
      Height = 25
      Anchors = [akTop, akRight, akBottom]
      Caption = 'CA&NCEL'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 1
    end
  end
end
