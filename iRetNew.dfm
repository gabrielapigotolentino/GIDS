object frmiRetNew: TfrmiRetNew
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'New Item Return'
  ClientHeight = 492
  ClientWidth = 1045
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
    1045
    492)
  PixelsPerInch = 96
  TextHeight = 13
  object pgc1: TPageControl
    Left = 0
    Top = 0
    Width = 1045
    Height = 177
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
        Left = 102
        Top = 50
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
        Left = 107
        Top = 109
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
        Left = 85
        Top = 23
        Width = 92
        Height = 13
        Caption = 'Item Return ID :'
        FocusControl = dbedtrecID
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl3: TLabel
        Left = 135
        Top = 77
        Width = 42
        Height = 13
        Caption = 'RIS ID :'
        FocusControl = DErisid
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl2: TLabel
        Left = 477
        Top = 23
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
      object dbedtrecID: TDBEdit
        Left = 216
        Top = 20
        Width = 181
        Height = 21
        TabStop = False
        BiDiMode = bdLeftToRight
        DataField = 'retID'
        DataSource = DSRet
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
      object dbedtretDesc: TDBEdit
        Left = 216
        Top = 106
        Width = 684
        Height = 21
        TabStop = False
        BiDiMode = bdLeftToRight
        DataField = 'retDescription'
        DataSource = DSRet
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
      object DTPret: TDateTimePicker
        Left = 216
        Top = 47
        Width = 181
        Height = 21
        Date = 41043.000000000000000000
        Time = 41043.000000000000000000
        DateFormat = dfLong
        TabOrder = 2
        TabStop = False
      end
      object DEc_signatory_id: TDBLookupComboBox
        Left = 668
        Top = 47
        Width = 232
        Height = 21
        DataField = 'c_signatory_id'
        DataSource = DSRet
        Enabled = False
        KeyField = 'signatory_id'
        ListField = 'signatory_name'
        ListSource = frmData.DSSignatory1
        TabOrder = 3
      end
      object DErisid: TDBLookupComboBox
        Left = 216
        Top = 74
        Width = 183
        Height = 21
        DataField = 'ris_id'
        DataSource = DSRet
        KeyField = 'ris_id'
        ListField = 'ris_id'
        ListSource = frmData.DSRisID
        TabOrder = 4
      end
      object dbedtretRIS: TDBEdit
        Left = 216
        Top = 74
        Width = 183
        Height = 21
        TabStop = False
        BiDiMode = bdLeftToRight
        DataField = 'ris_id'
        DataSource = DSRet
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
        TabOrder = 5
        Visible = False
      end
      object DEc_position_id: TDBLookupComboBox
        Left = 477
        Top = 47
        Width = 181
        Height = 21
        DataField = 'c_position_id'
        DataSource = DSRet
        KeyField = 'position_id'
        ListField = 'position_description'
        ListSource = frmData.DSPosition1
        TabOrder = 6
        OnCloseUp = DEc_position_idCloseUp
      end
      object DEp_signatory_id: TDBLookupComboBox
        Left = 668
        Top = 74
        Width = 232
        Height = 21
        DataField = 'p_signatory_id'
        DataSource = DSRet
        Enabled = False
        KeyField = 'signatory_id'
        ListField = 'signatory_name'
        ListSource = frmData.DSSignatory2
        TabOrder = 7
      end
      object DEp_position_id: TDBLookupComboBox
        Left = 477
        Top = 74
        Width = 181
        Height = 21
        DataField = 'p_position_id'
        DataSource = DSRet
        KeyField = 'position_id'
        ListField = 'position_description'
        ListSource = frmData.DSPosition2
        TabOrder = 8
        OnCloseUp = DEp_position_idCloseUp
      end
    end
  end
  object pnl1: TPanel
    Left = 0
    Top = 454
    Width = 1045
    Height = 38
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      1045
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
      Left = 966
      Top = 7
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Cancel'
      TabOrder = 0
      OnClick = btn1Click
    end
    object btnAdd: TButton
      Left = 885
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Post'
      TabOrder = 1
      OnClick = btnAddClick
    end
    object dbSearch: TJvDBSearchEdit
      Left = 8
      Top = 7
      Width = 269
      Height = 21
      DataSource = DSRetdet
      DataField = 'item_id'
      MaxLength = 50
      TabOrder = 2
    end
    object rb1: TRadioButton
      Left = 283
      Top = 17
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
      Top = 17
      Width = 73
      Height = 17
      Anchors = [akLeft, akBottom]
      Caption = 'Description'
      TabOrder = 4
      OnClick = rb2Click
    end
    object rb3: TRadioButton
      Left = 433
      Top = 17
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
    Top = 180
    Width = 1045
    Height = 271
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
      'unit_description;CustomEdit;dblookupUnit;F')
    Selected.Strings = (
      'item_id'#9'10'#9'Item ID'
      'item_description'#9'40'#9'Description'
      'qty_onhand'#9'15'#9'Quantity (pcs/kg)'
      'Quantity (box/cavan)'#9'20'#9'Quantity (box/cavan)'
      'Remainder'#9'17'#9'Remainder (pcs/kg)'
      'brand_description'#9'20'#9'Brand'
      'size_description'#9'10'#9'Size'
      'unit_description'#9'10'#9'Unit'
      'qty_distributed'#9'19'#9'Quantity (Distributed)')
    IniAttributes.Delimiter = ';;'
    TitleColor = clBtnFace
    OnRowChanged = dbGridRowChanged
    FixedCols = 0
    ShowHorzScrollBar = True
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DSRetdet
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
    Left = 72
    Top = 222
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
    Left = 217
    Top = 222
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
  object QryRet: TMyQuery
    Connection = frmData.dbCon
    SQL.Strings = (
      'SELECT'
      'iret.retDescription,'
      'iret.retID,'
      'iret.retDate,'
      'iret.userID,'
      'iret.TransDate,'
      'iret.c_signatory_id,'
      'iret.p_signatory_id,'
      'iret.c_position_id,'
      'iret.p_position_id,'
      'iret.ris_id'
      'FROM'
      'iret')
    AfterPost = QryRetAfterPost
    Left = 32
    object dbQryRetretDescription: TStringField
      FieldName = 'retDescription'
      Origin = 'iret.retDescription'
      Size = 50
    end
    object dbQryRetretID: TStringField
      Alignment = taCenter
      FieldName = 'retID'
      Origin = 'iret.retID'
    end
    object dbQryRetretDate: TDateTimeField
      FieldName = 'retDate'
      Origin = 'iret.retDate'
    end
    object dbQryRetuserID: TIntegerField
      FieldName = 'userID'
      Origin = 'iret.userID'
    end
    object dbQryRetTransDate: TDateTimeField
      FieldName = 'TransDate'
      Origin = 'iret.TransDate'
    end
    object dbQryRetris_id: TStringField
      Alignment = taCenter
      FieldName = 'ris_id'
      Origin = 'iret.ris_id'
    end
    object dbQryRetc_signatory_id: TIntegerField
      FieldName = 'c_signatory_id'
    end
    object dbQryRetp_signatory_id: TIntegerField
      FieldName = 'p_signatory_id'
    end
    object dbQryRetc_position_id: TIntegerField
      FieldName = 'c_position_id'
    end
    object dbQryRetp_position_id: TIntegerField
      FieldName = 'p_position_id'
    end
  end
  object DSRet: TMyDataSource
    AutoEdit = False
    DataSet = QryRet
    Left = 72
  end
  object QryRetDet: TMyQuery
    Connection = frmData.dbCon
    SQL.Strings = (
      'SELECT'
      'iretdet.retID,'
      'iretdet.item_id,'
      'iretdet.qty_onhand,'
      'iretdet.unit_id,'
      'iretdet.qty_distributed,'
      'item.item_description,'
      'brand.brand_description,'
      'size.size_description,'
      'unit.unit_description'
      'FROM'
      'iretdet'
      'INNER JOIN item ON iretdet.item_id = item.item_id'
      'INNER JOIN brand ON item.brand_id = brand.brand_id'
      'INNER JOIN size ON item.size_id = size.size_id'
      'INNER JOIN unit ON item.unit_id = unit.unit_id'
      'WHERE iretdet.retID = :currID'
      'ORDER BY item.item_id ASC')
    BeforeUpdateExecute = QryRetDetBeforeUpdateExecute
    OnCalcFields = QryRetDetCalcFields
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
    object dbQryRetDetitem_id: TStringField
      DisplayLabel = 'Item ID'
      DisplayWidth = 10
      FieldName = 'item_id'
      Origin = 'iretdet.item_id'
    end
    object dbQryRetDetitem_description: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 40
      FieldName = 'item_description'
      Origin = 'item.item_description'
      Size = 50
    end
    object dbQryRetDetqty_onhand: TFloatField
      DisplayLabel = 'Quantity (pcs/kg)'
      DisplayWidth = 15
      FieldName = 'qty_onhand'
      Origin = 'iretdet.qty_onhand'
      OnChange = dbQryRetDetqty_onhandChange
    end
    object dbQryRetDetQuantityboxcavan: TStringField
      Alignment = taCenter
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'Quantity (box/cavan)'
      Calculated = True
    end
    object dbQryRetDetRemainder: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'Remainder (pcs/kg)'
      DisplayWidth = 17
      FieldKind = fkCalculated
      FieldName = 'Remainder'
      Calculated = True
    end
    object dbQryRetDetbrand_description: TStringField
      DisplayLabel = 'Brand'
      DisplayWidth = 20
      FieldName = 'brand_description'
      Origin = 'brand.brand_description'
      Size = 50
    end
    object dbQryRetDetsize_description: TStringField
      DisplayLabel = 'Size'
      DisplayWidth = 10
      FieldName = 'size_description'
      Origin = 'size.size_description'
      Size = 50
    end
    object dbQryRetDetunit_description: TStringField
      DisplayLabel = 'Unit'
      DisplayWidth = 10
      FieldName = 'unit_description'
      Origin = 'unit.unit_description'
      Size = 50
    end
    object dbQryRetDetqty_distributed: TFloatField
      DisplayLabel = 'Quantity (Distributed)'
      DisplayWidth = 19
      FieldName = 'qty_distributed'
      Origin = 'iretdet.qty_distributed'
    end
    object dbQryRetDetretID: TStringField
      FieldName = 'retID'
      Origin = 'iretdet.retID'
      Visible = False
    end
    object dbQryRetDetunit_id: TIntegerField
      FieldName = 'unit_id'
      Origin = 'iretdet.unit_id'
      Visible = False
    end
  end
  object DSRetdet: TMyDataSource
    DataSet = QryRetDet
    Left = 520
    Top = 288
  end
  object pm1: TPopupMenu
    Left = 512
    Top = 176
    object Delete1: TMenuItem
      Caption = 'Delete'
      OnClick = Delete1Click
    end
  end
end
