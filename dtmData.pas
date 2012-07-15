unit dtmData;

interface

uses
  SysUtils, Classes, DB, DBAccess, MyAccess, MemDS, DADump, MyDump, IniFiles,
  StrUtils, Forms;

type
  TfrmData = class(TDataModule)
    dbCon: TMyConnection;
    dstblUserBindary: TMyDataSource;
    dstblGroupPermissions: TMyDataSource;
    dstblGroupMembershipBindary: TMyDataSource;
    dstblGroupBindary: TMyDataSource;
    dstblPermissionBindary: TMyDataSource;
    dstblUserPerrmissions: TMyDataSource;
    tblGroupPermissions: TMyTable;
    tblGroupMembershipBindary: TMyTable;
    tblGroupBindary: TMyTable;
    tblPermissionBindary: TMyTable;
    tblUserPermissions: TMyTable;
    tblUserBindary: TMyTable;
    tblUserBindaryUserID: TIntegerField;
    tblUserBindaryUserName: TStringField;
    tblUserBindaryPassword: TStringField;
    tblUserBindaryEnabled: TSmallintField;
    tblUserBindaryCreatedDate: TDateTimeField;
    tblUserBindaryLastAccess: TDateTimeField;
    tblUserBindaryAccessCount: TIntegerField;
    tblUserBindaryLastAccessTime: TTimeField;
    tblUserBindaryCreatedTime: TTimeField;
    tblUserBindaryFullname: TStringField;
    tblUserPermissionsUsername: TStringField;
    tblUserPermissionsPermission: TStringField;
    tblPermissionBindaryPermission: TStringField;
    tblPermissionBindaryItem: TMemoField;
    tblPermissionBindaryAction: TIntegerField;
    tblPermissionBindaryFormName: TStringField;
    tblGroupBindaryGroupID: TIntegerField;
    tblGroupBindaryGroupName: TStringField;
    tblGroupBindaryDescription: TStringField;
    tblGroupPermissionsGroupName: TStringField;
    tblGroupPermissionsPermission: TStringField;
    qrySet: TMyQuery;
    tblBrand: TMyTable;
    dstblBrand: TMyDataSource;
    tblBrandbrand_id: TIntegerField;
    tblBrandbrand_description: TStringField;
    tblBrandUserID: TIntegerField;
    tblBrandTransDate: TDateTimeField;
    tblItem: TMyTable;
    dstblItem: TMyDataSource;
    qryCheck: TMyQuery;
    qryDelete: TMyQuery;
    tblSize: TMyTable;
    tblSizesize_id: TIntegerField;
    tblSizesize_description: TStringField;
    tblSizeUserID: TIntegerField;
    tblSizeTransDate: TDateTimeField;
    dstblSize: TMyDataSource;
    tblUnit: TMyTable;
    tblUnitunit_id: TIntegerField;
    tblUnitunit_description: TStringField;
    tblUnitUserID: TIntegerField;
    tblUnitTransDate: TDateTimeField;
    dstblUnit: TMyDataSource;
    tblGoodsType: TMyTable;
    dstblGoodsType: TMyDataSource;
    tblGoodsTypegoodstype_id: TIntegerField;
    tblGoodsTypegoodstype_description: TStringField;
    tblGoodsTypeUserID: TIntegerField;
    tblGoodsTypeTransDate: TDateTimeField;
    tblPosition: TMyTable;
    tblPositionposition_id: TIntegerField;
    tblPositionposition_description: TStringField;
    tblPositionUserID: TIntegerField;
    tblPositionTransDate: TDateTimeField;
    dstblPosition: TMyDataSource;
    tblSignatory: TMyTable;
    dstblSignatory: TMyDataSource;
    qryItemList: TMyQuery;
    dsqryItemList: TMyDataSource;
    qryItemsbyGoods: TMyQuery;
    dsqryItemsbyGoods: TMyDataSource;
    tblItemsbyGoods: TMyTable;
    dstblItemsbyGoods: TMyDataSource;
    qryAI: TMyQuery;
    tblSAI: TMyTable;
    dstblSAI: TMyDataSource;
    qrytemp: TMyQuery;
    tblMunicipality: TMyTable;
    dstblMunicipality: TMyDataSource;
    tblMunicipalityCM_Mode: TStringField;
    tblMunicipalityCM_Code: TStringField;
    tblMunicipalityDescription: TStringField;
    tblMunicipalityProv: TStringField;
    tblMunicipalityCM_Capital: TStringField;
    tblMunicipalityCutoff: TStringField;
    tblMunicipalityLogoPath: TStringField;
    tblMunicipalityM_Code: TStringField;
    tblMunicipalityCActive: TSmallintField;
    tblBarangay: TMyTable;
    dstblBarangay: TMyDataSource;
    tblBarangayBCode: TStringField;
    tblBarangayDescription: TStringField;
    tblBarangayDist_Code: TStringField;
    tblBarangayM_Code: TStringField;
    qryPost: TMyQuery;
    tblItemitem_id: TStringField;
    tblItemitem_description: TStringField;
    tblItembrand_id: TIntegerField;
    tblItemsize_id: TIntegerField;
    tblItemunit_id: TIntegerField;
    tblItemUserID: TIntegerField;
    tblItemTransDate: TDateTimeField;
    qryItemListitem_id: TStringField;
    qryItemListitem_description: TStringField;
    qryItemListbrand_description: TStringField;
    qryItemListsize_description: TStringField;
    qryItemListunit_description: TStringField;
    tblItemsbyGoodsgoodstype_id: TIntegerField;
    tblItemsbyGoodsitem_id: TStringField;
    tblItemsbyGoodsitemsbygoods_qty: TFloatField;
    tblItemsbyGoodsUserID: TIntegerField;
    tblItemsbyGoodsTransDate: TDateTimeField;
    qryItemsbyGoodsgoodstype_id: TIntegerField;
    qryItemsbyGoodsitem_id: TStringField;
    qryItemsbyGoodsitem_description: TStringField;
    qryItemsbyGoodsbrand_description: TStringField;
    qryItemsbyGoodssize_description: TStringField;
    qryItemsbyGoodsitemsbygoods_qty: TIntegerField;
    qryItemsbyGoodsUserID: TIntegerField;
    qryItemsbyGoodsTransDate: TDateTimeField;
    qryAIitem_id: TStringField;
    qryAIitem_description: TStringField;
    qryAIbrand_description: TStringField;
    qryAIsize_description: TStringField;
    qryListofIG: TMyQuery;
    tblSAI_Det: TMyTable;
    tblSAI_Detsai_id: TStringField;
    tblSAI_Detgoodstype_id: TIntegerField;
    tblSAI_Detitem_id: TStringField;
    tblSAI_Detunit_w: TIntegerField;
    tblSAI_Detunit_r: TIntegerField;
    tblSAI_Dettotal_quantity: TIntegerField;
    dstblSAI_Det: TMyDataSource;
    tblTempSAIDet: TMyTable;
    dsTempSAIDet: TMyDataSource;
    tblTempSAIDetsai_id: TStringField;
    tblTempSAIDetgoodstype_id: TIntegerField;
    tblTempSAIDetitem_id: TStringField;
    tblTempSAIDetunit_w: TIntegerField;
    tblTempSAIDetunit_r: TIntegerField;
    tblTempSAIDettotal_quantity: TIntegerField;
    qryListofSAIDet: TMyQuery;
    qryListofIGgoodstype_id: TIntegerField;
    qryListofIGitem_id: TStringField;
    qryListofIGitemsbygoods_qty: TIntegerField;
    qryListofIGunit_description: TStringField;
    dsqryListofSAIDet: TMyDataSource;
    qryAGT: TMyQuery;
    dsqryAGT: TMyDataSource;
    qryAGTgoodstype_description: TStringField;
    qryAGTgoodstype_id: TIntegerField;
    qryListofSAIDetitem_id: TStringField;
    qryListofSAIDetitems_description: TStringField;
    qryListofSAIDetunit_w: TIntegerField;
    qryListofSAIDetunit_r: TIntegerField;
    qryListofSAIDettotal_quantity: TIntegerField;
    qryListofSAIs: TMyQuery;
    dsqryListofSAIs: TMyDataSource;
    qryListofSAIssai_id: TStringField;
    qryListofSAIssai_datetime: TDateTimeField;
    qryListofSAIsgoodstype_description: TStringField;
    qryListofSAIssai_qty: TIntegerField;
    qryListofSAIssai_location: TStringField;
    qryListofSAIssai_issued: TStringField;
    qryListofSAIssai_cancelled: TSmallintField;
    qryASAIs: TMyQuery;
    dsqryASAIs: TMyDataSource;
    tblRIS: TMyTable;
    tblRISris_id: TStringField;
    tblRISris_date: TDateTimeField;
    tblRISsai_id: TStringField;
    tblRISsai_date: TDateTimeField;
    tblRISgoodstype_id: TIntegerField;
    tblRISris_qty: TIntegerField;
    tblRISUserID: TIntegerField;
    tblRISTransDate: TDateTimeField;
    dstblRIS: TMyDataSource;
    tblRIS_Det: TMyTable;
    tblRIS_Detris_id: TStringField;
    tblRIS_Detgoodstype_id: TIntegerField;
    tblRIS_Detitem_id: TStringField;
    tblRIS_Dettotal_quantity: TIntegerField;
    tblRIS_Detunit_cost: TFloatField;
    dstblRIS_Det: TMyDataSource;
    tblTempRISDet: TMyTable;
    dstblTempRISDet: TMyDataSource;
    qryASAIssai_id: TStringField;
    qryASAIssai_datetime: TDateTimeField;
    qryASAIsgoodstype_id: TIntegerField;
    qryASAIsgoodstype_description: TStringField;
    qryASAIssai_qty: TIntegerField;
    qryASAIsDescription: TStringField;
    qryASAIssai_brgy: TStringField;
    qryASAIssai_status: TSmallintField;
    qryASAIssai_cancelled: TSmallintField;
    qryListOfPosition: TMyQuery;
    qryListOfPositionposition_id: TIntegerField;
    qryListOfPositionposition_description: TStringField;
    qryListOfSignatory: TMyQuery;
    tblSAIsai_id: TStringField;
    tblSAIsai_status: TSmallintField;
    tblSAIsai_datetime: TDateTimeField;
    tblSAIgoodstype_id: TIntegerField;
    tblSAIsai_qty: TIntegerField;
    tblSAIm_code: TStringField;
    tblSAIbcode: TStringField;
    tblSAIsai_cancelled: TSmallintField;
    tblSAIis_emergency: TSmallintField;
    tblSAIemergency_reason: TMemoField;
    tblSAIp_signatory_id: TIntegerField;
    tblSAIc_signatory_id: TIntegerField;
    tblSAIa_signatory_id: TIntegerField;
    tblSAIUserID: TIntegerField;
    tblSAITransDate: TDateTimeField;
    tblTempRISDetris_id: TStringField;
    tblTempRISDetgoodstype_id: TIntegerField;
    tblTempRISDetitem_id: TStringField;
    tblTempRISDettotal_quantity: TIntegerField;
    tblTempRISDetunit_cost: TFloatField;
    tblTempRISDetamount: TFloatField;
    strdprcListOfSAI: TMyStoredProc;
    dsspListOfSAI: TMyDataSource;
    qryListOfSAI: TMyQuery;
    qryListOfRIS: TMyQuery;
    dsspListOfRIS: TMyDataSource;
    strdprcListOfRIS: TMyStoredProc;
    dsqryListOfSignatory: TMyDataSource;
    dsUnit: TMyDataSource;
    QryCheckRecID: TMyQuery;
    QryItems: TMyQuery;
    dbQryItemsitem_id: TStringField;
    dbQryItemsitem_description: TStringField;
    dbQryItemsbrand_description: TStringField;
    dbQryItemssize_description: TStringField;
    dbQryItemsUserID: TIntegerField;
    dbQryItemsTransDate: TDateTimeField;
    dbQryItemsunit_id: TIntegerField;
    QryReciHist: TMyQuery;
    tblBalance: TMyTable;
    dbBalanceitem_id: TStringField;
    dbBalanceUserID: TIntegerField;
    dbBalanceTransDate: TDateTimeField;
    dbBalanceqty_onhand: TIntegerField;
    QryQuery: TMyQuery;
    QryMunicity: TMyQuery;
    dbQryMunicityDescription: TStringField;
    dbQryMunicityM_Code: TStringField;
    QryBarangay: TMyQuery;
    dbQryBarangayBCode: TStringField;
    dbQryBarangayDescription: TStringField;
    dbQryBarangayM_Code: TStringField;
    QryRecDetLoc: TMyQuery;
    QryRecBalance: TMyQuery;
    dbQryRecBalancerecID: TStringField;
    dbQryRecBalanceitem_id: TStringField;
    dbQryRecBalanceqty_onhand: TFloatField;
    dbQryRecBalanceunit_id: TIntegerField;
    QryRetDetLoc: TMyQuery;
    QryRetBalance: TMyQuery;
    dbQryRetBalanceretID: TStringField;
    dbQryRetBalanceitem_id: TStringField;
    dbQryRetBalanceqty_onhand: TFloatField;
    dbQryRetBalanceunit_id: TIntegerField;
    QryAdjDetLoc: TMyQuery;
    QryAdjBalance: TMyQuery;
    dbQryAdjBalanceadjID: TStringField;
    dbQryAdjBalanceitem_id: TStringField;
    dbQryAdjBalanceqty_onhand: TFloatField;
    dbQryAdjBalanceunit_id: TIntegerField;
    dbQryAdjBalanceadjustment_type: TIntegerField;
    QrySignatory: TMyQuery;
    dbQrySignatorysignatory_id: TIntegerField;
    dbQrySignatorysignatory_name: TStringField;
    dbQrySignatoryposition_id: TIntegerField;
    dbQrySignatoryUserID: TIntegerField;
    dbQrySignatoryTransDate: TDateTimeField;
    DSSignatory: TMyDataSource;
    qryUpdate: TMyQuery;
    qryInsert: TMyQuery;
    qrySelect: TMyQuery;
    dmpRIS: TMyDump;
    dmpSAI: TMyDump;
    tblItemitem_type: TStringField;
    qryListofSAIDetqty_whole: TStringField;
    qryListofSAIDetqty_remain: TStringField;
    qryListofSAIDetunit_description: TStringField;
    qryRecipientList: TMyQuery;
    dsqryRecipientList: TMyDataSource;
    tblDesignation: TMyTable;
    tblSignatorysignatory_id: TIntegerField;
    tblSignatorysignatory_name: TStringField;
    tblSignatorydesignation_id: TIntegerField;
    tblSignatoryposition_id: TIntegerField;
    tblSignatoryUserID: TIntegerField;
    tblSignatoryTransDate: TDateTimeField;
    dstblDesignation: TMyDataSource;
    tblDesignationdesignation_id: TIntegerField;
    tblDesignationdesignation_name: TStringField;
    tblDesignationUserID: TIntegerField;
    tblDesignationTransDate: TDateTimeField;
    qryListOfSignatorysignatory_id: TIntegerField;
    qryListOfSignatorysignatory_name: TStringField;
    qryListOfSignatorydesignation_id: TIntegerField;
    qryListOfSignatoryposition_id: TIntegerField;
    qryListOfSignatorydesignation_name: TStringField;
    qryListOfSignatoryUserID: TIntegerField;
    qryListOfSignatoryTransDate: TDateTimeField;
    strdprcListOfBegBalance: TMyStoredProc;
    dsspListOfBegBalance: TMyDataSource;
    qryListOfBegBalance: TMyQuery;
    qryListOfBegBalancecmonth: TIntegerField;
    qryListOfBegBalancecyear: TIntegerField;
    qryListOfBegBalanceitem_id: TStringField;
    qryListOfBegBalanceitem_descriptions: TStringField;
    qryListOfBegBalanceunit_description: TStringField;
    qryListOfBegBalancebeg_qty: TIntegerField;
    qryListOfBegBalancecactive: TSmallintField;
    DSSignatory2: TMyDataSource;
    DSPosition2: TMyDataSource;
    QryPosition2: TMyQuery;
    dbQryPosition2position_id: TIntegerField;
    dbQryPosition2position_description: TStringField;
    QrySignatory2: TMyQuery;
    dbQrySignatory2signatory_id: TIntegerField;
    dbQrySignatory2signatory_name: TStringField;
    dbQrySignatory2position_id: TIntegerField;
    dbQrySignatory2UserID: TIntegerField;
    dbQrySignatory2TransDate: TDateTimeField;
    DSPosition1: TMyDataSource;
    QryPosition1: TMyQuery;
    dbQryPositionposition_id: TIntegerField;
    dbQryPositionposition_description: TStringField;
    DSSignatory1: TMyDataSource;
    QrySignatory1: TMyQuery;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    DateTimeField1: TDateTimeField;
    DSRisID: TMyDataSource;
    QryRisID: TMyQuery;
    dbQryRisIDris_id: TStringField;
    dbQryRisIDris_returned: TSmallintField;
    procedure tblBrandBeforePost(DataSet: TDataSet);
    procedure tblSizeBeforePost(DataSet: TDataSet);
    procedure tblUnitBeforePost(DataSet: TDataSet);
    procedure tblGoodsTypeBeforePost(DataSet: TDataSet);
    procedure tblPositionBeforePost(DataSet: TDataSet);
    procedure tblSignatoryBeforePost(DataSet: TDataSet);
    procedure tblItemBeforePost(DataSet: TDataSet);
    procedure qryItemsbyGoodsBeforePost(DataSet: TDataSet);
    procedure qryListOfSignatoryBeforePost(DataSet: TDataSet);
    procedure qryListOfSignatorysignatory_nameChange(Sender: TField);
    procedure DataModuleCreate(Sender: TObject);
    procedure qryListofSAIDetCalcFields(DataSet: TDataSet);
    procedure tblDesignationBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmData: TfrmData;
  AddTrue : Integer;
  currID : string;


