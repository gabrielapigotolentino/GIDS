inherited frmSignatories: TfrmSignatories
  Caption = 'Signatories'
  ClientWidth = 563
  ExplicitWidth = 569
  ExplicitHeight = 329
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlDetail: TPanel
    Width = 563
    inherited wdbgrdDetail: TwwDBGrid
      Width = 553
      Selected.Strings = (
        'signatory_name'#9'35'#9'NAME'
        'signatory_designation'#9'50'#9'DESIGNATION'#9'F')
      DataSource = frmData.dstblSignatory
      ExplicitWidth = 492
      ExplicitHeight = 233
    end
    inherited pnlRecordCtr: TPanel
      Width = 554
      ExplicitTop = 238
    end
  end
  inherited pnlMenu: TPanel
    Width = 563
    ExplicitTop = 265
    inherited btnOK: TBitBtn
      Left = 407
      Anchors = [akRight, akBottom]
      ExplicitLeft = 407
    end
    inherited btnCANCEL: TBitBtn
      Left = 482
      Anchors = [akRight, akBottom]
      ExplicitLeft = 482
    end
  end
end
