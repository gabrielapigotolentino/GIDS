unit modFunctions;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ImgList, ToolWin, ExtCtrls, CheckLst, Menus,
  ActiveX, Buttons, DB, Wwdbigrd, Wwdbgrid, DBAccess, MyAccess, StrUtils,
  wwdblook;

  //Functions
  function Escape_String(valStr: string): string;
  function GetQuantityPerUnit(QuantityUnit: string): Integer;
  function GetUnitAsRemain(UnitDescription: string): string;
  function GetUnitAsWhole(UnitDescription: string): string;
  function IsLetter(checkValue: string): Boolean;
  function IsNumeric(checkValue: string): Boolean;
  function IsName(strName: string): Boolean;
  function IsRecordExist(strTableName, strFieldName, strFieldValue: string; Option: Char): Boolean;
  function IsRecordExistMore(strTableName, strCondition: string): Boolean;
  function SetNewID(strTableName, strFieldName, strPrefix: string; numPad: Integer): string;
  function SignatoryID(wdblkpcmbSignatory: TwwDBLookupCombo): Integer;

  //Procedures
  procedure AcceptRecord(DataSet: TDataSet);
  procedure BRDRecords(Option: Char; MyQuery: TMyQuery; CreateTable,TableName,TempTable: string);
  procedure CancelUpdateRecord(fromMasterTable, toMasterTable, pk_ID, checkField : string);
  procedure DeleteRecord(strTableName, strFieldName, strFieldValue: string; Option: Char);
  procedure DiscardRecord(DataSet: TDataSet);
  procedure DisplayRecordCount(DataSet: TDataSet; panelName: TPanel);
  procedure ExportUpdateRecord(fromMasterTable, fromDetailTable, toMasterTable, toDetailTable, pk_ID, checkField: string; IsCopied: Boolean);
  procedure ImportUpdateRecord(fromMasterTable, fromDetailTable, toMasterTable, toDetailTable, pk_ID, checkField: string);
  procedure ListSignatory(wdblkpcmbPosition,wdblkpcmbSignatory: TwwDBLookupCombo);
  procedure SetActiveUser(ActiveUser: Integer);
  procedure setGridOption(gridName: TwwDBGrid; gridOption: Byte);
  procedure StatusInformation(statName: TStatusBar; formWidth: Integer);

implementation

uses modPublicVar, modVarType, dtmData;

function Escape_String(valStr: string): string;
begin
  Result := valStr;
  if valStr <> '' then
    begin
      Result := StringReplace(Trim(valStr),Chr(34),Chr(92)+Chr(34),[rfReplaceAll,rfIgnoreCase]);
    end;
end;

function GetQuantityPerUnit(QuantityUnit: string): Integer;
const
  NumericValue = ['0'..'9'];
var
  I: Integer;
  validQty: string;
begin
  validQty := '';
  for I := 1 to Length(QuantityUnit) do
    begin
      if QuantityUnit[I] in NumericValue then
        begin
          validQty := validQty + QuantityUnit[I];
        end
      else
        begin
          Break;
        end;
    end;
  if validQty = '' then
    begin
      Result := 0;
    end
  else
    begin
      Result := StrToInt(validQty);
    end;
end;

function GetUnitAsRemain(UnitDescription: string): string;
begin
  Result := ' ';
  Result := Result + RightStr(LeftStr(UnitDescription,AnsiPos('/',UnitDescription)-1),(Length(LeftStr(UnitDescription,AnsiPos('/',UnitDescription)-1)))-(Length(IntToStr(GetQuantityPerUnit(LeftStr(UnitDescription,AnsiPos('/',UnitDescription)-1))))));
end;

function GetUnitAsWhole(UnitDescription: string): string;
begin
  Result := ' ';
  Result := Result + RightStr(UnitDescription,(Length(UnitDescription))-(AnsiPos('/',UnitDescription)));
end;

function IsLetter(checkValue: string): Boolean;
const
  validLetter = ['A'..'Z','a'..'z',' '];
var
  I: Integer;
begin
	for I := 1 to Length(checkValue) do
  	begin
      if checkValue[I] in validLetter then
      	begin
        	Result := True;
        end
      else
      	begin
          Result := False;
          Break;
        end;
    end;
