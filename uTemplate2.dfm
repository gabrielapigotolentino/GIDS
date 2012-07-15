object frmTemplate2: TfrmTemplate2
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  ClientHeight = 342
  ClientWidth = 381
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
  object pnlMaster: TPanel
    Left = 0
    Top = 0
    Width = 381
    Height = 35
    Align = alTop
    TabOrder = 0
    object pnlLabel: TPanel
      Left = 1
      Top = 1
      Width = 101
      Height = 33
      Align = alLeft
      BevelInner = bvLowered
      BevelOuter = bvNone
      TabOrder = 0
    end
    object pnlSelection: TPanel
      Left = 102
      Top = 1
      Width = 278
      Height = 33
      Align = alLeft
      Anchors = [akLeft, akTop, akRight, akBottom]
      BevelInner = bvLowered
      BevelOuter = bvNone
      TabOrder = 1
      DesignSize = (
        278
        33)
      object wdblkpcmbSelection: TwwDBLookupCombo
        Left = 8
        Top = 7
        Width = 261
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DropDownAlignment = taLeftJustify
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = False
      end
    end
  end
  object pnlDetail: TPanel
    Left = 0
    Top = 35
    Width = 381
    Height = 271
    Align = alClient
    TabOrder = 1
    DesignSize = (
      381
      271)
    object wdbgrdDetail: TwwDBGrid
      Left = 8
      Top = 9
      Width = 363
      Height = 231
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
      Left = 7
      Top = 240
      Width = 364
      Height = 21
      Anchors = [akLeft, akRight, akBottom]
      BevelInner = bvLowered
      TabOrder = 1
    end
  end
  object pnlMenu: TPanel
    Left = 0
    Top = 306
    Width = 381
    Height = 36
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 2
    DesignSize = (
      381
      36)
    object btnOK: TBitBtn
      Left = 221
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akTop, akRight, akBottom]
      Caption = '&OK'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 0
    end
    object btnCANCEL: TBitBtn
      Left = 296
      Top = 6
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
