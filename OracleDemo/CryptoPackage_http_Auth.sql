create or replace package KR2 as
    procedure get_pass(myURL IN varchar2, myUserName IN varchar2, myToken IN varchar2);
    procedure get_topass(myURL IN varchar2, myUserName IN varchar2, myToken IN varchar2);
    function pseudo(input_field IN varchar2) return raw;
    function depseudo(input_field IN varchar2) return varchar2;
    function transpseudo(input_field IN varchar2) return raw;
end KR2;

create or replace package body KR2 as
---variables of the package
    myURL varchar2(100);  --URL of the keys server
    myUserName varchar2(30); --User name for authentication
    myToken varchar2(100); --Token for user authentication
    myPass varchar2(32);  --Cypher returned by keys server
    myToPass varchar2(32);  --Cypher returned by keys server
    myStatus varchar2(32);  --http status returned by keys server
    
---procedure to get the cypher --> initialise when opening the session
    procedure get_pass(myURL IN varchar2, myUserName IN varchar2, myToken IN varchar2)
    is
      l_http_request   UTL_HTTP.req;
      l_http_response  UTL_HTTP.resp;
    begin
--- Make a HTTP request and get the response.
      l_http_request  := UTL_HTTP.begin_request(myURL);
      UTL_HTTP.SET_HEADER(l_http_request,'X-User-Name', myUserName);
      UTL_HTTP.SET_HEADER(l_http_request,'X-User-Token', myToken);
      UTL_HTTP.SET_HEADER(l_http_request, 'User-Agent', 'Specific'); --Keyman should check the user agent not to deliver key out of API 
      l_http_response := UTL_HTTP.get_response(l_http_request);
      UTL_HTTP.read_text(l_http_response, myPass, 32);
      myStatus := l_http_response.status_code;
      UTL_HTTP.END_RESPONSE(l_http_response);
      dbms_output.put_line(myStatus);  
---   dbms_output.put_line(myPass);
      if myStatus != 200 then 
        raise_application_error(-20100,'Not found or not allowed');
      end if;
    end get_pass;
    
    ---procedure to get the cypher --> initialise when opening the session
    procedure get_topass(myURL IN varchar2, myUserName IN varchar2, myToken IN varchar2)
    is
      l_http_request   UTL_HTTP.req;
      l_http_response  UTL_HTTP.resp;
    begin
--- Make a HTTP request and get the response.
      l_http_request  := UTL_HTTP.begin_request(myURL);
      UTL_HTTP.SET_HEADER(l_http_request,'X-User-Name', myUserName);
      UTL_HTTP.SET_HEADER(l_http_request,'X-User-Token', myToken);
      UTL_HTTP.SET_HEADER(l_http_request, 'User-Agent', 'Specific'); --Keyman should check the user agent not to deliver key out of API l_http_response := UTL_HTTP.get_response(l_http_request);
      UTL_HTTP.read_text(l_http_response, myToPass, 32);
      myStatus := l_http_response.status_code;
      UTL_HTTP.END_RESPONSE(l_http_response);
      dbms_output.put_line(myStatus); 
---   dbms_output.put_line(myToPass);
      if myStatus != 200 then 
        raise_application_error(-20100,'Not found or not allowed');
      end if;
 
    end get_topass;
    
---encrypting fonction using the mypass cypher
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
      key_bytes_raw := UTL_I18N.STRING_TO_RAW(myPass); -- cypher mypass has been initialised by get_pass
      encrypted_raw := DBMS_CRYPTO.ENCRYPT
        (
           src => UTL_I18N.STRING_TO_RAW (input_field,  'AL32UTF8'),
           typ => encryption_type,
           key => key_bytes_raw
        );
      return  encrypted_raw;
    end pseudo;
    
---decrypting fonction using the mypass cypher
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
      key_bytes_raw := UTL_I18N.STRING_TO_RAW(myPass); -- cypher mypass has been initialised by get_pass
      decrypted_raw := DBMS_CRYPTO.DECRYPT
        (
           src => (input_field),
           typ => encryption_type,
           key => key_bytes_raw
        );
      decrypted_string := UTL_I18N.RAW_TO_CHAR (decrypted_raw, 'AL32UTF8');
      return decrypted_string;
    end depseudo;
    
---transcrypting fonction using the mypass cypher
    function transpseudo(input_field IN varchar2)
    return raw
    is
      transcrypted_raw   RAW (2000);             -- stores encrypted binary text 
      decrypted_raw      RAW (2000);             -- stores decrypted binary text 
      decrypted_string   VARCHAR2 (2000);        -- stores decrypted string 
      num_key_bytes      NUMBER := 256/8;        -- key length 256 bits (32 bytes) 
      key_bytes_raw      RAW (32);               -- stores 256-bit encryption key
      encryption_type    PLS_INTEGER :=          -- total encryption type
                           DBMS_CRYPTO.ENCRYPT_AES256 
                           + DBMS_CRYPTO.CHAIN_CBC
                           + DBMS_CRYPTO.PAD_PKCS5;
    begin
      key_bytes_raw := UTL_I18N.STRING_TO_RAW(myPass); -- cypher mypass has been initialised by get_pass
      decrypted_raw := DBMS_CRYPTO.DECRYPT
        (
           src => (input_field),
           typ => encryption_type,
           key => key_bytes_raw
        );
      decrypted_string := UTL_I18N.RAW_TO_CHAR (decrypted_raw, 'AL32UTF8');
      key_bytes_raw := UTL_I18N.STRING_TO_RAW(myToPass); -- cypher myToPass has been initialised by get_topass
      transcrypted_raw := DBMS_CRYPTO.ENCRYPT
        (
           src => UTL_I18N.STRING_TO_RAW (decrypted_string,  'AL32UTF8'),
           typ => encryption_type,
           key => key_bytes_raw
        );
      return transcrypted_raw;
    end transpseudo;
  
end KR2;

/* URL and test
begin
ODQ_DEV.KR2.get_pass('http://keyman.nohoo.biz/api/1.json');
end;

select name, ODQ_DEV.KR2.pseudo(name), ODQ_DEV.KR2.depseudo(cryptopackage.pseudo(name)) from business_areas;
*/
