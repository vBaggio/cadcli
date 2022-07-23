object dmVIACEP: TdmVIACEP
  OldCreateOrder = False
  Height = 74
  Width = 397
  object RESTClient: TRESTClient
    Params = <>
    Left = 32
    Top = 16
  end
  object RESTRequest: TRESTRequest
    AssignedValues = [rvConnectTimeout, rvReadTimeout]
    Client = RESTClient
    Params = <>
    Response = RESTResponse
    Left = 104
    Top = 16
  end
  object RESTResponse: TRESTResponse
    Left = 184
    Top = 16
  end
  object DataSetAdapter: TRESTResponseDataSetAdapter
    Dataset = mtbConsulta
    FieldDefs = <>
    Response = RESTResponse
    TypesMode = Rich
    Left = 264
    Top = 16
  end
  object mtbConsulta: TFDMemTable
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvUpdateChngFields, uvUpdateMode, uvLockMode, uvLockPoint, uvLockWait, uvRefreshMode, uvFetchGeneratorsPoint, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable]
    UpdateOptions.LockWait = True
    UpdateOptions.FetchGeneratorsPoint = gpNone
    UpdateOptions.CheckRequired = False
    StoreDefs = True
    Left = 336
    Top = 16
  end
end
