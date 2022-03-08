/// Cryptography services
Class dc.crypto.CryptoService
{

ClassMethod Do3DESEncryptation(Message As %String) As %Library.String
{
        Set Key = $system.Util.GetEnviron("SECRETKEY")
        Return ..Encrypt3DES(Message, Key)
}

ClassMethod Do3DESDecryptation(Message As %String) As %Library.String
{
        Set Key = $system.Util.GetEnviron("SECRETKEY")
        Return ..Decrypt3DES(Message, Key)
}

/// encrypt messages
ClassMethod Encrypt3DES(msg, key) [ Language = python ]
{
        from pyDes import triple_des, CBC, PAD_PKCS5
        import binascii

        secret_key = key[:24]
        iv = secret_key[-8:]
        k = triple_des(secret_key, mode=CBC, IV=iv, padmode=PAD_PKCS5)
        en = k.encrypt(msg, padmode=PAD_PKCS5)
        return binascii.b2a_hex(en).decode(encoding='utf-8')
}

/// decrypt messages
ClassMethod Decrypt3DES(msg, key) [ Language = python ]
{
        from pyDes import triple_des, CBC, PAD_PKCS5 
        import binascii

        secret_key = key[:24]
        iv = secret_key[-8:]
        k = triple_des(secret_key, mode=CBC, IV=iv, padmode=PAD_PKCS5)
        de = k.decrypt(binascii.a2b_hex(msg), padmode=PAD_PKCS5)
        return de.decode(encoding='utf-8')
}

}
