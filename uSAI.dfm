inherited frmSAI: TfrmSAI
  Caption = 'Supplies Availability Inquiry'
  ClientHeight = 524
  ClientWidth = 811
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 817
  ExplicitHeight = 552
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMaster: TPanel
    Width = 811
    ExplicitWidth = 811
    object lblRN: TLabel
      Left = 20
      Top = 22
      Width = 70
      Height = 13
      AutoSize = False
      Caption = 'Reference No.'
    end
    object lblGT: TLabel
      Left = 20
      Top = 51
      Width = 70
      Height = 13
      AutoSize = False
      Caption = 'Type of Goods'
    end
    object lblQty: TLabel
      Left = 20
      Top = 80
      Width = 70
      Height = 13
      AutoSize = False
      Caption = 'Quantity'
    end
    object lblDate: TLabel
      Left = 546
      Top = 23
      Width = 55
      Height = 13
      Anchors = [akTop, akRight, akBottom]
      AutoSize = False
      Caption = 'Date'
      ExplicitLeft = 516
    end
    object lblMun: TLabel
      Left = 546
      Top = 52
      Width = 55
      Height = 13
      Anchors = [akTop, akRight, akBottom]
      AutoSize = False
      Caption = 'Municipality'
      ExplicitLeft = 516
    end
    object lblBrgy: TLabel
      Left = 546
      Top = 81
      Width = 55
      Height = 13
      Anchors = [akTop, akRight, akBottom]
      AutoSize = False
      Caption = 'Barangay'
      ExplicitLeft = 516
    end
    object lblCol1: TLabel
      Left = 90
      Top = 22
      Width = 25
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = ':'
    end
    object lblCol2: TLabel
      Left = 90
      Top = 51
      Width = 25
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = ':'
    end
    object lblCol3: TLabel
      Left = 90
      Top = 80
      Width = 25
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = ':'
    end
    object lblCol4: TLabel
      Left = 601
      Top = 23
      Width = 25
      Height = 13
      Alignment = taCenter
      Anchors = [akTop, akRight, akBottom]
      AutoSize = False
      Caption = ':'
      ExplicitLeft = 571
    end
    object lblCol5: TLabel
      Left = 601
      Top = 52
      Width = 25
      Height = 13
      Alignment = taCenter
      Anchors = [akTop, akRight, akBottom]
      AutoSize = False
      Caption = ':'
      ExplicitLeft = 571
    end
    object lblCol6: TLabel
      Left = 601
      Top = 81
      Width = 25
      Height = 13
      Alignment = taCenter
      Anchors = [akTop, akRight, akBottom]
      AutoSize = False
      Caption = ':'
      ExplicitLeft = 571
    end
    object wdbdtmpckrsai_date: TwwDBDateTimePicker
      Left = 626
      Top = 19
      Width = 165
      Height = 21
      DisableThemes = True
      Anchors = [akTop, akRight, akBottom]
      AutoFillDateAndTime = True
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'Tahoma'
      CalendarAttributes.Font.Style = []
      Epoch = 1950
      ShowButton = True
      TabOrder = 0
      DisplayFormat = 'MM/DD/YYYY HH:NN:SS AM/PM'
    end
    object wdblkpcmbGoodsType: TwwDBLookupCombo
      Left = 115
      Top = 48
      Width = 100
      Height = 21
      CharCase = ecUpperCase
      DisableThemes = True
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'goodstype_description'#9'32'#9'goodstype_description'#9'F')
      LookupTable = frmData.qryAGT
      LookupField = 'goodstype_id'
      DropDownCount = 5
      DropDownWidth = 100
      TabOrder = 1
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      ShowMatchText = True
      OnCloseUp = wdblkpcmbGoodsTypeCloseUp
      OnExit = wdblkpcmbGoodsTypeExit
      OnKeyPress = wdblkpcmbGoodsTypeKeyPress
    end
    object edtQuantity: TwwDBEdit
      Left = 115
      Top = 77
      Width = 100
      Height = 21
      DisableThemes = True
      MaxLength = 7
      TabOrder = 2
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
      OnExit = edtQuantityExit
      OnKeyPress = edtQuantityKeyPress
    end
    object wdblkpcmbMun: TwwDBLookupCombo
      Left = 626
      Top = 48
      Width = 165
      Height = 21
      Anchors = [akTop, akRight, akBottom]
      DisableThemes = True
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'Description'#9'255'#9'Description'#9'F')
      LookupTable = frmData.tblMunicipality
      LookupField = 'M_Code'
      DropDownCount = 5
      DropDownWidth = 100
      TabOrder = 3
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      ShowMatchText = True
      OnChange = wdblkpcmbMunChange
      OnKeyPress = wdblkpcmbMunKeyPress
    end
    object wdblkpcmbBrgy: TwwDBLookupCombo
      Left = 626
      Top = 77
      Width = 165
      Height = 21
      Anchors = [akTop, akRight, akBottom]
      DisableThemes = True
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'Description'#9'150'#9'Description'#9'F')
      LookupTable = frmData.tblBarangay
      LookupField = 'BCode'
      DropDownCount = 5
      DropDownWidth = 100
      Enabled = False
      TabOrder = 4
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      ShowMatchText = True
      OnKeyPress = wdblkpcmbBrgyKeyPress
    end
    object pnlRN: TPanel
      Left = 109
      Top = 11
      Width = 115
      Height = 36
      BevelOuter = bvNone
      Caption = 'pnlRN'
      Ctl3D = False
      Enabled = False
      ParentCtl3D = False
      TabOrder = 5
      object edtsai_id: TwwDBEdit
        Left = 6
        Top = 8
        Width = 100
        Height = 19
        DisableThemes = True
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
  end
  inherited pnlDetail: TPanel
    Width = 811
    Height = 371
    ExplicitTop = 115
    ExplicitWidth = 811
    ExplicitHeight = 371
    inherited pnlItems: TPanel
      Width = 807
      ExplicitWidth = 807
      inherited wdbgrdDetail: TwwDBGrid
        Width = 796
        Selected.Strings = (
          'item_id'#9'20'#9'Item ID'#9'F'#9
          'items_description'#9'59'#9'Item Description'#9#9
          'qty_whole'#9'15'#9'Whole'#9'F'
          'qty_remain'#9'15'#9'Additional'#9#9
          'total_quantity'#9'14'#9'Total'#9#9)
        OnRowChanged = wdbgrdDetailRowChanged
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataSource = frmData.dsqryListofSAIDet
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection]
        ExplicitWidth = 796
      end
      inherited pnlRecordCtr: TPanel
        Width = 797
        Anchors = [akLeft, akRight, akBottom]
        ExplicitWidth = 797
      end
    end
    inherited pnlEmergency: TPanel
      Width = 807
      Height = 60
      ExplicitWidth = 807
      ExplicitHeight = 60
      object chkEmergency: TwwCheckBox
        Left = 16
        Top = 8
        Width = 97
        Height = 17
        DisableThemes = True
        AlwaysTransparent = False
        ValueChecked = '1'
        ValueUnchecked = '0'
        DisplayValueChecked = '1'
        DisplayValueUnchecked = '0'
        NullAndBlankState = cbUnchecked
        Caption = '&Emergency'
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 0
        OnClick = chkEmergencyClick
      end
      object mmoEReason: TMemo
        Left = 107
        Top = 8
        Width = 682
        Height = 43
        Anchors = [akLeft, akTop, akRight, akBottom]
        Enabled = False
        TabOrder = 1
      end
    end
    inherited pnlSignatory: TPanel
      Top = 283
      Width = 807
      Height = 86
      ExplicitTop = 283
      ExplicitWidth = 807
      ExplicitHeight = 86
      object pnlPSign: TPanel
        Left = 18
        Top = 7
        Width = 240
        Height = 73
        BevelOuter = bvNone
        TabOrder = 0
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
        end
      end
      object pnlCSign: TPanel
        Left = 285
        Top = 7
        Width = 240
        Height = 73
        BevelOuter = bvNone
        TabOrder = 1
        DesignSize = (
          240
          73)
        object lblDesignation2: TLabel
          Left = 1
          Top = 56
          Width = 236
          Height = 13
          Alignment = taCenter
          AutoSize = False
        end
        object wdblkpcmbCPosition: TwwDBLookupCombo
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
          OnChange = wdblkpcmbCPositionChange
        end
        object wdblkpcmbCSignatory: TwwDBLookupCombo
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
          OnChange = wdblkpcmbCSignatoryChange
          OnClick = wdblkpcmbCSignatoryClick
          OnBeforeDropDown = wdblkpcmbCSignatoryBeforeDropDown
        end
      end
      object pnlASign: TPanel
        Left = 552
        Top = 7
        Width = 240
        Height = 73
        BevelOuter = bvNone
        TabOrder = 2
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
        end
      end
    end
  end
  inherited pnlMenu: TPanel
    Top = 486
    Width = 811
    ExplicitTop = 486
    ExplicitWidth = 811
    inherited btnOK: TBitBtn
      Left = 648
      Anchors = [akTop, akRight, akBottom]
      OnClick = btnOKClick
      ExplicitLeft = 648
    end
    inherited btnCANCEL: TBitBtn
      Left = 723
      Anchors = [akTop, akRight, akBottom]
      OnClick = btnCANCELClick
      ExplicitLeft = 723
    end
  end
end
