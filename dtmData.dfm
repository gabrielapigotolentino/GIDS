object frmData: TfrmData
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 602
  Width = 1526
  object dbCon: TMyConnection
    Database = 'gids'
    Username = 'root'
    Password = 'root'
    Server = 'localhost'
    LoginPrompt = False
    Left = 8
    Top = 8
  end
  object dstblUserBindary: TMyDataSource
    DataSet = tblUserBindary
    Left = 210
    Top = 256
  end
  object dstblGroupPermissions: TMyDataSource
    DataSet = tblGroupPermissions
    Left = 210
    Top = 496
  end
  object dstblGroupMembershipBindary: TMyDataSource
    DataSet = tblGroupMembershipBindary
    Left = 210
    Top = 448
  end
  object dstblGroupBindary: TMyDataSource
    DataSet = tblGroupBindary
    Left = 210
    Top = 400
  end
  object dstblPermissionBindary: TMyDataSource
    DataSet = tblPermissionBindary
    Left = 210
    Top = 352
  end
  object dstblUserPerrmissions: TMyDataSource
    DataSet = tblUserPermissions
    Left = 210
    Top = 304
  end
  object tblGroupPermissions: TMyTable
    TableName = 'grouppermissions'
    MasterFields = 'GroupName'
    DetailFields = 'GroupName'
    MasterSource = dstblGroupBindary
    Connection = dbCon
    Left = 64
    Top = 496
    object tblGroupPermissionsGroupName: TStringField
      FieldName = 'GroupName'
      Origin = 'grouppermissions.GroupName'
      Size = 50
    end
    object tblGroupPermissionsPermission: TStringField
      FieldName = 'Permission'
      Origin = 'grouppermissions.Permission'
      Size = 50
    end
  end
  object tblGroupMembershipBindary: TMyTable
    TableName = 'groupmembershipbindary'
    MasterFields = 'GroupName'
    DetailFields = 'GroupName'
    MasterSource = dstblGroupBindary
    Connection = dbCon
    Left = 64
    Top = 448
  end
  object tblGroupBindary: TMyTable
    TableName = 'groupbindary'
    DetailFields = 'GroupName'
    Connection = dbCon
    Left = 64
    Top = 400
    object tblGroupBindaryGroupID: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'GroupID'
      Origin = 'groupbindary.GroupID'
    end
    object tblGroupBindaryGroupName: TStringField
      FieldName = 'GroupName'
      Origin = 'groupbindary.GroupName'
      Size = 50
    end
    object tblGroupBindaryDescription: TStringField
      FieldName = 'Description'
      Origin = 'groupbindary.Description'
      Size = 50
    end
  end
  object tblPermissionBindary: TMyTable
    TableName = 'permissionbindary'
    Connection = dbCon
    Left = 64
    Top = 352
    object tblPermissionBindaryPermission: TStringField
      FieldName = 'Permission'
      Origin = 'permissionbindary.Permission'
      Size = 50
    end
    object tblPermissionBindaryItem: TMemoField
      FieldName = 'Item'
      Origin = 'permissionbindary.Item'
      BlobType = ftMemo
    end
    object tblPermissionBindaryAction: TIntegerField
      FieldName = 'Action'
      Origin = 'permissionbindary.Action'
    end
    object tblPermissionBindaryFormName: TStringField
      FieldName = 'FormName'
      Origin = 'permissionbindary.FormName'
      Size = 50
    end
  end
  object tblUserPermissions: TMyTable
    TableName = 'userpermissions'
    MasterFields = 'UserName'
    DetailFields = 'Username'
    MasterSource = dstblUserBindary
    Connection = dbCon
    Left = 64
    Top = 304
    object tblUserPermissionsUsername: TStringField
      FieldName = 'Username'
      Origin = 'userpermissions.Username'
      Size = 50
    end
    object tblUserPermissionsPermission: TStringField
      FieldName = 'Permission'
      Origin = 'userpermissions.Permission'
      Size = 50
    end
  end
  object tblUserBindary: TMyTable
    TableName = 'userbindary'
    Connection = dbCon
    Left = 64
    Top = 256
    object tblUserBindaryUserID: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'UserID'
      Origin = 'userbindary.UserID'
    end
    object tblUserBindaryUserName: TStringField
      FieldName = 'UserName'
      Origin = 'userbindary.UserName'
      Size = 30
    end
    object tblUserBindaryPassword: TStringField
      FieldName = 'Password'
      Origin = 'userbindary.Password'
      Size = 30
    end
    object tblUserBindaryEnabled: TSmallintField
      FieldName = 'Enabled'
      Origin = 'userbindary.Enabled'
    end
    object tblUserBindaryCreatedDate: TDateTimeField
      FieldName = 'CreatedDate'
      Origin = 'userbindary.CreatedDate'
    end
    object tblUserBindaryLastAccess: TDateTimeField
      FieldName = 'LastAccess'
      Origin = 'userbindary.LastAccess'
    end
    object tblUserBindaryAccessCount: TIntegerField
      FieldName = 'AccessCount'
      Origin = 'userbindary.AccessCount'
    end
    object tblUserBindaryLastAccessTime: TTimeField
      FieldName = 'LastAccessTime'
      Origin = 'userbindary.LastAccessTime'
    end
    object tblUserBindaryCreatedTime: TTimeField
      FieldName = 'CreatedTime'
      Origin = 'userbindary.CreatedTime'
    end
    object tblUserBindaryFullname: TStringField
      FieldName = 'Fullname'
      Origin = 'userbindary.Fullname'
      Size = 50
    end
  end
  object qrySet: TMyQuery
    Connection = dbCon
    Left = 63
    Top = 8
  end
  object tblBrand: TMyTable
    TableName = 'brand'
    Connection = dbCon
    BeforePost = tblBrandBeforePost
    Left = 337
    Top = 152
    object tblBrandbrand_description: TStringField
      DisplayLabel = 'Name'
      DisplayWidth = 32
      FieldName = 'brand_description'
      Size = 50
    end
    object tblBrandbrand_id: TIntegerField
      DisplayWidth = 10
      FieldName = 'brand_id'
      Visible = False
    end
    object tblBrandUserID: TIntegerField
      DisplayWidth = 10
      FieldName = 'UserID'
      Visible = False
    end
    object tblBrandTransDate: TDateTimeField
      DisplayWidth = 18
      FieldName = 'TransDate'
      Visible = False
    end
  end
  object dstblBrand: TMyDataSource
    DataSet = tblBrand
    Left = 439
    Top = 152
  end
  object tblItem: TMyTable
    TableName = 'item'
    Connection = dbCon
    BeforePost = tblItemBeforePost
    Left = 337
    Top = 104
    object tblItemitem_id: TStringField
      FieldName = 'item_id'
      Origin = 'item.item_id'
    end
    object tblItemitem_description: TStringField
      FieldName = 'item_description'
      Origin = 'item.item_description'
      Size = 50
    end
    object tblItembrand_id: TIntegerField
      FieldName = 'brand_id'
      Origin = 'item.brand_id'
    end
    object tblItemsize_id: TIntegerField
      FieldName = 'size_id'
      Origin = 'item.size_id'
    end
    object tblItemunit_id: TIntegerField
      FieldName = 'unit_id'
      Origin = 'item.unit_id'
    end
    object tblItemitem_type: TStringField
      FieldName = 'item_type'
      Origin = 'item.item_type'
      Size = 2
    end
    object tblItemUserID: TIntegerField
      FieldName = 'UserID'
      Origin = 'item.UserID'
    end
    object tblItemTransDate: TDateTimeField
      FieldName = 'TransDate'
      Origin = 'item.TransDate'
    end
  end
  object dstblItem: TMyDataSource
    DataSet = tblItem
    Left = 439
    Top = 104
  end
  object qryCheck: TMyQuery
    Connection = dbCon
    Left = 118
    Top = 8
  end
  object qryDelete: TMyQuery
    Connection = dbCon
    Left = 173
    Top = 8
  end
  object tblSize: TMyTable
    TableName = 'size'
    Connection = dbCon
    BeforePost = tblSizeBeforePost
    Left = 337
    Top = 200
    object tblSizesize_description: TStringField
      DisplayLabel = 'Name'
      DisplayWidth = 32
      FieldName = 'size_description'
      Size = 50
    end
    object tblSizesize_id: TIntegerField
      DisplayWidth = 10
      FieldName = 'size_id'
      Visible = False
    end
    object tblSizeUserID: TIntegerField
      DisplayWidth = 10
      FieldName = 'UserID'
      Visible = False
    end
    object tblSizeTransDate: TDateTimeField
      DisplayWidth = 18
      FieldName = 'TransDate'
      Visible = False
    end
  end
  object dstblSize: TMyDataSource
    DataSet = tblSize
    Left = 439
    Top = 200
  end
  object tblUnit: TMyTable
    TableName = 'unit'
    Connection = dbCon
    BeforePost = tblUnitBeforePost
    Left = 337
    Top = 248
    object tblUnitunit_description: TStringField
      DisplayWidth = 32
      FieldName = 'unit_description'
      Size = 50
    end
    object tblUnitunit_id: TIntegerField
      DisplayWidth = 10
      FieldName = 'unit_id'
      Visible = False
    end
    object tblUnitUserID: TIntegerField
      DisplayWidth = 10
      FieldName = 'UserID'
      Visible = False
    end
    object tblUnitTransDate: TDateTimeField
      DisplayWidth = 18
      FieldName = 'TransDate'
      Visible = False
    end
  end
  object dstblUnit: TMyDataSource
    DataSet = tblUnit
    Left = 439
    Top = 248
  end
  object tblGoodsType: TMyTable
    TableName = 'goodstype'
    Connection = dbCon
    BeforePost = tblGoodsTypeBeforePost
    Left = 337
    Top = 296
    object tblGoodsTypegoodstype_description: TStringField
      DisplayLabel = 'Type'
      DisplayWidth = 32
      FieldName = 'goodstype_description'
      Size = 30
    end
    object tblGoodsTypegoodstype_id: TIntegerField
      DisplayWidth = 10
      FieldName = 'goodstype_id'
      Visible = False
    end
    object tblGoodsTypeUserID: TIntegerField
      DisplayWidth = 10
      FieldName = 'UserID'
      Visible = False
    end
    object tblGoodsTypeTransDate: TDateTimeField
      DisplayWidth = 18
      FieldName = 'TransDate'
      Visible = False
    end
  end
  object dstblGoodsType: TMyDataSource
    DataSet = tblGoodsType
    Left = 439
    Top = 344
  end
  object tblPosition: TMyTable
    TableName = 'position'
    Connection = dbCon
    BeforePost = tblPositionBeforePost
    Left = 337
    Top = 344
    object tblPositionposition_description: TStringField
      DisplayWidth = 32
      FieldName = 'position_description'
      Origin = 'position.position_description'
      Size = 80
    end
    object tblPositionposition_id: TIntegerField
      AutoGenerateValue = arAutoInc
      DisplayWidth = 10
      FieldName = 'position_id'
      Origin = 'position.position_id'
      Visible = False
    end
    object tblPositionUserID: TIntegerField
      DisplayWidth = 10
      FieldName = 'UserID'
      Origin = 'position.UserID'
      Visible = False
    end
    object tblPositionTransDate: TDateTimeField
      DisplayWidth = 18
      FieldName = 'TransDate'
      Origin = 'position.TransDate'
      Visible = False
    end
  end
  object dstblPosition: TMyDataSource
    DataSet = tblPosition
    Left = 439
    Top = 296
  end
  object tblSignatory: TMyTable
    TableName = 'signatory'
    Connection = dbCon
    BeforePost = tblSignatoryBeforePost
    Left = 337
    Top = 391
    object tblSignatorysignatory_id: TIntegerField
      FieldName = 'signatory_id'
    end
    object tblSignatorysignatory_name: TStringField
      FieldName = 'signatory_name'
      Size = 80
    end
    object tblSignatorydesignation_id: TIntegerField
      FieldName = 'designation_id'
    end
    object tblSignatoryposition_id: TIntegerField
      FieldName = 'position_id'
    end
    object tblSignatoryUserID: TIntegerField
      FieldName = 'UserID'
    end
    object tblSignatoryTransDate: TDateTimeField
      FieldName = 'TransDate'
    end
  end
  object dstblSignatory: TMyDataSource
    DataSet = tblSignatory
    Left = 439
    Top = 391
  end
  object qryItemList: TMyQuery
    Connection = dbCon
    SQL.Strings = (
      'SELECT'
      #9'item.item_id,'
      #9'item.item_description,'
      #9'brand.brand_description,'
      #9'size.size_description,'
      #9'unit.unit_description'
      'FROM'
      #9'item'
      'LEFT JOIN brand ON item.brand_id = brand.brand_id'
      'LEFT JOIN size ON item.size_id = size.size_id'
      'LEFT JOIN unit ON item.unit_id = unit.unit_id')
    Left = 337
    Top = 8
    object qryItemListitem_id: TStringField
      DisplayLabel = 'ID'
      DisplayWidth = 20
      FieldName = 'item_id'
      Origin = 'item.item_id'
    end
    object qryItemListitem_description: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 45
      FieldName = 'item_description'
      Origin = 'item.item_description'
      Size = 50
    end
    object qryItemListbrand_description: TStringField
      DisplayLabel = 'Brand'
      DisplayWidth = 20
      FieldName = 'brand_description'
      Origin = 'brand.brand_description'
      Size = 50
    end
    object qryItemListsize_description: TStringField
      DisplayLabel = 'Size'
      DisplayWidth = 15
      FieldName = 'size_description'
      Origin = 'size.size_description'
      Size = 50
    end
    object qryItemListunit_description: TStringField
      DisplayLabel = 'Unit'
      DisplayWidth = 15
      FieldName = 'unit_description'
      Origin = 'unit.unit_description'
      Size = 50
    end
  end
  object dsqryItemList: TMyDataSource
    DataSet = qryItemList
    Left = 439
    Top = 8
  end
  object qryItemsbyGoods: TMyQuery
    Connection = dbCon
    SQL.Strings = (
      'SELECT'
      #9'itemsbygoods.goodstype_id,'
      #9'itemsbygoods.item_id,'
      #9'item.item_description,'
      #9'brand.brand_description,'
      #9'size.size_description,'
      #9'itemsbygoods.itemsbygoods_qty,'
      #9'itemsbygoods.UserID,'
      #9'itemsbygoods.TransDate'
      'FROM'
      #9'itemsbygoods'
      'LEFT JOIN item ON item.item_id = itemsbygoods.item_id'
      'LEFT JOIN brand ON brand.brand_id = item.brand_id'
      'LEFT JOIN size ON size.size_id = item.size_id'
      'WHERE'
      #9'itemsbygoods.goodstype_id = :gt_id')
    RefreshOptions = [roAfterInsert, roAfterUpdate]
    BeforePost = qryItemsbyGoodsBeforePost
    Left = 337
    Top = 56
    ParamData = <
      item
        DataType = ftInteger
        Name = 'gt_id'
        ParamType = ptInputOutput
        Value = 0
      end>
    object qryItemsbyGoodsitem_id: TStringField
      DisplayLabel = 'Item ID'
      DisplayWidth = 20
      FieldName = 'item_id'
      Origin = 'itemsbygoods.item_id'
    end
    object qryItemsbyGoodsitem_description: TStringField
      DisplayLabel = 'Item Description'
      DisplayWidth = 35
      FieldName = 'item_description'
      Origin = 'item.item_description'
      Size = 50
    end
    object qryItemsbyGoodsbrand_description: TStringField
      DisplayLabel = 'Brand'
      DisplayWidth = 18
      FieldName = 'brand_description'
      Origin = 'brand.brand_description'
      Size = 50
    end
    object qryItemsbyGoodssize_description: TStringField
      DisplayLabel = 'Size'
      DisplayWidth = 15
      FieldName = 'size_description'
      Origin = 'size.size_description'
      Size = 50
    end
    object qryItemsbyGoodsitemsbygoods_qty: TIntegerField
      DisplayLabel = 'Quantity'
      DisplayWidth = 12
      FieldName = 'itemsbygoods_qty'
      Origin = 'itemsbygoods.itemsbygoods_qty'
    end
    object qryItemsbyGoodsgoodstype_id: TIntegerField
      FieldName = 'goodstype_id'
      Origin = 'itemsbygoods.goodstype_id'
      Visible = False
    end
    object qryItemsbyGoodsUserID: TIntegerField
      FieldName = 'UserID'
      Origin = 'itemsbygoods.UserID'
      Visible = False
    end
    object qryItemsbyGoodsTransDate: TDateTimeField
      FieldName = 'TransDate'
      Origin = 'itemsbygoods.TransDate'
      Visible = False
    end
  end
  object dsqryItemsbyGoods: TMyDataSource
    DataSet = qryItemsbyGoods
    Left = 439
    Top = 56
  end
  object tblItemsbyGoods: TMyTable
    TableName = 'itemsbygoods'
    Connection = dbCon
    Left = 542
    Top = 256
    object tblItemsbyGoodsgoodstype_id: TIntegerField
      FieldName = 'goodstype_id'
    end
    object tblItemsbyGoodsitem_id: TStringField
      FieldName = 'item_id'
    end
    object tblItemsbyGoodsitemsbygoods_qty: TFloatField
      FieldName = 'itemsbygoods_qty'
    end
    object tblItemsbyGoodsUserID: TIntegerField
      FieldName = 'UserID'
    end
    object tblItemsbyGoodsTransDate: TDateTimeField
      FieldName = 'TransDate'
    end
  end
  object dstblItemsbyGoods: TMyDataSource
    DataSet = tblItemsbyGoods
    Left = 639
    Top = 256
  end
  object qryAI: TMyQuery
    Connection = dbCon
    SQL.Strings = (
      'SELECT'
      #9'item.item_id,'
      #9'item.item_description,'
      '        brand.brand_description,'
      '        size.size_description'
      'FROM'
      #9'item'
      'LEFT JOIN brand ON item.brand_id = brand.brand_id'
      'LEFT JOIN size ON item.size_id = size.size_id'
      'WHERE'
      #9'item.item_id'
      'NOT IN'
      
        #9'(SELECT itemsbygoods.item_id FROM itemsbygoods WHERE itemsbygoo' +
        'ds.goodstype_id = :gt_id)'
      'ORDER BY'
      #9'item.item_id')
    Left = 229
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'gt_id'
      end>
    object qryAIitem_id: TStringField
      FieldName = 'item_id'
    end
    object qryAIitem_description: TStringField
      FieldName = 'item_description'
      Size = 50
    end
    object qryAIbrand_description: TStringField
      FieldName = 'brand_description'
      Size = 50
    end
    object qryAIsize_description: TStringField
      FieldName = 'size_description'
      Size = 50
    end
  end
  object tblSAI: TMyTable
    TableName = 'sai'
    Connection = dbCon
    Left = 542
    Top = 304
    object tblSAIsai_id: TStringField
      FieldName = 'sai_id'
      Origin = 'sai.sai_id'
    end
    object tblSAIsai_status: TSmallintField
      FieldName = 'sai_status'
      Origin = 'sai.sai_status'
    end
    object tblSAIsai_datetime: TDateTimeField
      FieldName = 'sai_datetime'
      Origin = 'sai.sai_datetime'
    end
    object tblSAIgoodstype_id: TIntegerField
      FieldName = 'goodstype_id'
      Origin = 'sai.goodstype_id'
    end
    object tblSAIsai_qty: TIntegerField
      FieldName = 'sai_qty'
      Origin = 'sai.sai_qty'
    end
    object tblSAIm_code: TStringField
      FieldName = 'm_code'
      Origin = 'sai.m_code'
      Size = 50
    end
    object tblSAIbcode: TStringField
      FieldName = 'bcode'
      Origin = 'sai.bcode'
      Size = 3
    end
    object tblSAIsai_cancelled: TSmallintField
      FieldName = 'sai_cancelled'
      Origin = 'sai.sai_cancelled'
    end
    object tblSAIis_emergency: TSmallintField
      FieldName = 'is_emergency'
      Origin = 'sai.is_emergency'
    end
    object tblSAIemergency_reason: TMemoField
      FieldName = 'emergency_reason'
      Origin = 'sai.emergency_reason'
      BlobType = ftMemo
    end
    object tblSAIp_signatory_id: TIntegerField
      FieldName = 'p_signatory_id'
      Origin = 'sai.p_signatory_id'
    end
    object tblSAIc_signatory_id: TIntegerField
      FieldName = 'c_signatory_id'
      Origin = 'sai.c_signatory_id'
    end
    object tblSAIa_signatory_id: TIntegerField
      FieldName = 'a_signatory_id'
      Origin = 'sai.a_signatory_id'
    end
    object tblSAIUserID: TIntegerField
      FieldName = 'UserID'
      Origin = 'sai.UserID'
    end
    object tblSAITransDate: TDateTimeField
      FieldName = 'TransDate'
      Origin = 'sai.TransDate'
    end
  end
  object dstblSAI: TMyDataSource
    DataSet = tblSAI
    Left = 639
    Top = 304
  end
  object qrytemp: TMyQuery
    Connection = dbCon
    Left = 63
    Top = 56
  end
  object tblMunicipality: TMyTable
    TableName = 'municity'
    Connection = dbCon
    Left = 542
    Top = 400
    object tblMunicipalityDescription: TStringField
      DisplayWidth = 255
      FieldName = 'Description'
      Size = 255
    end
    object tblMunicipalityCM_Mode: TStringField
      FieldName = 'CM_Mode'
      Visible = False
      Size = 50
    end
    object tblMunicipalityCM_Code: TStringField
      FieldName = 'CM_Code'
      Visible = False
      Size = 50
    end
    object tblMunicipalityProv: TStringField
      FieldName = 'Prov'
      Visible = False
      Size = 255
    end
    object tblMunicipalityCM_Capital: TStringField
      FieldName = 'CM_Capital'
      Visible = False
      Size = 255
    end
    object tblMunicipalityCutoff: TStringField
      FieldName = 'Cutoff'
      Visible = False
      Size = 15
    end
    object tblMunicipalityLogoPath: TStringField
      FieldName = 'LogoPath'
      Visible = False
      Size = 100
    end
    object tblMunicipalityM_Code: TStringField
      FieldName = 'M_Code'
      Visible = False
      Size = 50
    end
    object tblMunicipalityCActive: TSmallintField
      FieldName = 'CActive'
      Visible = False
    end
  end
  object dstblMunicipality: TMyDataSource
    DataSet = tblMunicipality
    Left = 639
    Top = 400
  end
  object tblBarangay: TMyTable
    TableName = 'barangay'
    MasterFields = 'M_Code'
    DetailFields = 'M_Code'
    MasterSource = dstblMunicipality
    Connection = dbCon
    Left = 542
    Top = 448
    object tblBarangayDescription: TStringField
      DisplayWidth = 150
      FieldName = 'Description'
      Size = 150
    end
    object tblBarangayBCode: TStringField
      FieldName = 'BCode'
      Visible = False
      Size = 3
    end
    object tblBarangayDist_Code: TStringField
      FieldName = 'Dist_Code'
      Visible = False
      Size = 150
    end
    object tblBarangayM_Code: TStringField
      FieldName = 'M_Code'
      Visible = False
      Size = 50
    end
  end
  object dstblBarangay: TMyDataSource
    DataSet = tblBarangay
    Left = 639
    Top = 448
  end
  object qryPost: TMyQuery
    Connection = dbCon
    Left = 118
    Top = 56
  end
  object qryListofIG: TMyQuery
    Connection = dbCon
    SQL.Strings = (
      'SELECT'
      #9'itemsbygoods.goodstype_id,'
      #9'itemsbygoods.item_id,'
      #9'itemsbygoods.itemsbygoods_qty,'
      #9'unit.unit_description'
      'FROM'
      #9'itemsbygoods'
      'INNER JOIN item ON item.item_id = itemsbygoods.item_id'
      'INNER JOIN unit ON unit.unit_id = item.unit_id'
      'WHERE'
      #9'itemsbygoods.goodstype_id = :gt_id')
    Left = 63
    Top = 104
    ParamData = <
      item
        DataType = ftInteger
        Name = 'gt_id'
        Value = 0
      end>
    object qryListofIGgoodstype_id: TIntegerField
      FieldName = 'goodstype_id'
    end
    object qryListofIGitem_id: TStringField
      FieldName = 'item_id'
    end
    object qryListofIGitemsbygoods_qty: TIntegerField
      FieldName = 'itemsbygoods_qty'
    end
    object qryListofIGunit_description: TStringField
      FieldName = 'unit_description'
      Size = 50
    end
  end
  object tblSAI_Det: TMyTable
    TableName = 'sai_det'
    Connection = dbCon
    Left = 542
    Top = 352
    object tblSAI_Detsai_id: TStringField
      FieldName = 'sai_id'
    end
    object tblSAI_Detgoodstype_id: TIntegerField
      FieldName = 'goodstype_id'
    end
    object tblSAI_Detitem_id: TStringField
      FieldName = 'item_id'
    end
    object tblSAI_Detunit_w: TIntegerField
      FieldName = 'unit_w'
    end
    object tblSAI_Detunit_r: TIntegerField
      FieldName = 'unit_r'
    end
    object tblSAI_Dettotal_quantity: TIntegerField
      FieldName = 'total_quantity'
    end
  end
  object dstblSAI_Det: TMyDataSource
    DataSet = tblSAI_Det
    Left = 639
    Top = 352
  end
  object tblTempSAIDet: TMyTable
    TableName = 'temp_sai_det'
    Connection = dbCon
    Left = 738
    Top = 8
    object tblTempSAIDetsai_id: TStringField
      FieldName = 'sai_id'
    end
    object tblTempSAIDetgoodstype_id: TIntegerField
      FieldName = 'goodstype_id'
    end
    object tblTempSAIDetitem_id: TStringField
      FieldName = 'item_id'
    end
    object tblTempSAIDetunit_w: TIntegerField
      FieldName = 'unit_w'
    end
    object tblTempSAIDetunit_r: TIntegerField
      FieldName = 'unit_r'
    end
    object tblTempSAIDettotal_quantity: TIntegerField
      FieldName = 'total_quantity'
    end
  end
  object dsTempSAIDet: TMyDataSource
    DataSet = tblTempSAIDet
    Left = 828
    Top = 8
  end
  object qryListofSAIDet: TMyQuery
    Connection = dbCon
    SQL.Strings = (
      'SELECT'
      #9'temp_sai_det.item_id,'
      
        #9'CONCAT(item.item_description,'#39' '#39',brand.brand_description,'#39' '#39',si' +
        'ze.size_description,'#39' '#39',unit.unit_description) AS `items_descrip' +
        'tion`,'
      #9'unit.unit_description,'
      #9'temp_sai_det.unit_w,'
      #9'temp_sai_det.unit_r,'
      #9'temp_sai_det.total_quantity'
      'FROM'
      #9'temp_sai_det'
      'LEFT JOIN item ON item.item_id = temp_sai_det.item_id'
      'LEFT JOIN brand ON brand.brand_id = item.brand_id'
      'LEFT JOIN size ON size.size_id = item.size_id'
      'LEFT JOIN unit ON unit.unit_id = item.unit_id')
    OnCalcFields = qryListofSAIDetCalcFields
    Left = 544
    Top = 8
    object qryListofSAIDetitem_id: TStringField
      DisplayLabel = 'Item ID'
      DisplayWidth = 20
      FieldName = 'item_id'
      Origin = 'temp_sai_det.item_id'
    end
    object qryListofSAIDetitems_description: TStringField
      DisplayLabel = 'Item Description'
      DisplayWidth = 59
      FieldName = 'items_description'
      Origin = 'items_description'
      Size = 203
    end
    object qryListofSAIDetqty_whole: TStringField
      DisplayLabel = 'Whole'
      DisplayWidth = 15
      FieldKind = fkCalculated
      FieldName = 'qty_whole'
      Calculated = True
    end
    object qryListofSAIDetqty_remain: TStringField
      DisplayLabel = 'Additional'
      DisplayWidth = 15
      FieldKind = fkCalculated
      FieldName = 'qty_remain'
      Calculated = True
    end
    object qryListofSAIDettotal_quantity: TIntegerField
      DisplayLabel = 'Total'
      DisplayWidth = 14
      FieldName = 'total_quantity'
      Origin = 'temp_sai_det.total_quantity'
      DisplayFormat = '#,###,###'
    end
    object qryListofSAIDetunit_w: TIntegerField
      DisplayLabel = 'Quantity per Unit'
      DisplayWidth = 12
      FieldName = 'unit_w'
      Origin = 'temp_sai_det.unit_w'
      Visible = False
      DisplayFormat = '#,###,###'
    end
    object qryListofSAIDetunit_r: TIntegerField
      DisplayLabel = 'Additional'
      DisplayWidth = 12
      FieldName = 'unit_r'
      Origin = 'temp_sai_det.unit_r'
      Visible = False
      DisplayFormat = '#,###,###'
    end
    object qryListofSAIDetunit_description: TStringField
      DisplayWidth = 50
      FieldName = 'unit_description'
      Origin = 'unit.unit_description'
      Visible = False
      Size = 50
    end
  end
  object dsqryListofSAIDet: TMyDataSource
    DataSet = qryListofSAIDet
    Left = 639
    Top = 8
  end
  object qryAGT: TMyQuery
    Connection = dbCon
    SQL.Strings = (
      'SELECT'
      #9'goodstype.goodstype_description,'
      #9'itemsbygoods.goodstype_id'
      'FROM'
      #9'itemsbygoods'
      
        'INNER JOIN goodstype ON itemsbygoods.goodstype_id = goodstype.go' +
        'odstype_id'
      'GROUP BY'
      #9'itemsbygoods.goodstype_id')
    Left = 542
    Top = 55
    object qryAGTgoodstype_description: TStringField
      DisplayWidth = 32
      FieldName = 'goodstype_description'
      Size = 30
    end
    object qryAGTgoodstype_id: TIntegerField
      FieldName = 'goodstype_id'
      Visible = False
    end
  end
  object dsqryAGT: TMyDataSource
    DataSet = qryAGT
    Left = 639
    Top = 55
  end
  object qryListofSAIs: TMyQuery
    Connection = dbCon
    SQL.Strings = (
      'SELECT'
      #9'sai.sai_id,'
      #9'sai.sai_datetime,'
      #9'goodstype.goodstype_description,'
      #9'sai.sai_qty,'
      
        #9'CONCAT(IFNULL(CONCAT((SELECT barangay.Description FROM barangay' +
        ' WHERE barangay.M_Code = sai.m_code AND barangay.BCode = sai.bco' +
        'de),'#39', '#39'),""),municity.Description) AS `sai_location`,'
      #9'CASE'
      #9#9'WHEN sai.sai_status = 0 THEN '#39'No'#39
      #9#9'WHEN sai.sai_status = 1 THEN '#39'Yes'#39
      #9'END AS `sai_issued`,'
      #9'sai.sai_cancelled'
      'FROM'
      #9'sai'
      
        'INNER JOIN goodstype ON goodstype.goodstype_id = sai.goodstype_i' +
        'd'
      'INNER JOIN municity ON municity.M_Code = sai.m_code'
      'ORDER BY'
      #9'sai.sai_id')
    Left = 542
    Top = 104
    object qryListofSAIssai_id: TStringField
      DisplayLabel = 'ID'
      DisplayWidth = 20
      FieldName = 'sai_id'
      Origin = 'sai.sai_id'
    end
    object qryListofSAIssai_datetime: TDateTimeField
      DisplayLabel = 'Date/Time'
      DisplayWidth = 19
      FieldName = 'sai_datetime'
      Origin = 'sai.sai_datetime'
    end
    object qryListofSAIsgoodstype_description: TStringField
      DisplayLabel = 'Type of Goods'
      DisplayWidth = 20
      FieldName = 'goodstype_description'
      Origin = 'goodstype.goodstype_description'
      Size = 30
    end
    object qryListofSAIssai_qty: TIntegerField
      DisplayLabel = 'Quantity'
      DisplayWidth = 10
      FieldName = 'sai_qty'
      Origin = 'sai.sai_qty'
    end
    object qryListofSAIssai_location: TStringField
      DisplayLabel = 'Location'
      DisplayWidth = 35
      FieldName = 'sai_location'
      Origin = 'sai_location'
      Size = 407
    end
    object qryListofSAIssai_issued: TStringField
      DisplayLabel = 'Issued?'
      DisplayWidth = 10
      FieldName = 'sai_issued'
      Origin = 'sai_issued'
      Size = 3
    end
    object qryListofSAIssai_cancelled: TSmallintField
      DisplayLabel = 'Cancel?'
      DisplayWidth = 10
      FieldName = 'sai_cancelled'
      Origin = 'sai.sai_cancelled'
    end
  end
  object dsqryListofSAIs: TMyDataSource
    DataSet = qryListofSAIs
    Left = 639
    Top = 104
  end
  object qryASAIs: TMyQuery
    Connection = dbCon
    SQL.Strings = (
      'SELECT'
      #9'sai.sai_id,'
      #9'sai.sai_datetime,'
      #9'sai.goodstype_id,'
      #9'goodstype.goodstype_description,'
      #9'sai.sai_qty,'
      #9'municity.Description,'
      
        #9'(SELECT barangay.Description FROM barangay WHERE barangay.M_Cod' +
        'e = sai.m_code AND barangay.BCode = sai.bcode) AS `sai_brgy`,'
      #9'sai.sai_status,'
      #9'sai.sai_cancelled'
      'FROM'
      #9'sai'
      
        'INNER JOIN goodstype ON goodstype.goodstype_id = sai.goodstype_i' +
        'd'
      'INNER JOIN municity ON municity.M_Code = sai.m_code'
      'WHERE'
      #9'sai.sai_status = 0 AND sai.sai_cancelled = 0'
      'ORDER BY'
      #9'sai.sai_id')
    Left = 542
    Top = 151
    object qryASAIssai_id: TStringField
      FieldName = 'sai_id'
    end
    object qryASAIssai_datetime: TDateTimeField
      FieldName = 'sai_datetime'
    end
    object qryASAIsgoodstype_id: TIntegerField
      FieldName = 'goodstype_id'
    end
    object qryASAIsgoodstype_description: TStringField
      FieldName = 'goodstype_description'
      Size = 30
    end
    object qryASAIssai_qty: TIntegerField
      FieldName = 'sai_qty'
    end
    object qryASAIsDescription: TStringField
      FieldName = 'Description'
      Size = 255
    end
    object qryASAIssai_brgy: TStringField
      FieldName = 'sai_brgy'
      Size = 150
    end
    object qryASAIssai_status: TSmallintField
      FieldName = 'sai_status'
    end
    object qryASAIssai_cancelled: TSmallintField
      FieldName = 'sai_cancelled'
    end
  end
  object dsqryASAIs: TMyDataSource
    DataSet = qryASAIs
    Left = 639
    Top = 151
  end
  object tblRIS: TMyTable
    TableName = 'ris'
    Connection = dbCon
    Left = 542
    Top = 496
    object tblRISris_id: TStringField
      FieldName = 'ris_id'
    end
    object tblRISris_date: TDateTimeField
      FieldName = 'ris_date'
    end
    object tblRISsai_id: TStringField
      FieldName = 'sai_id'
    end
    object tblRISsai_date: TDateTimeField
      FieldName = 'sai_date'
    end
    object tblRISgoodstype_id: TIntegerField
      FieldName = 'goodstype_id'
    end
    object tblRISris_qty: TIntegerField
      FieldName = 'ris_qty'
    end
    object tblRISUserID: TIntegerField
      FieldName = 'UserID'
    end
    object tblRISTransDate: TDateTimeField
      FieldName = 'TransDate'
    end
  end
  object dstblRIS: TMyDataSource
    DataSet = tblRIS
    Left = 639
    Top = 496
  end
  object tblRIS_Det: TMyTable
    TableName = 'ris_det'
    Connection = dbCon
    Left = 542
    Top = 543
    object tblRIS_Detris_id: TStringField
      FieldName = 'ris_id'
    end
    object tblRIS_Detgoodstype_id: TIntegerField
      FieldName = 'goodstype_id'
    end
    object tblRIS_Detitem_id: TStringField
      FieldName = 'item_id'
    end
    object tblRIS_Dettotal_quantity: TIntegerField
      FieldName = 'total_quantity'
    end
    object tblRIS_Detunit_cost: TFloatField
      FieldName = 'unit_cost'
    end
  end
  object dstblRIS_Det: TMyDataSource
    DataSet = tblRIS_Det
    Left = 639
    Top = 543
  end
  object tblTempRISDet: TMyTable
    TableName = 'temp_ris_det'
    Connection = dbCon
    Left = 738
    Top = 55
    object tblTempRISDetris_id: TStringField
      FieldName = 'ris_id'
    end
    object tblTempRISDetgoodstype_id: TIntegerField
      FieldName = 'goodstype_id'
    end
    object tblTempRISDetitem_id: TStringField
      FieldName = 'item_id'
    end
    object tblTempRISDettotal_quantity: TIntegerField
      FieldName = 'total_quantity'
    end
    object tblTempRISDetunit_cost: TFloatField
      FieldName = 'unit_cost'
    end
    object tblTempRISDetamount: TFloatField
      FieldName = 'amount'
    end
  end
  object dstblTempRISDet: TMyDataSource
    DataSet = tblTempRISDet
    Left = 828
    Top = 55
  end
  object qryListOfPosition: TMyQuery
    Connection = dbCon
    SQL.Strings = (
      'SELECT'
      #9'position.position_id,'
      #9'position.position_description'
      'FROM'
      #9'position'
      
        'INNER JOIN signatory ON position.position_id = signatory.positio' +
        'n_id'
      'GROUP BY'
      #9'position.position_id'
      'ORDER BY'
      #9'position.position_description')
    Left = 63
    Top = 151
    object qryListOfPositionposition_description: TStringField
      DisplayWidth = 80
      FieldName = 'position_description'
      Size = 80
    end
    object qryListOfPositionposition_id: TIntegerField
      FieldName = 'position_id'
      Visible = False
    end
  end
  object qryListOfSignatory: TMyQuery
    Connection = dbCon
    SQL.Strings = (
      'SELECT'
      'signatory.signatory_id,'
      'signatory.signatory_name,'
      'signatory.designation_id,'
      'signatory.position_id,'
      'designation.designation_name,'
      'signatory.UserID,'
      'signatory.TransDate'
      'FROM'
      #9'signatory'
      
        'INNER JOIN designation ON designation.designation_id = signatory' +
        '.designation_id'
      'WHERE'
      #9'signatory.position_id = :postID')
    BeforePost = qryListOfSignatoryBeforePost
    Left = 63
    Top = 199
    ParamData = <
      item
        DataType = ftInteger
        Name = 'postID'
        ParamType = ptInputOutput
        Value = 0
      end>
    object qryListOfSignatorysignatory_name: TStringField
      DisplayLabel = 'Name'
      DisplayWidth = 40
      FieldName = 'signatory_name'
      Origin = 'signatory.signatory_name'
      Size = 80
    end
    object qryListOfSignatorydesignation_name: TStringField
      DisplayLabel = 'Designation'
      DisplayWidth = 60
      FieldName = 'designation_name'
      Origin = 'designation.designation_name'
      Size = 100
    end
    object qryListOfSignatorysignatory_id: TIntegerField
      AutoGenerateValue = arAutoInc
      DisplayWidth = 10
      FieldName = 'signatory_id'
      Origin = 'signatory.signatory_id'
      Visible = False
    end
    object qryListOfSignatorydesignation_id: TIntegerField
      DisplayWidth = 10
      FieldName = 'designation_id'
      Origin = 'signatory.designation_id'
      Visible = False
    end
    object qryListOfSignatoryposition_id: TIntegerField
      DisplayWidth = 10
      FieldName = 'position_id'
      Origin = 'signatory.position_id'
      Visible = False
    end
    object qryListOfSignatoryUserID: TIntegerField
      FieldName = 'UserID'
      Origin = 'signatory.UserID'
      Visible = False
    end
    object qryListOfSignatoryTransDate: TDateTimeField
      FieldName = 'TransDate'
      Origin = 'signatory.TransDate'
      Visible = False
    end
  end
  object strdprcListOfSAI: TMyStoredProc
    StoredProcName = 'spListOfSAI'
    Connection = dbCon
    SQL.Strings = (
      'CALL spListOfSAI(:`ConditionStatement`)')
    Left = 738
    Top = 151
    ParamData = <
      item
        DataType = ftString
        Name = '`ConditionStatement`'
        ParamType = ptInput
        Value = ''
      end>
    CommandStoredProcName = 'spListOfSAI'
  end
  object dsspListOfSAI: TMyDataSource
    DataSet = strdprcListOfSAI
    Left = 828
    Top = 151
  end
  object qryListOfSAI: TMyQuery
    Connection = dbCon
    SQL.Strings = (
      'SELECT'
      #9'`sai`.`sai_id`,'
      #9'`sai`.`sai_datetime`,'
      #9'`goodstype`.`goodstype_description`,'
      #9'`sai`.`sai_qty`,'
      #9'`municity`.`Description` AS `mun`,'
      
        #9'(SELECT `barangay`.`Description` FROM `barangay` WHERE `baranga' +
        'y`.`M_Code` = `sai`.`m_code` AND `barangay`.`BCode` = `sai`.`bco' +
        'de`) AS `brgy`,'
      #9'`sai_det`.`item_id`,'
      
        #9'CONCAT(`item`.`item_description`," ",IFNULL(`brand`.`brand_desc' +
        'ription`,"")," ",IFNULL(`size`.`size_description`,"")," ",IFNULL' +
        '(`unit`.`unit_description`,"")) AS `item_descriptions`,'
      #9'`sai_det`.`unit_w`,'
      #9'`sai_det`.`unit_r`,'
      #9'`sai_det`.`total_quantity`,'
      
        #9'IF(`sai`.`is_emergency` = 0,"",CONCAT("Emergency : "," ",`sai`.' +
        '`emergency_reason`)) AS `sai_emergency`,'
      
        #9'(SELECT CONCAT(`position`.`position_description`," :") FROM `si' +
        'gnatory` INNER JOIN `position` ON `position`.`position_id` = `si' +
        'gnatory`.`position_id` WHERE `signatory`.`signatory_id` = `sai`.' +
        '`p_signatory_id`) AS `p_position`,'
      
        #9'(SELECT `signatory`.`signatory_name` FROM `signatory` WHERE `si' +
        'gnatory`.`signatory_id` = `sai`.`p_signatory_id`) AS `p_signator' +
        'y`,'
      
        #9'(SELECT `designation`.`designation_name` FROM `signatory` INNER' +
        ' JOIN `designation` ON `designation`.`designation_id` = `signato' +
        'ry`.`designation_id` WHERE `signatory`.`signatory_id` = `sai`.`p' +
        '_signatory_id`) AS `p_designation`,'
      
        #9'(SELECT CONCAT(`position`.`position_description`," :") FROM `si' +
        'gnatory` INNER JOIN `position` ON `position`.`position_id` = `si' +
        'gnatory`.`position_id` WHERE `signatory`.`signatory_id` = `sai`.' +
        '`c_signatory_id`) AS `c_position`,'
      
        #9'(SELECT `signatory`.`signatory_name` FROM `signatory` WHERE `si' +
        'gnatory`.`signatory_id` = `sai`.`c_signatory_id`) AS `c_signator' +
        'y`,'
      
        #9'(SELECT `designation`.`designation_name` FROM `signatory` INNER' +
        ' JOIN `designation` ON `designation`.`designation_id` = `signato' +
        'ry`.`designation_id` WHERE `signatory`.`signatory_id` = `sai`.`c' +
        '_signatory_id`) AS `c_designation`,'
      
        #9'(SELECT CONCAT(`position`.`position_description`," :") FROM `si' +
        'gnatory` INNER JOIN `position` ON `position`.`position_id` = `si' +
        'gnatory`.`position_id` WHERE `signatory`.`signatory_id` = `sai`.' +
        '`a_signatory_id`) AS `a_position`,'
      
        #9'(SELECT `signatory`.`signatory_name` FROM `signatory` WHERE `si' +
        'gnatory`.`signatory_id` = `sai`.`a_signatory_id`) AS `a_signator' +
        'y`,'
      
        #9'(SELECT `designation`.`designation_name` FROM `signatory` INNER' +
        ' JOIN `designation` ON `designation`.`designation_id` = `signato' +
        'ry`.`designation_id` WHERE `signatory`.`signatory_id` = `sai`.`a' +
        '_signatory_id`) AS `a_designation`,'
      #9'CASE'
      
        #9#9'WHEN `sai`.`sai_status` = 0 AND `sai`.`sai_cancelled` = 0 THEN' +
        ' "Not Yet Issued"'
      
        #9#9'WHEN `sai`.`sai_status` = 1 AND `sai`.`sai_cancelled` = 0 THEN' +
        ' CONCAT("Issued with RIS ID : ",(SELECT `ris`.`ris_id` FROM `ris' +
        '` WHERE `ris`.`sai_id` = `sai`.`sai_id`))'
      
        #9#9'WHEN `sai`.`sai_status` = 0 AND `sai`.`sai_cancelled` = 1 THEN' +
        ' "Cancelled"'
      #9'END AS `sai_issued`,'
      
        #9'(SELECT `userbindary`.`UserName` FROM `userbindary` WHERE `user' +
        'bindary`.`UserID` = `sai`.`UserID`) AS `user_name`'
      'FROM'
      #9'`sai`'
      
        'INNER JOIN `goodstype` ON `goodstype`.`goodstype_id` = `sai`.`go' +
        'odstype_id`'
      'INNER JOIN `municity` ON `municity`.`M_Code` = `sai`.`m_code`'
      
        'INNER JOIN `barangay` ON `barangay`.`BCode` = `sai`.`bcode` AND ' +
        '`barangay`.`M_Code` = `sai`.`m_code`'
      'INNER JOIN `sai_det` ON `sai_det`.`sai_id` = `sai`.`sai_id`'
      'INNER JOIN `item` ON `item`.`item_id` = `sai_det`.`item_id`'
      'LEFT JOIN `brand` ON `brand`.`brand_id` = `item`.`brand_id`'
      'LEFT JOIN `size` ON `size`.`size_id` = `item`.`size_id`'
      'LEFT JOIN `unit` ON `unit`.`unit_id` = `item`.`unit_id`')
    Left = 738
    Top = 199
  end
  object qryListOfRIS: TMyQuery
    Connection = dbCon
    SQL.Strings = (
      'SELECT'
      #9'`ris`.`ris_id`,'
      #9'`ris`.`ris_date`,'
      #9'`ris`.`sai_id`,'
      #9'`ris`.`sai_date`,'
      #9'`goodstype`.`goodstype_description`,'
      #9'`ris`.`ris_qty` AS `request_qty`,'
      #9'`municity`.`Description` AS `mun`,'
      
        #9'(SELECT `barangay`.`Description` FROM `barangay` WHERE `baranga' +
        'y`.`M_Code` = `sai`.`m_code` AND `barangay`.`BCode` = `sai`.`bco' +
        'de`) AS `brgy`,'
      #9'`ris_det`.`item_id`,'
      
        #9'CONCAT(`item`.`item_description`," ",IFNULL(`brand`.`brand_desc' +
        'ription`,"")," ",IFNULL(`size`.`size_description`,"")," ",IFNULL' +
        '(`unit`.`unit_description`,"")) AS `item_descriptions`,'
      #9'`sai_det`.`unit_w`,'
      #9'`sai_det`.`unit_r`,'
      #9'`sai_det`.`total_quantity` AS `sai_qty`,'
      #9'`ris_det`.`total_quantity` AS `ris_qty`,'
      #9'`ris_det`.`unit_cost`,'
      #9'`ris_det`.`amount`,'
      
        #9'IF(`sai`.`is_emergency` = 0,"",CONCAT("Emergency : "," ",`sai`.' +
        '`emergency_reason`)) AS `sai_emergency`,'
      
        #9'(SELECT CONCAT(`position`.`position_description`," :") FROM `si' +
        'gnatory` INNER JOIN `position` ON `position`.`position_id` = `si' +
        'gnatory`.`position_id` WHERE `signatory`.`signatory_id` = `ris`.' +
        '`r_signatory_id`) AS `r_position`,'
      
        #9'(SELECT `signatory`.`signatory_name` FROM `signatory` WHERE `si' +
        'gnatory`.`signatory_id` = `ris`.`r_signatory_id`) AS `r_signator' +
        'y`,'
      
        #9'(SELECT `designation`.`designation_name` FROM `signatory` INNER' +
        ' JOIN `designation` ON `designation`.`designation_id` = `signato' +
        'ry`.`designation_id` WHERE `signatory`.`signatory_id` = `ris`.`r' +
        '_signatory_id`) AS `r_designation`,'
      
        #9'(SELECT CONCAT(`position`.`position_description`," :") FROM `si' +
        'gnatory` INNER JOIN `position` ON `position`.`position_id` = `si' +
        'gnatory`.`position_id` WHERE `signatory`.`signatory_id` = `ris`.' +
        '`e_signatory_id`) AS `e_position`,'
      
        #9'(SELECT `signatory`.`signatory_name` FROM `signatory` WHERE `si' +
        'gnatory`.`signatory_id` = `ris`.`e_signatory_id`) AS `e_signator' +
        'y`,'
      
        #9'(SELECT `designation`.`designation_name` FROM `signatory` INNER' +
        ' JOIN `designation` ON `designation`.`designation_id` = `signato' +
        'ry`.`designation_id` WHERE `signatory`.`signatory_id` = `ris`.`e' +
        '_signatory_id`) AS `e_designation`,'
      
        #9'(SELECT CONCAT(`position`.`position_description`," :") FROM `si' +
        'gnatory` INNER JOIN `position` ON `position`.`position_id` = `si' +
        'gnatory`.`position_id` WHERE `signatory`.`signatory_id` = `ris`.' +
        '`na_signatory_id`) AS `na_position`,'
      
        #9'(SELECT `signatory`.`signatory_name` FROM `signatory` WHERE `si' +
        'gnatory`.`signatory_id` = `ris`.`na_signatory_id`) AS `na_signat' +
        'ory`,'
      
        #9'(SELECT `designation`.`designation_name` FROM `signatory` INNER' +
        ' JOIN `designation` ON `designation`.`designation_id` = `signato' +
        'ry`.`designation_id` WHERE `signatory`.`signatory_id` = `ris`.`n' +
        'a_signatory_id`) AS `na_designation`,'
      
        #9'(SELECT CONCAT(`position`.`position_description`," :") FROM `si' +
        'gnatory` INNER JOIN `position` ON `position`.`position_id` = `si' +
        'gnatory`.`position_id` WHERE `signatory`.`signatory_id` = `ris`.' +
        '`ie_signatory_id`) AS `ie_position`,'
      
        #9'(SELECT `signatory`.`signatory_name` FROM `signatory` WHERE `si' +
        'gnatory`.`signatory_id` = `ris`.`ie_signatory_id`) AS `ie_signat' +
        'ory`,'
      
        #9'(SELECT `designation`.`designation_name` FROM `signatory` INNER' +
        ' JOIN `designation` ON `designation`.`designation_id` = `signato' +
        'ry`.`designation_id` WHERE `signatory`.`signatory_id` = `ris`.`i' +
        'e_signatory_id`) AS `ie_designation`,'
      
        #9'(SELECT CONCAT(`position`.`position_description`," :") FROM `si' +
        'gnatory` INNER JOIN `position` ON `position`.`position_id` = `si' +
        'gnatory`.`position_id` WHERE `signatory`.`signatory_id` = `ris`.' +
        '`ici_signatory_id`) AS `ici_position`,'
      
        #9'(SELECT `signatory`.`signatory_name` FROM `signatory` WHERE `si' +
        'gnatory`.`signatory_id` = `ris`.`ici_signatory_id`) AS `ici_sign' +
        'atory`,'
      
        #9'(SELECT `designation`.`designation_name` FROM `signatory` INNER' +
        ' JOIN `designation` ON `designation`.`designation_id` = `signato' +
        'ry`.`designation_id` WHERE `signatory`.`signatory_id` = `ris`.`i' +
        'ci_signatory_id`) AS `ici_designation`,'
      
        #9'(SELECT CONCAT(`position`.`position_description`," :") FROM `si' +
        'gnatory` INNER JOIN `position` ON `position`.`position_id` = `si' +
        'gnatory`.`position_id` WHERE `signatory`.`signatory_id` = `ris`.' +
        '`a_signatory_id`) AS `a_position`,'
      
        #9'(SELECT `signatory`.`signatory_name` FROM `signatory` WHERE `si' +
        'gnatory`.`signatory_id` = `ris`.`a_signatory_id`) AS `a_signator' +
        'y`,'
      
        #9'(SELECT `designation`.`designation_name` FROM `signatory` INNER' +
        ' JOIN `designation` ON `designation`.`designation_id` = `signato' +
        'ry`.`designation_id` WHERE `signatory`.`signatory_id` = `ris`.`a' +
        '_signatory_id`) AS `a_designation`,'
      
        #9'(SELECT `userbindary`.`UserName` FROM `userbindary` WHERE `user' +
        'bindary`.`UserID` = `sai`.`UserID`) AS `user_name`'
      'FROM'
      #9'`ris`'
      
        'INNER JOIN `goodstype` ON `goodstype`.`goodstype_id` = `ris`.`go' +
        'odstype_id`'
      'INNER JOIN `sai` ON `sai`.`sai_id` = `ris`.`sai_id`'
      'INNER JOIN `municity` ON `municity`.`M_Code` = `sai`.`m_code`'
      
        'INNER JOIN `barangay` ON `barangay`.`M_Code` = `sai`.`m_code` AN' +
        'D `barangay`.`BCode` = `sai`.`bcode`'
      'INNER JOIN `ris_det` ON `ris_det`.`ris_id` = `ris`.`ris_id`'
      'INNER JOIN `item` ON `item`.`item_id` = `ris_det`.`item_id`'
      'LEFT JOIN `brand` ON `brand`.`brand_id` = `item`.`brand_id`'
      'LEFT JOIN `size` ON `size`.`size_id` = `item`.`size_id`'
      'LEFT JOIN `unit` ON `unit`.`unit_id` = `item`.`unit_id`'
      
        'INNER JOIN `sai_det` ON `sai_det`.`sai_id` = `ris`.`sai_id` AND ' +
        '`sai_det`.`item_id` = `ris_det`.`item_id`')
    Left = 738
    Top = 304
  end
  object dsspListOfRIS: TMyDataSource
    DataSet = strdprcListOfRIS
    Left = 828
    Top = 256
  end
  object strdprcListOfRIS: TMyStoredProc
    StoredProcName = 'spListOfRIS'
    Connection = dbCon
    SQL.Strings = (
      'CALL spListOfRIS(:`ConditionStatement`)')
    Left = 738
    Top = 256
    ParamData = <
      item
        DataType = ftString
        Name = '`ConditionStatement`'
        ParamType = ptInput
        Value = ''
      end>
    CommandStoredProcName = 'spListOfRIS'
  end
  object dsqryListOfSignatory: TMyDataSource
    DataSet = qryListOfSignatory
    Left = 210
    Top = 199
  end
  object dsUnit: TMyDataSource
    AutoEdit = False
    DataSet = tblUnit
    Left = 1217
    Top = 199
  end
  object QryCheckRecID: TMyQuery
    Connection = dbCon
    SQL.Strings = (
      'SELECT'
      'irec.recID'
      'FROM'
      'irec'
      'WHERE'
      'irec.recID like :CurrRec')
    Left = 997
    Top = 151
    ParamData = <
      item
        DataType = ftString
        Name = 'CurrRec'
        ParamType = ptInputOutput
      end>
  end
  object QryItems: TMyQuery
    Connection = dbCon
    SQL.Strings = (
      'SELECT'
      'item.item_description,'
      'item.item_id,'
      'item.UserID,'
      'item.TransDate,'
      'size.size_description,'
      'brand.brand_description,'
      'item.unit_id'
      'FROM'
      'item'
      'INNER JOIN size ON item.size_id = size.size_id'
      'INNER JOIN brand ON item.brand_id = brand.brand_id')
    Left = 999
    Top = 256
    object dbQryItemsitem_id: TStringField
      DisplayWidth = 10
      FieldName = 'item_id'
    end
    object dbQryItemsitem_description: TStringField
      DisplayWidth = 25
      FieldName = 'item_description'
      Size = 50
    end
    object dbQryItemsbrand_description: TStringField
      DisplayWidth = 15
      FieldName = 'brand_description'
      Visible = False
      Size = 50
    end
    object dbQryItemssize_description: TStringField
      DisplayWidth = 5
      FieldName = 'size_description'
      Visible = False
      Size = 50
    end
    object dbQryItemsUserID: TIntegerField
      FieldName = 'UserID'
      Visible = False
    end
    object dbQryItemsTransDate: TDateTimeField
      FieldName = 'TransDate'
      Visible = False
    end
    object dbQryItemsunit_id: TIntegerField
      FieldName = 'unit_id'
    end
  end
  object QryReciHist: TMyQuery
    Connection = dbCon
    SQL.Strings = (
      'SELECT'
      'ihist.item_id,'
      'ihist.trans_type,'
      'ihist.ref_id,'
      'ihist.trans_date,'
      'ihist.qty,'
      'ihist.UserID,'
      'ihist.TransDate'
      'FROM'
      'ihist')
    Left = 998
    Top = 199
  end
  object tblBalance: TMyTable
    TableName = 'ibalance'
    Connection = dbCon
    Left = 1217
    Top = 151
    object dbBalanceitem_id: TStringField
      FieldName = 'item_id'
      Size = 11
    end
    object dbBalanceUserID: TIntegerField
      FieldName = 'UserID'
    end
    object dbBalanceTransDate: TDateTimeField
      FieldName = 'TransDate'
    end
    object dbBalanceqty_onhand: TIntegerField
      FieldName = 'qty_onhand'
    end
  end
  object QryQuery: TMyQuery
    Connection = dbCon
    Left = 998
    Top = 304
  end
  object QryMunicity: TMyQuery
    Connection = dbCon
    SQL.Strings = (
      'SELECT'
      'municity.Description,'
      'municity.M_Code'
      'FROM'
      'municity')
    Left = 1113
    Top = 151
    object dbQryMunicityDescription: TStringField
      FieldName = 'Description'
      Size = 255
    end
    object dbQryMunicityM_Code: TStringField
      FieldName = 'M_Code'
      Size = 3
    end
  end
  object QryBarangay: TMyQuery
    Connection = dbCon
    SQL.Strings = (
      'SELECT'
      'barangay.BCode,'
      'barangay.Description,'
      'barangay.M_Code'
      'FROM'
      'barangay'
      'WHERE barangay.M_Code = :currMCode')
    Left = 1113
    Top = 199
    ParamData = <
      item
        DataType = ftString
        Name = 'currMCode'
        ParamType = ptInputOutput
      end>
    object dbQryBarangayBCode: TStringField
      FieldName = 'BCode'
      Size = 3
    end
    object dbQryBarangayDescription: TStringField
      FieldName = 'Description'
      Size = 150
    end
    object dbQryBarangayM_Code: TStringField
      FieldName = 'M_Code'
      Size = 50
    end
  end
  object QryRecDetLoc: TMyQuery
    Connection = dbCon
    SQL.Strings = (
      'SELECT'
      'irecdet.recID,'
      'irecdet.item_id'
      'FROM'
      'irecdet')
    Left = 998
    Top = 352
  end
  object QryRecBalance: TMyQuery
    Connection = dbCon
    SQL.Strings = (
      'SELECT'
      'irecdet.recID,'
      'irecdet.item_id,'
      'irecdet.qty_onhand,'
      'irecdet.unit_id'
      'FROM'
      'irecdet'
      'WHERE'
      'irecdet.recID = :currID')
    Left = 1113
    Top = 352
    ParamData = <
      item
        DataType = ftString
        Name = 'currID'
        ParamType = ptInputOutput
      end>
    object dbQryRecBalancerecID: TStringField
      FieldName = 'recID'
    end
    object dbQryRecBalanceitem_id: TStringField
      FieldName = 'item_id'
    end
    object dbQryRecBalanceqty_onhand: TFloatField
      FieldName = 'qty_onhand'
    end
    object dbQryRecBalanceunit_id: TIntegerField
      FieldName = 'unit_id'
    end
  end
  object QryRetDetLoc: TMyQuery
    Connection = dbCon
    SQL.Strings = (
      'SELECT'
      'iretdet.retID,'
      'iretdet.item_id'
      'FROM'
      'iretdet')
    Left = 998
    Top = 400
  end
  object QryRetBalance: TMyQuery
    Connection = dbCon
    SQL.Strings = (
      'SELECT'
      'iretdet.retID,'
      'iretdet.item_id,'
      'iretdet.qty_onhand,'
      'iretdet.unit_id'
      'FROM'
      'iretdet'
      'WHERE'
      'iretdet.retID = :currID')
    Left = 1113
    Top = 400
    ParamData = <
      item
        DataType = ftString
        Name = 'currID'
        ParamType = ptInputOutput
      end>
    object dbQryRetBalanceretID: TStringField
      FieldName = 'retID'
    end
    object dbQryRetBalanceitem_id: TStringField
      FieldName = 'item_id'
    end
    object dbQryRetBalanceqty_onhand: TFloatField
      FieldName = 'qty_onhand'
    end
    object dbQryRetBalanceunit_id: TIntegerField
      FieldName = 'unit_id'
    end
  end
  object QryAdjDetLoc: TMyQuery
    Connection = dbCon
    SQL.Strings = (
      'SELECT'
      'iadjdet.adjID,'
      'iadjdet.item_id'
      'FROM'
      'iadjdet')
    Left = 998
    Top = 448
  end
  object QryAdjBalance: TMyQuery
    Connection = dbCon
    SQL.Strings = (
      'SELECT'
      'iadjdet.adjID,'
      'iadjdet.item_id,'
      'iadjdet.qty_onhand,'
      'iadjdet.unit_id,'
      'iadjdet.adjustment_type'
      'FROM'
      'iadjdet'
      'WHERE'
      'iadjdet.adjID = :currID')
    Left = 1113
    Top = 448
    ParamData = <
      item
        DataType = ftString
        Name = 'currID'
        ParamType = ptInputOutput
      end>
    object dbQryAdjBalanceadjID: TStringField
      FieldName = 'adjID'
    end
    object dbQryAdjBalanceitem_id: TStringField
      FieldName = 'item_id'
    end
    object dbQryAdjBalanceqty_onhand: TFloatField
      FieldName = 'qty_onhand'
    end
    object dbQryAdjBalanceunit_id: TIntegerField
      FieldName = 'unit_id'
    end
    object dbQryAdjBalanceadjustment_type: TIntegerField
      FieldName = 'adjustment_type'
    end
  end
  object QrySignatory: TMyQuery
    Connection = dbCon
    SQL.Strings = (
      'SELECT'
      'signatory.signatory_id,'
      'signatory.signatory_name,'
      'signatory.position_id,'
      'signatory.UserID,'
      'signatory.TransDate'
      'FROM'
      'signatory'
      'WHERE'
      'signatory.position_id = :currPos')
    Left = 998
    Top = 496
    ParamData = <
      item
        DataType = ftInteger
        Name = 'currPos'
        ParamType = ptInputOutput
      end>
    object dbQrySignatorysignatory_id: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'signatory_id'
      Origin = 'signatory.signatory_id'
    end
    object dbQrySignatorysignatory_name: TStringField
      FieldName = 'signatory_name'
      Origin = 'signatory.signatory_name'
      Size = 80
    end
    object dbQrySignatoryposition_id: TIntegerField
      FieldName = 'position_id'
      Origin = 'signatory.position_id'
    end
    object dbQrySignatoryUserID: TIntegerField
      FieldName = 'UserID'
      Origin = 'signatory.UserID'
    end
    object dbQrySignatoryTransDate: TDateTimeField
      FieldName = 'TransDate'
      Origin = 'signatory.TransDate'
    end
  end
  object DSSignatory: TMyDataSource
    AutoEdit = False
    DataSet = QrySignatory
    Left = 1113
    Top = 496
  end
  object qryUpdate: TMyQuery
    Connection = dbCon
    Left = 229
    Top = 104
  end
  object qryInsert: TMyQuery
    Connection = dbCon
    Left = 173
    Top = 104
  end
  object qrySelect: TMyQuery
    Connection = dbCon
    Left = 118
    Top = 104
  end
  object dmpRIS: TMyDump
    TableNames = 'update_ris, update_ris_det'
    Connection = dbCon
    Objects = [doTables, doData]
    Options.GenerateHeader = False
    Options.CompleteInsert = True
    Left = 737
    Top = 519
  end
  object dmpSAI: TMyDump
    TableNames = 'update_sai, update_sai_det'
    Connection = dbCon
    Objects = [doTables, doData]
    Options.GenerateHeader = False
    Options.CompleteInsert = True
    Left = 828
    Top = 519
  end
  object qryRecipientList: TMyQuery
    Connection = dbCon
    SQL.Strings = (
      'SELECT'
      #9'ris.ris_date,'
      
        #9'CONCAT(IFNULL(CONCAT(barangay.Description,", "),""),IFNULL(muni' +
        'city.Description,"")) AS `DISTRIBUTION TO`,'
      
        #9'CONCAT(item.item_description,IFNULL(CONCAT(" ",unit.unit_descri' +
        'ption),""),IFNULL(CONCAT("(",size.size_description,")"),"")) AS ' +
        '`ITEMS`,'
      #9'SUM(ris.ris_qty) AS `No of Recipient`,'
      #9'SUM(ris_det.total_quantity) AS `Quantity Issued`'
      'FROM'
      #9'ris'
      'INNER JOIN ris_det ON ris_det.ris_id = ris.ris_id'
      'INNER JOIN sai ON sai.sai_id = ris.sai_id'
      
        'LEFT OUTER JOIN barangay ON barangay.M_Code = sai.m_code AND bar' +
        'angay.BCode = sai.bcode'
      'LEFT OUTER JOIN municity ON municity.M_Code = sai.m_code'
      'INNER JOIN item ON item.item_id = ris_det.item_id'
      'LEFT OUTER JOIN size ON size.size_id = item.size_id'
      'LEFT OUTER JOIN unit ON unit.unit_id = item.unit_id'
      'GROUP BY'
      
        #9'barangay.Description, municity.Description, item.item_descripti' +
        'on'
      'ORDER BY'
      #9'barangay.Description, municity.Description')
    Left = 997
    Top = 8
  end
  object dsqryRecipientList: TMyDataSource
    DataSet = qryRecipientList
    Left = 1113
    Top = 8
  end
  object tblDesignation: TMyTable
    TableName = 'designation'
    Connection = dbCon
    BeforePost = tblDesignationBeforePost
    Left = 337
    Top = 447
    object tblDesignationdesignation_name: TStringField
      DisplayLabel = 'Name'
      DisplayWidth = 50
      FieldName = 'designation_name'
      Origin = 'designation.designation_name'
      Size = 100
    end
    object tblDesignationdesignation_id: TIntegerField
      AutoGenerateValue = arAutoInc
      DisplayWidth = 10
      FieldName = 'designation_id'
      Origin = 'designation.designation_id'
      Visible = False
    end
    object tblDesignationUserID: TIntegerField
      DisplayWidth = 10
      FieldName = 'UserID'
      Origin = 'designation.UserID'
      Visible = False
    end
    object tblDesignationTransDate: TDateTimeField
      DisplayWidth = 18
      FieldName = 'TransDate'
      Origin = 'designation.TransDate'
      Visible = False
    end
  end
  object dstblDesignation: TMyDataSource
    DataSet = tblDesignation
    Left = 439
    Top = 447
  end
  object strdprcListOfBegBalance: TMyStoredProc
    StoredProcName = 'spListOfBegBalance'
    Connection = dbCon
    SQL.Strings = (
      'CALL spListOfBegBalance(:`ConditionStatement`)')
    Left = 738
    Top = 360
    ParamData = <
      item
        DataType = ftString
        Name = '`ConditionStatement`'
        ParamType = ptInput
        Size = 255
      end>
    CommandStoredProcName = 'spListOfBegBalance'
  end
  object dsspListOfBegBalance: TMyDataSource
    DataSet = qryListOfBegBalance
    Left = 866
    Top = 359
  end
  object qryListOfBegBalance: TMyQuery
    Connection = dbCon
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
      'LEFT OUTER JOIN unit ON unit.unit_id = item.unit_id')
    Left = 737
    Top = 420
    object qryListOfBegBalancecmonth: TIntegerField
      DisplayLabel = 'MONTH'
      DisplayWidth = 8
      FieldName = 'cmonth'
      Origin = 'beg_balance.cmonth'
      DisplayFormat = '0#'
      EditFormat = '0#'
      MaxValue = 12
      MinValue = 1
    end
    object qryListOfBegBalancecyear: TIntegerField
      DisplayLabel = 'YEAR'
      DisplayWidth = 10
      FieldName = 'cyear'
      Origin = 'beg_balance.cyear'
      DisplayFormat = '####'
      EditFormat = '####'
    end
    object qryListOfBegBalanceitem_id: TStringField
      DisplayLabel = 'ITEM ID'
      DisplayWidth = 20
      FieldName = 'item_id'
      Origin = 'item.item_id'
      ReadOnly = True
    end
    object qryListOfBegBalanceitem_descriptions: TStringField
      DisplayLabel = 'ITEM DESCRIPTION'
      DisplayWidth = 60
      FieldName = 'item_descriptions'
      Origin = 'item_descriptions'
      ReadOnly = True
      Size = 203
    end
    object qryListOfBegBalancebeg_qty: TIntegerField
      DisplayLabel = 'QUANTITY'
      DisplayWidth = 10
      FieldName = 'beg_qty'
      Origin = 'beg_balance.beg_qty'
      DisplayFormat = '##,###,##0.00'
      EditFormat = '##,###,##0.00'
    end
    object qryListOfBegBalancecactive: TSmallintField
      DisplayLabel = 'ACTIVE'
      DisplayWidth = 8
      FieldName = 'cactive'
      Origin = 'beg_balance.cactive'
    end
    object qryListOfBegBalanceunit_description: TStringField
      FieldName = 'unit_description'
      Origin = 'unit.unit_description'
      Visible = False
      Size = 50
    end
  end
  object DSSignatory2: TMyDataSource
    AutoEdit = False
    DataSet = QrySignatory2
    Left = 1288
    Top = 472
  end
  object DSPosition2: TMyDataSource
    AutoEdit = False
    DataSet = QryPosition2
    Left = 1288
    Top = 416
  end
  object QryPosition2: TMyQuery
    Connection = dbCon
    SQL.Strings = (
      'SELECT'
      'position.position_id,'
      'position.position_description'
      'FROM'
      'position')
    Left = 1213
    Top = 416
    object dbQryPosition2position_id: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'position_id'
      Origin = 'position.position_id'
    end
    object dbQryPosition2position_description: TStringField
      FieldName = 'position_description'
      Origin = 'position.position_description'
      Size = 80
    end
  end
  object QrySignatory2: TMyQuery
    Connection = dbCon
    SQL.Strings = (
      'SELECT'
      'signatory.signatory_id,'
      'signatory.signatory_name,'
      'signatory.position_id,'
      'signatory.UserID,'
      'signatory.TransDate'
      'FROM'
      'signatory')
    MasterSource = DSPosition2
    MasterFields = 'position_id'
    DetailFields = 'position_id'
    Left = 1213
    Top = 472
    ParamData = <
      item
        DataType = ftInteger
        Name = 'position_id'
        ParamType = ptInput
        Value = 1
      end>
    object dbQrySignatory2signatory_id: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'signatory_id'
      Origin = 'signatory.signatory_id'
    end
    object dbQrySignatory2signatory_name: TStringField
      FieldName = 'signatory_name'
      Origin = 'signatory.signatory_name'
      Size = 80
    end
    object dbQrySignatory2position_id: TIntegerField
      FieldName = 'position_id'
      Origin = 'signatory.position_id'
    end
    object dbQrySignatory2UserID: TIntegerField
      FieldName = 'UserID'
      Origin = 'signatory.UserID'
    end
    object dbQrySignatory2TransDate: TDateTimeField
      FieldName = 'TransDate'
      Origin = 'signatory.TransDate'
    end
  end
  object DSPosition1: TMyDataSource
    AutoEdit = False
    DataSet = QryPosition1
    Left = 1287
    Top = 296
  end
  object QryPosition1: TMyQuery
    Connection = dbCon
    SQL.Strings = (
      'SELECT'
      'position.position_id,'
      'position.position_description'
      'FROM'
      'position')
    Left = 1213
    Top = 296
    object dbQryPositionposition_id: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'position_id'
      Origin = 'position.position_id'
    end
    object dbQryPositionposition_description: TStringField
      FieldName = 'position_description'
      Origin = 'position.position_description'
      Size = 80
    end
  end
  object DSSignatory1: TMyDataSource
    AutoEdit = False
    DataSet = QrySignatory1
    Left = 1288
    Top = 352
  end
  object QrySignatory1: TMyQuery
    Connection = dbCon
    SQL.Strings = (
      'SELECT'
      'signatory.signatory_id,'
      'signatory.signatory_name,'
      'signatory.position_id,'
      'signatory.UserID,'
      'signatory.TransDate'
      'FROM'
      'signatory')
    MasterSource = DSPosition1
    MasterFields = 'position_id'
    DetailFields = 'position_id'
    Left = 1213
    Top = 352
    ParamData = <
      item
        DataType = ftInteger
        Name = 'position_id'
        ParamType = ptInput
        Value = 1
      end>
    object IntegerField1: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'signatory_id'
      Origin = 'signatory.signatory_id'
    end
    object StringField1: TStringField
      FieldName = 'signatory_name'
      Origin = 'signatory.signatory_name'
      Size = 80
    end
    object IntegerField2: TIntegerField
      FieldName = 'position_id'
      Origin = 'signatory.position_id'
    end
    object IntegerField3: TIntegerField
      FieldName = 'UserID'
      Origin = 'signatory.UserID'
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'TransDate'
      Origin = 'signatory.TransDate'
    end
  end
  object DSRisID: TMyDataSource
    AutoEdit = False
    DataSet = QryRisID
    Left = 1408
    Top = 320
  end
  object QryRisID: TMyQuery
    Connection = dbCon
    SQL.Strings = (
      'SELECT'
      'ris.ris_id,'
      'ris.ris_returned'
      'FROM'
      'ris'
      'WHERE '
      'ris.ris_returned <> 1')
    Left = 1352
    Top = 320
    object dbQryRisIDris_id: TStringField
      FieldName = 'ris_id'
      Origin = 'ris.ris_id'
    end
    object dbQryRisIDris_returned: TSmallintField
      FieldName = 'ris_returned'
      Origin = 'ris.ris_returned'
    end
  end
end
