/* Grant access to UTL_HTTP and DBMS_CRYPTO libraries */
CONN SYS/Manager11g@INFO as SYSDBA;

GRANT EXECUTE ON DBMS_OUTPUT TO ODQ_DEV; /* Nice to have for displaying resuts in the console */
GRANT EXECUTE ON UTL_HTTP TO ODQ_DEV;
GRANT EXECUTE ON DBMS_CRYPTO TO ODQ_DEV;

/* Create ACL for ODQ_DEV */
BEGIN
  DBMS_NETWORK_ACL_ADMIN.create_acl (
    acl          => 'http_acl_file.xml', 
    description  => 'Access Control List for http resources',
    principal    => 'ODQ_DEV',
    is_grant     => TRUE, 
    privilege    => 'connect',
    start_date   => SYSTIMESTAMP,
    end_date     => NULL);

  COMMIT;
END;

BEGIN
  DBMS_NETWORK_ACL_ADMIN.add_privilege ( 
    acl         => 'http_acl_file.xml', 
    principal   => 'ODQ_DEV',
    is_grant    => TRUE, 
    privilege   => 'connect', 
    position    => NULL, 
    start_date  => SYSTIMESTAMP,
    end_date    => NULL);

  COMMIT;
END;

/* Give access to networks */
BEGIN
  DBMS_NETWORK_ACL_ADMIN.assign_acl (
    acl         => 'http_acl_file.xml',
    host        => 'keyman.nohoo.biz', 
    lower_port  => 80,
    upper_port  => NULL); 

  DBMS_NETWORK_ACL_ADMIN.assign_acl (
    acl         => 'http_acl_file.xml',
    host        => 'localhost', 
    lower_port  => NULL,
    upper_port  => NULL);

  COMMIT;
END;

/* Check granted accesses */
SELECT host, lower_port, upper_port, acl
FROM   dba_network_acls;

SELECT acl,
       principal,
       privilege,
       is_grant,
       TO_CHAR(start_date, 'DD-MON-YYYY') AS start_date,
       TO_CHAR(end_date, 'DD-MON-YYYY') AS end_date
FROM   dba_network_acl_privileges;

CONN ODQ_DEV/ODQ_DEV@INFO;

SELECT DECODE(DBMS_NETWORK_ACL_ADMIN.check_privilege('http_acl_file.xml', 'ODQ_DEV', 'connect'), 1, 'GRANTED', 0, 'DENIED', NULL) privilege FROM dual;

/* Testing with a stored procedure */
CREATE OR REPLACE PROCEDURE show_html_from_url (p_url  IN  VARCHAR2) AS
  l_http_request   UTL_HTTP.req;
  l_http_response  UTL_HTTP.resp;
  l_text           VARCHAR2(32767);
BEGIN
  -- Make a HTTP request and get the response.
  l_http_request  := UTL_HTTP.begin_request(p_url);
  l_http_response := UTL_HTTP.get_response(l_http_request);

  -- Loop through the response.
  BEGIN
    LOOP
      UTL_HTTP.read_text(l_http_response, l_text, 32766);
      DBMS_OUTPUT.put_line (l_text);
    END LOOP;
  EXCEPTION
    WHEN UTL_HTTP.end_of_body THEN
      UTL_HTTP.end_response(l_http_response);
  END;
EXCEPTION
  WHEN OTHERS THEN
    UTL_HTTP.end_response(l_http_response);
    RAISE;
END show_html_from_url;

SET SERVEROUTPUT ON;
EXEC show_html_from_url('http://keyman.nohoo.biz/api/1.json');