end;

function IsNumeric(checkValue: string): Boolean;
const
	validNumeric = ['0'..'9'];
var
	I: Integer;
begin
	for I := 1 to Length(checkValue) do
  	begin
      if checkValue[I] in validNumeric then
      	begin
        	Result := True;
        end
      else
      	begin
          Result := False;
          Break;
        end;
    end;
end;

function IsName(strName: string): Boolean;
const
  validName = ['A'..'Z','a'..'z','.',',',' '];
var
  I: Integer;
begin
	for I := 1 to Length(strName) do
  	begin
      if strName[I] in validName then
      	begin
        	Result := True;
        end
      else
      	begin
          Result := False;
          Break;
        end;
    end;
end;

function IsRecordExist(strTableName, strFieldName, strFieldValue: string; Option: Char): Boolean;
var
  strQuery: string;
begin
  strQuery := '';
  if Option = 'S' then
    begin
      strFieldValue := Chr(34)+Escape_String(strFieldValue)+Chr(34);
    end;
  Result := False;

  strQuery := 'SELECT ' + strFieldName + ' FROM ' + strTableName;
  strQuery := strQuery + ' WHERE ' + strFieldName + ' = ' + strFieldValue;
  with frmData.qryCheck do
    begin
      Close;
      SQL.Clear;
      SQL.Text := strQuery;
      Open;

      if RecordCount > 0 then
        begin
          Result := True;
        end;
    end;
end;

function IsRecordExistMore(strTableName, strCondition: string): Boolean;
var
  strQuery: string;
begin
  strQuery := '';
  Result := False;
  strQuery := 'SELECT * FROM ' + strTableName;
  strQuery := strQuery + ' ' + strCondition;
  with frmData.qryCheck do
    begin
      Close;
      SQL.Clear;
      SQL.Text := strQuery;
      Open;

      if RecordCount > 0 then
        begin
          Result := True;
        end;
    end;
end;

function SetNewID(strTableName, strFieldName, strPrefix: string; numPad: Integer): string;
var
  NewID: string;
  LastID,nPad: Integer;
begin
  NewID := '';
  LastID := 1;
  nPad := 0;
  with frmData.qrySet do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'SELECT ' + strFieldName + ' FROM ' + strTableName + ' ORDER BY ' + strFieldName;
      Open;

      Last;
      if RecordCount > 0 then
        begin
          LastID := StrToInt(RightStr(FieldByName(strFieldName).AsString,numPad)) + 1;
        end;
      nPad := numPad - Length(IntToStr(LastID));
    end;
  Result := strPrefix + StringOfChar('0',nPad) + IntToStr(LastID);
end;

function SignatoryID(wdblkpcmbSignatory: TwwDBLookupCombo): Integer;
begin
  Result := 0;
  if wdblkpcmbSignatory.Text <> '' then
    begin
      with frmData do
        begin
          if qryListOfSignatory.Locate('signatory_name',wdblkpcmbSignatory.Text,[loPartialKey,loCaseInsensitive]) then
            begin
              Result := qryListOfSignatorysignatory_id.AsInteger;
            end
          else
            begin
              wdblkpcmbSignatory.Text := '';
              wdblkpcmbSignatory.SetFocus;
              raise(Exception.Create('Field "Signatory Name" does not exist!'));
            end;
        end;
    end;
end;

procedure AcceptRecord(DataSet: TDataSet);
begin
  with DataSet do
    begin
      if State in [dsEdit, dsInsert] then
        begin
            try
              Post;
            except
              on E: Exception do
                begin
                  raise(Exception.Create('Error : ' + E.Message));
                end;
            end;
        end;
    end;
end;

procedure BRDRecords(Option: Char; MyQuery: TMyQuery; CreateTable,TableName,TempTable: string);
var
  sqlqry: string;
