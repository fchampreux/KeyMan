create function pseudo(input_field IN varchar2, input_key IN varchar2)
  return raw
  is    
    encrypted_raw      RAW (2000);             -- stores encrypted binary text
    num_key_bytes      NUMBER := 256/8;        -- key length 256 bits (32 bytes) 
    key_bytes_raw      RAW (32);               -- stores 256-bit encryption key
    encryption_type    PLS_INTEGER :=          -- total encryption type
                         DBMS_CRYPTO.ENCRYPT_AES256 
                         + DBMS_CRYPTO.CHAIN_CBC
                         + DBMS_CRYPTO.PAD_PKCS5;
  begin
    --key_bytes_raw := DBMS_CRYPTO.RANDOMBYTES (num_key_bytes);
    key_bytes_raw := UTL_I18N.STRING_TO_RAW(input_key);
    encrypted_raw := DBMS_CRYPTO.ENCRYPT
      (
         src => UTL_I18N.STRING_TO_RAW (input_field,  'AL32UTF8'),
         typ => encryption_type,
         key => key_bytes_raw
      );
    return  encrypted_raw;
  end;
  
create fucntion depseudo(input_field IN varchar2, 
input_key IN varchar2)
  return varchar2
  is
    decrypted_raw      RAW (2000);             -- stores decrypted binary text    
    decrypted_string   VARCHAR2 (2000);        -- stores decrypted string
    num_key_bytes      NUMBER := 256/8;        -- key length 256 bits (32 bytes) 
    key_bytes_raw      RAW (32);               -- stores 256-bit encryption key
    encryption_type    PLS_INTEGER :=          -- total encryption type
                         DBMS_CRYPTO.ENCRYPT_AES256 
                         + DBMS_CRYPTO.CHAIN_CBC
                         + DBMS_CRYPTO.PAD_PKCS5;
  begin
    --key_bytes_raw := DBMS_CRYPTO.RANDOMBYTES (num_key_bytes);
    key_bytes_raw := UTL_I18N.STRING_TO_RAW(input_key);
    decrypted_raw := DBMS_CRYPTO.DECRYPT
      (
         src => (input_field),
         typ => encryption_type,
         key => key_bytes_raw
      );
    decrypted_string := UTL_I18N.RAW_TO_CHAR (decrypted_raw, 'AL32UTF8');
    return decrypted_string;
  end;