object frmItem: TfrmItem
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Item'
  ClientHeight = 204
  ClientWidth = 345
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlDetail: TPanel
    Left = 0
    Top = 0
    Width = 345
    Height = 165
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 0
    object lblItemID: TLabel
      Left = 12
      Top = 19
      Width = 11
      Height = 13
      Caption = 'ID'
    end
    object lblItemDescription: TLabel
      Left = 12
      Top = 48
      Width = 53
      Height = 13
      Caption = 'Description'
    end
    object lblItemBrand: TLabel
      Left = 12
      Top = 77
      Width = 28
      Height = 13
      Caption = 'Brand'
    end
    object lblItemSize: TLabel
      Left = 12
      Top = 106
      Width = 19
      Height = 13
      Caption = 'Size'
    end
    object lblCol1: TLabel
      Left = 83
      Top = 19
      Width = 19
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = ':'
    end
    object lblCol2: TLabel
      Left = 83
      Top = 48
      Width = 19
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = ':'
    end
    object lblCol3: TLabel
      Left = 83
      Top = 77
      Width = 19
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = ':'
    end
    object lblCol4: TLabel
      Left = 83
      Top = 106
      Width = 19
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = ':'
    end
    object btnBrand: TSpeedButton
      Left = 237
      Top = 71
      Width = 23
      Height = 22
      Caption = '...'
      OnClick = btnBrandClick
    end
    object btnSize: TSpeedButton
      Left = 237
      Top = 100
      Width = 23
      Height = 22
      Caption = '...'
      OnClick = btnSizeClick
    end
    object lblUnit: TLabel
      Left = 12
      Top = 135
      Width = 19
      Height = 13
      Caption = 'Unit'
    end
    object lblCol5: TLabel
      Left = 83
      Top = 135
      Width = 19
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = ':'
    end
    object btnUnit: TSpeedButton
      Left = 237
      Top = 131
      Width = 23
      Height = 22
      Caption = '...'
      OnClick = btnUnitClick
    end
    object edtItemDescription: TwwDBEdit
      Left = 108
      Top = 44
      Width = 225
      Height = 21
      DataField = 'item_description'
      DataSource = frmData.dstblItem
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
      OnExit = edtItemDescriptionExit
    end
    object wdblkpcmbBrand: TwwDBLookupCombo
      Left = 108
      Top = 73
      Width = 125
      Height = 21
      DisableThemes = True
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'brand_description'#9'32'#9'Name'#9'F')
      DataField = 'brand_id'
      DataSource = frmData.dstblItem
      LookupTable = frmData.tblBrand
      LookupField = 'brand_id'
      DropDownWidth = 100
      TabOrder = 1
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      ShowMatchText = True
    end
    object wdblkpcmbSize: TwwDBLookupCombo
      Left = 108
      Top = 102
      Width = 125
      Height = 21
      DisableThemes = True
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'size_description'#9'32'#9'Name'#9'F')
      DataField = 'size_id'
      DataSource = frmData.dstblItem
      LookupTable = frmData.tblSize
      LookupField = 'size_id'
      DropDownWidth = 100
      TabOrder = 2
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      ShowMatchText = True
    end
    object wdblkpcmbUnit: TwwDBLookupCombo
      Left = 108
      Top = 131
      Width = 125
      Height = 21
      DisableThemes = True
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'unit_description'#9'32'#9'unit_description'#9'F')
      DataField = 'unit_id'
      DataSource = frmData.dstblItem
      LookupTable = frmData.tblUnit
      LookupField = 'unit_id'
      DropDownWidth = 100
      TabOrder = 3
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      ShowMatchText = True
    end
    object pnlItemID: TPanel
      Left = 104
      Top = 11
      Width = 116
      Height = 31
      BevelOuter = bvNone
      Ctl3D = False
      Enabled = False
      ParentCtl3D = False
      TabOrder = 4
      object edtItemID: TwwDBEdit
        Left = 4
        Top = 5
        Width = 105
        Height = 19
        DisableThemes = True
        Ctl3D = False
        DataField = 'item_id'
        DataSource = frmData.dstblItem
        ParentCtl3D = False
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    object wrdgrpType: TwwRadioGroup
      Left = 268
      Top = 73
      Width = 65
      Height = 79
      DisableThemes = False
      Caption = 'Type:'
      DataField = 'item_type'
      DataSource = frmData.dstblItem
      Items.Strings = (
        'Goods'
        'School')
      TabOrder = 5
      Values.Strings = (
        'G'
        'S')
      OnClick = wrdgrpTypeClick
    end
  end
  object pnlMenu: TPanel
    Left = 0
    Top = 165
    Width = 345
    Height = 39
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 1
    object btnOK: TBitBtn
      Left = 183
      Top = 8
      Width = 75
      Height = 25
      Caption = '&OK'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 0
      OnClick = btnOKClick
    end
    object btnCANCEL: TBitBtn
      Left = 258
      Top = 8
      Width = 75
      Height = 25
      Caption = 'CA&NCEL'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 1
      OnClick = btnCANCELClick
    end
  end
  object qryiBalanceItem: TMyQuery
    Connection = frmData.dbCon
    Left = 149
    Top = 78
  end
end