begin
  sqlqry := '';
  with MyQuery do
    begin
      if Option = 'B' then
        begin
          sqlqry := sqlqry + CreateTable;
          Close;
          SQL.Clear;
          SQL.Text := sqlqry;
          Execute;

          sqlqry := '';
          sqlqry := sqlqry + 'SELECT * FROM ';
          sqlqry := sqlqry + TableName;
          Close;
          SQL.Clear;
          SQL.Text := sqlqry;
          Open;

          if RecordCount > 0 then
            begin
              sqlqry := '';
              sqlqry := sqlqry + 'INSERT INTO ';
              sqlqry := sqlqry + TempTable;
              sqlqry := sqlqry + ' SELECT * FROM ';
              sqlqry := sqlqry + TableName;
              Close;
              SQL.Clear;
              SQL.Text := sqlqry;
              Execute;
            end;
        end;
      if Option = 'R' then
        begin
          sqlqry := '';
          sqlqry := sqlqry + 'TRUNCATE ';
          sqlqry := sqlqry + TableName;
          Close;
          SQL.Clear;
          SQL.Text := sqlqry;
          Execute;

          sqlqry := '';
          sqlqry := sqlqry + 'SELECT * FROM ';
          sqlqry := sqlqry + TempTable;
          Close;
          SQL.Clear;
          SQL.Text := sqlqry;
          Open;

          if RecordCount > 0 then
            begin
              sqlqry := '';
              sqlqry := sqlqry + 'INSERT INTO ';
              sqlqry := sqlqry + TableName;
              sqlqry := sqlqry + ' SELECT * FROM ';
              sqlqry := sqlqry + TempTable;
              Close;
              SQL.Clear;
              SQL.Text := sqlqry;
              Execute;
            end;
        end;
      if Option = 'D' then
        begin
          sqlqry := '';
          sqlqry := sqlqry + 'DROP TABLE IF EXISTS ';
          sqlqry := sqlqry + TempTable;
          Close;
          SQL.Clear;
          SQL.Text := sqlqry;
          Execute;
        end;
    end;
end;

procedure DeleteRecord(strTableName, strFieldName, strFieldValue: string; Option: Char);
var
  strQuery: string;
begin
  strQuery := '';
  if Option = 'S' then
    begin
      strFieldValue := Chr(34)+Escape_String(strFieldValue)+Chr(34);
    end;

  strQuery := 'DELETE FROM ' + strTableName;
  strQuery := strQuery + ' WHERE ' + strFieldName + ' = ' + strFieldValue;
  with frmData.qryDelete do
    begin
      Close;
      SQL.Clear;
      SQL.Text := strQuery;
      Execute;
    end;
end;

procedure DiscardRecord(DataSet: TDataSet);
begin
  with DataSet do
    begin
      if State in [dsEdit, dsInsert] then
        begin
          Cancel;
        end;
    end;
end;

procedure DisplayRecordCount(DataSet: TDataSet; panelName: TPanel);
begin
  with DataSet do
    begin
      panelName.Caption := '';
      if State = dsBrowse then
        begin
          panelName.Caption := 'Record : ' + IntToStr(RecNo) + ' of ' + IntToStr(RecordCount);
        end;
    end;
end;

procedure ListSignatory(wdblkpcmbPosition,wdblkpcmbSignatory: TwwDBLookupCombo);
begin
  wdblkpcmbSignatory.Text := '';
  wdblkpcmbSignatory.Enabled := False;
  if wdblkpcmbPosition.Text <> '' then
    begin
      with frmData do
        begin
          if qryListOfPosition.Locate('position_description',Trim(wdblkpcmbPosition.Text),[loPartialKey,loCaseInsensitive]) then
            begin
              qryListOfSignatory.Active := False;
              qryListOfSignatory.Params[0].AsInteger := qryListOfPositionposition_id.AsInteger;
              qryListOfSignatory.Active := True;

              if qryListOfSignatory.RecordCount > 0 then
                begin
                  wdblkpcmbSignatory.Enabled := True;
                end;
            end
          else
            begin
              wdblkpcmbPosition.Text := '';
              wdblkpcmbPosition.SetFocus;
              raise(Exception.Create('Field "Position Name" does not exist!'));
            end;
        end;
    end;
end;

procedure SetActiveUser(ActiveUser: Integer);
begin
  with frmData.qrySet do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'SELECT * FROM userbindary WHERE UserID = ' + IntToStr(ActiveUser);
      Open;

      if RecordCount > 0 then
        begin
          with CurrUser do
            begin
              USER_ID := ActiveUser;
              USER_NAME := FieldByName('UserName').AsString;
              USER_FULLNAME := FieldByName('Fullname').AsString;
            end;
        end;
    end;
