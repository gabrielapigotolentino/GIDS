object frmiAdjList: TfrmiAdjList
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Item Adjusment'
  ClientHeight = 322
  ClientWidth = 538
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
  DesignSize = (
    538
    322)
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 538
    Height = 28
    Align = alTop
    Alignment = taRightJustify
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitWidth = 671
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
  object GridAdjList: TDBGrid
    Left = 2
    Top = 30
    Width = 531
    Height = 241
    Align = alCustom
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DSAdj
    DrawingStyle = gdsClassic
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentShowHint = False
    PopupMenu = pm1
    ReadOnly = True
    ShowHint = False
    TabOrder = 1
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
        FieldName = 'adjID'
        Title.Alignment = taCenter
        Title.Caption = 'ID'
        Width = 100
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'adjDescription'
        Title.Alignment = taCenter
        Title.Caption = 'Description'
        Width = 300
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'adjDate'
        Title.Alignment = taCenter
        Title.Caption = 'Adjustment Date'
        Width = 100
        Visible = True
      end>
  end
  object pnl2: TPanel
    Left = 0
    Top = 267
    Width = 538
    Height = 55
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 2
    ExplicitWidth = 671
    DesignSize = (
      538
      55)
    object lbl1: TLabel
      Left = 8
      Top = 35
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
      Top = 10
      Width = 310
      Height = 21
      DataSource = DSAdj
      DataField = 'adjID'
      MaxLength = 50
      TabOrder = 0
      Text = 'dbSearch'
    end
    object rb2: TRadioButton
      Left = 76
      Top = 34
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
      Left = 121
      Top = 34
      Width = 83
      Height = 17
      Anchors = [akLeft, akBottom]
      Caption = 'Description'
      TabOrder = 2
      OnClick = rb3Click
    end
    object btn2: TButton
      Left = 440
      Top = 16
      Width = 85
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Print'
      TabOrder = 3
      OnClick = btn2Click
      ExplicitLeft = 573
    end
  end
  object pm1: TPopupMenu
    Left = 184
    Top = 91
    object N1: TMenuItem
      Caption = '&New'
    end
    object Edit1: TMenuItem
      Caption = '&View'
    end
    object Refresh1: TMenuItem
      Caption = '&Refresh'
    end
  end
  object QryAdj: TMyQuery
    Connection = frmData.dbCon
    SQL.Strings = (
      'SELECT'
      'iadj.adjID,'
      'iadj.adjDate,'
      'iadj.adjDescription,'
      'iadj.c_signatory_id,'
      'iadj.p_signatory_id,'
      'iadj.c_position_id,'
      'iadj.p_position_id'
      'FROM'
      'iadj'
      'ORDER BY iadj.adjDate DESC')
    AfterRefresh = QryAdjAfterRefresh
    Left = 288
    Top = 104
  end
  object DSAdj: TMyDataSource
    AutoEdit = False
    DataSet = QryAdj
    Left = 336
    Top = 104
  end
  object DSAdjRec: TMyDataSource
    AutoEdit = False
    DataSet = QryAdjRec
    Left = 96
    Top = 208
  end
  object QryAdjRec: TMyQuery
    Connection = frmData.dbCon
    SQL.Strings = (
      'SELECT'
      'iadj.adjID,'
      'iadj.adjDate,'
      'iadj.adjDescription,'
      'iadjdet.qty_onhand,'
      'item.item_description,'
      'unit.unit_description,'
      'brand.brand_description,'
      'size.size_description,'
      'userbindary.UserName,'
      'CASE'
      '   WHEN iadjdet.adjustment_type = 1 THEN '#39'Debit'#39
      '   WHEN iadjdet.adjustment_type = 0 THEN '#39'Credit'#39
      'END AS '#39'transaction type'#39','
      
        '(SELECT position.position_description FROM position WHERE positi' +
        'on.position_id = iadj.c_position_id) as '#39'c_position'#39','
      
        '(SELECT position.position_description FROM position WHERE positi' +
        'on.position_id = iadj.p_position_id) as '#39'p_position'#39','
      
        '(SELECT signatory.signatory_name FROM signatory WHERE signatory.' +
        'signatory_id = iadj.c_signatory_id) as '#39'c_signatory'#39','
      
        '(SELECT signatory.signatory_name FROM signatory WHERE signatory.' +
        'signatory_id = iadj.p_signatory_id) as '#39'p_signatory'#39','
      
        '(SELECT designation.designation_name FROM designation INNER JOIN' +
        ' signatory ON signatory.designation_id = designation.designation' +
        '_id WHERE signatory.signatory_id = iadj.c_signatory_id) AS '#39'c_de' +
        'signation'#39','
      
        '(SELECT designation.designation_name FROM designation INNER JOIN' +
        ' signatory ON signatory.designation_id = designation.designation' +
        '_id WHERE signatory.signatory_id = iadj.p_signatory_id) AS '#39'p_de' +
        'signation'#39
      'FROM'
      'iadj'
      'INNER JOIN iadjdet ON iadj.adjID = iadjdet.adjID'
      'INNER JOIN item ON iadjdet.item_id = item.item_id'
      'INNER JOIN unit ON iadjdet.unit_id = unit.unit_id'
      'INNER JOIN brand ON item.brand_id = brand.brand_id'
      'INNER JOIN size ON item.size_id = size.size_id'
      'INNER JOIN userbindary ON iadj.userID = userbindary.UserID'
      'WHERE iadj.adjID = :itemrec')
    AfterRefresh = QryAdjAfterRefresh
    Active = True
    Left = 40
    Top = 208
    ParamData = <
      item
        DataType = ftString
        Name = 'itemrec'
        ParamType = ptInputOutput
      end>
  end
  object IRdbpipeline: TppDBPipeline
    DataSource = DSAdjRec
    UserName = 'IRdbpipeline'
    Left = 48
    Top = 104
    object IRdbpipelineppField1: TppField
      FieldAlias = 'adjID'
      FieldName = 'adjID'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object IRdbpipelineppField2: TppField
      FieldAlias = 'adjDate'
      FieldName = 'adjDate'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 1
    end
    object IRdbpipelineppField3: TppField
      FieldAlias = 'adjDescription'
      FieldName = 'adjDescription'
      FieldLength = 50
      DisplayWidth = 50
      Position = 2
    end
    object IRdbpipelineppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'qty_onhand'
      FieldName = 'qty_onhand'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object IRdbpipelineppField5: TppField
      FieldAlias = 'item_description'
      FieldName = 'item_description'
      FieldLength = 50
      DisplayWidth = 50
      Position = 4
    end
    object IRdbpipelineppField6: TppField
      FieldAlias = 'unit_description'
      FieldName = 'unit_description'
      FieldLength = 50
      DisplayWidth = 50
      Position = 5
    end
    object IRdbpipelineppField7: TppField
      FieldAlias = 'brand_description'
      FieldName = 'brand_description'
      FieldLength = 50
      DisplayWidth = 50
      Position = 6
    end
    object IRdbpipelineppField8: TppField
      FieldAlias = 'size_description'
      FieldName = 'size_description'
      FieldLength = 50
      DisplayWidth = 50
      Position = 7
    end
    object IRdbpipelineppField9: TppField
      FieldAlias = 'UserName'
      FieldName = 'UserName'
      FieldLength = 30
      DisplayWidth = 30
      Position = 8
    end
    object IRdbpipelineppField10: TppField
      FieldAlias = 'transaction type'
      FieldName = 'transaction type'
      FieldLength = 6
      DisplayWidth = 6
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
  end
  object ItemRecieverpt: TppReport
    AutoStop = False
    DataPipeline = IRdbpipeline
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Letter'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 215900
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
    Left = 48
    Top = 152
    Version = '12.03'
    mmColumnWidth = 0
    DataPipelineName = 'IRdbpipeline'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 71438
      mmPrintPosition = 0
      object ppShape1: TppShape
        UserName = 'Shape1'
        Gradient.EndColor = clWhite
        Gradient.StartColor = clWhite
        Gradient.Style = gsNone
        mmHeight = 7938
        mmLeft = 794
        mmTop = 63500
        mmWidth = 202407
        BandType = 0
      end
      object ppShape8: TppShape
        UserName = 'Shape8'
        Gradient.EndColor = clWhite
        Gradient.StartColor = clWhite
        Gradient.Style = gsNone
        mmHeight = 7938
        mmLeft = 171980
        mmTop = 63500
        mmWidth = 31221
        BandType = 0
      end
      object ppShape7: TppShape
        UserName = 'Shape7'
        Gradient.EndColor = clWhite
        Gradient.StartColor = clWhite
        Gradient.Style = gsNone
        mmHeight = 7938
        mmLeft = 137054
        mmTop = 63500
        mmWidth = 35190
        BandType = 0
      end
      object ppShape6: TppShape
        UserName = 'Shape6'
        Gradient.EndColor = clWhite
        Gradient.StartColor = clWhite
        Gradient.Style = gsNone
        mmHeight = 7938
        mmLeft = 113506
        mmTop = 63500
        mmWidth = 28575
        BandType = 0
      end
      object ppShape5: TppShape
        UserName = 'Shape5'
        Gradient.EndColor = clWhite
        Gradient.StartColor = clWhite
        Gradient.Style = gsNone
        mmHeight = 7938
        mmLeft = 89429
        mmTop = 63500
        mmWidth = 24606
        BandType = 0
      end
      object ppShape4: TppShape
        UserName = 'Shape4'
        Gradient.EndColor = clWhite
        Gradient.StartColor = clWhite
        Gradient.Style = gsNone
        mmHeight = 7938
        mmLeft = 56886
        mmTop = 63500
        mmWidth = 33073
        BandType = 0
      end
      object ppShape3: TppShape
        UserName = 'Shape3'
        Gradient.EndColor = clWhite
        Gradient.StartColor = clWhite
        Gradient.Style = gsNone
        mmHeight = 7938
        mmLeft = 0
        mmTop = 63500
        mmWidth = 57150
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
        mmLeft = 70930
        mmTop = 5292
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
        mmHeight = 4763
        mmLeft = 0
        mmTop = 11113
        mmWidth = 203200
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
        Caption = 'ID :'
        Ellipsis = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 12965
        mmTop = 41540
        mmWidth = 7938
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
        Transparent = True
        mmHeight = 4657
        mmLeft = 1852
        mmTop = 65088
        mmWidth = 30427
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        HyperlinkColor = clBlue
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Brand'
        Ellipsis = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4763
        mmLeft = 67998
        mmTop = 65088
        mmWidth = 11642
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
        Transparent = True
        mmHeight = 4763
        mmLeft = 122767
        mmTop = 65088
        mmWidth = 8996
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
        Caption = 'Size'
        Ellipsis = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4763
        mmLeft = 97896
        mmTop = 65088
        mmWidth = 10054
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
        Caption = 'Remarks : :'
        Ellipsis = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 2381
        mmTop = 48683
        mmWidth = 18521
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        HyperlinkColor = clBlue
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Type'
        Ellipsis = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 143669
        mmTop = 65088
        mmWidth = 27517
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        HyperlinkColor = clBlue
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Adjusted Value'
        Ellipsis = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4657
        mmLeft = 173567
        mmTop = 65088
        mmWidth = 27252
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'ITEM ADJUSTMENT'
        Ellipsis = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 16
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 6615
        mmLeft = 0
        mmTop = 22225
        mmWidth = 203200
        BandType = 0
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'adjDate'
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
        mmLeft = 139965
        mmTop = 41540
        mmWidth = 58208
        BandType = 0
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'adjDescription'
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
        mmLeft = 22225
        mmTop = 48683
        mmWidth = 173567
        BandType = 0
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'adjID'
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
        mmLeft = 22225
        mmTop = 41540
        mmWidth = 64558
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
      mmHeight = 7938
      mmPrintPosition = 0
      object ppShape14: TppShape
        UserName = 'Shape14'
        Gradient.EndColor = clWhite
        Gradient.StartColor = clWhite
        Gradient.Style = gsNone
        mmHeight = 7938
        mmLeft = 170392
        mmTop = 0
        mmWidth = 32808
        BandType = 4
      end
      object ppShape13: TppShape
        UserName = 'Shape13'
        Gradient.EndColor = clWhite
        Gradient.StartColor = clWhite
        Gradient.Style = gsNone
        mmHeight = 7938
        mmLeft = 137319
        mmTop = 0
        mmWidth = 35190
        BandType = 4
      end
      object ppShape12: TppShape
        UserName = 'Shape12'
        Gradient.EndColor = clWhite
        Gradient.StartColor = clWhite
        Gradient.Style = gsNone
        mmHeight = 7938
        mmLeft = 113771
        mmTop = 0
        mmWidth = 28575
        BandType = 4
      end
      object ppShape11: TppShape
        UserName = 'Shape11'
        Gradient.EndColor = clWhite
        Gradient.StartColor = clWhite
        Gradient.Style = gsNone
        mmHeight = 7938
        mmLeft = 89694
        mmTop = 0
        mmWidth = 24606
        BandType = 4
      end
      object ppShape10: TppShape
        UserName = 'Shape10'
        Gradient.EndColor = clWhite
        Gradient.StartColor = clWhite
        Gradient.Style = gsNone
        mmHeight = 7938
        mmLeft = 56886
        mmTop = 0
        mmWidth = 33338
        BandType = 4
      end
      object ppShape9: TppShape
        UserName = 'Shape9'
        Gradient.EndColor = clWhite
        Gradient.StartColor = clWhite
        Gradient.Style = gsNone
        mmHeight = 7938
        mmLeft = 0
        mmTop = 0
        mmWidth = 57150
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'item_description'
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
        mmLeft = 794
        mmTop = 1588
        mmWidth = 54769
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'brand_description'
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
        mmLeft = 58473
        mmTop = 1588
        mmWidth = 30163
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'size_description'
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
        mmLeft = 92075
        mmTop = 1588
        mmWidth = 20373
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'unit_description'
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
        mmLeft = 115623
        mmTop = 1588
        mmWidth = 25135
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'transaction type'
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
        mmLeft = 143669
        mmTop = 1588
        mmWidth = 27517
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'qty_onhand'
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
        mmLeft = 173567
        mmTop = 1588
        mmWidth = 27252
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 48683
      mmPrintPosition = 0
      object ppDBText5: TppDBText
        UserName = 'DBText5'
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
        mmLeft = 6085
        mmTop = 3704
        mmWidth = 73554
        BandType = 8
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
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
        mmLeft = 6085
        mmTop = 20902
        mmWidth = 73554
        BandType = 8
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
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
        mmHeight = 4868
        mmLeft = 6085
        mmTop = 28575
        mmWidth = 73554
        BandType = 8
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Weight = 0.750000000000000000
        mmHeight = 3969
        mmLeft = 120915
        mmTop = 26988
        mmWidth = 73554
        BandType = 8
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
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
        mmLeft = 120915
        mmTop = 3704
        mmWidth = 73554
        BandType = 8
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
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
        mmLeft = 120915
        mmTop = 20902
        mmWidth = 73554
        BandType = 8
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
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
        mmLeft = 120915
        mmTop = 28575
        mmWidth = 73554
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
        mmLeft = 6085
        mmTop = 26988
        mmWidth = 73554
        BandType = 8
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
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
        mmHeight = 3175
        mmLeft = 4233
        mmTop = 43921
        mmWidth = 51329
        BandType = 8
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
end
