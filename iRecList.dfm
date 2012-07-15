object frmiRec: TfrmiRec
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Item Received List'
  ClientHeight = 322
  ClientWidth = 535
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
    Width = 535
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
  object GridRecList: TDBGrid
    Left = 0
    Top = 28
    Width = 535
    Height = 244
    Align = alClient
    DataSource = DSRec
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
        Expanded = False
        FieldName = 'recID'
        Title.Caption = 'Item Received No.'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'recDescription'
        Title.Alignment = taCenter
        Title.Caption = 'Description'
        Width = 300
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'recDate'
        Title.Alignment = taCenter
        Title.Caption = 'Received Date'
        Width = 100
        Visible = True
      end>
  end
  object pnl2: TPanel
    Left = 0
    Top = 272
    Width = 535
    Height = 50
    Align = alBottom
    TabOrder = 2
    ExplicitLeft = 1
    ExplicitTop = 278
    DesignSize = (
      535
      50)
    object lbl1: TLabel
      Left = 8
      Top = 32
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
      Top = 7
      Width = 310
      Height = 21
      DataSource = DSRec
      DataField = 'recID'
      MaxLength = 50
      TabOrder = 0
      Text = 'dbSearch'
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
      Left = 121
      Top = 26
      Width = 83
      Height = 17
      Anchors = [akLeft, akBottom]
      Caption = 'Description'
      TabOrder = 2
      OnClick = rb3Click
    end
    object rb4: TRadioButton
      Left = 208
      Top = 26
      Width = 81
      Height = 17
      Anchors = [akLeft, akBottom]
      Caption = 'Received by'
      TabOrder = 3
      OnClick = rb4Click
    end
    object btn2: TButton
      Left = 447
      Top = 13
      Width = 75
      Height = 25
      Caption = 'Print'
      TabOrder = 4
      OnClick = btn2Click
    end
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
      OnClick = btn1Click
    end
  end
  object QryREC: TMyQuery
    Connection = frmData.dbCon
    SQL.Strings = (
      'SELECT'
      'irec.recID,'
      'irec.recDate,'
      'irec.recDescription'
      'FROM'
      'irec'
      'ORDER BY irec.recDate DESC')
    AfterRefresh = QryRECAfterRefresh
    Left = 328
    Top = 72
  end
  object DSRec: TMyDataSource
    AutoEdit = False
    DataSet = QryREC
    Left = 376
    Top = 72
  end
  object QryRecRec: TMyQuery
    Connection = frmData.dbCon
    SQL.Strings = (
      'SELECT'
      'irec.recID,'
      'irec.recDate,'
      'irec.recDescription,'
      'irecdet.qty_onhand,'
      'item.item_description,'
      'unit.unit_description,'
      'brand.brand_description,'
      'size.size_description,'
      
        '(SELECT position.position_description FROM position WHERE positi' +
        'on.position_id = irec.c_position_id) AS c_position,'
      
        '(SELECT position.position_description FROM position WHERE positi' +
        'on.position_id = irec.p_position_id) AS p_position,'
      
        '(SELECT signatory.signatory_name FROM signatory WHERE signatory.' +
        'signatory_id = irec.c_signatory_id) AS c_signatory,'
      
        '(SELECT signatory.signatory_name FROM signatory WHERE signatory.' +
        'signatory_id = irec.p_signatory_id) AS p_signatory,'
      
        '(SELECT designation.designation_name FROM designation INNER JOIN' +
        ' signatory ON signatory.designation_id = designation.designation' +
        '_id WHERE signatory.signatory_id = irec.c_signatory_id) AS c_des' +
        'ignation,'
      
        '(SELECT designation.designation_name FROM designation INNER JOIN' +
        ' signatory ON signatory.designation_id = designation.designation' +
        '_id WHERE signatory.signatory_id = irec.p_signatory_id) AS p_des' +
        'ignation,'
      'userbindary.UserName'
      'FROM'
      'irec'
      'INNER JOIN irecdet ON irec.recID = irecdet.recID'
      'INNER JOIN item ON irecdet.item_id = item.item_id'
      'INNER JOIN unit ON irecdet.unit_id = unit.unit_id'
      'INNER JOIN brand ON item.brand_id = brand.brand_id'
      'INNER JOIN size ON item.size_id = size.size_id'
      'INNER JOIN userbindary ON irec.userID = userbindary.UserID'
      'WHERE irec.recID = :itemrec')
    AfterRefresh = QryRECAfterRefresh
    Active = True
    Left = 144
    Top = 208
    ParamData = <
      item
        DataType = ftString
        Name = 'itemrec'
        ParamType = ptInputOutput
      end>
  end
  object DSRecRec: TMyDataSource
    AutoEdit = False
    DataSet = QryRecRec
    Left = 208
    Top = 208
  end
  object IRdbpipeline: TppDBPipeline
    DataSource = DSRecRec
    UserName = 'IRdbpipeline'
    Left = 392
    Top = 152
    object IRdbpipelineppField1: TppField
      FieldAlias = 'recID'
      FieldName = 'recID'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object IRdbpipelineppField2: TppField
      FieldAlias = 'recDate'
      FieldName = 'recDate'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 1
    end
    object IRdbpipelineppField3: TppField
      FieldAlias = 'recDescription'
      FieldName = 'recDescription'
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
      FieldAlias = 'c_position'
      FieldName = 'c_position'
      FieldLength = 80
      DisplayWidth = 80
      Position = 8
    end
    object IRdbpipelineppField10: TppField
      FieldAlias = 'p_position'
      FieldName = 'p_position'
      FieldLength = 80
      DisplayWidth = 80
      Position = 9
    end
    object IRdbpipelineppField11: TppField
      FieldAlias = 'c_signatory'
      FieldName = 'c_signatory'
      FieldLength = 80
      DisplayWidth = 80
      Position = 10
    end
    object IRdbpipelineppField12: TppField
      FieldAlias = 'p_signatory'
      FieldName = 'p_signatory'
      FieldLength = 80
      DisplayWidth = 80
      Position = 11
    end
    object IRdbpipelineppField13: TppField
      FieldAlias = 'c_designation'
      FieldName = 'c_designation'
      FieldLength = 100
      DisplayWidth = 100
      Position = 12
    end
    object IRdbpipelineppField14: TppField
      FieldAlias = 'p_designation'
      FieldName = 'p_designation'
      FieldLength = 100
      DisplayWidth = 100
      Position = 13
    end
    object IRdbpipelineppField15: TppField
      FieldAlias = 'UserName'
      FieldName = 'UserName'
      FieldLength = 30
      DisplayWidth = 30
      Position = 14
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
    Left = 392
    Top = 200
    Version = '12.03'
    mmColumnWidth = 0
    DataPipelineName = 'IRdbpipeline'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 79111
      mmPrintPosition = 0
      object ppShape1: TppShape
        UserName = 'Shape1'
        Gradient.EndColor = clWhite
        Gradient.StartColor = clWhite
        Gradient.Style = gsNone
        mmHeight = 7938
        mmLeft = 0
        mmTop = 71438
        mmWidth = 202936
        BandType = 0
      end
      object ppShape6: TppShape
        UserName = 'Shape6'
        Gradient.EndColor = clWhite
        Gradient.StartColor = clWhite
        Gradient.Style = gsNone
        mmHeight = 7938
        mmLeft = 123561
        mmTop = 71438
        mmWidth = 40746
        BandType = 0
      end
      object ppShape5: TppShape
        UserName = 'Shape5'
        Gradient.EndColor = clWhite
        Gradient.StartColor = clWhite
        Gradient.Style = gsNone
        mmHeight = 7938
        mmLeft = 93398
        mmTop = 71438
        mmWidth = 30427
        BandType = 0
      end
      object ppShape4: TppShape
        UserName = 'Shape4'
        Gradient.EndColor = clWhite
        Gradient.StartColor = clWhite
        Gradient.Style = gsNone
        mmHeight = 7938
        mmLeft = 59267
        mmTop = 71438
        mmWidth = 34660
        BandType = 0
      end
      object ppShape3: TppShape
        UserName = 'Shape3'
        Gradient.EndColor = clWhite
        Gradient.StartColor = clWhite
        Gradient.Style = gsNone
        mmHeight = 7938
        mmLeft = 0
        mmTop = 71438
        mmWidth = 59531
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
        mmLeft = 70797
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
        mmLeft = 83504
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
          'This is to certify that the following items were received and en' +
          'coded to warehouse.'
        Ellipsis = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 13
        Font.Style = []
        Transparent = True
        mmHeight = 5292
        mmLeft = 21167
        mmTop = 61383
        mmWidth = 166688
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
        Caption = 'Remarks:'
        Ellipsis = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 1852
        mmTop = 43392
        mmWidth = 18256
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
        mmLeft = 13758
        mmTop = 36777
        mmWidth = 6350
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
        mmLeft = 1852
        mmTop = 72761
        mmWidth = 56092
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
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 61119
        mmTop = 72761
        mmWidth = 30427
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
        mmLeft = 124354
        mmTop = 72761
        mmWidth = 38894
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
        mmLeft = 168805
        mmTop = 72761
        mmWidth = 27517
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
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 96309
        mmTop = 72761
        mmWidth = 25665
        BandType = 0
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'recID'
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
        mmLeft = 21167
        mmTop = 36777
        mmWidth = 64558
        BandType = 0
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'recDescription'
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
        mmLeft = 21167
        mmTop = 43392
        mmWidth = 175155
        BandType = 0
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'recDate'
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
        mmHeight = 4763
        mmLeft = 138113
        mmTop = 36777
        mmWidth = 58208
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'CERTIFICATION OF RECEIVED GOODS'
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
        mmTop = 21696
        mmWidth = 202936
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
      object ppShape2: TppShape
        UserName = 'Shape2'
        Gradient.EndColor = clWhite
        Gradient.StartColor = clWhite
        Gradient.Style = gsNone
        mmHeight = 7938
        mmLeft = 0
        mmTop = 0
        mmWidth = 202936
        BandType = 4
      end
      object ppShape7: TppShape
        UserName = 'Shape7'
        Gradient.EndColor = clWhite
        Gradient.StartColor = clWhite
        Gradient.Style = gsNone
        mmHeight = 7938
        mmLeft = 0
        mmTop = 0
        mmWidth = 59531
        BandType = 4
      end
      object ppShape8: TppShape
        UserName = 'Shape8'
        Gradient.EndColor = clWhite
        Gradient.StartColor = clWhite
        Gradient.Style = gsNone
        mmHeight = 7938
        mmLeft = 59267
        mmTop = 0
        mmWidth = 34660
        BandType = 4
      end
      object ppShape10: TppShape
        UserName = 'Shape10'
        Gradient.EndColor = clWhite
        Gradient.StartColor = clWhite
        Gradient.Style = gsNone
        mmHeight = 7938
        mmLeft = 123561
        mmTop = 0
        mmWidth = 40746
        BandType = 4
      end
      object ppShape9: TppShape
        UserName = 'Shape9'
        Gradient.EndColor = clWhite
        Gradient.StartColor = clWhite
        Gradient.Style = gsNone
        mmHeight = 7938
        mmLeft = 93398
        mmTop = 0
        mmWidth = 30427
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
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
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'IRdbpipeline'
        mmHeight = 4868
        mmLeft = 1852
        mmTop = 1323
        mmWidth = 56092
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
        mmLeft = 61119
        mmTop = 1323
        mmWidth = 29633
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
        mmLeft = 96309
        mmTop = 1323
        mmWidth = 25135
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
        mmLeft = 125148
        mmTop = 1323
        mmWidth = 38100
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
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
        mmLeft = 166688
        mmTop = 1323
        mmWidth = 32808
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 53446
      mmPrintPosition = 0
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
        mmLeft = 7144
        mmTop = 10848
        mmWidth = 75671
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
        mmLeft = 7144
        mmTop = 27252
        mmWidth = 75671
        BandType = 8
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
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
        mmLeft = 7144
        mmTop = 36248
        mmWidth = 75671
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
        mmLeft = 7144
        mmTop = 34396
        mmWidth = 75671
        BandType = 8
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
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
        mmLeft = 1852
        mmTop = 49213
        mmWidth = 39158
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
        mmLeft = 112977
        mmTop = 10848
        mmWidth = 75671
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
        mmLeft = 112977
        mmTop = 27517
        mmWidth = 75671
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
        mmLeft = 112977
        mmTop = 36248
        mmWidth = 75671
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
        mmLeft = 112977
        mmTop = 34396
        mmWidth = 75671
        BandType = 8
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
end
