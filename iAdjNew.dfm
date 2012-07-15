object frmiAdjNew: TfrmiAdjNew
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'New Item Adjustment'
  ClientHeight = 470
  ClientWidth = 764
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    764
    470)
  PixelsPerInch = 96
  TextHeight = 13
  object pgc1: TPageControl
    Left = 0
    Top = 0
    Width = 764
    Height = 185
    ActivePage = ts1
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object ts1: TTabSheet
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      object lbl1: TLabel
        Left = 39
        Top = 43
        Width = 75
        Height = 13
        Caption = 'Return Date :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl5: TLabel
        Left = 44
        Top = 70
        Width = 70
        Height = 13
        Caption = 'Description :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl6: TLabel
        Left = 22
        Top = 16
        Width = 92
        Height = 13
        Caption = 'Item Return ID :'
        FocusControl = dbedtadjID
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl2: TLabel
        Left = 44
        Top = 99
        Width = 70
        Height = 13
        Caption = 'Signatories :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbedtadjID: TDBEdit
        Left = 153
        Top = 13
        Width = 181
        Height = 21
        TabStop = False
        BiDiMode = bdLeftToRight
        DataField = 'adjID'
        DataSource = DSAdj
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBiDiMode = False
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = False
        TabOrder = 0
      end
      object dbedtadjDesc: TDBEdit
        Left = 153
        Top = 67
        Width = 513
        Height = 21
        TabStop = False
        BiDiMode = bdLeftToRight
        DataField = 'adjDescription'
        DataSource = DSAdj
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 1
      end
      object DTPadj: TDateTimePicker
        Left = 153
        Top = 40
        Width = 181
        Height = 21
        Date = 41043.000000000000000000
        Time = 41043.000000000000000000
        DateFormat = dfLong
        TabOrder = 2
        TabStop = False
      end
      object DEc_position_id: TDBLookupComboBox
        Left = 153
        Top = 96
        Width = 163
        Height = 21
        DataField = 'c_position_id'
        DataSource = DSAdj
        KeyField = 'position_id'
        ListField = 'position_description'
        ListSource = frmData.DSPosition1
        TabOrder = 3
        OnCloseUp = DEc_position_idCloseUp
      end
      object DEp_position_id: TDBLookupComboBox
        Left = 153
        Top = 123
        Width = 163
        Height = 21
        DataField = 'p_position_id'
        DataSource = DSAdj
        KeyField = 'position_id'
        ListField = 'position_description'
        ListSource = frmData.DSPosition2
        TabOrder = 4
        OnCloseUp = DEp_position_idCloseUp
      end
      object DEp_signatory_id: TDBLookupComboBox
        Left = 326
        Top = 123
        Width = 232
        Height = 21
        DataField = 'p_signatory_id'
        DataSource = DSAdj
        Enabled = False
        KeyField = 'signatory_id'
        ListField = 'signatory_name'
        ListSource = frmData.DSSignatory2
        TabOrder = 5
      end
      object DEc_signatory_id: TDBLookupComboBox
        Left = 326
        Top = 96
        Width = 232
        Height = 21
        DataField = 'c_signatory_id'
        DataSource = DSAdj
        Enabled = False
        KeyField = 'signatory_id'
        ListField = 'signatory_name'
        ListSource = frmData.DSSignatory1
        TabOrder = 6
      end
    end
  end
  object pnl1: TPanel
    Left = 0
    Top = 432
    Width = 764
    Height = 38
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      764
      38)
    object lbl11: TLabel
      Left = 283
      Top = 2
      Width = 55
      Height = 11
      Caption = 'Search by :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btn1: TButton
      Left = 685
      Top = 7
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Cancel'
      TabOrder = 0
      OnClick = btn1Click
    end
    object btnAdd: TButton
      Left = 604
      Top = 7
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Post'
      TabOrder = 1
      OnClick = btnAddClick
    end
    object dbSearch: TJvDBSearchEdit
      Left = 8
      Top = 8
      Width = 269
      Height = 21
      DataSource = DSAdjdet
      DataField = 'item_id'
      MaxLength = 50
      TabOrder = 2
    end
    object rb1: TRadioButton
      Left = 283
      Top = 15
      Width = 70
      Height = 17
      Anchors = [akLeft, akBottom]
      Caption = 'Item No.'
      Checked = True
      TabOrder = 3
      TabStop = True
      OnClick = rb1Click
    end
    object rb2: TRadioButton
      Left = 351
      Top = 15
      Width = 73
      Height = 17
      Anchors = [akLeft, akBottom]
      Caption = 'Description'
      TabOrder = 4
      OnClick = rb2Click
    end
    object rb3: TRadioButton
      Left = 433
      Top = 15
      Width = 72
      Height = 17
      Anchors = [akLeft, akBottom]
      Caption = 'Brand'
      TabOrder = 5
      OnClick = rb3Click
    end
  end
  object dbGrid: TwwDBGrid
    AlignWithMargins = True
    Left = 0
    Top = 188
    Width = 764
    Height = 241
    DisableThemes = True
    DisableThemesInTitle = True
    ControlType.Strings = (
      'ItemNo;CustomEdit;dbLookUp;F'
      'ItemDescription;CustomEdit;dbItemDesc;F'
      'AdjustmentType;CustomEdit;cbbAdjustmentType1;F'
      'itemNo;CustomEdit;dbItemNo;F'
      'item_id;CustomEdit;dblookupID;F'
      'item_description;CustomEdit;dblookupDesc;F'
      'Municipality;CustomEdit;dbMunicity;F'
      'Barangay;CustomEdit;dbBarangay;F'
      'unit_id;CustomEdit;dblookupUnit;F'
      'unit_description;CustomEdit;dblookupUnit;F'
      'adjustment_type;CustomEdit;cbb1;F')
    Selected.Strings = (
      'item_id'#9'10'#9'Item ID'
      'qty_onhand'#9'10'#9'Quantity'
      'item_description'#9'40'#9'Description'
      'brand_description'#9'20'#9'Brand'
      'size_description'#9'10'#9'Size'
      'unit_description'#9'10'#9'Unit'
      'adjustment_type'#9'16'#9'Adjustment Type')
    IniAttributes.Delimiter = ';;'
    TitleColor = clBtnFace
    OnRowChanged = dbGridRowChanged
    FixedCols = 0
    ShowHorzScrollBar = True
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DSAdjdet
    PopupMenu = pm1
    TabOrder = 2
    TitleAlignment = taCenter
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    TitleLines = 1
    TitleButtons = True
    OnColExit = dbGridColExit
    OnExit = dbGridExit
  end
  object dblookupID: TwwDBLookupCombo
    Left = 26
    Top = 254
    Width = 129
    Height = 21
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'item_id'#9'10'#9'item_id'#9'F'
      'item_description'#9'25'#9'item_description'#9'F')
    LookupTable = frmData.QryItems
    LookupField = 'item_id'
    TabOrder = 3
    AutoDropDown = False
    ShowButton = True
    PreciseEditRegion = False
    AllowClearKey = False
    ShowMatchText = True
    OnCloseUp = dblookupIDCloseUp
    OnExit = dblookupIDExit
  end
  object dblookupDesc: TwwDBLookupCombo
    Left = 192
    Top = 240
    Width = 121
    Height = 21
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'item_description'#9'53'#9'item_description'#9'F'
      'brand_description'#9'15'#9'brand_description'#9'F'
      'size_description'#9'5'#9'size_description'#9'F')
    LookupTable = frmData.QryItems
    LookupField = 'item_description'
    TabOrder = 4
    AutoDropDown = False
    ShowButton = True
    PreciseEditRegion = False
    AllowClearKey = False
    ShowMatchText = True
    OnCloseUp = dblookupDescCloseUp
    OnExit = dblookupDescExit
  end
  object cbb1: TwwDBComboBox
    Left = 240
    Top = 296
    Width = 121
    Height = 21
    ShowButton = True
    Style = csDropDownList
    MapList = True
    AllowClearKey = False
    DataField = 'adjustment_type'
    DataSource = DSAdjdet
    DropDownCount = 8
    ItemHeight = 0
    Items.Strings = (
      'Debit'#9'1'
      'Credit'#9'0')
    Sorted = False
    TabOrder = 5
    UnboundDataType = wwDefault
    OnCloseUp = cbb1CloseUp
  end
  object QryAdj: TMyQuery
    Connection = frmData.dbCon
    SQL.Strings = (
      'SELECT'
      'iadj.adjID,'
      'iadj.adjDate,'
      'iadj.adjDescription,'
      'iadj.userID,'
      'iadj.TransDate,'
      'iadj.c_signatory_id,'
      'iadj.p_signatory_id,'
      'iadj.c_position_id,'
      'iadj.p_position_id'
      'FROM'
      'iadj')
    AfterPost = QryAdjAfterPost
    Left = 456
    Top = 24
    object dbQryAdjadjID: TStringField
      Alignment = taCenter
      FieldName = 'adjID'
    end
    object dbQryAdjadjDate: TDateTimeField
      FieldName = 'adjDate'
    end
    object dbQryAdjadjDescription: TStringField
      FieldName = 'adjDescription'
      Size = 50
    end
    object dbQryAdjuserID: TIntegerField
      FieldName = 'userID'
    end
    object dbQryAdjTransDate: TDateTimeField
      FieldName = 'TransDate'
    end
    object dbQryAdjc_signatory_id: TIntegerField
      FieldName = 'c_signatory_id'
    end
    object dbQryAdjp_signatory_id: TIntegerField
      FieldName = 'p_signatory_id'
    end
    object dbQryAdjc_position_id: TIntegerField
      FieldName = 'c_position_id'
    end
    object dbQryAdjp_position_id: TIntegerField
      FieldName = 'p_position_id'
    end
  end
  object DSAdj: TMyDataSource
    AutoEdit = False
    DataSet = QryAdj
    Left = 488
    Top = 24
  end
  object QryAdjDet: TMyQuery
    Connection = frmData.dbCon
    SQL.Strings = (
      'SELECT'
      'iadjdet.adjID,'
      'iadjdet.item_id,'
      'iadjdet.qty_onhand,'
      'iadjdet.unit_id,'
      'iadjdet.adjustment_type,'
      'item.item_description,'
      'brand.brand_description,'
      'size.size_description,'
      'unit.unit_description'
      'FROM'
      'iadjdet'
      'INNER JOIN item ON iadjdet.item_id = item.item_id'
      'INNER JOIN size ON item.size_id = size.size_id'
      'INNER JOIN unit ON item.unit_id = unit.unit_id'
      'INNER JOIN brand ON item.brand_id = brand.brand_id'
      'WHERE iadjdet.adjID = :currID'
      'ORDER BY item.item_id ASC')
    BeforeUpdateExecute = QryAdjDetBeforeUpdateExecute
    DetailFields = 'recID'
    Active = True
    Left = 472
    Top = 288
    ParamData = <
      item
        DataType = ftString
        Name = 'currID'
        ParamType = ptInputOutput
      end>
    object dbQryAdjDetitem_id: TStringField
      DisplayLabel = 'Item ID'
      DisplayWidth = 10
      FieldName = 'item_id'
      Origin = 'iadjdet.item_id'
    end
    object dbQryAdjDetqty_onhand: TFloatField
      DisplayLabel = 'Quantity'
      DisplayWidth = 10
      FieldName = 'qty_onhand'
      Origin = 'iadjdet.qty_onhand'
    end
    object dbQryAdjDetitem_description: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 40
      FieldName = 'item_description'
      Origin = 'item.item_description'
      Size = 50
    end
    object dbQryAdjDetbrand_description: TStringField
      DisplayLabel = 'Brand'
      DisplayWidth = 20
      FieldName = 'brand_description'
      Origin = 'brand.brand_description'
      Size = 50
    end
    object dbQryAdjDetsize_description: TStringField
      DisplayLabel = 'Size'
      DisplayWidth = 10
      FieldName = 'size_description'
      Origin = 'size.size_description'
      Size = 50
    end
    object dbQryAdjDetunit_description: TStringField
      DisplayLabel = 'Unit'
      DisplayWidth = 10
      FieldName = 'unit_description'
      Origin = 'unit.unit_description'
      Size = 50
    end
    object dbQryAdjDetadjustment_type: TIntegerField
      DisplayLabel = 'Adjustment Type'
      DisplayWidth = 16
      FieldName = 'adjustment_type'
      Origin = 'iadjdet.adjustment_type'
    end
    object dbQryAdjDetadjID: TStringField
      FieldName = 'adjID'
      Origin = 'iadjdet.adjID'
      Visible = False
    end
    object dbQryAdjDetunit_id: TIntegerField
      FieldName = 'unit_id'
      Origin = 'iadjdet.unit_id'
      Visible = False
    end
  end
  object DSAdjdet: TMyDataSource
    DataSet = QryAdjDet
    Left = 520
    Top = 288
  end
  object pm1: TPopupMenu
    Left = 640
    Top = 280
    object Delete1: TMenuItem
      Caption = 'Delete'
      OnClick = Delete1Click
    end
  end
end
