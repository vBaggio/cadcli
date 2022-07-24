object dtmGeral: TdtmGeral
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 73
  Width = 422
  object driverSQLite: TFDPhysSQLiteDriverLink
    Left = 25
    Top = 14
  end
  object lsqlMemory: TFDLocalSQL
    Connection = connMemory
    DataSets = <
      item
        DataSet = mtbClientes
        Name = 'Clientes'
      end
      item
        DataSet = mtbEnderecos
        Name = 'Enderecos'
      end
      item
        DataSet = mtbConfigEmail
        Name = 'ConfigEmail'
      end>
    Left = 156
    Top = 14
  end
  object connMemory: TFDConnection
    Params.Strings = (
      'LockingMode=Normal'
      'DriverID=SQLite')
    Connected = True
    LoginPrompt = False
    Left = 91
    Top = 14
  end
  object mtbClientes: TFDMemTable
    Active = True
    FieldDefs = <
      item
        Name = 'IdCliente'
        DataType = ftInteger
      end
      item
        Name = 'Nome'
        DataType = ftString
        Size = 120
      end
      item
        Name = 'Identidade'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CPF'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Telefone'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Email'
        DataType = ftString
        Size = 120
      end>
    IndexDefs = <>
    IndexFieldNames = 'IdCliente'
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvPersistent, rvSilentMode]
    ResourceOptions.Persistent = True
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 217
    Top = 14
    Content = {
      414442530F00000028030000FF00010001FF02FF030400160000006D00740062
      0043006C00690065006E0074006500730005000A0000005400610062006C0065
      00060000000000070000080032000000090000FF0AFF0B040012000000490064
      0043006C00690065006E00740065000500120000004900640043006C00690065
      006E00740065000C00010000000E000D000F0001100001110001120001130001
      1400011500120000004900640043006C00690065006E0074006500FEFF0B0400
      080000004E006F006D0065000500080000004E006F006D0065000C0002000000
      0E0016001700780000000F000110000111000112000113000114000115000800
      00004E006F006D006500180078000000FEFF0B0400140000004900640065006E
      007400690064006100640065000500140000004900640065006E007400690064
      006100640065000C00030000000E0016001700140000000F0001100001110001
      1200011300011400011500140000004900640065006E00740069006400610064
      006500180014000000FEFF0B0400060000004300500046000500060000004300
      500046000C00040000000E0016001700140000000F0001100001110001120001
      130001140001150006000000430050004600180014000000FEFF0B0400100000
      00540065006C00650066006F006E006500050010000000540065006C00650066
      006F006E0065000C00050000000E0016001700140000000F0001100001110001
      120001130001140001150010000000540065006C00650066006F006E00650018
      0014000000FEFF0B04000A00000045006D00610069006C0005000A0000004500
      6D00610069006C000C00060000000E0016001700780000000F00011000011100
      0112000113000114000115000A00000045006D00610069006C00180078000000
      FEFEFF19FEFF1AFEFF1BFF1C1D0000000000FF1E000001000000010008000000
      56494E494349555302000900000031323334353637383903000B000000323837
      343435383630303004000B000000313939383430373132303105001400000076
      6E632E62616767696F40676D61696C2E636F6DFEFEFEFEFEFF1FFEFF20210004
      000000FF22FEFEFE0E004D0061006E0061006700650072001E00550070006400
      6100740065007300520065006700690073007400720079001200540061006200
      6C0065004C006900730074000A005400610062006C00650008004E0061006D00
      6500140053006F0075007200630065004E0061006D0065000A00540061006200
      49004400240045006E0066006F0072006300650043006F006E00730074007200
      610069006E00740073001E004D0069006E0069006D0075006D00430061007000
      61006300690074007900180043006800650063006B004E006F0074004E007500
      6C006C00140043006F006C0075006D006E004C006900730074000C0043006F00
      6C0075006D006E00100053006F007500720063006500490044000E0064007400
      49006E0074003300320010004400610074006100540079007000650014005300
      65006100720063006800610062006C006500120041006C006C006F0077004E00
      75006C006C000800420061007300650014004F0041006C006C006F0077004E00
      75006C006C0012004F0049006E0055007000640061007400650010004F004900
      6E00570068006500720065001A004F0072006900670069006E0043006F006C00
      4E0061006D00650018006400740041006E007300690053007400720069006E00
      67000800530069007A006500140053006F007500720063006500530069007A00
      65001C0043006F006E00730074007200610069006E0074004C00690073007400
      100056006900650077004C006900730074000E0052006F0077004C0069007300
      7400060052006F0077000A0052006F0077004900440010004F00720069006700
      69006E0061006C001800520065006C006100740069006F006E004C0069007300
      74001C0055007000640061007400650073004A006F00750072006E0061006C00
      1200530061007600650050006F0069006E0074000E004300680061006E006700
      65007300}
    object mtbClientesIdCliente: TIntegerField
      FieldName = 'IdCliente'
    end
    object mtbClientesNome: TStringField
      FieldName = 'Nome'
      Size = 120
    end
    object mtbClientesIdentidade: TStringField
      FieldName = 'Identidade'
    end
    object mtbClientesCPF: TStringField
      FieldName = 'CPF'
    end
    object mtbClientesTelefone: TStringField
      FieldName = 'Telefone'
    end
    object mtbClientesEmail: TStringField
      FieldName = 'Email'
      Size = 120
    end
  end
  object mtbEnderecos: TFDMemTable
    Active = True
    FieldDefs = <
      item
        Name = 'IdCliente'
        DataType = ftInteger
      end
      item
        Name = 'IdEndereco'
        DataType = ftInteger
      end
      item
        Name = 'CEP'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Logradouro'
        DataType = ftString
        Size = 120
      end
      item
        Name = 'Numero'
        DataType = ftString
        Size = 120
      end
      item
        Name = 'Complemento'
        DataType = ftString
        Size = 120
      end
      item
        Name = 'Bairro'
        DataType = ftString
        Size = 120
      end
      item
        Name = 'Cidade'
        DataType = ftString
        Size = 120
      end
      item
        Name = 'UF'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'Pais'
        DataType = ftString
        Size = 120
      end>
    IndexDefs = <
      item
        Name = 'mtbEnderecosIndex1'
      end>
    Indexes = <
      item
        Active = True
        Name = 'mtbEnderecosIndex1'
      end>
    IndexFieldNames = 'IdCliente;IdEndereco'
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvPersistent, rvSilentMode]
    ResourceOptions.Persistent = True
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 284
    Top = 14
    Content = {
      414442530F000000C5040000FF00010001FF02FF030400180000006D00740062
      0045006E00640065007200650063006F00730005000A0000005400610062006C
      006500060000000000070000080032000000090000FF0AFF0B04001200000049
      00640043006C00690065006E00740065000500120000004900640043006C0069
      0065006E00740065000C00010000000E000D000F000110000111000112000113
      00011400011500120000004900640043006C00690065006E0074006500FEFF0B
      0400140000004900640045006E00640065007200650063006F00050014000000
      4900640045006E00640065007200650063006F000C00020000000E000D000F00
      011000011100011200011300011400011500140000004900640045006E006400
      65007200650063006F00FEFF0B04000600000043004500500005000600000043
      00450050000C00030000000E0016001700140000000F00011000011100011200
      01130001140001150006000000430045005000180014000000FEFF0B04001400
      00004C006F0067007200610064006F00750072006F000500140000004C006F00
      67007200610064006F00750072006F000C00040000000E001600170078000000
      0F00011000011100011200011300011400011500140000004C006F0067007200
      610064006F00750072006F00180078000000FEFF0B04000C0000004E0075006D
      00650072006F0005000C0000004E0075006D00650072006F000C00050000000E
      0016001700780000000F000110000111000112000113000114000115000C0000
      004E0075006D00650072006F00180078000000FEFF0B04001600000043006F00
      6D0070006C0065006D0065006E0074006F0005001600000043006F006D007000
      6C0065006D0065006E0074006F000C00060000000E0016001700780000000F00
      0110000111000112000113000114000115001600000043006F006D0070006C00
      65006D0065006E0074006F00180078000000FEFF0B04000C0000004200610069
      00720072006F0005000C000000420061006900720072006F000C00070000000E
      0016001700780000000F000110000111000112000113000114000115000C0000
      00420061006900720072006F00180078000000FEFF0B04000C00000043006900
      640061006400650005000C0000004300690064006100640065000C0008000000
      0E0016001700780000000F000110000111000112000113000114000115000C00
      0000430069006400610064006500180078000000FEFF0B040004000000550046
      00050004000000550046000C00090000000E0016001700020000000F00011000
      0111000112000113000114000115000400000055004600180002000000FEFF0B
      040008000000500061006900730005000800000050006100690073000C000A00
      00000E0016001700780000000F00011000011100011200011300011400011500
      080000005000610069007300180078000000FEFEFF19FEFF1AFEFF1BFF1C1D00
      000000001F001E00FF2000000100000001000100000002000800000031333438
      3631343503000D000000527561204C75697A2054616E6B040003000000313030
      06000900000056696C612050697A610700070000004C696D6569726108000200
      0000535009000600000042524153494CFEFEFEFEFEFF21FEFF22230004000000
      FF24FEFEFE0E004D0061006E0061006700650072001E00550070006400610074
      00650073005200650067006900730074007200790012005400610062006C0065
      004C006900730074000A005400610062006C00650008004E0061006D00650014
      0053006F0075007200630065004E0061006D0065000A00540061006200490044
      00240045006E0066006F0072006300650043006F006E00730074007200610069
      006E00740073001E004D0069006E0069006D0075006D00430061007000610063
      00690074007900180043006800650063006B004E006F0074004E0075006C006C
      00140043006F006C0075006D006E004C006900730074000C0043006F006C0075
      006D006E00100053006F007500720063006500490044000E006400740049006E
      0074003300320010004400610074006100540079007000650014005300650061
      00720063006800610062006C006500120041006C006C006F0077004E0075006C
      006C000800420061007300650014004F0041006C006C006F0077004E0075006C
      006C0012004F0049006E0055007000640061007400650010004F0049006E0057
      0068006500720065001A004F0072006900670069006E0043006F006C004E0061
      006D00650018006400740041006E007300690053007400720069006E00670008
      00530069007A006500140053006F007500720063006500530069007A0065001C
      0043006F006E00730074007200610069006E0074004C00690073007400100056
      006900650077004C006900730074000E0052006F0077004C0069007300740006
      0052006F0077000A0052006F0077004900440016007200730055006E00630068
      0061006E006700650064001A0052006F0077005000720069006F007200530074
      0061007400650010004F0072006900670069006E0061006C001800520065006C
      006100740069006F006E004C006900730074001C005500700064006100740065
      0073004A006F00750072006E0061006C001200530061007600650050006F0069
      006E0074000E004300680061006E00670065007300}
    object mtbEnderecosIdCliente: TIntegerField
      FieldName = 'IdCliente'
    end
    object mtbEnderecosIdEndereco: TIntegerField
      FieldName = 'IdEndereco'
    end
    object mtbEnderecosCEP: TStringField
      FieldName = 'CEP'
    end
    object mtbEnderecosLogradouro: TStringField
      FieldName = 'Logradouro'
      Size = 120
    end
    object mtbEnderecosNumero: TStringField
      FieldName = 'Numero'
      Size = 120
    end
    object mtbEnderecosComplemento: TStringField
      FieldName = 'Complemento'
      Size = 120
    end
    object mtbEnderecosBairro: TStringField
      FieldName = 'Bairro'
      Size = 120
    end
    object mtbEnderecosCidade: TStringField
      FieldName = 'Cidade'
      Size = 120
    end
    object mtbEnderecosUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object mtbEnderecosPais: TStringField
      FieldName = 'Pais'
      Size = 120
    end
  end
  object mtbConfigEmail: TFDMemTable
    Active = True
    FieldDefs = <
      item
        Name = 'IdConfigEmail'
        DataType = ftInteger
      end
      item
        Name = 'Servidor'
        DataType = ftString
        Size = 120
      end
      item
        Name = 'Porta'
        DataType = ftInteger
      end
      item
        Name = 'Usuario'
        DataType = ftString
        Size = 120
      end
      item
        Name = 'Senha'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'FromName'
        DataType = ftString
        Size = 120
      end
      item
        Name = 'FromEmail'
        DataType = ftString
        Size = 120
      end
      item
        Name = 'SSL'
        DataType = ftBoolean
      end
      item
        Name = 'TLS'
        DataType = ftBoolean
      end>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvPersistent, rvSilentMode]
    ResourceOptions.Persistent = True
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 362
    Top = 14
    Content = {
      414442530F00000071040000FF00010001FF02FF0304001C0000006D00740062
      0043006F006E0066006900670045006D00610069006C0005000A000000540061
      0062006C006500060000000000070000080032000000090000FF0AFF0B04001A
      0000004900640043006F006E0066006900670045006D00610069006C0005001A
      0000004900640043006F006E0066006900670045006D00610069006C000C0001
      0000000E000D000F000110000111000112000113000114000115001A00000049
      00640043006F006E0066006900670045006D00610069006C00FEFF0B04001000
      00005300650072007600690064006F0072000500100000005300650072007600
      690064006F0072000C00020000000E0016001700780000000F00011000011100
      011200011300011400011500100000005300650072007600690064006F007200
      180078000000FEFF0B04000A00000050006F0072007400610005000A00000050
      006F007200740061000C00030000000E000D000F000110000111000112000113
      000114000115000A00000050006F00720074006100FEFF0B04000E0000005500
      730075006100720069006F0005000E0000005500730075006100720069006F00
      0C00040000000E0016001700780000000F000110000111000112000113000114
      000115000E0000005500730075006100720069006F00180078000000FEFF0B04
      000A000000530065006E006800610005000A000000530065006E00680061000C
      00050000000E0016001700140000000F00011000011100011200011300011400
      0115000A000000530065006E0068006100180014000000FEFF0B040010000000
      460072006F006D004E0061006D006500050010000000460072006F006D004E00
      61006D0065000C00060000000E0016001700780000000F000110000111000112
      0001130001140001150010000000460072006F006D004E0061006D0065001800
      78000000FEFF0B040012000000460072006F006D0045006D00610069006C0005
      0012000000460072006F006D0045006D00610069006C000C00070000000E0016
      001700780000000F000110000111000112000113000114000115001200000046
      0072006F006D0045006D00610069006C00180078000000FEFF0B040006000000
      530053004C00050006000000530053004C000C00080000000E0019000F000110
      0001110001120001130001140001150006000000530053004C00FEFF0B040006
      00000054004C00530005000600000054004C0053000C00090000000E0019000F
      000110000111000112000113000114000115000600000054004C005300FEFEFF
      1AFEFF1BFEFF1CFF1D1E000000000020001F00FF2100000100000001000E0000
      00736D74702E676D61696C2E636F6D0200D101000003001C0000007465737465
      7376696E6963697573736D747040676D61696C2E636F6D040010000000797361
      6A7466686F6E7279736B687A7205000500000054657374650600160000007465
      73746540656E76696F6465656D61696C2E636F6D0700010008000100FEFEFEFE
      FEFF22FEFF23240004000000FF25FEFEFE0E004D0061006E0061006700650072
      001E005500700064006100740065007300520065006700690073007400720079
      0012005400610062006C0065004C006900730074000A005400610062006C0065
      0008004E0061006D006500140053006F0075007200630065004E0061006D0065
      000A0054006100620049004400240045006E0066006F0072006300650043006F
      006E00730074007200610069006E00740073001E004D0069006E0069006D0075
      006D0043006100700061006300690074007900180043006800650063006B004E
      006F0074004E0075006C006C00140043006F006C0075006D006E004C00690073
      0074000C0043006F006C0075006D006E00100053006F00750072006300650049
      0044000E006400740049006E0074003300320010004400610074006100540079
      00700065001400530065006100720063006800610062006C006500120041006C
      006C006F0077004E0075006C006C000800420061007300650014004F0041006C
      006C006F0077004E0075006C006C0012004F0049006E00550070006400610074
      00650010004F0049006E00570068006500720065001A004F0072006900670069
      006E0043006F006C004E0061006D00650018006400740041006E007300690053
      007400720069006E0067000800530069007A006500140053006F007500720063
      006500530069007A00650012006400740042006F006F006C00650061006E001C
      0043006F006E00730074007200610069006E0074004C00690073007400100056
      006900650077004C006900730074000E0052006F0077004C0069007300740006
      0052006F0077000A0052006F0077004900440016007200730055006E00630068
      0061006E006700650064001A0052006F0077005000720069006F007200530074
      0061007400650010004F0072006900670069006E0061006C001800520065006C
      006100740069006F006E004C006900730074001C005500700064006100740065
      0073004A006F00750072006E0061006C001200530061007600650050006F0069
      006E0074000E004300680061006E00670065007300}
    object mtbConfigEmailIdConfigEmail: TIntegerField
      FieldName = 'IdConfigEmail'
    end
    object mtbConfigEmailServidor: TStringField
      FieldName = 'Servidor'
      Size = 120
    end
    object mtbConfigEmailPorta: TIntegerField
      FieldName = 'Porta'
    end
    object mtbConfigEmailUsuario: TStringField
      FieldName = 'Usuario'
      Size = 120
    end
    object mtbConfigEmailSenha: TStringField
      FieldName = 'Senha'
    end
    object mtbConfigEmailFromName: TStringField
      FieldName = 'FromName'
      Size = 120
    end
    object mtbConfigEmailFromEmail: TStringField
      FieldName = 'FromEmail'
      Size = 120
    end
    object mtbConfigEmailSSL: TBooleanField
      FieldName = 'SSL'
    end
    object mtbConfigEmailTLS: TBooleanField
      FieldName = 'TLS'
    end
  end
end