implementation

uses modFunctions, modPublicVar, modVarType;

{$R *.dfm}

function Decrypt(const input: string): string; stdcall; external 'mysqlmaintenance.dll';
function Encrypt(const input: string): string; stdcall; external 'mysqlmaintenance.dll';

procedure TfrmData.DataModuleCreate(Sender: TObject);
var
	INIFilename: TIniFile;
begin
  INIFilename := TIniFile.Create(ChangeFileExt(Application.ExeName,'.ini'));
  with dbCon do
    begin
        try
          Server := INIFilename.ReadString('Settings','Server','Default');
          Port := StrToInt(INIFilename.ReadString('Settings','Port','Default'));
          Username := INIFilename.ReadString('Settings','Username','Default');
          Password := Decrypt(INIFilename.ReadString('Settings','Password','Default'));
          Database := INIFilename.ReadString('Settings','Database','Default');
          Open;
        except
          on E: Exception do
            raise(Exception.Create('Error : ' + E.Message));
        end;
    end;
  INIFilename.Free;
  if not QryItems.Active then QryItems.Active := True;
  if not QryMunicity.Active then QryMunicity.Active := True;

  //use to locate items already selected in the current transaction
  if not QryRecDetLoc.Active then QryRecDetLoc.Active := True;
  if not QryRetDetLoc.Active then QryRetDetLoc.Active := True;
  if not QryAdjDetLoc.Active then QryAdjDetLoc.Active := True;
  //

  if not tblBalance.Active then tblBalance.Active := True;
  if not tblUnit.Active then tblUnit.Active := True;
