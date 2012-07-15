inherited frmRIS: TfrmRIS
  Caption = 'Requisition and Issuance Slip'
  ClientHeight = 667
  ClientWidth = 1018
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 1024
  ExplicitHeight = 695
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMaster: TPanel
    Width = 1018
    Height = 148
    ExplicitWidth = 1018
    ExplicitHeight = 148
    object lblGT: TLabel
      Left = 20
      Top = 80
      Width = 70
      Height = 13
      AutoSize = False
      Caption = 'Type of Goods'
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
    object lblSAI_ID: TLabel
      Left = 20
      Top = 23
      Width = 70
      Height = 13
      AutoSize = False
      Caption = 'SAI ID'
    end
    object lblCol1: TLabel
      Left = 90
      Top = 23
      Width = 25
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = ':'
    end
    object lblSAI_Date: TLabel
      Left = 20
      Top = 51
      Width = 70
      Height = 13
      AutoSize = False
      Caption = 'SAI Date'
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
    object lblQty: TLabel
      Left = 20
      Top = 109
      Width = 70
      Height = 13
      AutoSize = False
      Caption = 'Quantity'
    end
    object lblCol4: TLabel
      Left = 90
      Top = 109
      Width = 25
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = ':'
    end
    object lblRFNo: TLabel
      Left = 754
      Top = 23
      Width = 70
      Height = 13
      Anchors = [akTop, akRight]
      AutoSize = False
      Caption = 'Reference No.'
      ExplicitLeft = 692
    end
    object lblCol5: TLabel
      Left = 824
      Top = 23
      Width = 25
      Height = 13
      Alignment = taCenter
      Anchors = [akTop, akRight]
      AutoSize = False
      Caption = ':'
      ExplicitLeft = 762
    end
    object lblDate: TLabel
      Left = 754
      Top = 51
      Width = 70
      Height = 13
      Anchors = [akTop, akRight]
      AutoSize = False
      Caption = 'Date'
      ExplicitLeft = 692
    end
    object lblCol6: TLabel
      Left = 824
      Top = 51
      Width = 25
      Height = 13
      Alignment = taCenter
      Anchors = [akTop, akRight]
      AutoSize = False
      Caption = ':'
      ExplicitLeft = 762
    end
    object lblMun: TLabel
      Left = 754
      Top = 80
      Width = 70
      Height = 13
      Anchors = [akTop, akRight]
      AutoSize = False
      Caption = 'Municipality'
      ExplicitLeft = 692
    end
    object lblCol7: TLabel
      Left = 824
      Top = 80
      Width = 25
      Height = 13
      Alignment = taCenter
      Anchors = [akTop, akRight]
      AutoSize = False
      Caption = ':'
      ExplicitLeft = 762
    end
    object lblBrgy: TLabel
      Left = 754
      Top = 109
      Width = 70
      Height = 13
      Anchors = [akTop, akRight]
      AutoSize = False
      Caption = 'Barangay'
      ExplicitLeft = 692
    end
    object lblCol8: TLabel
      Left = 824
      Top = 109
      Width = 25
      Height = 13
      Alignment = taCenter
      Anchors = [akTop, akRight]
      AutoSize = False
      Caption = ':'
      ExplicitLeft = 762
    end
    object wdblkpcmbSAI_ID: TwwDBLookupCombo
      Left = 116
      Top = 19
      Width = 140
      Height = 21
      Ctl3D = True
      CharCase = ecUpperCase
      DisableThemes = True
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'sai_id'#9'20'#9'sai_id'#9'F')
      LookupTable = frmData.qryASAIs
      LookupField = 'sai_id'
      DropDownCount = 5
      DropDownWidth = 120
      ParentCtl3D = False
      TabOrder = 0
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      ShowMatchText = True
      OnCloseUp = wdblkpcmbSAI_IDCloseUp
      OnExit = wdblkpcmbSAI_IDExit
    end
    object pnlSAI1: TPanel
      Left = 115
      Top = 48
      Width = 142
      Height = 81
      BevelOuter = bvNone
      Ctl3D = False
      Enabled = False
      ParentCtl3D = False
      TabOrder = 1
      DesignSize = (
        142
        81)
      object edtSAI_Date: TwwDBEdit
        Left = 1
        Top = 1
        Width = 140
        Height = 19
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object edtSAI_TG: TwwDBEdit
        Left = 1
        Top = 30
        Width = 140
        Height = 19
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object edtSAI_Qty: TwwDBEdit
        Left = 1
        Top = 59
        Width = 140
        Height = 19
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    object pnlSAI2: TPanel
      Left = 849
      Top = 78
      Width = 146
      Height = 51
      Anchors = [akTop, akRight, akBottom]
      BevelOuter = bvNone
      Ctl3D = False
      Enabled = False
      ParentCtl3D = False
      TabOrder = 2
      DesignSize = (
        146
        51)
      object edtSAI_Mun: TwwDBEdit
        Left = 1
        Top = 0
        Width = 144
        Height = 19
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object edtSAI_Brgy: TwwDBEdit
        Left = 1
        Top = 29
        Width = 144
        Height = 19
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    object pnlRIS: TPanel
      Left = 849
      Top = 19
      Width = 146
      Height = 22
      Anchors = [akTop, akRight, akBottom]
      BevelOuter = bvNone
      Ctl3D = False
      Enabled = False
      ParentCtl3D = False
      TabOrder = 3
      DesignSize = (
        146
        22)
      object edtris_id: TwwDBEdit
        Left = 1
        Top = 1
        Width = 144
        Height = 19
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    object wdbdtmpckrRIS_Date: TwwDBDateTimePicker
      Left = 850
      Top = 48
      Width = 145
      Height = 21
      DisableThemes = True
      Anchors = [akTop, akRight, akBottom]
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'Tahoma'
      CalendarAttributes.Font.Style = []
      Epoch = 1950
      ShowButton = True
      TabOrder = 4
      DisplayFormat = 'MM/DD/YYYY HH:NN:SS AM/PM'
    end
  end
  inherited pnlDetail: TPanel
    Top = 148
    Width = 1018
    Height = 481
    ExplicitTop = 148
    ExplicitWidth = 1018
    ExplicitHeight = 481
    inherited pnlItems: TPanel
      Width = 1014
      Height = 220
      ExplicitWidth = 1014
      ExplicitHeight = 220
      inherited wdbgrdDetail: TwwDBGrid
        Top = 4
        Width = 1003
        Selected.Strings = (
          'item_id'#9'20'#9'Item ID'
          'item_descriptions'#9'50'#9'Item Description'
          'unit_whole'#9'15'#9'Whole'
          'unit_remain'#9'15'#9'Additional'
          'sai_qty'#9'10'#9'Quantity'
          'ris_qty'#9'10'#9'Quantity'
          'unit_cost'#9'15'#9'Unit Price'
          'amount'#9'20'#9'Amount')
        OnRowChanged = wdbgrdDetailRowChanged
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataSource = dsqryListOfRISDet
        OnColExit = wdbgrdDetailColExit
        OnExit = wdbgrdDetailExit
        ExplicitTop = 4
        ExplicitWidth = 1003
      end
      inherited pnlRecordCtr: TPanel
        Top = 196
        Width = 1004
        Anchors = [akLeft, akRight, akBottom]
        ExplicitTop = 196
        ExplicitWidth = 1004
      end
    end
    inherited pnlEmergency: TPanel
      Top = 222
      Width = 1014
      Height = 60
      ExplicitTop = 222
      ExplicitWidth = 1014
      ExplicitHeight = 60
      object lblEmergency: TLabel
        Left = 16
        Top = 8
        Width = 53
        Height = 13
        Caption = 'Emergency'
      end
      object pnlEReason: TPanel
        Left = 103
        Top = 5
        Width = 842
        Height = 50
        BevelOuter = bvNone
        Ctl3D = False
        Enabled = False
        ParentCtl3D = False
        TabOrder = 0
        DesignSize = (
          842
          50)
        object mmoEReason: TMemo
          Left = 4
          Top = 3
          Width = 886
          Height = 43
          Anchors = [akLeft, akTop, akRight, akBottom]
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 0
        end
      end
    end
    inherited pnlSignatory: TPanel
      Top = 282
      Width = 1014
      Height = 197
      ExplicitTop = 282
      ExplicitWidth = 1014
      ExplicitHeight = 197
      object grpAcceptance: TGroupBox
        Left = 10
        Top = 7
        Width = 495
        Height = 178
        Caption = 'ACCEPTANCE'
        TabOrder = 0
        object pnlAR: TPanel
          Left = 10
          Top = 23
          Width = 230
          Height = 73
          BevelOuter = bvNone
          TabOrder = 0
          DesignSize = (
            230
            73)
          object lblADesignation1: TLabel
            Left = 1
            Top = 56
            Width = 226
            Height = 13
            Alignment = taCenter
            AutoSize = False
          end
          object wdblkpcmbarposition: TwwDBLookupCombo
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
            OnChange = wdblkpcmbarpositionChange
          end
          object wdblkpcmbarsignatory: TwwDBLookupCombo
            Left = 1
            Top = 31
            Width = 226
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            CharCase = ecUpperCase
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
            OnChange = wdblkpcmbarsignatoryChange
            OnClick = wdblkpcmbarsignatoryClick
            OnBeforeDropDown = wdblkpcmbarsignatoryBeforeDropDown
          end
        end
        object pnlAE: TPanel
          Left = 255
          Top = 23
          Width = 230
          Height = 73
          BevelOuter = bvNone
          TabOrder = 1
          DesignSize = (
            230
            73)
          object lblADesignation2: TLabel
            Left = 1
            Top = 56
            Width = 226
            Height = 13
            Alignment = taCenter
            AutoSize = False
          end
          object wdblkpcmbaeposition: TwwDBLookupCombo
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
            OnChange = wdblkpcmbaepositionChange
          end
          object wdblkpcmbaesignatory: TwwDBLookupCombo
            Left = 1
            Top = 31
            Width = 226
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
            OnChange = wdblkpcmbaesignatoryChange
            OnClick = wdblkpcmbaesignatoryClick
            OnBeforeDropDown = wdblkpcmbaesignatoryBeforeDropDown
          end
        end
        object pnlANA: TPanel
          Left = 133
          Top = 99
          Width = 230
          Height = 73
          BevelOuter = bvNone
          TabOrder = 2
          DesignSize = (
            230
            73)
          object lblADesignation3: TLabel
            Left = 1
            Top = 56
            Width = 226
            Height = 13
            Alignment = taCenter
            AutoSize = False
          end
          object wdblkpcmbanaposition: TwwDBLookupCombo
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
            OnChange = wdblkpcmbanapositionChange
          end
          object wdblkpcmbanasignatory: TwwDBLookupCombo
            Left = 1
            Top = 31
            Width = 226
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
            OnChange = wdblkpcmbanasignatoryChange
            OnClick = wdblkpcmbanasignatoryClick
            OnBeforeDropDown = wdblkpcmbanasignatoryBeforeDropDown
          end
        end
      end
      object grpIssued: TGroupBox
        Left = 507
        Top = 7
        Width = 495
        Height = 178
        Caption = 'ISSUED'
        TabOrder = 1
        object pnlIIE: TPanel
          Left = 10
          Top = 23
          Width = 230
          Height = 73
          BevelOuter = bvNone
          TabOrder = 0
          DesignSize = (
            230
            73)
          object lblIDesignation1: TLabel
            Left = 1
            Top = 56
            Width = 226
            Height = 13
            Alignment = taCenter
            AutoSize = False
          end
          object wdblkpcmbiiePosition: TwwDBLookupCombo
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
            OnChange = wdblkpcmbiiePositionChange
          end
          object wdblkpcmbiieSignatory: TwwDBLookupCombo
            Left = 1
            Top = 31
            Width = 226
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
            OnChange = wdblkpcmbiieSignatoryChange
            OnClick = wdblkpcmbiieSignatoryClick
            OnBeforeDropDown = wdblkpcmbiieSignatoryBeforeDropDown
          end
        end
        object pnlIICI: TPanel
          Left = 255
          Top = 23
          Width = 230
          Height = 73
          BevelOuter = bvNone
          TabOrder = 1
          DesignSize = (
            230
            73)
          object lblIDesignation2: TLabel
            Left = 1
            Top = 56
            Width = 226
            Height = 13
            Alignment = taCenter
            AutoSize = False
          end
          object wdblkpcmbiiciPosition: TwwDBLookupCombo
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
            OnChange = wdblkpcmbiiciPositionChange
          end
          object wdblkpcmbiiciSignatory: TwwDBLookupCombo
            Left = 1
            Top = 31
            Width = 226
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
            OnChange = wdblkpcmbiiciSignatoryChange
            OnClick = wdblkpcmbiiciSignatoryClick
            OnBeforeDropDown = wdblkpcmbiiciSignatoryBeforeDropDown
          end
        end
        object pnlIA: TPanel
          Left = 133
          Top = 99
          Width = 230
          Height = 73
          BevelOuter = bvNone
          TabOrder = 2
          DesignSize = (
            230
            73)
          object lblIDesignation3: TLabel
            Left = 1
            Top = 56
            Width = 226
            Height = 13
            Alignment = taCenter
            AutoSize = False
          end
          object wdblkpcmbiaPosition: TwwDBLookupCombo
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
            OnChange = wdblkpcmbiaPositionChange
          end
          object wdblkpcmbiaSignatory: TwwDBLookupCombo
            Left = 1
            Top = 31
            Width = 226
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
            OnChange = wdblkpcmbiaSignatoryChange
            OnClick = wdblkpcmbiaSignatoryClick
            OnBeforeDropDown = wdblkpcmbiaSignatoryBeforeDropDown
          end
        end
      end
    end
  end
  inherited pnlMenu: TPanel
    Top = 629
    Width = 1018
    ExplicitTop = 629
    ExplicitWidth = 1018
    inherited btnOK: TBitBtn
      Left = 856
      Anchors = [akTop, akRight, akBottom]
      OnClick = btnOKClick
      ExplicitLeft = 856
    end
    inherited btnCANCEL: TBitBtn
      Left = 931
      Anchors = [akTop, akRight, akBottom]
      OnClick = btnCANCELClick
      ExplicitLeft = 931
    end
  end
  object qryListOfRISDet: TMyQuery
    Connection = frmData.dbCon
    SQL.Strings = (
      'SELECT'
      #9'sai_det.sai_id,'
      #9'sai_det.goodstype_id,'
      #9'sai_det.item_id,'
      
        #9'CONCAT(item.item_description," ",IFNULL(brand.brand_description' +
        ',"")," ",IFNULL(size.size_description,"")," ",IFNULL(unit.unit_d' +
        'escription,"")) AS `item_descriptions`,'
      #9'unit.unit_description,'
      #9'sai_det.unit_w,'
      #9'sai_det.unit_r,'
      #9'sai_det.total_quantity AS `sai_qty`,'
      #9'temp_ris_det.total_quantity AS `ris_qty`,'
      #9'temp_ris_det.unit_cost,'
      #9'temp_ris_det.amount'
      'FROM'
      #9'sai_det'
      'INNER JOIN item ON item.item_id = sai_det.item_id'
      'LEFT JOIN brand ON brand.brand_id = item.brand_id'
      'LEFT JOIN size ON size.size_id = item.size_id'
      'LEFT JOIN unit ON unit.unit_id = item.unit_id'
      'LEFT JOIN temp_ris_det ON temp_ris_det.item_id = sai_det.item_id'
      'WHERE'
      #9'sai_det.sai_id = :sai')
    OnCalcFields = qryListOfRISDetCalcFields
    Active = True
    Left = 368
    Top = 19
    ParamData = <
      item
        DataType = ftString
        Name = 'sai'
        ParamType = ptInputOutput
        Value = ''
      end>
    object qryListOfRISDetitem_id: TStringField
      DisplayLabel = 'Item ID'
      DisplayWidth = 20
      FieldName = 'item_id'
      Origin = 'sai_det.item_id'
      ReadOnly = True
    end
    object qryListOfRISDetitem_descriptions: TStringField
      DisplayLabel = 'Item Description'
      DisplayWidth = 50
      FieldName = 'item_descriptions'
      Origin = 'item_descriptions'
      ReadOnly = True
      Size = 203
    end
    object qryListOfRISDetunit_whole: TStringField
      DisplayLabel = 'Whole'
      DisplayWidth = 15
      FieldKind = fkCalculated
      FieldName = 'unit_whole'
      Calculated = True
    end
    object qryListOfRISDetunit_remain: TStringField
      DisplayLabel = 'Additional'
      DisplayWidth = 15
      FieldKind = fkCalculated
      FieldName = 'unit_remain'
      Calculated = True
    end
    object qryListOfRISDetsai_qty: TIntegerField
      DisplayLabel = 'Quantity'
      DisplayWidth = 10
      FieldName = 'sai_qty'
      Origin = 'sai_det.total_quantity'
      ReadOnly = True
    end
    object qryListOfRISDetris_qty: TIntegerField
      DisplayLabel = 'Quantity'
      DisplayWidth = 10
      FieldName = 'ris_qty'
      Origin = 'temp_ris_det.total_quantity'
      ReadOnly = True
    end
    object qryListOfRISDetunit_cost: TFloatField
      DisplayLabel = 'Unit Price'
      DisplayWidth = 15
      FieldName = 'unit_cost'
      Origin = 'temp_ris_det.unit_cost'
      OnChange = qryListOfRISDetunit_costChange
      DisplayFormat = '##,###,##0.00'
      EditFormat = '##,###,##0.00'
    end
    object qryListOfRISDetamount: TFloatField
      DisplayLabel = 'Amount'
      DisplayWidth = 20
      FieldName = 'amount'
      Origin = 'temp_ris_det.amount'
      DisplayFormat = '##,###,##0.00'
      EditFormat = '##,###,##0.00'
    end
    object qryListOfRISDetunit_w: TIntegerField
      DisplayLabel = 'Additional'
      DisplayWidth = 10
      FieldName = 'unit_w'
      Origin = 'sai_det.unit_w'
      ReadOnly = True
      Visible = False
    end
    object qryListOfRISDetunit_r: TIntegerField
      DisplayLabel = 'KG/PC'
      DisplayWidth = 10
      FieldName = 'unit_r'
      Origin = 'sai_det.unit_r'
      ReadOnly = True
      Visible = False
    end
    object qryListOfRISDetsai_id: TStringField
      FieldName = 'sai_id'
      Origin = 'sai_det.sai_id'
      Visible = False
    end
    object qryListOfRISDetgoodstype_id: TIntegerField
      FieldName = 'goodstype_id'
      Origin = 'sai_det.goodstype_id'
      Visible = False
    end
    object qryListOfRISDetunit_description: TStringField
      FieldName = 'unit_description'
      Origin = 'unit.unit_description'
      Visible = False
      Size = 50
    end
  end
  object dsqryListOfRISDet: TMyDataSource
    DataSet = qryListOfRISDet
    Left = 368
    Top = 64
  end
  object qryTempStorage: TMyQuery
    Connection = frmData.dbCon
    Left = 478
    Top = 38
  end
end
