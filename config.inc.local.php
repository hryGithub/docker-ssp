<?php
// Override config.inc.php parameters below

# ldap
$ldap_url = getenv('LDAP_URL');
$ldap_binddn = getenv('LDAP_BINDDN');                             
$ldap_bindpw = getenv('LDAP_BINDPW');                     
$ldap_base = getenv('LDAP_BASE'); 

# mail
$mail_from = getenv('MAIL_SMTP_USER');                                            
$mail_smtp_host = getenv('MAIL_SMTP_HOST');                                                                                
$mail_smtp_auth = true;                                                                                                
$mail_smtp_user = getenv('MAIL_SMTP_USER');                                                                            
$mail_smtp_pass = getenv('MAIL_SMTP_PASS');                                                                                  
$mail_smtp_port = getenv('MAIL_SMTP_PORT');  
$mail_smtp_secure = 'ssl';

# SMS
$use_sms = false;

# QUESTION
$use_questions = false;

$keyphrase = "uK9Kargj";

?>