end;

procedure TfrmData.qryItemsbyGoodsBeforePost(DataSet: TDataSet);
begin
  if qryItemsbyGoodsitem_id.AsString = '' then
    begin
      raise(Exception.Create('Item "ID" must have a value.'));
    end
  else if qryItemsbyGoodsitemsbygoods_qty.AsInteger = 0 then
    begin
      raise(Exception.Create('Item "Quantity" must not be zero.'));
    end
  else
    begin
      qryItemsbyGoodsUserID.Value := CurrUser.USER_ID;
      qryItemsbyGoodsTransDate.Value := Now;
    end;
end;

procedure TfrmData.qryListofSAIDetCalcFields(DataSet: TDataSet);
var
  unit_whole,unit_remain: string;
begin
  inherited;
  unit_whole := '';
  unit_remain := '';

  unit_whole := IntToStr(qryListofSAIDettotal_quantity.AsInteger div GetQuantityPerUnit(qryListofSAIDetunit_description.AsString));
  unit_whole := unit_whole + GetUnitAsWhole(qryListofSAIDetunit_description.AsString);

  unit_remain := IntToStr(qryListofSAIDettotal_quantity.AsInteger mod GetQuantityPerUnit(qryListofSAIDetunit_description.AsString));
  unit_remain := unit_remain + GetUnitAsRemain(qryListofSAIDetunit_description.AsString);

  qryListofSAIDetqty_whole.Value := unit_whole;
  qryListofSAIDetqty_remain.Value := unit_remain;
