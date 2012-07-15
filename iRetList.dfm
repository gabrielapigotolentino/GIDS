object frmiRetList: TfrmiRetList
  Left = 0
  Top = 0
  Anchors = [akRight, akBottom]
  BorderStyle = bsSingle
  Caption = 'Item Return List'
  ClientHeight = 331
  ClientWidth = 620
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 620
    Height = 28
    Align = alTop
    Alignment = taRightJustify
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitWidth = 568
    object btnNew: TSpeedButton
      Left = 1
      Top = 2
      Width = 44
      Height = 22
      Caption = '&New'
      OnClick = btnNewClick
    end
    object btnView: TSpeedButton
      Left = 46
      Top = 2
      Width = 44
      Height = 22
      Caption = '&View'
      OnClick = btnViewClick
    end
    object btn1: TSpeedButton
      Left = 91
      Top = 2
      Width = 46
      Height = 22
      Caption = '&Refresh'
      OnClick = btn1Click
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 280
    Width = 620
    Height = 51
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      620
      51)
    object lbl1: TLabel
      Left = 8
      Top = 31
      Width = 62
      Height = 13
      Caption = 'Search by :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dbSearch: TJvDBSearchEdit
      Left = 8
      Top = 6
      Width = 329
      Height = 21
      DataSource = DSRet
      DataField = 'retID'
      MaxLength = 50
      TabOrder = 0
      Text = 'U-2012-00005'
    end
    object rb2: TRadioButton
      Left = 76
      Top = 26
      Width = 37
      Height = 17
      Anchors = [akLeft, akBottom]
      Caption = 'ID'
      Checked = True
      TabOrder = 1
      TabStop = True
      OnClick = rb2Click
    end
    object rb3: TRadioButton
      Left = 118
      Top = 26
      Width = 83
      Height = 17
      Anchors = [akLeft, akBottom]
      Caption = 'Description'
      TabOrder = 2
      OnClick = rb3Click
    end
    object rb4: TRadioButton
      Left = 196
      Top = 26
      Width = 141
      Height = 17
      Anchors = [akLeft, akBottom]
      Caption = 'Noted and Accepted by'
      TabOrder = 3
      OnClick = rb4Click
    end
    object btn2: TButton
      Left = 525
      Top = 12
      Width = 85
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Print'
      TabOrder = 4
      OnClick = btn2Click
    end
  end
  object GridRetList: TDBGrid
    Left = 0
    Top = 28
    Width = 620
    Height = 252
    Align = alClient
    DataSource = DSRet
    DrawingStyle = gdsClassic
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentShowHint = False
    PopupMenu = pm1
    ReadOnly = True
    ShowHint = False
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = btnViewClick
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'retID'
        Title.Alignment = taCenter
        Title.Caption = 'ID'
        Width = 100
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'retDescription'
        Title.Alignment = taCenter
        Title.Caption = 'Description'
        Width = 300
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'retDate'
        Title.Alignment = taCenter
        Title.Caption = 'Transaction Date'
        Width = 100
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ris_id'
        Title.Alignment = taCenter
        Title.Caption = 'RIS ID'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'position1'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'signatory1'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'designation1'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'position2'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'signatory2'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'designation2'
        Visible = False
      end>
  end
  object pm1: TPopupMenu
    Left = 184
    Top = 91
    object N1: TMenuItem
      Caption = '&New'
      OnClick = btnNewClick
    end
    object Edit1: TMenuItem
      Caption = '&View'
      OnClick = btnViewClick
    end
    object Refresh1: TMenuItem
      Caption = '&Refresh'
    end
  end
  object QryRET: TMyQuery
    Connection = frmData.dbCon
    SQL.Strings = (
      'SELECT'
      'iret.retDescription,'
      'iret.retID,'
      'iret.retDate,'
      'iret.ris_id,'
      
        '(SELECT position.position_description FROM position INNER JOIN s' +
        'ignatory ON signatory.signatory_id = position.position_id WHERE ' +
        'signatory.signatory_id = iret.c_signatory_id) AS '#39'position1'#39','
      
        '(SELECT signatory.signatory_name FROM signatory WHERE signatory.' +
        'signatory_id = iret.c_signatory_id) AS `signatory1`,'
      
        '(SELECT designation.designation_name FROM designation INNER JOIN' +
        ' signatory ON signatory.designation_id = designation.designation' +
        '_id WHERE signatory.signatory_id = iret.c_signatory_id) AS `desi' +
        'gnation1`,'
      ''
      
        '(SELECT position.position_description FROM position INNER JOIN s' +
        'ignatory ON signatory.signatory_id = position.position_id WHERE ' +
        'signatory.signatory_id = iret.p_signatory_id) AS '#39'position2'#39','
      
        '(SELECT signatory.signatory_name FROM signatory WHERE signatory.' +
        'signatory_id = iret.p_signatory_id) AS '#39'signatory2'#39','
      
        '(SELECT designation.designation_name FROM designation INNER JOIN' +
        ' signatory ON signatory.designation_id = designation.designation' +
        '_id WHERE signatory.signatory_id = iret.p_signatory_id) AS '#39'desi' +
        'gnation2'#39
      'FROM'
      'iret'
      'ORDER BY iret.retDate DESC')
    AfterRefresh = QryRETAfterRefresh
    Active = True
    Left = 384
    Top = 96
  end
  object DSRet: TMyDataSource
    AutoEdit = False
    DataSet = QryRET
    Left = 432
    Top = 96
  end
  object QryRetRec: TMyQuery
    Connection = frmData.dbCon
    SQL.Strings = (
      'SELECT'
      'iret.retID AS ID,'
      'iret.retDate AS `transaction date`,'
      'iret.retDescription AS `transaction description`,'
      'item.item_description AS `item description`,'
      'iretdet.qty_onhand AS `returned quantity`,'
      'iretdet.qty_distributed AS `distributed quantity`,'
      'unit.unit_description AS whole,'
      'size.size_description AS `per pc`,'
      'brand.brand_description AS brand,'
      'iret.ris_id,'
      
        '(SELECT position.position_description FROM position WHERE positi' +
        'on.position_id = iret.c_position_id) AS c_position,'
      
        '(SELECT position.position_description FROM position WHERE positi' +
        'on.position_id = iret.p_position_id) AS p_position,'
      
        '(SELECT signatory.signatory_name FROM signatory WHERE signatory.' +
        'signatory_id = iret.c_signatory_id) AS c_signatory,'
      
        '(SELECT signatory.signatory_name FROM signatory WHERE signatory.' +
        'signatory_id = iret.p_signatory_id) AS p_signatory,'
      
        '(SELECT designation.designation_name FROM designation INNER JOIN' +
        ' signatory ON signatory.designation_id = designation.designation' +
        '_id WHERE signatory.signatory_id = iret.c_signatory_id) AS c_des' +
        'ignation,'
      
        '(SELECT designation.designation_name FROM designation INNER JOIN' +
        ' signatory ON signatory.designation_id = designation.designation' +
        '_id WHERE signatory.signatory_id = iret.p_signatory_id) AS p_des' +
        'ignation,'
      'iretdet.retID,'
      'iretdet.item_id,'
      'iretdet.unit_id,'
      'userbindary.UserName,'
      'ris_det.total_quantity'
      'FROM'
      'iret'
      'INNER JOIN iretdet ON iret.retID = iretdet.retID'
      'INNER JOIN item ON iretdet.item_id = item.item_id'
      'INNER JOIN brand ON item.brand_id = brand.brand_id'
      'INNER JOIN size ON item.size_id = size.size_id'
      'INNER JOIN unit ON iretdet.unit_id = unit.unit_id'
      'INNER JOIN userbindary ON iret.userID = userbindary.UserID'
      
        'INNER JOIN ris_det ON iret.ris_id = ris_det.ris_id AND iretdet.i' +
        'tem_id = ris_det.item_id'
      'WHERE iret.retID = :itemret')
    AfterRefresh = QryRETAfterRefresh
    Active = True
    Left = 376
    Top = 184
    ParamData = <
      item
        DataType = ftString
        Name = 'itemret'
        ParamType = ptInputOutput
      end>
  end
  object DSRetRec: TMyDataSource
    AutoEdit = False
    DataSet = QryRetRec
    Left = 432
    Top = 184
  end
  object IRdbpipeline: TppDBPipeline
    DataSource = DSRetRec
    UserName = 'IRdbpipeline'
    Left = 232
    Top = 144
    object IRdbpipelineppField1: TppField
      FieldAlias = 'ID'
      FieldName = 'ID'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object IRdbpipelineppField2: TppField
      FieldAlias = 'transaction date'
      FieldName = 'transaction date'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 1
    end
    object IRdbpipelineppField3: TppField
      FieldAlias = 'transaction description'
      FieldName = 'transaction description'
      FieldLength = 50
      DisplayWidth = 50
      Position = 2
    end
    object IRdbpipelineppField4: TppField
      FieldAlias = 'item description'
      FieldName = 'item description'
      FieldLength = 50
      DisplayWidth = 50
      Position = 3
    end
    object IRdbpipelineppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'returned quantity'
      FieldName = 'returned quantity'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object IRdbpipelineppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'distributed quantity'
      FieldName = 'distributed quantity'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object IRdbpipelineppField7: TppField
      FieldAlias = 'whole'
      FieldName = 'whole'
      FieldLength = 50
      DisplayWidth = 50
      Position = 6
    end
    object IRdbpipelineppField8: TppField
      FieldAlias = 'per pc'
      FieldName = 'per pc'
      FieldLength = 50
      DisplayWidth = 50
      Position = 7
    end
    object IRdbpipelineppField9: TppField
      FieldAlias = 'brand'
      FieldName = 'brand'
      FieldLength = 50
      DisplayWidth = 50
      Position = 8
    end
    object IRdbpipelineppField10: TppField
      FieldAlias = 'ris_id'
      FieldName = 'ris_id'
      FieldLength = 20
      DisplayWidth = 20
      Position = 9
    end
    object IRdbpipelineppField11: TppField
      FieldAlias = 'c_position'
      FieldName = 'c_position'
      FieldLength = 80
      DisplayWidth = 80
      Position = 10
    end
    object IRdbpipelineppField12: TppField
      FieldAlias = 'p_position'
      FieldName = 'p_position'
      FieldLength = 80
      DisplayWidth = 80
      Position = 11
    end
    object IRdbpipelineppField13: TppField
      FieldAlias = 'c_signatory'
      FieldName = 'c_signatory'
      FieldLength = 80
      DisplayWidth = 80
      Position = 12
    end
    object IRdbpipelineppField14: TppField
      FieldAlias = 'p_signatory'
      FieldName = 'p_signatory'
      FieldLength = 80
      DisplayWidth = 80
      Position = 13
    end
    object IRdbpipelineppField15: TppField
      FieldAlias = 'c_designation'
      FieldName = 'c_designation'
      FieldLength = 100
      DisplayWidth = 100
      Position = 14
    end
    object IRdbpipelineppField16: TppField
      FieldAlias = 'p_designation'
      FieldName = 'p_designation'
      FieldLength = 100
      DisplayWidth = 100
      Position = 15
    end
    object IRdbpipelineppField17: TppField
      FieldAlias = 'retID'
      FieldName = 'retID'
      FieldLength = 20
      DisplayWidth = 20
      Position = 16
    end
    object IRdbpipelineppField18: TppField
      FieldAlias = 'item_id'
      FieldName = 'item_id'
      FieldLength = 20
      DisplayWidth = 20
      Position = 17
    end
    object IRdbpipelineppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'unit_id'
      FieldName = 'unit_id'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 18
    end
    object IRdbpipelineppField20: TppField
      FieldAlias = 'UserName'
      FieldName = 'UserName'
      FieldLength = 30
      DisplayWidth = 30
      Position = 19
    end
    object IRdbpipelineppField21: TppField
      Alignment = taRightJustify
      FieldAlias = 'total_quantity'
      FieldName = 'total_quantity'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 20
    end
  end
  object ItemRecieverpt: TppReport
    AutoStop = False
    DataPipeline = IRdbpipeline
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'Letter'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 215900
    PrinterSetup.mmPaperWidth = 279401
    PrinterSetup.PaperSize = 1
    Template.FileName = 'C:\Users\Jeicee\Desktop\gdis\report\itemrec.rtm'
    DeviceType = 'Screen'
    EmailSettings.ReportFormat = 'PDF'
    LanguageID = 'Default'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    PDFSettings.EmbedFontOptions = [efUseSubset]
    PDFSettings.EncryptSettings.AllowCopy = True
    PDFSettings.EncryptSettings.AllowInteract = True
    PDFSettings.EncryptSettings.AllowModify = True
    PDFSettings.EncryptSettings.AllowPrint = True
    PDFSettings.EncryptSettings.Enabled = False
    PDFSettings.FontEncoding = feAnsi
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 232
    Top = 192
    Version = '12.03'
    mmColumnWidth = 0
    DataPipelineName = 'IRdbpipeline'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 92870
      mmPrintPosition = 0
      object ppShape14: TppShape
        UserName = 'Shape14'
        Gradient.EndColor = clWhite
        Gradient.StartColor = clWhite
        Gradient.Style = gsNone
        mmHeight = 16140
        mmLeft = 265
        mmTop = 77258
        mmWidth = 266171
        BandType = 0
      end
      object ppShape1: TppShape
        UserName = 'Shape1'
        Gradient.EndColor = clWhite
        Gradient.StartColor = clWhite
        Gradient.Style = gsNone
        mmHeight = 7938
        mmLeft = 0
        mmTop = 84931
        mmWidth = 266701
        BandType = 0
      end
      object ppShape16: TppShape
        UserName = 'Shape16'
        Gradient.EndColor = clWhite
        Gradient.StartColor = clWhite
        Gradient.Style = gsNone
        mmHeight = 7408
        mmLeft = 106098
        mmTop = 85196
        mmWidth = 29104
        BandType = 0
      end
      object ppShape13: TppShape
        UserName = 'Shape13'
        Gradient.EndColor = clWhite
        Gradient.StartColor = clWhite
        Gradient.Style = gsNone
        mmHeight = 7408
        mmLeft = 200025
        mmTop = 85196
        mmWidth = 66675
        BandType = 0
      end
      object ppShape6: TppShape
        UserName = 'Shape6'
        Gradient.EndColor = clWhite
        Gradient.StartColor = clWhite
        Gradient.Style = gsNone
        mmHeight = 7408
        mmLeft = 75142
        mmTop = 85196
        mmWidth = 31485
        BandType = 0
      end
      object ppShape5: TppShape
        UserName = 'Shape5'
        Gradient.EndColor = clWhite
        Gradient.StartColor = clWhite
        Gradient.Style = gsNone
        mmHeight = 7938
        mmLeft = 0
        mmTop = 84667
        mmWidth = 75406
        BandType = 0
      end
      object ppShape3: TppShape
        UserName = 'Shape3'
        Gradient.EndColor = clWhite
        Gradient.StartColor = clWhite
        Gradient.Style = gsNone
        mmHeight = 7938
        mmLeft = 0
        mmTop = 77523
        mmWidth = 266701
        BandType = 0
      end
      object ppShape4: TppShape
        UserName = 'Shape4'
        Gradient.EndColor = clWhite
        Gradient.StartColor = clWhite
        Gradient.Style = gsNone
        mmHeight = 7938
        mmLeft = 0
        mmTop = 77523
        mmWidth = 135202
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Office of the Provincial Governor'
        Ellipsis = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4868
        mmLeft = 102680
        mmTop = 1852
        mmWidth = 61341
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Province of Bataan'
        Ellipsis = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4868
        mmLeft = 115380
        mmTop = 7673
        mmWidth = 35941
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 
          'This is to certify that the unclaimed goods from the Provincial ' +
          'Social Welfare and Development'
        Ellipsis = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 53711
        mmTop = 59002
        mmWidth = 177800
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        HyperlinkColor = clBlue
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Transaction Description :'
        Ellipsis = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 2381
        mmTop = 42598
        mmWidth = 46302
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        HyperlinkColor = clBlue
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Transaction ID: '
        Ellipsis = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 20638
        mmTop = 28310
        mmWidth = 28046
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        HyperlinkColor = clBlue
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Description'
        Ellipsis = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 2381
        mmTop = 86254
        mmWidth = 71173
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        HyperlinkColor = clBlue
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Unit'
        Ellipsis = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 81492
        mmTop = 86254
        mmWidth = 20638
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        HyperlinkColor = clBlue
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Quantity'
        Ellipsis = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 110861
        mmTop = 86254
        mmWidth = 18785
        BandType = 0
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'transaction description'
        DataPipeline = IRdbpipeline
        Ellipsis = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'IRdbpipeline'
        mmHeight = 4763
        mmLeft = 50800
        mmTop = 42598
        mmWidth = 201348
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'CERTIFICATION OF RETURNED GOODS'
        Ellipsis = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 16
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 6615
        mmLeft = 79111
        mmTop = 15875
        mmWidth = 107421
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 
          'Office were returned to the National Food Authority Warehouse as' +
          ' listed below:'
        Ellipsis = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 29633
        mmTop = 66411
        mmWidth = 148696
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        HyperlinkColor = clBlue
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'RIS ID :'
        Ellipsis = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 34131
        mmTop = 34925
        mmWidth = 14552
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'WITHDRAWAL'
        Ellipsis = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 43656
        mmTop = 79111
        mmWidth = 28840
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label101'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'RETURNED'
        Ellipsis = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 202142
        mmTop = 79111
        mmWidth = 62177
        BandType = 0
      end
      object ppShape8: TppShape
        UserName = 'Shape8'
        Gradient.EndColor = clWhite
        Gradient.StartColor = clWhite
        Gradient.Style = gsNone
        mmHeight = 7408
        mmLeft = 134938
        mmTop = 85196
        mmWidth = 66411
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        HyperlinkColor = clBlue
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Quantity'
        Ellipsis = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 221192
        mmTop = 86254
        mmWidth = 28046
        BandType = 0
      end
      object ppShape15: TppShape
        UserName = 'Shape15'
        Gradient.EndColor = clWhite
        Gradient.StartColor = clWhite
        Gradient.Style = gsNone
        mmHeight = 7938
        mmLeft = 134938
        mmTop = 77523
        mmWidth = 66411
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'Label102'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'DISTRIBUTTED'
        Ellipsis = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 137584
        mmTop = 79111
        mmWidth = 61383
        BandType = 0
      end
      object ppLabel20: TppLabel
        UserName = 'Label20'
        HyperlinkColor = clBlue
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Quantity'
        Ellipsis = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 160867
        mmTop = 86254
        mmWidth = 18785
        BandType = 0
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'ID'
        DataPipeline = IRdbpipeline
        Ellipsis = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'IRdbpipeline'
        mmHeight = 4763
        mmLeft = 50800
        mmTop = 28310
        mmWidth = 64558
        BandType = 0
      end
      object ppDBText17: TppDBText
        UserName = 'DBText17'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'ris_id'
        DataPipeline = IRdbpipeline
        Ellipsis = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'IRdbpipeline'
        mmHeight = 4763
        mmLeft = 50800
        mmTop = 34925
        mmWidth = 64558
        BandType = 0
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'transaction date'
        DataPipeline = IRdbpipeline
        Ellipsis = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'IRdbpipeline'
        mmHeight = 4868
        mmLeft = 193940
        mmTop = 28310
        mmWidth = 58208
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      Background1.Brush.Style = bsClear
      Background1.Gradient.EndColor = clWhite
      Background1.Gradient.StartColor = clWhite
      Background1.Gradient.Style = gsNone
      Background2.Brush.Style = bsClear
      Background2.Gradient.EndColor = clWhite
      Background2.Gradient.StartColor = clWhite
      Background2.Gradient.Style = gsNone
      mmBottomOffset = 0
      mmHeight = 6615
      mmPrintPosition = 0
      object ppShape2: TppShape
        UserName = 'Shape2'
        Gradient.EndColor = clWhite
        Gradient.StartColor = clWhite
        Gradient.Style = gsNone
        mmHeight = 6615
        mmLeft = 0
        mmTop = 0
        mmWidth = 266701
        BandType = 4
      end
      object ppShape11: TppShape
        UserName = 'Shape11'
        Gradient.EndColor = clWhite
        Gradient.StartColor = clWhite
        Gradient.Style = gsNone
        mmHeight = 6615
        mmLeft = 134938
        mmTop = 0
        mmWidth = 66411
        BandType = 4
      end
      object ppShape10: TppShape
        UserName = 'Shape10'
        Gradient.EndColor = clWhite
        Gradient.StartColor = clWhite
        Gradient.Style = gsNone
        mmHeight = 6615
        mmLeft = 75142
        mmTop = 0
        mmWidth = 31485
        BandType = 4
      end
      object ppShape9: TppShape
        UserName = 'Shape9'
        Gradient.EndColor = clWhite
        Gradient.StartColor = clWhite
        Gradient.Style = gsNone
        mmHeight = 6615
        mmLeft = 0
        mmTop = 0
        mmWidth = 75406
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'item description'
        DataPipeline = IRdbpipeline
        Ellipsis = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'IRdbpipeline'
        mmHeight = 4868
        mmLeft = 1323
        mmTop = 794
        mmWidth = 72231
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'unit_id'
        DataPipeline = IRdbpipeline
        Ellipsis = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'IRdbpipeline'
        mmHeight = 4868
        mmLeft = 76994
        mmTop = 794
        mmWidth = 27781
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'returned quantity'
        DataPipeline = IRdbpipeline
        Ellipsis = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'IRdbpipeline'
        mmHeight = 4868
        mmLeft = 108215
        mmTop = 794
        mmWidth = 25400
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'distributed quantity'
        DataPipeline = IRdbpipeline
        Ellipsis = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'IRdbpipeline'
        mmHeight = 4868
        mmLeft = 141023
        mmTop = 794
        mmWidth = 57944
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'returned quantity'
        DataPipeline = IRdbpipeline
        Ellipsis = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'IRdbpipeline'
        mmHeight = 4868
        mmLeft = 211138
        mmTop = 794
        mmWidth = 47096
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 43921
      mmPrintPosition = 0
      object ppLine1: TppLine
        UserName = 'Line1'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Weight = 0.750000000000000000
        mmHeight = 3969
        mmLeft = 17198
        mmTop = 23813
        mmWidth = 55298
        BandType = 8
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Weight = 0.750000000000000000
        mmHeight = 3969
        mmLeft = 186267
        mmTop = 23813
        mmWidth = 55298
        BandType = 8
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'UserName'
        DataPipeline = IRdbpipeline
        Ellipsis = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'IRdbpipeline'
        mmHeight = 3260
        mmLeft = 0
        mmTop = 39688
        mmWidth = 33867
        BandType = 8
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'c_position'
        DataPipeline = IRdbpipeline
        Ellipsis = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'IRdbpipeline'
        mmHeight = 4995
        mmLeft = 8731
        mmTop = 9790
        mmWidth = 70115
        BandType = 8
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'c_designation'
        DataPipeline = IRdbpipeline
        Ellipsis = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'IRdbpipeline'
        mmHeight = 4763
        mmLeft = 8731
        mmTop = 26723
        mmWidth = 70115
        BandType = 8
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'c_signatory'
        DataPipeline = IRdbpipeline
        Ellipsis = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'IRdbpipeline'
        mmHeight = 4995
        mmLeft = 8731
        mmTop = 17463
        mmWidth = 70115
        BandType = 8
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'p_position'
        DataPipeline = IRdbpipeline
        Ellipsis = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'IRdbpipeline'
        mmHeight = 4995
        mmLeft = 177800
        mmTop = 9790
        mmWidth = 70115
        BandType = 8
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'p_signatory'
        DataPipeline = IRdbpipeline
        Ellipsis = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'IRdbpipeline'
        mmHeight = 4995
        mmLeft = 177800
        mmTop = 17463
        mmWidth = 70115
        BandType = 8
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'p_designation'
        DataPipeline = IRdbpipeline
        Ellipsis = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'IRdbpipeline'
        mmHeight = 4868
        mmLeft = 178594
        mmTop = 26723
        mmWidth = 69321
        BandType = 8
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
end
