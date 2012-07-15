object frmiRecNew: TfrmiRecNew
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'New Item Received'
  ClientHeight = 460
  ClientWidth = 723
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
    723
    460)
  PixelsPerInch = 96
  TextHeight = 13
  object pgc1: TPageControl
    Left = 0
    Top = 0
    Width = 723
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
        Top = 42
        Width = 88
        Height = 13
        Caption = 'Received Date :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl5: TLabel
        Left = 57
        Top = 72
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
        Top = 15
        Width = 105
        Height = 13
        Caption = 'Item Received ID :'
        FocusControl = dbedtrecID
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl2: TLabel
        Left = 61
        Top = 101
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
        Left = 153
        Top = 12
        Width = 181
        Height = 21
        TabStop = False
        BiDiMode = bdLeftToRight
        DataField = 'recID'
        DataSource = DSRec
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
      object dbedtrecDesc: TDBEdit
        Left = 153
        Top = 69
        Width = 520
        Height = 21
        TabStop = False
        BiDiMode = bdLeftToRight
        DataField = 'recDescription'
        DataSource = DSRec
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
      object DTPrec: TDateTimePicker
        Left = 153
        Top = 39
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
        Top = 97
        Width = 163
        Height = 21
        DataField = 'c_position_id'
        DataSource = DSRec
        KeyField = 'position_id'
        ListField = 'position_description'
        ListSource = frmData.DSPosition1
        TabOrder = 3
        OnCloseUp = DEc_position_idCloseUp
      end
      object DEp_position_id: TDBLookupComboBox
        Left = 153
        Top = 124
        Width = 163
        Height = 21
        DataField = 'p_position_id'
        DataSource = DSRec
        KeyField = 'position_id'
        ListField = 'position_description'
        ListSource = frmData.DSPosition2
        TabOrder = 4
        OnCloseUp = DEp_position_idCloseUp
      end
      object DEc_signatory_id: TDBLookupComboBox
        Left = 326
        Top = 98
        Width = 232
        Height = 21
        DataField = 'c_signatory_id'
        DataSource = DSRec
        Enabled = False
        KeyField = 'signatory_id'
        ListField = 'signatory_name'
        ListSource = frmData.DSSignatory1
        TabOrder = 5
      end
      object DEp_signatory_id: TDBLookupComboBox
        Left = 326
        Top = 125
        Width = 232
        Height = 21
        DataField = 'p_signatory_id'
        DataSource = DSRec
        Enabled = False
        KeyField = 'signatory_id'
        ListField = 'signatory_name'
        ListSource = frmData.DSSignatory2
        TabOrder = 6
      end
    end
  end
  object pnl1: TPanel
    Left = 0
    Top = 424
    Width = 723
    Height = 36
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      723
      36)
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
      Left = 644
      Top = 5
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Cancel'
      TabOrder = 0
      OnClick = btn1Click
    end
    object btnAdd: TButton
      Left = 563
      Top = 5
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Post'
      TabOrder = 1
      OnClick = btnAddClick
    end
    object dbSearch: TJvDBSearchEdit
      Left = 8
      Top = 6
      Width = 269
      Height = 21
      DataSource = DSRecDet
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
    Width = 723
    Height = 233
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
      'qty_onhand'#9'10'#9'Quantity'
      'item_description'#9'50'#9'Description'
      'brand_description'#9'20'#9'Brand'
      'size_description'#9'10'#9'Size'
      'unit_description'#9'10'#9'Unit')
    IniAttributes.Delimiter = ';;'
    TitleColor = clBtnFace
    OnRowChanged = dbGridRowChanged
    FixedCols = 0
    ShowHorzScrollBar = True
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DSRecDet
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
    Top = 320
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
    Top = 320
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
  object QryRec: TMyQuery
    Connection = frmData.dbCon
    SQL.Strings = (
      'SELECT'
      'irec.recID,'
      'irec.recDate,'
      'irec.recDescription,'
      'irec.UserID,'
      'irec.TransDate,'
      'irec.c_signatory_id,'
      'irec.p_signatory_id,'
      'irec.c_position_id,'
      'irec.p_position_id'
      'FROM'
      'irec')
    AfterPost = QryRecAfterPost
    Left = 72
    object dbQryRecrecID: TStringField
      Alignment = taCenter
      FieldName = 'recID'
      Origin = 'irec.recID'
      Visible = False
    end
    object dbQryRecrecDate: TDateTimeField
      FieldName = 'recDate'
      Origin = 'irec.recDate'
      Visible = False
    end
    object dbQryRecrecDescription: TStringField
      FieldName = 'recDescription'
      Origin = 'irec.recDescription'
      Visible = False
      Size = 50
    end
    object dbQryRecUserID: TIntegerField
      FieldName = 'UserID'
      Origin = 'irec.userID'
      Visible = False
    end
    object dbQryRecTransDate: TDateTimeField
      FieldName = 'TransDate'
      Origin = 'irec.TransDate'
    end
    object dbQryRecc_signatory_id: TIntegerField
      FieldName = 'c_signatory_id'
    end
    object dbQryRecp_signatory_id: TIntegerField
      FieldName = 'p_signatory_id'
    end
    object dbQryRecc_position_id: TIntegerField
      FieldName = 'c_position_id'
    end
    object dbQryRecp_position_id: TIntegerField
      FieldName = 'p_position_id'
    end
  end
  object DSRec: TMyDataSource
    AutoEdit = False
    DataSet = QryRec
    Left = 134
  end
  object QryRecDet: TMyQuery
    Connection = frmData.dbCon
    SQL.Strings = (
      'SELECT'
      'irecdet.recID,'
      'irecdet.item_id,'
      'irecdet.qty_onhand,'
      'irecdet.total_qty,'
      'item.item_description,'
      'brand.brand_description,'
      'size.size_description,'
      'unit.unit_description,'
      'irecdet.unit_id'
      'FROM'
      'irecdet'
      'INNER JOIN item ON irecdet.item_id = item.item_id'
      'INNER JOIN brand ON item.brand_id = brand.brand_id'
      'INNER JOIN size ON item.size_id = size.size_id'
      'INNER JOIN unit ON item.unit_id = unit.unit_id'
      'WHERE irecdet.recID = :currID'
      'ORDER BY item.item_id ASC')
    BeforeUpdateExecute = QryRecDetBeforeUpdateExecute
    DetailFields = 'recID'
    Active = True
    Left = 457
    Top = 288
    ParamData = <
      item
        DataType = ftString
        Name = 'currID'
        ParamType = ptInputOutput
      end>
    object dbQryRecDetitem_id: TStringField
      Alignment = taCenter
      DisplayLabel = 'Item ID'
      DisplayWidth = 10
      FieldName = 'item_id'
      Origin = 'irecdet.item_id'
    end
    object dbQryRecDetqty_onhand: TFloatField
      DisplayLabel = 'Quantity'
      DisplayWidth = 10
      FieldName = 'qty_onhand'
      Origin = 'irecdet.qty_onhand'
      OnChange = dbQryRecDetqty_onhandChange
    end
    object dbQryRecDetitem_description: TStringField
      Alignment = taCenter
      DisplayLabel = 'Description'
      DisplayWidth = 50
      FieldName = 'item_description'
      Origin = 'item.item_description'
      Size = 50
    end
    object dbQryRecDetbrand_description: TStringField
      Alignment = taCenter
      DisplayLabel = 'Brand'
      DisplayWidth = 20
      FieldName = 'brand_description'
      Origin = 'brand.brand_description'
      ReadOnly = True
      Size = 50
    end
    object dbQryRecDetsize_description: TStringField
      Alignment = taCenter
      DisplayLabel = 'Size'
      DisplayWidth = 10
      FieldName = 'size_description'
      Origin = 'size.size_description'
      ReadOnly = True
      Size = 50
    end
    object dbQryRecDetunit_description: TStringField
      DisplayLabel = 'Unit'
      DisplayWidth = 10
      FieldName = 'unit_description'
      Origin = 'unit.unit_description'
      Size = 50
    end
    object dbQryRecDetunit_id: TIntegerField
      DisplayWidth = 10
      FieldName = 'unit_id'
      Origin = 'irecdet.unit_id'
      Visible = False
    end
    object dbQryRecDetrecID: TStringField
      FieldName = 'recID'
      Origin = 'irecdet.recID'
      Visible = False
    end
    object dbQryRecDettotal_qty: TIntegerField
      FieldName = 'total_qty'
      Origin = 'irecdet.total_qty'
      Visible = False
    end
  end
  object DSRecDet: TMyDataSource
    DataSet = QryRecDet
    Left = 520
    Top = 288
  end
  object pm1: TPopupMenu
    Left = 544
    object Delete1: TMenuItem
      Caption = 'Delete'
      OnClick = Delete1Click
    end
  end
end