end;

procedure TfrmData.qryListOfSignatoryBeforePost(DataSet: TDataSet);
var
  qryCondition: string;
begin
  qryCondition := '';
  qryCondition := 'WHERE signatory_name = "';
  qryCondition := qryCondition + Escape_String(qryListOfSignatorysignatory_name.AsString);
  qryCondition := qryCondition + '" AND position_id = ';
  qryCondition := qryCondition + qryListOfSignatoryposition_id.AsString;
  qryCondition := qryCondition + ' AND designation_id = ';
  qryCondition := qryCondition + qryListOfSignatorydesignation_id.AsString;

  if qryListOfSignatorysignatory_name.AsString = '' then
    begin
      raise(Exception.Create('Signatory "Name" must have a value.'));
    end
  else if qryListOfSignatorydesignation_name.AsString = '' then
    begin
      raise(Exception.Create('Signatory "Designation" must have a value.'));
    end
  else if IsRecordExistMore('signatory',qryCondition) then
    begin
      raise(Exception.Create('Signatory "Name" already exists.'));
    end
  else
    begin
      qryListOfSignatoryUserID.Value := CurrUser.USER_ID;
      qryListOfSignatoryTransDate.Value := Now;
    end;
end;

procedure TfrmData.qryListOfSignatorysignatory_nameChange(Sender: TField);
begin
  qryListOfSignatoryposition_id.Value := tblPositionposition_id.AsInteger;
