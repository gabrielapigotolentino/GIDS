inherited frmItemsbyGoods: TfrmItemsbyGoods
  Caption = 'Items by Goods'
  ClientHeight = 303
  ClientWidth = 675
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 681
  ExplicitHeight = 331
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMaster: TPanel
    Width = 675
    ExplicitWidth = 675
    inherited pnlLabel: TPanel
      Caption = 'Goods'
    end
    inherited pnlSelection: TPanel
      Width = 572
      ExplicitWidth = 572
      inherited wdblkpcmbSelection: TwwDBLookupCombo
        Width = 150
        CharCase = ecUpperCase
        DisableThemes = True
        Selected.Strings = (
          'goodstype_description'#9'32'#9'Type'#9'F')
        LookupTable = frmData.tblGoodsType
        LookupField = 'goodstype_id'
        DropDownWidth = 100
        ShowMatchText = True
        OnCloseUp = wdblkpcmbSelectionCloseUp
        OnExit = wdblkpcmbSelectionExit
        ExplicitWidth = 150
      end
    end
  end
  inherited pnlDetail: TPanel
    Width = 675
    Height = 232
    ExplicitWidth = 675
    ExplicitHeight = 232
    inherited wdbgrdDetail: TwwDBGrid
      Width = 657
      Height = 192
      ControlType.Strings = (
        'item_id;CustomEdit;wdblkpcmbItem;F'
        'unit_id;CustomEdit;wdblkpcmbUnits;F'
        'unit_description;CustomEdit;wdblkpcmbUnits;F')
      Selected.Strings = (
        'item_id'#9'20'#9'Item ID'
        'item_description'#9'35'#9'Item Description'
        'brand_description'#9'18'#9'Brand'
        'size_description'#9'15'#9'Size'
        'itemsbygoods_qty'#9'12'#9'Quantity')
      OnRowChanged = wdbgrdDetailRowChanged
      DataSource = frmData.dsqryItemsbyGoods
      OnKeyDown = wdbgrdDetailKeyDown
      OnKeyPress = wdbgrdDetailKeyPress
      OnFieldChanged = wdbgrdDetailFieldChanged
      ExplicitWidth = 657
      ExplicitHeight = 192
    end
    inherited pnlRecordCtr: TPanel
      Top = 201
      Width = 658
      ExplicitTop = 201
      ExplicitWidth = 658
    end
    object wdblkpcmbItem: TwwDBLookupCombo
      Left = 19
      Top = 47
      Width = 130
      Height = 21
      DisableThemes = True
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'item_id'#9'20'#9'ID'#9'F'
        'item_description'#9'35'#9'Description'#9'F'
        'brand_description'#9'15'#9'brand_description'#9'F'
        'size_description'#9'15'#9'size_description'#9'F')
      LookupTable = frmData.qryAI
      LookupField = 'item_id'
      DropDownCount = 10
      DropDownWidth = 520
      TabOrder = 2
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      ShowMatchText = True
      OnCloseUp = wdblkpcmbItemCloseUp
    end
  end
  inherited pnlMenu: TPanel
    Top = 267
    Width = 675
    ExplicitTop = 267
    ExplicitWidth = 675
    inherited btnOK: TBitBtn
      Left = 515
      OnClick = btnOKClick
      ExplicitLeft = 515
    end
    inherited btnCANCEL: TBitBtn
      Left = 590
      OnClick = btnCANCELClick
      OnMouseEnter = btnCANCELMouseEnter
      OnMouseLeave = btnCANCELMouseLeave
      ExplicitLeft = 590
    end
  end
end
