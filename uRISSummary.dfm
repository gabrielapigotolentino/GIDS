object frmRISSummary: TfrmRISSummary
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'RIS Summary'
  ClientHeight = 297
  ClientWidth = 273
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblMonth: TLabel
    Left = 17
    Top = 22
    Width = 30
    Height = 13
    Caption = 'Month'
  end
  object lblCol1: TLabel
    Left = 47
    Top = 22
    Width = 22
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = ':'
  end
  object lblYear: TLabel
    Left = 135
    Top = 22
    Width = 22
    Height = 13
    Caption = 'Year'
  end
  object lblCol2: TLabel
    Left = 157
    Top = 22
    Width = 22
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = ':'
  end
  object btnPREVIEW: TBitBtn
    Left = 18
    Top = 260
    Width = 240
    Height = 25
    Caption = 'PRE&VIEW'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 4
    OnClick = btnPREVIEWClick
  end
  object edtMonth: TEdit
    Left = 69
    Top = 18
    Width = 40
    Height = 21
    Alignment = taCenter
    MaxLength = 2
    NumbersOnly = True
    TabOrder = 0
  end
  object edtYear: TEdit
    Left = 179
    Top = 18
    Width = 75
    Height = 21
    Alignment = taCenter
    MaxLength = 4
    NumbersOnly = True
    TabOrder = 1
  end
  object chkCurrent: TCheckBox
    Left = 193
    Top = 70
    Width = 61
    Height = 17
    Caption = 'Current'
    TabOrder = 3
    OnClick = chkCurrentClick
  end
  object rgItemType: TRadioGroup
    Left = 17
    Top = 43
    Width = 146
    Height = 71
    Caption = 'Item Type:'
    Items.Strings = (
      'Canned / Rice Goods'
      'School Supplies')
    TabOrder = 2
    OnClick = rgItemTypeClick
  end
  object pnlPSign: TPanel
    Left = 17
    Top = 114
    Width = 240
    Height = 73
    BevelOuter = bvNone
    TabOrder = 5
    DesignSize = (
      240
      73)
    object lblDesignation1: TLabel
      Left = 1
      Top = 56
      Width = 236
      Height = 13
      Alignment = taCenter
      AutoSize = False
    end
    object wdblkpcmbPPosition: TwwDBLookupCombo
      Left = 1
      Top = 2
      Width = 152
      Height = 21
      DisableThemes = True
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'position_description'#9'80'#9'position_description'#9'F')
      LookupTable = frmData.qryListOfPosition
      LookupField = 'position_id'
      DropDownCount = 5
      DropDownWidth = 120
      TabOrder = 0
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      ShowMatchText = True
      OnChange = wdblkpcmbPPositionChange
      OnKeyPress = wdblkpcmbPPositionKeyPress
    end
    object wdblkpcmbPSignatory: TwwDBLookupCombo
      Left = 1
      Top = 31
      Width = 236
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DisableThemes = True
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'signatory_name'#9'80'#9'signatory_name'#9'F')
      LookupTable = frmData.qryListOfSignatory
      LookupField = 'signatory_id'
      DropDownCount = 5
      DropDownWidth = 195
      Enabled = False
      TabOrder = 1
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      ShowMatchText = True
      OnChange = wdblkpcmbPSignatoryChange
      OnClick = wdblkpcmbPSignatoryClick
      OnBeforeDropDown = wdblkpcmbPSignatoryBeforeDropDown
      OnKeyPress = wdblkpcmbPSignatoryKeyPress
    end
  end
  object pnlASign: TPanel
    Left = 17
    Top = 187
    Width = 240
    Height = 73
    BevelOuter = bvNone
    TabOrder = 6
    DesignSize = (
      240
      73)
    object lblDesignation3: TLabel
      Left = 1
      Top = 56
      Width = 236
      Height = 13
      Alignment = taCenter
      AutoSize = False
    end
    object wdblkpcmbAPosition: TwwDBLookupCombo
      Left = 1
      Top = 2
      Width = 152
      Height = 21
      DisableThemes = True
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'position_description'#9'80'#9'position_description'#9'F')
      LookupTable = frmData.qryListOfPosition
      LookupField = 'position_id'
      DropDownCount = 5
      DropDownWidth = 120
      TabOrder = 0
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      ShowMatchText = True
      OnChange = wdblkpcmbAPositionChange
      OnKeyPress = wdblkpcmbAPositionKeyPress
    end
    object wdblkpcmbASignatory: TwwDBLookupCombo
      Left = 1
      Top = 31
      Width = 236
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DisableThemes = True
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'signatory_name'#9'80'#9'signatory_name'#9'F')
      LookupTable = frmData.qryListOfSignatory
      LookupField = 'signatory_id'
      DropDownCount = 5
      DropDownWidth = 195
      Enabled = False
      TabOrder = 1
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      ShowMatchText = True
      OnChange = wdblkpcmbASignatoryChange
      OnClick = wdblkpcmbASignatoryClick
      OnBeforeDropDown = wdblkpcmbASignatoryBeforeDropDown
      OnKeyPress = wdblkpcmbASignatoryKeyPress
    end
  end
  object strdprcBegBalance: TMyStoredProc
    StoredProcName = 'spBegBalance'
    Connection = frmData.dbCon
    SQL.Strings = (
      'CALL spBegBalance(:`ConditionStatement`)')
    Active = True
    Left = 331
    Top = 273
    ParamData = <
      item
        DataType = ftString
        Name = '`ConditionStatement`'
        ParamType = ptInput
        Value = ''
      end>
    CommandStoredProcName = 'spBegBalance'
  end
  object dsspBegBalance: TMyDataSource
    DataSet = strdprcBegBalance
    Left = 331
    Top = 321
  end
  object strdprcListOfRecipient: TMyStoredProc
    StoredProcName = 'spListOfRecipient'
    Connection = frmData.dbCon
    SQL.Strings = (
      'CALL spListOfRecipient(:`ConditionStatement`)')
    Active = True
    Left = 442
    Top = 273
    ParamData = <
      item
        DataType = ftString
        Name = '`ConditionStatement`'
        ParamType = ptInput
        Value = ''
      end>
    CommandStoredProcName = 'spListOfRecipient'
  end
  object dsspListOfRecipient: TMyDataSource
    DataSet = strdprcListOfRecipient
    Left = 439
    Top = 321
  end
  object strdprcEndBalance: TMyStoredProc
    StoredProcName = 'spEndBalance'
    Connection = frmData.dbCon
    SQL.Strings = (
      'CALL spEndBalance(:`ConditionStatement`)')
    Active = True
    Left = 554
    Top = 273
    ParamData = <
      item
        DataType = ftString
        Name = '`ConditionStatement`'
        ParamType = ptInput
        Value = ''
      end>
    CommandStoredProcName = 'spEndBalance'
  end
  object dsspEndBalance: TMyDataSource
    DataSet = strdprcEndBalance
    Left = 554
    Top = 321
  end
  object pdbpplnBB: TppDBPipeline
    DataSource = dsspBegBalance
    UserName = 'pdbpplnBB'
    Left = 329
    Top = 369
    object pdbpplnBBppField1: TppField
      FieldAlias = 'ITEM DESCRIPTION'
      FieldName = 'ITEM DESCRIPTION'
      FieldLength = 153
      DisplayWidth = 153
      Position = 0
    end
    object pdbpplnBBppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'BEGINNING BALANCE'
      FieldName = 'BEGINNING BALANCE'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 1
    end
    object pdbpplnBBppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'BUNIT PRICE'
      FieldName = 'BUNIT PRICE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object pdbpplnBBppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'BSUB - TOTAL'
      FieldName = 'BSUB - TOTAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object pdbpplnBBppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'ADD'
      FieldName = 'ADD'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object pdbpplnBBppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'AUNIT PRICE'
      FieldName = 'AUNIT PRICE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object pdbpplnBBppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'ASUB - TOTAL'
      FieldName = 'ASUB - TOTAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object pdbpplnBBppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'GRAND TOTAL'
      FieldName = 'GRAND TOTAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
  end
  object pdbpplnLR: TppDBPipeline
    DataSource = dsspListOfRecipient
    UserName = 'pdbpplnLR'
    Left = 439
    Top = 369
    object pdbpplnLRppField1: TppField
      FieldAlias = 'DISTRIBUTION TO'
      FieldName = 'DISTRIBUTION TO'
      FieldLength = 407
      DisplayWidth = 407
      Position = 0
    end
    object pdbpplnLRppField2: TppField
      FieldAlias = 'ITEM DESCRIPTION'
      FieldName = 'ITEM DESCRIPTION'
      FieldLength = 153
      DisplayWidth = 153
      Position = 1
    end
    object pdbpplnLRppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'NO OF RECIPIENT'
      FieldName = 'NO OF RECIPIENT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object pdbpplnLRppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'QUANTITY'
      FieldName = 'QUANTITY'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object pdbpplnLRppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'UNIT PRICE'
      FieldName = 'UNIT PRICE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
  end
  object pdbpplnEB: TppDBPipeline
    DataSource = dsspEndBalance
    UserName = 'pdbpplnEB'
    Left = 554
    Top = 369
    object pdbpplnEBppField1: TppField
      FieldAlias = 'ITEM DESCRIPTION'
      FieldName = 'ITEM DESCRIPTION'
      FieldLength = 153
      DisplayWidth = 153
      Position = 0
    end
    object pdbpplnEBppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTAL DISTRIBUTION'
      FieldName = 'TOTAL DISTRIBUTION'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object pdbpplnEBppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'UNIT PRICE'
      FieldName = 'UNIT PRICE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object pdbpplnEBppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTAL COST GOODS DISTRIBUTED'
      FieldName = 'TOTAL COST GOODS DISTRIBUTED'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object pdbpplnEBppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'ENDING BALANCE'
      FieldName = 'ENDING BALANCE'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 4
    end
    object pdbpplnEBppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'EUNIT PRICE'
      FieldName = 'EUNIT PRICE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object pdbpplnEBppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'AMOUNT'
      FieldName = 'AMOUNT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
  end
  object prprtRISSummary: TppReport
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'Custom'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 3810
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 215900
    PrinterSetup.mmPaperWidth = 342901
    PrinterSetup.PaperSize = 175
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
    Left = 439
    Top = 417
    Version = '12.03'
    mmColumnWidth = 0
    object ppTitleBand1: TppTitleBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 22754
      mmPrintPosition = 0
      object plblTitle1: TppLabel
        UserName = 'plblTitle1'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'OFFICE OF THE PROVINCIAL GOVERNOR'
        Ellipsis = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4498
        mmLeft = 125942
        mmTop = 794
        mmWidth = 77788
        BandType = 1
      end
      object plblTitle2: TppLabel
        UserName = 'plblTitle2'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'SUMMARY OF REQUISITION AND ISSUANCE SLIP'
        Ellipsis = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4498
        mmLeft = 119063
        mmTop = 5556
        mmWidth = 92075
        BandType = 1
      end
      object ppCrossTab1: TppCrossTab
        UserName = 'CrossTab1'
        DataPipeline = pdbpplnBB
        ParentDataPipeline = False
        Stretch = True
        Style = 'Standard'
        DataPipelineName = 'pdbpplnBB'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 17727
        mmWidth = 330201
        BandType = 1
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmMinHeight = 0
        object TppGrandTotal
          ChildType = 6
          object TppTotalCaptionDef
            ChildType = 4
            Alignment = taCenter
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
          end
          object TppTotalDef
            ChildType = 3
            Color = clWhite
            DisplayFormat = '#,0;-#,0'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
          end
        end
        object TppGrandTotal
          ChildType = 6
          object TppTotalCaptionDef
            ChildType = 4
            Alignment = taRightJustify
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
          end
          object TppTotalDef
            ChildType = 3
            Color = clWhite
            DisplayFormat = '#,0.00;-#,0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
          end
        end
        object TppGrandTotal
          ChildType = 6
          object TppTotalCaptionDef
            ChildType = 4
            Alignment = taRightJustify
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
          end
          object TppTotalDef
            ChildType = 3
            Color = clWhite
            DisplayFormat = '#,0.00;-#,0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
          end
        end
        object TppGrandTotal
          ChildType = 6
          object TppTotalCaptionDef
            ChildType = 4
            Alignment = taRightJustify
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
          end
          object TppTotalDef
            ChildType = 3
            Color = clWhite
            DisplayFormat = '#,0;-#,0'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
          end
        end
        object TppGrandTotal
          ChildType = 6
          object TppTotalCaptionDef
            ChildType = 4
            Alignment = taRightJustify
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
          end
          object TppTotalDef
            ChildType = 3
            Color = clWhite
            DisplayFormat = '#,0.00;-#,0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
          end
        end
        object TppGrandTotal
          ChildType = 6
          object TppTotalCaptionDef
            ChildType = 4
            Alignment = taRightJustify
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
          end
          object TppTotalDef
            ChildType = 3
            Color = clWhite
            DisplayFormat = '#,0.00;-#,0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
          end
        end
        object TppGrandTotal
          ChildType = 6
          object TppTotalCaptionDef
            ChildType = 4
            Alignment = taRightJustify
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
          end
          object TppTotalDef
            ChildType = 3
            Color = clWhite
            DisplayFormat = '#,0.00;-#,0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
          end
        end
        object TppGrandTotal
          ChildType = 7
          object TppTotalCaptionDef
            ChildType = 4
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
          end
          object TppTotalDef
            ChildType = 3
            Color = clWhite
            DisplayFormat = '#,0;-#,0'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
          end
        end
        object TppGrandTotal
          ChildType = 7
          object TppTotalCaptionDef
            ChildType = 4
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
          end
          object TppTotalDef
            ChildType = 3
            Color = clWhite
            DisplayFormat = '#,0.00;-#,0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
          end
        end
        object TppGrandTotal
          ChildType = 7
          object TppTotalCaptionDef
            ChildType = 4
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
          end
          object TppTotalDef
            ChildType = 3
            Color = clWhite
            DisplayFormat = '#,0.00;-#,0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
          end
        end
        object TppGrandTotal
          ChildType = 7
          object TppTotalCaptionDef
            ChildType = 4
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
          end
          object TppTotalDef
            ChildType = 3
            Color = clWhite
            DisplayFormat = '#,0;-#,0'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
          end
        end
        object TppGrandTotal
          ChildType = 7
          object TppTotalCaptionDef
            ChildType = 4
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
          end
          object TppTotalDef
            ChildType = 3
            Color = clWhite
            DisplayFormat = '#,0.00;-#,0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
          end
        end
        object TppGrandTotal
          ChildType = 7
          object TppTotalCaptionDef
            ChildType = 4
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
          end
          object TppTotalDef
            ChildType = 3
            Color = clWhite
            DisplayFormat = '#,0.00;-#,0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
          end
        end
        object TppGrandTotal
          ChildType = 7
          object TppTotalCaptionDef
            ChildType = 4
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
          end
          object TppTotalDef
            ChildType = 3
            Color = clWhite
            DisplayFormat = '#,0.00;-#,0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
          end
        end
        object TppColumnDef
          FieldAlias = 'ITEM DESCRIPTION'
          FieldName = 'ITEM DESCRIPTION'
          Alignment = taCenter
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          object TppSubTotal
            ChildType = 5
            object TppTotalCaptionDef
              ChildType = 4
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
            end
            object TppTotalDef
              ChildType = 3
              Color = clWhite
              DisplayFormat = '#,0;-#,0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
            end
          end
          object TppSubTotal
            ChildType = 5
            object TppTotalCaptionDef
              ChildType = 4
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
            end
            object TppTotalDef
              ChildType = 3
              Color = clWhite
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
            end
          end
          object TppSubTotal
            ChildType = 5
            object TppTotalCaptionDef
              ChildType = 4
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
            end
            object TppTotalDef
              ChildType = 3
              Color = clWhite
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
            end
          end
          object TppSubTotal
            ChildType = 5
            object TppTotalCaptionDef
              ChildType = 4
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
            end
            object TppTotalDef
              ChildType = 3
              Color = clWhite
              DisplayFormat = '#,0;-#,0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
            end
          end
          object TppSubTotal
            ChildType = 5
            object TppTotalCaptionDef
              ChildType = 4
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
            end
            object TppTotalDef
              ChildType = 3
              Color = clWhite
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
            end
          end
          object TppSubTotal
            ChildType = 5
            object TppTotalCaptionDef
              ChildType = 4
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
            end
            object TppTotalDef
              ChildType = 3
              Color = clWhite
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
            end
          end
          object TppSubTotal
            ChildType = 5
            object TppTotalCaptionDef
              ChildType = 4
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
            end
            object TppTotalDef
              ChildType = 3
              Color = clWhite
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
            end
          end
        end
        object TppValueDef
          ChildType = 2
          FieldAlias = 'BEGINNING BALANCE'
          FieldName = 'BEGINNING BALANCE'
          Color = clWhite
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          object TppValueCaptionDef
            ChildType = 8
            CalcType = dcSum
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
          end
        end
        object TppValueDef
          ChildType = 2
          FieldAlias = 'BUNIT PRICE'
          FieldName = 'BUNIT PRICE'
          Color = clWhite
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          object TppValueCaptionDef
            ChildType = 8
            CalcType = dcSum
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
          end
        end
        object TppValueDef
          ChildType = 2
          FieldAlias = 'BSUB - TOTAL'
          FieldName = 'BSUB - TOTAL'
          Color = clWhite
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          object TppValueCaptionDef
            ChildType = 8
            CalcType = dcSum
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
          end
        end
        object TppValueDef
          ChildType = 2
          FieldAlias = 'ADD'
          FieldName = 'ADD'
          Color = clWhite
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          object TppValueCaptionDef
            ChildType = 8
            CalcType = dcSum
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
          end
        end
        object TppValueDef
          ChildType = 2
          FieldAlias = 'AUNIT PRICE'
          FieldName = 'AUNIT PRICE'
          Color = clWhite
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          object TppValueCaptionDef
            ChildType = 8
            CalcType = dcSum
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
          end
        end
        object TppValueDef
          ChildType = 2
          FieldAlias = 'ASUB - TOTAL'
          FieldName = 'ASUB - TOTAL'
          Color = clWhite
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          object TppValueCaptionDef
            ChildType = 8
            CalcType = dcSum
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
          end
        end
        object TppValueDef
          ChildType = 2
          FieldAlias = 'GRAND TOTAL'
          FieldName = 'GRAND TOTAL'
          Color = clWhite
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          object TppValueCaptionDef
            ChildType = 8
            CalcType = dcSum
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
          end
        end
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        HyperlinkColor = clBlue
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'typegoods'
        DataPipeline = pdbpplnSign
        Ellipsis = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pdbpplnSign'
        mmHeight = 4498
        mmLeft = 0
        mmTop = 10319
        mmWidth = 330201
        BandType = 1
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
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppCrossTab2: TppCrossTab
        UserName = 'CrossTab2'
        DataPipeline = pdbpplnLR
        ParentDataPipeline = False
        Stretch = True
        Style = 'Standard'
        DataPipelineName = 'pdbpplnLR'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 0
        mmWidth = 330201
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmMinHeight = 0
        object TppGrandTotal
          ChildType = 6
          object TppTotalCaptionDef
            ChildType = 4
            Alignment = taRightJustify
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
          end
          object TppTotalDef
            ChildType = 3
            Color = clWhite
            DisplayFormat = '#,0;-#,0'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
          end
        end
        object TppGrandTotal
          ChildType = 7
          object TppTotalCaptionDef
            ChildType = 4
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
          end
          object TppTotalDef
            ChildType = 3
            Alignment = taCenter
            Color = clWhite
            DisplayFormat = '#,0;-#,0'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
          end
        end
        object TppColumnDef
          FieldAlias = 'ITEM DESCRIPTION'
          FieldName = 'ITEM DESCRIPTION'
          Alignment = taCenter
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          object TppSubTotal
            ChildType = 5
            object TppTotalCaptionDef
              ChildType = 4
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
            end
            object TppTotalDef
              ChildType = 3
              Color = clWhite
              DisplayFormat = '#,0;-#,0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
            end
          end
        end
        object TppRowDef
          ChildType = 1
          FieldAlias = 'DISTRIBUTION TO'
          FieldName = 'DISTRIBUTION TO'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          object TppSubTotal
            ChildType = 5
            object TppTotalCaptionDef
              ChildType = 4
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              Visible = False
            end
            object TppTotalDef
              ChildType = 3
              Color = clWhite
              DisplayFormat = '#,0;-#,0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              Visible = False
            end
          end
        end
        object TppRowDef
          ChildType = 1
          FieldAlias = 'NO OF RECIPIENT'
          FieldName = 'NO OF RECIPIENT'
          Alignment = taCenter
          Color = clWhite
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          object TppSubTotal
            ChildType = 5
            object TppTotalCaptionDef
              ChildType = 4
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
            end
            object TppTotalDef
              ChildType = 3
              Color = clWhite
              DisplayFormat = '#,0;-#,0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
            end
          end
        end
        object TppValueDef
          ChildType = 2
          FieldAlias = 'QUANTITY'
          FieldName = 'QUANTITY'
          Alignment = taCenter
          Color = clWhite
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          object TppValueCaptionDef
            ChildType = 8
            Alignment = taCenter
            CalcType = dcSum
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
          end
        end
      end
    end
    object ppSummaryBand1: TppSummaryBand
      PrintHeight = phDynamic
      AlignToBottom = False
      mmBottomOffset = 0
      mmHeight = 55563
      mmPrintPosition = 0
      object ppCrossTab3: TppCrossTab
        UserName = 'CrossTab3'
        DataPipeline = pdbpplnEB
        ParentDataPipeline = False
        Stretch = True
        Style = 'Standard'
        DataPipelineName = 'pdbpplnEB'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 0
        mmWidth = 330201
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmMinHeight = 0
        object TppGrandTotal
          ChildType = 6
          object TppTotalCaptionDef
            ChildType = 4
            Alignment = taCenter
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
          end
          object TppTotalDef
            ChildType = 3
            Color = clWhite
            DisplayFormat = '#,0;-#,0'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
          end
        end
        object TppGrandTotal
          ChildType = 6
          object TppTotalCaptionDef
            ChildType = 4
            Alignment = taRightJustify
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
          end
          object TppTotalDef
            ChildType = 3
            Color = clWhite
            DisplayFormat = '#,0.00;-#,0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
          end
        end
        object TppGrandTotal
          ChildType = 6
          object TppTotalCaptionDef
            ChildType = 4
            Alignment = taRightJustify
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
          end
          object TppTotalDef
            ChildType = 3
            Color = clWhite
            DisplayFormat = '#,0.00;-#,0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
          end
        end
        object TppGrandTotal
          ChildType = 6
          object TppTotalCaptionDef
            ChildType = 4
            Alignment = taRightJustify
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
          end
          object TppTotalDef
            ChildType = 3
            Color = clWhite
            DisplayFormat = '#,0;-#,0'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
          end
        end
        object TppGrandTotal
          ChildType = 6
          object TppTotalCaptionDef
            ChildType = 4
            Alignment = taRightJustify
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
          end
          object TppTotalDef
            ChildType = 3
            Color = clWhite
            DisplayFormat = '#,0.00;-#,0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
          end
        end
        object TppGrandTotal
          ChildType = 6
          object TppTotalCaptionDef
            ChildType = 4
            Alignment = taRightJustify
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
          end
          object TppTotalDef
            ChildType = 3
            Color = clWhite
            DisplayFormat = '#,0.00;-#,0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
          end
        end
        object TppGrandTotal
          ChildType = 7
          object TppTotalCaptionDef
            ChildType = 4
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
          end
          object TppTotalDef
            ChildType = 3
            Color = clWhite
            DisplayFormat = '#,0;-#,0'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
          end
        end
        object TppGrandTotal
          ChildType = 7
          object TppTotalCaptionDef
            ChildType = 4
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
          end
          object TppTotalDef
            ChildType = 3
            Color = clWhite
            DisplayFormat = '#,0.00;-#,0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
          end
        end
        object TppGrandTotal
          ChildType = 7
          object TppTotalCaptionDef
            ChildType = 4
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
          end
          object TppTotalDef
            ChildType = 3
            Color = clWhite
            DisplayFormat = '#,0.00;-#,0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
          end
        end
        object TppGrandTotal
          ChildType = 7
          object TppTotalCaptionDef
            ChildType = 4
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
          end
          object TppTotalDef
            ChildType = 3
            Color = clWhite
            DisplayFormat = '#,0;-#,0'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
          end
        end
        object TppGrandTotal
          ChildType = 7
          object TppTotalCaptionDef
            ChildType = 4
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
          end
          object TppTotalDef
            ChildType = 3
            Color = clWhite
            DisplayFormat = '#,0.00;-#,0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
          end
        end
        object TppGrandTotal
          ChildType = 7
          object TppTotalCaptionDef
            ChildType = 4
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
          end
          object TppTotalDef
            ChildType = 3
            Color = clWhite
            DisplayFormat = '#,0.00;-#,0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
          end
        end
        object TppColumnDef
          FieldAlias = 'ITEM DESCRIPTION'
          FieldName = 'ITEM DESCRIPTION'
          Alignment = taCenter
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          object TppSubTotal
            ChildType = 5
            object TppTotalCaptionDef
              ChildType = 4
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
            end
            object TppTotalDef
              ChildType = 3
              Color = clWhite
              DisplayFormat = '#,0;-#,0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
            end
          end
          object TppSubTotal
            ChildType = 5
            object TppTotalCaptionDef
              ChildType = 4
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
            end
            object TppTotalDef
              ChildType = 3
              Color = clWhite
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
            end
          end
          object TppSubTotal
            ChildType = 5
            object TppTotalCaptionDef
              ChildType = 4
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
            end
            object TppTotalDef
              ChildType = 3
              Color = clWhite
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
            end
          end
          object TppSubTotal
            ChildType = 5
            object TppTotalCaptionDef
              ChildType = 4
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
            end
            object TppTotalDef
              ChildType = 3
              Color = clWhite
              DisplayFormat = '#,0;-#,0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
            end
          end
          object TppSubTotal
            ChildType = 5
            object TppTotalCaptionDef
              ChildType = 4
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
            end
            object TppTotalDef
              ChildType = 3
              Color = clWhite
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
            end
          end
          object TppSubTotal
            ChildType = 5
            object TppTotalCaptionDef
              ChildType = 4
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
            end
            object TppTotalDef
              ChildType = 3
              Color = clWhite
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
            end
          end
        end
        object TppValueDef
          ChildType = 2
          FieldAlias = 'TOTAL DISTRIBUTION'
          FieldName = 'TOTAL DISTRIBUTION'
          Color = clWhite
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          object TppValueCaptionDef
            ChildType = 8
            CalcType = dcSum
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
          end
        end
        object TppValueDef
          ChildType = 2
          FieldAlias = 'UNIT PRICE'
          FieldName = 'UNIT PRICE'
          Color = clWhite
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          object TppValueCaptionDef
            ChildType = 8
            CalcType = dcSum
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
          end
        end
        object TppValueDef
          ChildType = 2
          FieldAlias = 'TOTAL COST GOODS DISTRIBUTED'
          FieldName = 'TOTAL COST GOODS DISTRIBUTED'
          Color = clWhite
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          object TppValueCaptionDef
            ChildType = 8
            CalcType = dcSum
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
          end
        end
        object TppValueDef
          ChildType = 2
          FieldAlias = 'ENDING BALANCE'
          FieldName = 'ENDING BALANCE'
          Color = clWhite
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          object TppValueCaptionDef
            ChildType = 8
            CalcType = dcSum
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
          end
        end
        object TppValueDef
          ChildType = 2
          FieldAlias = 'EUNIT PRICE'
          FieldName = 'EUNIT PRICE'
          Color = clWhite
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          object TppValueCaptionDef
            ChildType = 8
            CalcType = dcSum
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
          end
        end
        object TppValueDef
          ChildType = 2
          FieldAlias = 'AMOUNT'
          FieldName = 'AMOUNT'
          Color = clWhite
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          object TppValueCaptionDef
            ChildType = 8
            CalcType = dcSum
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
          end
        end
      end
      object ppSubReport1: TppSubReport
        UserName = 'SubReport1'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        DataPipelineName = 'pdbpplnSign'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 50536
        mmWidth = 330201
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmMinHeight = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = pdbpplnSign
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Report'
          PrinterSetup.Orientation = poLandscape
          PrinterSetup.PaperName = 'Custom'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.SaveDeviceSettings = False
          PrinterSetup.mmMarginBottom = 3810
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 215900
          PrinterSetup.mmPaperWidth = 342901
          PrinterSetup.PaperSize = 175
          Version = '12.03'
          mmColumnWidth = 0
          DataPipelineName = 'pdbpplnSign'
          object ppDetailBand2: TppDetailBand
            Background1.Brush.Style = bsClear
            Background1.Gradient.EndColor = clWhite
            Background1.Gradient.StartColor = clWhite
            Background1.Gradient.Style = gsNone
            Background2.Brush.Style = bsClear
            Background2.Gradient.EndColor = clWhite
            Background2.Gradient.StartColor = clWhite
            Background2.Gradient.Style = gsNone
            mmBottomOffset = 0
            mmHeight = 31221
            mmPrintPosition = 0
            object ppDBText2: TppDBText
              UserName = 'DBText2'
              HyperlinkColor = clBlue
              AutoSize = True
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              DataField = 'p_position'
              DataPipeline = pdbpplnSign
              Ellipsis = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'pdbpplnSign'
              mmHeight = 3969
              mmLeft = 4233
              mmTop = 6085
              mmWidth = 794
              BandType = 4
            end
            object ppDBText3: TppDBText
              UserName = 'DBText3'
              HyperlinkColor = clBlue
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              DataField = 'p_signatory'
              DataPipeline = pdbpplnSign
              Ellipsis = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'pdbpplnSign'
              mmHeight = 3969
              mmLeft = 4233
              mmTop = 14552
              mmWidth = 67733
              BandType = 4
            end
            object ppDBText4: TppDBText
              UserName = 'DBText4'
              HyperlinkColor = clBlue
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              DataField = 'p_designation'
              DataPipeline = pdbpplnSign
              Ellipsis = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'pdbpplnSign'
              mmHeight = 3969
              mmLeft = 4233
              mmTop = 18785
              mmWidth = 67733
              BandType = 4
            end
            object ppDBText5: TppDBText
              UserName = 'DBText5'
              HyperlinkColor = clBlue
              AutoSize = True
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              DataField = 'a_position'
              DataPipeline = pdbpplnSign
              Ellipsis = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'pdbpplnSign'
              mmHeight = 3969
              mmLeft = 258498
              mmTop = 6085
              mmWidth = 794
              BandType = 4
            end
            object ppDBText6: TppDBText
              UserName = 'DBText6'
              HyperlinkColor = clBlue
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              DataField = 'a_signatory'
              DataPipeline = pdbpplnSign
              Ellipsis = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'pdbpplnSign'
              mmHeight = 3969
              mmLeft = 258498
              mmTop = 14552
              mmWidth = 67733
              BandType = 4
            end
            object ppDBText7: TppDBText
              UserName = 'DBText7'
              HyperlinkColor = clBlue
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              DataField = 'a_designation'
              DataPipeline = pdbpplnSign
              Ellipsis = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'pdbpplnSign'
              mmHeight = 3969
              mmLeft = 258498
              mmTop = 18785
              mmWidth = 67733
              BandType = 4
            end
            object ppDBText8: TppDBText
              UserName = 'DBText8'
              HyperlinkColor = clBlue
              AutoSize = True
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              DataField = 'user_name'
              DataPipeline = pdbpplnSign
              Ellipsis = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'pdbpplnSign'
              mmHeight = 3175
              mmLeft = 0
              mmTop = 27517
              mmWidth = 529
              BandType = 4
            end
            object ppLine1: TppLine
              UserName = 'Line1'
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              Weight = 0.750000000000000000
              mmHeight = 265
              mmLeft = 4233
              mmTop = 18521
              mmWidth = 67733
              BandType = 4
            end
            object ppLine2: TppLine
              UserName = 'Line2'
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              Weight = 0.750000000000000000
              mmHeight = 265
              mmLeft = 258498
              mmTop = 18521
              mmWidth = 67733
              BandType = 4
            end
            object ppSystemVariable1: TppSystemVariable
              UserName = 'SystemVariable1'
              HyperlinkColor = clBlue
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              VarType = vtDateTime
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 299244
              mmTop = 27517
              mmWidth = 30956
              BandType = 4
            end
            object ppSystemVariable2: TppSystemVariable
              UserName = 'SystemVariable2'
              HyperlinkColor = clBlue
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              VarType = vtPageSetDesc
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 156898
              mmTop = 27517
              mmWidth = 16404
              BandType = 4
            end
          end
        end
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
  object qryRS: TMyQuery
    Connection = frmData.dbCon
    Left = 442
    Top = 195
  end
  object qrySign: TMyQuery
    Connection = frmData.dbCon
    SQL.Strings = (
      'SELECT'
      
        #9'(SELECT CASE'#9'WHEN item.item_type = "G" THEN "CANNED / RICE GOOD' +
        'S" WHEN item.item_type = "S" THEN "SCHOOL SUPPLIES"'#9'END AS `item' +
        'type` FROM item WHERE'#9'item.item_type = :gtype GROUP BY item.item' +
        '_type) AS `typegoods`,'
      
        #9'(SELECT CONCAT(`position`.`position_description`," :") FROM `si' +
        'gnatory` INNER JOIN `position` ON `position`.`position_id` = `si' +
        'gnatory`.`position_id` WHERE `signatory`.`signatory_id` = :signp' +
        'p) AS `p_position`,'
      
        #9'(SELECT `signatory`.`signatory_name` FROM `signatory` WHERE `si' +
        'gnatory`.`signatory_id` = :signps) AS `p_signatory`,'
      
        #9'(SELECT `designation`.`designation_name` FROM `signatory` INNER' +
        ' JOIN `designation` ON `designation`.`designation_id` = `signato' +
        'ry`.`designation_id` WHERE `signatory`.`signatory_id` = :signpd)' +
        ' AS `p_designation`,'
      
        #9'(SELECT CONCAT(`position`.`position_description`," :") FROM `si' +
        'gnatory` INNER JOIN `position` ON `position`.`position_id` = `si' +
        'gnatory`.`position_id` WHERE `signatory`.`signatory_id` = :signa' +
        'p) AS `a_position`,'
      
        #9'(SELECT `signatory`.`signatory_name` FROM `signatory` WHERE `si' +
        'gnatory`.`signatory_id` = :signas) AS `a_signatory`,'
      
        #9'(SELECT `designation`.`designation_name` FROM `signatory` INNER' +
        ' JOIN `designation` ON `designation`.`designation_id` = `signato' +
        'ry`.`designation_id` WHERE `signatory`.`signatory_id` = :signad)' +
        ' AS `a_designation`,'
      
        #9'(SELECT `userbindary`.`UserName` FROM `userbindary` WHERE `user' +
        'bindary`.`UserID` = :uID) AS `user_name`')
    Active = True
    Left = 648
    Top = 273
    ParamData = <
      item
        DataType = ftString
        Name = 'gtype'
        ParamType = ptInput
        Value = ''
      end
      item
        DataType = ftString
        Name = 'signpp'
        ParamType = ptInput
        Value = ''
      end
      item
        DataType = ftString
        Name = 'signps'
        ParamType = ptInput
        Value = ''
      end
      item
        DataType = ftString
        Name = 'signpd'
        ParamType = ptInput
        Value = ''
      end
      item
        DataType = ftString
        Name = 'signap'
        ParamType = ptInput
        Value = ''
      end
      item
        DataType = ftString
        Name = 'signas'
        ParamType = ptInput
        Value = ''
      end
      item
        DataType = ftString
        Name = 'signad'
        Value = ''
      end
      item
        DataType = ftString
        Name = 'uID'
        ParamType = ptInput
        Value = ''
      end>
  end
  object dsqrySign: TMyDataSource
    DataSet = qrySign
    Left = 648
    Top = 321
  end
  object pdbpplnSign: TppDBPipeline
    DataSource = dsqrySign
    UserName = 'pdbpplnSign'
    Left = 648
    Top = 369
    object pdbpplnSignppField1: TppField
      FieldAlias = 'typegoods'
      FieldName = 'typegoods'
      FieldLength = 19
      DisplayWidth = 19
      Position = 0
    end
    object pdbpplnSignppField2: TppField
      FieldAlias = 'p_position'
      FieldName = 'p_position'
      FieldLength = 82
      DisplayWidth = 82
      Position = 1
    end
    object pdbpplnSignppField3: TppField
      FieldAlias = 'p_signatory'
      FieldName = 'p_signatory'
      FieldLength = 80
      DisplayWidth = 80
      Position = 2
    end
    object pdbpplnSignppField4: TppField
      FieldAlias = 'p_designation'
      FieldName = 'p_designation'
      FieldLength = 100
      DisplayWidth = 100
      Position = 3
    end
    object pdbpplnSignppField5: TppField
      FieldAlias = 'a_position'
      FieldName = 'a_position'
      FieldLength = 82
      DisplayWidth = 82
      Position = 4
    end
    object pdbpplnSignppField6: TppField
      FieldAlias = 'a_signatory'
      FieldName = 'a_signatory'
      FieldLength = 80
      DisplayWidth = 80
      Position = 5
    end
    object pdbpplnSignppField7: TppField
      FieldAlias = 'a_designation'
      FieldName = 'a_designation'
      FieldLength = 100
      DisplayWidth = 100
      Position = 6
    end
    object pdbpplnSignppField8: TppField
      FieldAlias = 'user_name'
      FieldName = 'user_name'
      FieldLength = 30
      DisplayWidth = 30
      Position = 7
    end
  end
end
