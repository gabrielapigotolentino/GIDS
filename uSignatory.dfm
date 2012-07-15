inherited frmSignatory: TfrmSignatory
  Caption = 'Signatory'
  ClientHeight = 303
  ClientWidth = 661
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 667
  ExplicitHeight = 331
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMaster: TPanel
    Width = 661
    ExplicitWidth = 265
    inherited pnlLabel: TPanel
      Caption = 'Position'
    end
    inherited pnlSelection: TPanel
      Width = 558
      ExplicitWidth = 162
      inherited wdblkpcmbSelection: TwwDBLookupCombo
        Width = 250
        DisableThemes = True
        Selected.Strings = (
          'position_description'#9'32'#9'position_description'#9'F')
        LookupTable = frmData.tblPosition
        LookupField = 'position_id'
        DropDownWidth = 100
        ShowMatchText = True
        OnCloseUp = wdblkpcmbSelectionCloseUp
        OnExit = wdblkpcmbSelectionExit
        ExplicitWidth = 250
      end
    end
  end
  inherited pnlDetail: TPanel
    Width = 661
    Height = 232
    ExplicitWidth = 265
    ExplicitHeight = 232
    inherited wdbgrdDetail: TwwDBGrid
      Width = 643
      Height = 192
      ControlType.Strings = (
        'designation_name;CustomEdit;wdblkpcmbDesignation;F')
      Selected.Strings = (
        'signatory_name'#9'40'#9'Name'#9#9
        'designation_name'#9'60'#9'Designation'#9'F'#9)
      OnRowChanged = wdbgrdDetailRowChanged
      DataSource = frmData.dsqryListOfSignatory
      OnKeyDown = wdbgrdDetailKeyDown
      OnKeyPress = wdbgrdDetailKeyPress
      ExplicitWidth = 643
      ExplicitHeight = 192
    end
    inherited pnlRecordCtr: TPanel
      Top = 201
      Width = 644
      ExplicitTop = 201
      ExplicitWidth = 248
    end
    object wdblkpcmbDesignation: TwwDBLookupCombo
      Left = 267
      Top = 45
      Width = 366
      Height = 21
      DisableThemes = True
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'designation_name'#9'50'#9'Name'#9'F')
      LookupTable = frmData.tblDesignation
      LookupField = 'designation_name'
      TabOrder = 2
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      ShowMatchText = True
      OnCloseUp = wdblkpcmbDesignationCloseUp
      OnExit = wdblkpcmbDesignationExit
    end
  end
  inherited pnlMenu: TPanel
    Top = 267
    Width = 661
    ExplicitTop = 267
    ExplicitWidth = 265
    inherited btnOK: TBitBtn
      Left = 501
      OnClick = btnOKClick
      ExplicitLeft = 105
    end
    inherited btnCANCEL: TBitBtn
      Left = 576
      OnClick = btnCANCELClick
      ExplicitLeft = 180
    end
  end
end
