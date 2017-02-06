create or replace package cryptopackage as
    procedure set_pass(mytoken IN varchar2);
    function pseudo(input_field IN varchar2) return raw;
    function depseudo(input_field IN varchar2) return varchar2;
end cryptopackage;

create or replace package body cryptopackage as
---variables du package
    mytoken varchar2(100); --Token utilisé pour l'identification auprès du serveur de clefs
    mypass varchar2(32);  --Cypher retourné par le serveur de clefs
    
---procédure de lecture du cypher à initialiser à l'ouverture de session
    procedure set_pass(mytoken IN varchar2)
    is
      l_http_request   UTL_HTTP.req;
      l_http_response  UTL_HTTP.resp;
    begin
--- Make a HTTP request and get the response.
      l_http_request  := UTL_HTTP.begin_request(mytoken);
      l_http_response := UTL_HTTP.get_response(l_http_request);
      UTL_HTTP.read_text(l_http_response, mypass, 32);
      dbms_output.put_line(mypass);
    end set_pass;
    
---fonction de chiffrement utilisant le cypher mypass
    function pseudo(input_field IN varchar2)
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
      key_bytes_raw := UTL_I18N.STRING_TO_RAW(mypass); --cypher mypass initialisé par la procédure set_pass
      encrypted_raw := DBMS_CRYPTO.ENCRYPT
        (
           src => UTL_I18N.STRING_TO_RAW (input_field,  'AL32UTF8'),
           typ => encryption_type,
           key => key_bytes_raw
        );
      return  encrypted_raw;
    end pseudo;
    
---fonction de déchiffrement utilisant le cypher mypass
    function depseudo(input_field IN varchar2)
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
      key_bytes_raw := UTL_I18N.STRING_TO_RAW(mypass); --cypher mypass initialisé par la procédure set_pass
      decrypted_raw := DBMS_CRYPTO.DECRYPT
        (
           src => (input_field),
           typ => encryption_type,
           key => key_bytes_raw
        );
      decrypted_string := UTL_I18N.RAW_TO_CHAR (decrypted_raw, 'AL32UTF8');
      return decrypted_string;
    end depseudo;
  
end cryptopackage;

/* URL and test
begin
ODQ_DEV.cryptopackage.set_pass('http://keyman.nohoo.biz/api/1.json');
end;

select name, cryptopackage.pseudo(name), cryptopackage.depseudo(cryptopackage.pseudo(name)) from business_areas;
*/