end;

procedure TfrmData.tblBrandBeforePost(DataSet: TDataSet);
begin
  if tblBrandbrand_description.AsString = '' then
    begin
      raise(Exception.Create('Brand "Name" must have a value.'));
    end
  else if IsRecordExist('brand','brand_description',tblBrandbrand_description.AsString,'S') then
    begin
      raise(Exception.Create('Brand "Name" already exists.'));
    end
  else
    begin
      tblBrandUserID.Value := CurrUser.USER_ID;
      tblBrandTransDate.Value := Now;
    end;
end;

procedure TfrmData.tblDesignationBeforePost(DataSet: TDataSet);
begin
  if tblDesignationdesignation_name.AsString = '' then
    begin
      raise(Exception.Create('Designation "Name" must have a value.'));
    end
  else if IsRecordExist('designation','designation_name',tblDesignationdesignation_name.AsString,'S') then
    begin
      raise(Exception.Create('Designation "Name" already exists.'));
    end
  else
    begin
      tblDesignationUserID.Value := CurrUser.USER_ID;
      tblDesignationTransDate.Value := Now;
    end;
end;

procedure TfrmData.tblGoodsTypeBeforePost(DataSet: TDataSet);
begin
  if tblGoodsTypegoodstype_description.AsString = '' then
    begin
      raise(Exception.Create('Goods "Type" must have a value.'));
    end
  else if IsRecordExist('goodstype','goodstype_description',tblGoodsTypegoodstype_description.AsString,'S') then
    begin
      raise(Exception.Create('Goods "Type" already exists.'));
    end
  else
    begin
      tblGoodsTypeUserID.Value := CurrUser.USER_ID;
      tblGoodsTypeTransDate.Value := Now;
    end;
