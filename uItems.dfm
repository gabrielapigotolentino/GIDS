inherited frmItems: TfrmItems
  Caption = 'Items'
  ClientWidth = 767
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 773
  ExplicitHeight = 303
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlDetail: TPanel
    Width = 767
    ExplicitWidth = 702
    inherited wdbgrdDetail: TwwDBGrid
      Width = 747
      Selected.Strings = (
        'item_id'#9'20'#9'ID'
        'item_description'#9'45'#9'Description'
        'brand_description'#9'20'#9'Brand'
        'size_description'#9'15'#9'Size'
        'unit_description'#9'15'#9'Unit')
      OnRowChanged = wdbgrdDetailRowChanged
      DataSource = frmData.dsqryItemList
      OnDblClick = wdbgrdDetailDblClick
      OnKeyPress = wdbgrdDetailKeyPress
      ExplicitWidth = 682
    end
    inherited pnlRecordCtr: TPanel
      Width = 748
      ExplicitWidth = 683
    end
  end
  inherited pnlFooter: TPanel
    Width = 767
    ExplicitWidth = 702
    inherited pnlMenu: TPanel
      Left = 673
      ExplicitLeft = 608
      inherited btnCLOSE: TBitBtn
        OnClick = btnCLOSEClick
      end
    end
  end
end
