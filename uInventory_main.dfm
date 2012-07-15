object frmInventory: TfrmInventory
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Inventory'
  ClientHeight = 398
  ClientWidth = 875
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  DesignSize = (
    875
    398)
  PixelsPerInch = 96
  TextHeight = 13
  object pgc1: TPageControl
    Left = 0
    Top = 8
    Width = 878
    Height = 387
    ActivePage = ts1
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object ts1: TTabSheet
      Caption = 'Inventory Details'
      DesignSize = (
        870
        359)
      object lbl1: TLabel
        Left = 3
        Top = 331
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
      object db2: TwwDBGrid
        Left = 0
        Top = 3
        Width = 867
        Height = 300
        ControlType.Strings = (
          'ItemNo;CustomEdit;dbItemNo;F'
          'ItemDescription;CustomEdit;dbItemDescription;F')
        Selected.Strings = (
          'item_id'#9'7'#9'ID'
          'item_description'#9'30'#9'Description'
          'unit_description'#9'10'#9'Unit'
          'brand_description'#9'15'#9'Brand'
          'size_description'#9'10'#9'Size'
          'qty_onhand'#9'13'#9'Stock Quantity'#9'F'
          'Whole'#9'17'#9'Whole'
          'Remainder'#9'10'#9'kg / pcs'
          'UserName'#9'20'#9'User')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        DataSource = DSInv
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        TabOrder = 0
        TitleAlignment = taCenter
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        TitleLines = 1
        TitleButtons = False
      end
      object rb3: TRadioButton
        Left = 116
        Top = 329
        Width = 83
        Height = 17
        Anchors = [akLeft, akBottom]
        Caption = 'Description'
        TabOrder = 1
        OnClick = rb3Click
      end
      object rb4: TRadioButton
        Left = 203
        Top = 329
        Width = 57
        Height = 17
        Anchors = [akLeft, akBottom]
        Caption = 'Brand'
        TabOrder = 2
        OnClick = rb4Click
      end
      object dbSearch: TJvDBSearchEdit
        Left = 3
        Top = 306
        Width = 310
        Height = 21
        DataSource = DSInv
        DataField = 'item_id'
        MaxLength = 50
        TabOrder = 3
        Text = '00002'
      end
      object rb2: TRadioButton
        Left = 71
        Top = 329
        Width = 37
        Height = 17
        Anchors = [akLeft, akBottom]
        Caption = 'ID'
        Checked = True
        TabOrder = 4
        TabStop = True
        OnClick = rb2Click
      end
      object rb1: TRadioButton
        Left = 267
        Top = 329
        Width = 45
        Height = 17
        Anchors = [akLeft, akBottom]
        Caption = 'User'
        TabOrder = 5
        OnClick = rb1Click
      end
      object btn2: TButton
        Left = 757
        Top = 320
        Width = 85
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = 'Print'
        TabOrder = 6
        OnClick = btn2Click
      end
    end
  end
  object QryInv: TMyQuery
    Connection = frmData.dbCon
    SQL.Strings = (
      'SELECT'
      'ibalance.item_id,'
      'item.item_description,'
      'unit.unit_description,'
      'brand.brand_description,'
      'ibalance.qty_onhand,'
      'size.size_description,'
      'userbindary.UserName'
      'FROM'
      'ibalance'
      'INNER JOIN item ON ibalance.item_id = item.item_id'
      'INNER JOIN unit ON item.unit_id = unit.unit_id'
      'INNER JOIN brand ON item.brand_id = brand.brand_id'
      'INNER JOIN size ON item.size_id = size.size_id'
      'INNER JOIN userbindary ON ibalance.UserID = userbindary.UserID')
    OnCalcFields = QryInvCalcFields
    Active = True
    Left = 240
    Top = 144
    object dbQryInvitem_id: TStringField
      Alignment = taCenter
      DisplayLabel = 'ID'
      DisplayWidth = 7
      FieldName = 'item_id'
      Origin = 'ibalance.item_id'
      ReadOnly = True
      Size = 11
    end
    object dbQryInvitem_description: TStringField
      Alignment = taCenter
      DisplayLabel = 'Description'
      DisplayWidth = 30
      FieldName = 'item_description'
      Origin = 'item.item_description'
      ReadOnly = True
      Size = 50
    end
    object dbQryInvunit_description: TStringField
      Alignment = taCenter
      DisplayLabel = 'Unit'
      DisplayWidth = 10
      FieldName = 'unit_description'
      Origin = 'unit.unit_description'
      ReadOnly = True
      Size = 50
    end
    object dbQryInvbrand_description: TStringField
      Alignment = taCenter
      DisplayLabel = 'Brand'
      DisplayWidth = 15
      FieldName = 'brand_description'
      Origin = 'brand.brand_description'
      ReadOnly = True
      Size = 50
    end
    object dbQryInvsize_description: TStringField
      Alignment = taCenter
      DisplayLabel = 'Size'
      DisplayWidth = 10
      FieldName = 'size_description'
      Origin = 'size.size_description'
      ReadOnly = True
      Size = 50
    end
    object dbQryInvqty_onhand: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'Stock Quantity'
      DisplayWidth = 13
      FieldName = 'qty_onhand'
      Origin = 'ibalance.qty_onhand'
      ReadOnly = True
    end
    object dbQryInvWhole: TStringField
      Alignment = taCenter
      DisplayWidth = 17
      FieldKind = fkCalculated
      FieldName = 'Whole'
      Calculated = True
    end
    object dbQryInvRemainder: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'kg / pcs'
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'Remainder'
      Calculated = True
    end
    object dbQryInvUserName: TStringField
      Alignment = taCenter
      DisplayLabel = 'User'
      DisplayWidth = 20
      FieldName = 'UserName'
      Origin = 'userbindary.UserName'
      ReadOnly = True
      Size = 30
    end
  end
  object DSInv: TMyDataSource
    AutoEdit = False
    DataSet = QryInv
    Left = 280
    Top = 144
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
    Left = 576
    Top = 224
    Version = '12.03'
    mmColumnWidth = 0
    DataPipelineName = 'IRdbpipeline'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 60854
      mmPrintPosition = 0
      object ppShape1: TppShape
        UserName = 'Shape1'
        Gradient.EndColor = clWhite
        Gradient.StartColor = clWhite
        Gradient.Style = gsNone
        mmHeight = 7938
        mmLeft = 0
        mmTop = 52917
        mmWidth = 266436
        BandType = 0
      end
      object ppShape12: TppShape
        UserName = 'Shape12'
        Gradient.EndColor = clWhite
        Gradient.StartColor = clWhite
        Gradient.Style = gsNone
        mmHeight = 7938
        mmLeft = 201348
        mmTop = 52917
        mmWidth = 34660
        BandType = 0
      end
      object ppShape11: TppShape
        UserName = 'Shape11'
        Gradient.EndColor = clWhite
        Gradient.StartColor = clWhite
        Gradient.Style = gsNone
        mmHeight = 7938
        mmLeft = 164042
        mmTop = 52917
        mmWidth = 37571
        BandType = 0
      end
      object ppShape6: TppShape
        UserName = 'Shape6'
        Gradient.EndColor = clWhite
        Gradient.StartColor = clWhite
        Gradient.Style = gsNone
        mmHeight = 7938
        mmLeft = 123561
        mmTop = 52916
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
        mmTop = 52916
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
        mmTop = 52916
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
        mmTop = 52916
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
        Caption = 'Ofiice of the Provincial Governor'
        Ellipsis = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4498
        mmLeft = 0
        mmTop = 1852
        mmWidth = 202936
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
        Font.Size = 11
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4487
        mmLeft = 85028
        mmTop = 7673
        mmWidth = 32893
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
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 1852
        mmTop = 44450
        mmWidth = 182034
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
        mmTop = 29633
        mmWidth = 18256
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
        mmLeft = 21167
        mmTop = 29633
        mmWidth = 58738
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
        mmLeft = 2381
        mmTop = 23019
        mmWidth = 6350
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
        mmLeft = 9790
        mmTop = 23019
        mmWidth = 64558
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
        mmHeight = 4657
        mmLeft = 1852
        mmTop = 54504
        mmWidth = 56092
        BandType = 0
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'receive date'
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
        mmLeft = 143404
        mmTop = 23019
        mmWidth = 58208
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
        mmHeight = 4657
        mmLeft = 61119
        mmTop = 54504
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
        mmHeight = 4657
        mmLeft = 124354
        mmTop = 54504
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
        Caption = 'Quantity(pcs/kg)'
        Ellipsis = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 166952
        mmTop = 54504
        mmWidth = 34131
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
        mmHeight = 4657
        mmLeft = 96309
        mmTop = 54504
        mmWidth = 25665
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        HyperlinkColor = clBlue
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Whole'
        Ellipsis = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 202936
        mmTop = 54504
        mmWidth = 31221
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
        Caption = 'Remainder'
        Ellipsis = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 240242
        mmTop = 54504
        mmWidth = 21167
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
        mmWidth = 266436
        BandType = 4
      end
      object ppShape14: TppShape
        UserName = 'Shape102'
        Gradient.EndColor = clWhite
        Gradient.StartColor = clWhite
        Gradient.Style = gsNone
        mmHeight = 7938
        mmLeft = 201348
        mmTop = 0
        mmWidth = 34660
        BandType = 4
      end
      object ppShape13: TppShape
        UserName = 'Shape101'
        Gradient.EndColor = clWhite
        Gradient.StartColor = clWhite
        Gradient.Style = gsNone
        mmHeight = 7938
        mmLeft = 164042
        mmTop = 0
        mmWidth = 37571
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
      object ppDBText10: TppDBText
        UserName = 'DBText10'
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
        mmHeight = 4763
        mmLeft = 168805
        mmTop = 1323
        mmWidth = 30956
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
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
        mmLeft = 127265
        mmTop = 1323
        mmWidth = 32808
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
        mmWidth = 25665
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
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
        mmHeight = 4763
        mmLeft = 61119
        mmTop = 1323
        mmWidth = 30427
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
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
        mmLeft = 2381
        mmTop = 1323
        mmWidth = 55563
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'Whole'
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
        mmLeft = 207698
        mmTop = 1323
        mmWidth = 25135
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'Remainder'
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
        mmLeft = 238655
        mmTop = 1323
        mmWidth = 24606
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 45773
      mmPrintPosition = 0
      object ppLabel7: TppLabel
        UserName = 'Label7'
        HyperlinkColor = clBlue
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Received by'
        Ellipsis = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4572
        mmLeft = 2381
        mmTop = 1323
        mmWidth = 29633
        BandType = 8
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'received by'
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
        mmLeft = 1852
        mmTop = 15875
        mmWidth = 114829
        BandType = 8
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
  object IRdbpipeline: TppDBPipeline
    DataSource = DSInv
    UserName = 'IRdbpipeline'
    Left = 576
    Top = 176
    object IRdbpipelineppField1: TppField
      FieldAlias = 'item_id'
      FieldName = 'item_id'
      FieldLength = 11
      DisplayWidth = 7
      Position = 0
    end
    object IRdbpipelineppField2: TppField
      FieldAlias = 'item_description'
      FieldName = 'item_description'
      FieldLength = 50
      DisplayWidth = 30
      Position = 1
    end
    object IRdbpipelineppField3: TppField
      FieldAlias = 'unit_description'
      FieldName = 'unit_description'
      FieldLength = 50
      DisplayWidth = 10
      Position = 2
    end
    object IRdbpipelineppField4: TppField
      FieldAlias = 'brand_description'
      FieldName = 'brand_description'
      FieldLength = 50
      DisplayWidth = 15
      Position = 3
    end
    object IRdbpipelineppField5: TppField
      FieldAlias = 'size_description'
      FieldName = 'size_description'
      FieldLength = 50
      DisplayWidth = 10
      Position = 4
    end
    object IRdbpipelineppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'qty_onhand'
      FieldName = 'qty_onhand'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 13
      Position = 5
    end
    object IRdbpipelineppField7: TppField
      FieldAlias = 'Whole'
      FieldName = 'Whole'
      FieldLength = 20
      DisplayWidth = 17
      Position = 6
    end
    object IRdbpipelineppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'Remainder'
      FieldName = 'Remainder'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 7
    end
    object IRdbpipelineppField9: TppField
      FieldAlias = 'UserName'
      FieldName = 'UserName'
      FieldLength = 30
      DisplayWidth = 20
      Position = 8
    end
  end
end
