inherited frmActualStock: TfrmActualStock
  Caption = 'Actual Stock'
  ClientWidth = 828
  OnClose = FormClose
  OnCreate = FormCreate
  ExplicitWidth = 834
  ExplicitHeight = 303
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlDetail: TPanel
    Width = 828
    ExplicitWidth = 828
    inherited wdbgrdDetail: TwwDBGrid
      Width = 808
      Selected.Strings = (
        'item_id'#9'20'#9'Item ID'#9#9
        'item_descriptions'#9'60'#9'Item Description'#9#9
        'qty_whole'#9'15'#9'Whole'#9#9
        'qty_remain'#9'15'#9'Additional'#9#9
        'qty_onhand'#9'15'#9'Quantity'#9#9)
      OnRowChanged = wdbgrdDetailRowChanged
      DataSource = dsqryActualStock
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection]
      OnExit = wdbgrdDetailExit
      OnKeyDown = wdbgrdDetailKeyDown
      OnKeyPress = wdbgrdDetailKeyPress
      OnFieldChanged = wdbgrdDetailFieldChanged
      ExplicitWidth = 808
    end
    inherited pnlRecordCtr: TPanel
      Width = 809
      ExplicitWidth = 809
    end
  end
  inherited pnlFooter: TPanel
    Width = 828
    ExplicitWidth = 828
    inherited pnlMenu: TPanel
      Left = 734
      ExplicitLeft = 734
      inherited btnCLOSE: TBitBtn
        OnClick = btnCLOSEClick
      end
    end
  end
  object qryActualStock: TMyQuery
    Connection = frmData.dbCon
    SQL.Strings = (
      'SELECT'
      #9'ibalance.item_id,'
      
        #9'CONCAT(item.item_description,IFNULL(CONCAT('#39' '#39',brand.brand_desc' +
        'ription),'#39#39'),IFNULL(CONCAT('#39' '#39',size.size_description),'#39#39'),IFNULL' +
        '(CONCAT('#39' '#39',unit.unit_description),'#39#39')) AS item_descriptions,'
      #9'unit.unit_description,'
      #9'ibalance.qty_onhand'
      'FROM'
      #9'item'
      'INNER JOIN brand ON brand.brand_id = item.brand_id'
      'LEFT OUTER JOIN size ON size.size_id = item.size_id'
      'INNER JOIN unit ON unit.unit_id = item.unit_id'
      'LEFT OUTER JOIN ibalance ON item.item_id = ibalance.item_id')
    OnCalcFields = qryActualStockCalcFields
    Left = 350
    Top = 67
    object qryActualStockitem_id: TStringField
      DisplayLabel = 'Item ID'
      DisplayWidth = 20
      FieldName = 'item_id'
      Origin = 'ibalance.item_id'
      Size = 11
    end
    object qryActualStockitem_descriptions: TStringField
      DisplayLabel = 'Item Description'
      DisplayWidth = 60
      FieldName = 'item_descriptions'
      Origin = 'item_descriptions'
      Size = 203
    end
    object qryActualStockqty_whole: TStringField
      DisplayLabel = 'Whole'
      DisplayWidth = 15
      FieldKind = fkCalculated
      FieldName = 'qty_whole'
      Calculated = True
    end
    object qryActualStockqty_remain: TStringField
      DisplayLabel = 'Additional'
      DisplayWidth = 15
      FieldKind = fkCalculated
      FieldName = 'qty_remain'
      Calculated = True
    end
    object qryActualStockqty_onhand: TIntegerField
      DisplayLabel = 'Quantity'
      DisplayWidth = 15
      FieldName = 'qty_onhand'
      Origin = 'ibalance.qty_onhand'
    end
    object qryActualStockunit_description: TStringField
      FieldName = 'unit_description'
      Origin = 'unit.unit_description'
      Visible = False
      Size = 50
    end
  end
  object dsqryActualStock: TMyDataSource
    DataSet = qryActualStock
    Left = 350
    Top = 113
  end
  object qryiBal: TMyQuery
    Connection = frmData.dbCon
    Left = 539
    Top = 89
  end
end