end;

procedure setGridOption(gridName: TwwDBGrid; gridOption: Byte);
begin
  if gridOption = 0 then
    begin
      gridName.Options := [dgTitles,dgIndicator,dgColLines,dgRowLines,dgRowSelect,dgAlwaysShowSelection];
    end
  else if gridOption = 1 then
    begin
      gridName.Options := [dgEditing,dgTitles,dgIndicator, dgTabs, dgColLines,dgRowLines,dgCancelOnExit];
    end;
end;

procedure StatusInformation(statName: TStatusBar; formWidth: Integer);
begin
  with statName do
    begin
      Panels[0].Text := 'Username : ' + CurrUser.USER_NAME;
      Panels[0].Width := Length(Panels[0].Text)+100;

      Panels[2].Text := FormatDateTime('mm/dd/yyyy hh:nn:ss',Now);
      Panels[2].Width := Length(Panels[2].Text)+140;

      Panels[1].Text := 'Fullname : ' + CurrUser.USER_FULLNAME;
      Panels[1].Width := Length(Panels[1].Text) + (formWidth - (Panels[0].Width + Panels[2].Width));
    end;
end;

procedure ExportUpdateRecord(fromMasterTable, fromDetailTable, toMasterTable, toDetailTable, pk_ID, checkField: string; IsCopied: Boolean);
var
  qryIns,qrySel,qryUpd: string;
begin
  qryIns := '';
  qrySel := '';
  qryUpd := '';
  with frmData do
    begin
      //
      if not IsCopied then
        begin
          qryUpd := '';
          qryUpd := qryUpd + 'TRUNCATE ';
          qryUpd := qryUpd + toMasterTable;

          qryUpdate.Close;
          qryUpdate.SQL.Clear;
          qryUpdate.SQL.Text := qryUpd;
          qryUpdate.Execute;

          //
          qryUpd := '';
          qryUpd := qryUpd + 'TRUNCATE ';
          qryUpd := qryUpd + toDetailTable;

          qryUpdate.Close;
          qryUpdate.SQL.Clear;
          qryUpdate.SQL.Text := qryUpd;
          qryUpdate.Execute;

          qrySel := '';
          qrySel := qrySel + 'SELECT * FROM ';
          qrySel := qrySel + fromMasterTable;
          qrySel := qrySel + ' WHERE ';
          qrySel := qrySel + checkField;
          qrySel := qrySel + ' = 0';

          qrySelect.Close;
          qrySelect.SQL.Clear;
          qrySelect.SQL.Text := qrySel;
          qrySelect.Open;

          if qrySelect.RecordCount > 0 then
            begin
              //
              qryIns := '';
              qryIns := qryIns + 'INSERT INTO ';
              qryIns := qryIns + toMasterTable;
              qryIns := qryIns + ' ';
              qryIns := qryIns + qrySel;

              qryInsert.Close;
              qryInsert.SQL.Clear;
              qryInsert.SQL.Text := qryIns;
              qryInsert.Execute;

              qrySelect.First;
              while not qrySelect.Eof do
                begin
                  //
                  qryIns := '';
                  qryIns := qryIns + 'INSERT INTO ';
                  qryIns := qryIns + toDetailTable;
                  qryIns := qryIns + ' SELECT * FROM ';
                  qryIns := qryIns + fromDetailTable;
                  qryIns := qryIns + ' WHERE ';
                  qryIns := qryIns + pk_ID;
                  qryIns := qryIns + '= "';
                  qryIns := qryIns + qrySelect.FieldByName(pk_ID).AsString;
                  qryIns := qryIns + '"';

                  qryInsert.Close;
                  qryInsert.SQL.Clear;
                  qryInsert.SQL.Text := qryIns;
                  qryInsert.Execute;

                  qrySelect.Next;
                end;
            end;
        end
      else
        begin
          //
          qryUpd := '';
          qryUpd := qryUpd + 'UPDATE ';
          qryUpd := qryUpd + fromMasterTable;
          qryUpd := qryUpd + ' SET ';
          qryUpd := qryUpd + checkField;
          qryUpd := qryUpd + ' = 1';

          qryUpdate.Close;
          qryUpdate.SQL.Clear;
          qryUpdate.SQL.Text := qryUpd;
          qryUpdate.Execute;
        end;
    end;