end;

procedure TfrmData.tblItemBeforePost(DataSet: TDataSet);
var
  qryCondition: string;
begin
  qryCondition := '';
  qryCondition := 'WHERE item_description = "' + Escape_String(tblItemitem_description.AsString) + '"';
  qryCondition := qryCondition + ' AND brand_id = ' + tblItembrand_id.AsString;
  qryCondition := qryCondition + ' AND size_id = ' + tblItemsize_id.AsString;
  qryCondition := qryCondition + ' AND unit_id = ' + tblItemunit_id.AsString;

  if tblItemitem_description.AsString = '' then
    begin
      raise(Exception.Create('Item "Description" must have a value.'));
    end
  else if tblItembrand_id.AsInteger = 0 then
    begin
      raise(Exception.Create('Item "Brand" must have a value.'));
    end
  else if tblItemsize_id.AsInteger = 0 then
    begin
      raise(Exception.Create('Item "Size" must have a value.'));
    end
  else if tblItemitem_type.AsString = '' then
    begin
      raise(Exception.Create('Item "Type" must have a value.'));
    end
  else if IsRecordExistMore('item',qryCondition) then
    begin
      raise(Exception.Create('Item already exists.'));
    end
  else
    begin
      tblItemUserID.Value := CurrUser.USER_ID;
      tblItemTransDate.Value := Now;
    end;
