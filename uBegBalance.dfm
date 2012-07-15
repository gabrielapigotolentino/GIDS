inherited frmBegBalance: TfrmBegBalance
  Caption = 'Beginning Balance'
  ClientWidth = 933
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 939
  ExplicitHeight = 303
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlDetail: TPanel
    Width = 933
    ExplicitWidth = 933
    inherited wdbgrdDetail: TwwDBGrid
      Width = 913
      ControlType.Strings = (
        'cactive;CheckBox;1;0')
      Selected.Strings = (
        'cmonth'#9'6'#9'Month'
        'cyear'#9'10'#9'Year'
        'item_id'#9'20'#9'Item ID'
        'item_descriptions'#9'60'#9'Item Description'
        'unit_whole'#9'15'#9'Whole'
        'unit_remain'#9'15'#9'Additional'
        'beg_qty'#9'15'#9'Quantity')
      OnRowChanged = wdbgrdDetailRowChanged
      DataSource = dsqryBegBalance
      OnColExit = wdbgrdDetailColExit
      OnExit = wdbgrdDetailExit
      OnKeyDown = wdbgrdDetailKeyDown
      OnKeyPress = wdbgrdDetailKeyPress
      OnFieldChanged = wdbgrdDetailFieldChanged
      ExplicitWidth = 913
    end
    inherited pnlRecordCtr: TPanel
      Width = 914
      ExplicitWidth = 914
    end
  end
  inherited pnlFooter: TPanel
    Width = 933
    ExplicitWidth = 933
    inherited pnlMenu: TPanel
      Left = 839
      TabOrder = 1
      ExplicitLeft = 839
      inherited btnCLOSE: TBitBtn
        Anchors = [akRight, akBottom]
        OnClick = btnCLOSEClick
      end
    end
    object btnGENERATE: TBitBtn
      Left = 772
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&GENERATE'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 0
      OnClick = btnGENERATEClick
    end
  end
  object qryBegBalance: TMyQuery
    Connection = frmData.dbCon
    SQL.Strings = (
      'SELECT'
      #9'beg_balance.cmonth,'
      #9'beg_balance.cyear,'
      #9'item.item_id,'
      
        #9'CONCAT(item.item_description,IFNULL(CONCAT(" ",brand.brand_desc' +
        'ription),""),IFNULL(CONCAT(" ",size.size_description),""),IFNULL' +
        '(CONCAT(" ",unit.unit_description),"")) AS `item_descriptions`,'
      #9'unit.unit_description,'
      #9'beg_balance.beg_qty,'
      #9'beg_balance.cactive'
      'FROM'
      #9'beg_balance'
      'INNER JOIN item ON item.item_id = beg_balance.item_id'
      'LEFT OUTER JOIN brand ON brand.brand_id = item.brand_id'
      'LEFT OUTER JOIN size ON size.size_id = item.size_id'
      'LEFT OUTER JOIN unit ON unit.unit_id = item.unit_id'
      'WHERE'
      #9'beg_balance.cmonth = :cmo'
      'AND'
      #9'beg_balance.cyear = :cyr'
      'AND'
      #9'beg_balance.cactive = :cac')
    OnCalcFields = qryBegBalanceCalcFields
    Left = 321
    Top = 72
    ParamData = <
      item
        DataType = ftInteger
        Name = 'cmo'
        ParamType = ptInputOutput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'cyr'
        ParamType = ptInputOutput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'cac'
        ParamType = ptInputOutput
        Value = 0
      end>
    object qryBegBalancecmonth: TIntegerField
      DisplayLabel = 'Month'
      DisplayWidth = 6
      FieldName = 'cmonth'
      Origin = 'beg_balance.cmonth'
      ReadOnly = True
    end
    object qryBegBalancecyear: TIntegerField
      DisplayLabel = 'Year'
      DisplayWidth = 10
      FieldName = 'cyear'
      Origin = 'beg_balance.cyear'
      ReadOnly = True
    end
    object qryBegBalanceitem_id: TStringField
      DisplayLabel = 'Item ID'
      DisplayWidth = 20
      FieldName = 'item_id'
      Origin = 'item.item_id'
      ReadOnly = True
    end
    object qryBegBalanceitem_descriptions: TStringField
      DisplayLabel = 'Item Description'
      DisplayWidth = 60
      FieldName = 'item_descriptions'
      Origin = 'item_descriptions'
      ReadOnly = True
      Size = 203
    end
    object qryBegBalanceunit_whole: TStringField
      DisplayLabel = 'Whole'
      DisplayWidth = 15
      FieldKind = fkCalculated
      FieldName = 'unit_whole'
      ReadOnly = True
      Calculated = True
    end
    object qryBegBalanceunit_remain: TStringField
      DisplayLabel = 'Additional'
      DisplayWidth = 15
      FieldKind = fkCalculated
      FieldName = 'unit_remain'
      ReadOnly = True
      Calculated = True
    end
    object qryBegBalancebeg_qty: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'Quantity'
      DisplayWidth = 15
      FieldName = 'beg_qty'
      Origin = 'beg_balance.beg_qty'
    end
    object qryBegBalancecactive: TSmallintField
      DisplayLabel = 'Active'
      DisplayWidth = 10
      FieldName = 'cactive'
      Origin = 'beg_balance.cactive'
      Visible = False
    end
    object qryBegBalanceunit_description: TStringField
      DisplayWidth = 50
      FieldName = 'unit_description'
      Origin = 'unit.unit_description'
      Visible = False
      Size = 50
    end
  end
  object dsqryBegBalance: TMyDataSource
    DataSet = qryBegBalance
    Left = 321
    Top = 120
  end
  object qryiBalance: TMyQuery
    Connection = frmData.dbCon
    Left = 120
    Top = 72
  end
  object qryBB: TMyQuery
    Connection = frmData.dbCon
    Left = 120
    Top = 120
  end
end