end;

procedure ImportUpdateRecord(fromMasterTable, fromDetailTable, toMasterTable, toDetailTable, pk_ID, checkField: string);
var
  qryIns,qrySel,qryUpd,transDate,transType: string;
begin
  qryIns := '';
  qrySel := '';
  qryUpd := '';
  transDate := '';
  transType := '';
  if toMasterTable = 'ris' then
    begin
      transType := 'I';
      transDate := 'ris_date';
    end
  else if toMasterTable = 'sai' then
    begin
      transType := 'S';
      transDate := 'sai_datetime';
    end;
  with frmData do
    begin
      //check if record exist on the update_sai or update_ris table
      qrySel := '';
      qrySel := qrySel + 'SELECT * FROM ';
      qrySel := qrySel + fromMasterTable;

      qrySelect.Close;
      qrySelect.SQL.Clear;
      qrySelect.SQL.Text := qrySel;
      qrySelect.Open;

      if qrySelect.RecordCount > 0 then
        begin
          //SET copied field value of update_sai or update_ris table to 1
          qryUpd := '';
          qryUpd := qryUpd + 'UPDATE ';
          qryUpd := qryUpd + fromMasterTable;
          qryUpd := qryUpd + ' SET ';
          qryUpd := qryUpd + checkField;
          qryUpd := qryUpd + ' = 1';

          qryUpdate.Close;
          qryUpdate.SQL.Clear;
          qryUpdate.SQL.Text := qryUpd;
          qryUpdate.Execute;

          qrySelect.First;
          while not qrySelect.Eof do
            begin

              //Check if record already exists on the sai or ris table.
              qryIns := '';
              qryIns := qryIns + 'SELECT * FROM ';
              qryIns := qryIns + toMasterTable;
              qryIns := qryIns + ' WHERE ';
              qryIns := qryIns + pk_ID;
              qryIns := qryIns + ' = "';
              qryIns := qryIns + qrySelect.FieldByName(pk_ID).AsString;
              qryIns := qryIns + '"';

              qryInsert.Close;
              qryInsert.SQL.Clear;
              qryInsert.SQL.Text := qryIns;
              qryInsert.Open;

              if qryInsert.RecordCount = 0 then
                begin
                  //if record does not exists on sai or ris table then insert record
                  qryIns := '';
                  qryIns := qryIns + 'INSERT INTO ';
                  qryIns := qryIns + toMasterTable;
                  qryIns := qryIns + ' SELECT * FROM ';
                  qryIns := qryIns + fromMasterTable;
                  qryIns := qryIns + ' WHERE ';
                  qryIns := qryIns + pk_ID;
                  qryIns := qryIns + ' = "';
                  qryIns := qryIns + qrySelect.FieldByName(pk_ID).AsString;
                  qryIns := qryIns + '"';

                  qryInsert.Close;
                  qryInsert.SQL.Clear;
                  qryInsert.SQL.Text := qryIns;
                  qryInsert.Execute;

                  //Insert all update_sai_det or update_ris_det entry to sai_det or ris_det
                  qryIns := '';
                  qryIns := qryIns + 'INSERT INTO ';
                  qryIns := qryIns + toDetailTable;
                  qryIns := qryIns + ' SELECT * FROM ';
                  qryIns := qryIns + fromDetailTable;
                  qryIns := qryIns + ' WHERE ';
                  qryIns := qryIns + pk_ID;
                  qryIns := qryIns + ' = "';
                  qryIns := qryIns + qrySelect.FieldByName(pk_ID).AsString;
                  qryIns := qryIns + '"';

                  qryInsert.Close;
                  qryInsert.SQL.Clear;
                  qryInsert.SQL.Text := qryIns;
                  qryInsert.Execute;

                  //Update ihist table
                  qryIns := '';
                  qryIns := qryIns + 'INSERT INTO ihist (trans_type, reference_id, trans_date) VALUES';
                  qryIns := qryIns + '("';
                  qryIns := qryIns + transType;
                  qryIns := qryIns + '","';
                  qryIns := qryIns + qrySelect.FieldByName(pk_ID).AsString;
                  qryIns := qryIns + '","';
                  qryIns := qryIns + FormatDateTime('yyyy-mm-dd hh:nn:ss',qrySelect.FieldByName(transDate).AsDateTime);
                  qryIns := qryIns + '")';

                  qryInsert.Close;
                  qryInsert.SQL.Clear;
                  qryInsert.SQL.Text := qryIns;
                  qryInsert.Execute;

                  if toMasterTable = 'ris' then
                    begin
                      //Update sai_status of sai table
                      qryUpd := '';
                      qryUpd := qryUpd + 'UPDATE sai SET sai_status = 1 WHERE sai_id = "';
                      qryUpd := qryUpd + qrySelect.FieldByName('sai_id').AsString;
                      qryUpd := qryUpd + '" AND sai_status = 0';

                      qryUpdate.Close;
                      qryUpdate.SQL.Clear;
                      qryUpdate.SQL.Text := qryUpd;
                      qryUpdate.Execute;

                      //Update qty_onhand of ibalance table
                      qryIns := '';
                      qryIns := qryIns + 'SELECT * FROM update_ris_det WHERE ris_id = "';
                      qryIns := qryIns + qrySelect.FieldByName('ris_id').AsString;
                      qryIns := qryIns + '"';

                      qryInsert.Close;
                      qryInsert.SQL.Clear;
                      qryInsert.SQL.Text := qryIns;
                      qryInsert.Open;

                      if qryInsert.RecordCount > 0 then
                        begin
                          qryInsert.First;
                          while not qryInsert.Eof do
                            begin
                              qryUpd := '';
                              qryUpd := qryUpd + 'UPDATE ibalance SET qty_onhand = (qty_onhand - ';
                              qryUpd := qryUpd + qryInsert.FieldByName('total_quantity').AsString;
                              qryUpd := qryUpd + '), UserID = ';
                              qryUpd := qryUpd + qrySelect.FieldByName('UserID').AsString;
                              qryUpd := qryUpd + ', TransDate = "';
                              qryUpd := qryUpd + FormatDateTime('yyyy-mm-dd hh:nn:ss',qrySelect.FieldByName('TransDate').AsDateTime);
                              qryUpd := qryUpd + '" WHERE item_id = "';
                              qryUpd := qryUpd + qryInsert.FieldByName('item_id').AsString;
                              qryUpd := qryUpd + '"';

                              qryUpdate.Close;
                              qryUpdate.SQL.Clear;
                              qryUpdate.SQL.Text := qryUpd;
                              qryUpdate.Execute;

                              qryInsert.Next;
                            end;
                        end;
                    end;
                end;

              qrySelect.Next;
            end;
        end;