end;

procedure TfrmData.tblPositionBeforePost(DataSet: TDataSet);
begin
  if tblPositionposition_description.AsString = '' then
    begin
      raise(Exception.Create('Position "Name" must have a value.'));
    end
  else if IsRecordExist('position','position_description',tblPositionposition_description.AsString,'S') then
    begin
      raise(Exception.Create('Position "Name" already exists.'));
    end
  else
    begin
      tblPositionUserID.Value := CurrUser.USER_ID;
      tblPositionTransDate.Value := Now;
    end;
end;

procedure TfrmData.tblSignatoryBeforePost(DataSet: TDataSet);
//var
//  qryCondition: string;
begin
//  qryCondition := '';
//  qryCondition := 'WHERE signatory_name = "' + Escape_String(tblSignatorysignatory_name.AsString) + '"';
//  qryCondition := qryCondition + ' AND position_id = ' + tblSignatoryposition_id.AsString;

//  if tblSignatorysignatory_name.AsString = '' then
//    begin
//      raise(Exception.Create('Signatory "Name" must have a value.'));
//    end
//  else if IsRecordExistMore('signatory',qryCondition) then
//    begin
//      raise(Exception.Create('Signatory "Name" already exists.'));
//    end
//  else
//    begin
//      tblSignatoryUserID.Value := CurrUser.USER_ID;
//      tblSignatoryTransDate.Value := Now;
//    end;
//  if tblSignatorysignatory_name.AsString = '' then
//    begin
//      raise(Exception.Create('Signatory "Name" must have a value.'));
//    end
//  else
//    begin
//      tblSignatoryUserID.Value := CurrUser.USER_ID;
//      tblSignatoryTransDate.Value := Now;
//    end;
end;

procedure TfrmData.tblSizeBeforePost(DataSet: TDataSet);
begin
  if tblSizesize_description.AsString = '' then
    begin
      raise(Exception.Create('Size "Name" must have a value.'));
    end
  else if IsRecordExist('size','size_description',tblSizesize_description.AsString,'S') then
    begin
      raise(Exception.Create('Size "Name" already exists.'));
    end
  else
    begin
      tblSizeUserID.Value := CurrUser.USER_ID;
      tblSizeTransDate.Value := Now;
    end;
end;

procedure TfrmData.tblUnitBeforePost(DataSet: TDataSet);
begin
  if tblUnitunit_description.AsString = '' then
    begin
      raise(Exception.Create('Unit "Name" must have a value.'));
    end
  else if IsRecordExist('unit','unit_description',tblUnitunit_description.AsString,'S') then
    begin
      raise(Exception.Create('Unit "Name" already exists.'));
    end
  else
    begin
      tblUnitUserID.Value := CurrUser.USER_ID;
      tblUnitTransDate.Value := Now;
    end;
end;

end.