//      if toMasterTable = 'ris' then
//        begin
//          qrySel := '';
//          qrySel := qrySel + 'SELECT * FROM update_ris';
//
//          qrySelect.Close;
//          qrySelect.SQL.Clear;
//          qrySelect.SQL.Text := qrySel;
//          qrySelect.Open;
//
//          if qrySelect.RecordCount > 0 then
//            begin
//              qrySelect.First;
//              while not qrySelect.Eof do
//                begin
//                  qryUpd := '';
//                  qryUpd := qryUpd + 'UPDATE sai SET sai_status = 1 WHERE sai_id = "';
//                  qryUpd := qryUpd + qrySelect.FieldByName('sai_id').AsString;
//                  qryUpd := qryUpd + '" AND sai_status = 0';
//
//                  qryUpdate.Close;
//                  qryUpdate.SQL.Clear;
//                  qryUpdate.SQL.Text := qryUpd;
//                  qryUpdate.Execute;
//
//                  //Update iBalance
//                  qryIns := '';
//                  qryIns := qryIns + 'SELECT * FROM update_ris_det WHERE ris_id = "';
//                  qryIns := qryIns + qrySelect.FieldByName('ris_id').AsString;
//                  qryIns := qryIns + '"';
//
//                  qryInsert.Close;
//                  qryInsert.SQL.Clear;
//                  qryInsert.SQL.Text := qryIns;
//                  qryInsert.Open;
//
//                  if qryInsert.RecordCount > 0 then
//                    begin
//                      qryInsert.First;
//                      while not qryInsert.Eof do
//                        begin
//                          qryUpd := '';
//                          qryUpd := qryUpd + 'UPDATE ibalance SET qty_onhand = (qty_onhand - ';
//                          qryUpd := qryUpd + qryInsert.FieldByName('total_quantity').AsString;
//                          qryUpd := qryUpd + '), UserID = ';
//                          qryUpd := qryUpd + qrySelect.FieldByName('UserID').AsString;
//                          qryUpd := qryUpd + ', TransDate = "';
//                          qryUpd := qryUpd + FormatDateTime('yyyy-mm-dd hh:nn:ss',qrySelect.FieldByName('TransDate').AsDateTime);
//                          qryUpd := qryUpd + '" WHERE item_id = "';
//                          qryUpd := qryUpd + qryInsert.FieldByName('item_id').AsString;
//                          qryUpd := qryUpd + '"';
//
//                          qryUpdate.Close;
//                          qryUpdate.SQL.Clear;
//                          qryUpdate.SQL.Text := qryUpd;
//                          qryUpdate.Execute;
//
//                          qryInsert.Next;
//                        end;
//                    end;
//
//                  qrySelect.Next;
//                end;
//            end;
//
//        end;
      //
      qryUpd := '';
      qryUpd := qryUpd + 'TRUNCATE ';
      qryUpd := qryUpd + fromMasterTable;

      qryUpdate.Close;
      qryUpdate.SQL.Clear;
      qryUpdate.SQL.Text := qryUpd;
      qryUpdate.Execute;

      //
      qryUpd := '';
      qryUpd := qryUpd + 'TRUNCATE ';
      qryUpd := qryUpd + fromDetailTable;

      qryUpdate.Close;
      qryUpdate.SQL.Clear;
      qryUpdate.SQL.Text := qryUpd;
      qryUpdate.Execute;
    end;
end;

procedure CancelUpdateRecord(fromMasterTable, toMasterTable, pk_ID, checkField : string);
var
  qrySel,qryUpd: string;
begin
  qrySel := '';
  qryUpd := '';
  with frmData do
    begin
      qrySel := '';
      qrySel := qrySel + 'SELECT * FROM ';
      qrySel := qrySel + fromMasterTable;

      qrySelect.Close;
      qrySelect.SQL.Clear;
      qrySelect.SQL.Text := qrySel;
      qrySelect.Open;

      if qrySelect.RecordCount > 0 then
        begin
          qrySelect.First;
          while not qrySelect.Eof do
            begin
              qryUpd := '';
              qryUpd := qryUpd + 'UPDATE ';
              qryUpd := qryUpd + toMasterTable;
              qryUpd := qryUpd + ' SET ';
              qryUpd := qryUpd + checkField;
              qryUpd := qryUpd + ' = 0 WHERE ';
              qryUpd := qryUpd + pk_ID;
              qryUpd := qryUpd + ' = "';
              qryUpd := qryUpd + qrySelect.FieldByName(pk_ID).AsString;
              qryUpd := qryUpd + '"';

              qryUpdate.Close;
              qryUpdate.SQL.Clear;
              qryUpdate.SQL.Text := qryUpd;
              qryUpdate.Execute;

              qrySelect.Next;
            end;
          qryUpd := '';
          qryUpd := qryUpd + 'TRUNCATE ';
          qryUpd := qryUpd + fromMasterTable;

          qryUpdate.Close;
          qryUpdate.SQL.Clear;
          qryUpdate.SQL.Text := qryUpd;
          qryUpdate.Execute;

          qryUpd := '';
          qryUpd := qryUpd + 'TRUNCATE ';
          qryUpd := qryUpd + fromMasterTable;
          qryUpd := qryUpd + '_det';

          qryUpdate.Close;
          qryUpdate.SQL.Clear;
          qryUpdate.SQL.Text := qryUpd;
          qryUpdate.Execute;
        end;
    end;

end;

end.
