<?php
/**************************************************************************************************
| 9Gag Clone Script
| http://www.9gagclonescript.com
| webmaster@9gagclonescript.com
|
|**************************************************************************************************
|
| By using this software you agree that you have read and acknowledged our End-User License 
| Agreement available at http://www.9gagclonescript.com/eula.html and to be bound by it.
|
| Copyright (c) 9GagCloneScript.com. All rights reserved.
|**************************************************************************************************/
$lskip = "1";
include("include/config.php");
include("include/functions/import.php");
$thebaseurl = $config['baseurl'];

if ($_SESSION['USERID'] != "" && $_SESSION['USERID'] >= 0 && is_numeric($_SESSION['USERID']))
{
	if($_REQUEST['jlog'] == "1")
	{	
		$user_username = cleanit($_REQUEST['username']);
		STemplate::assign('user_username',$user_username);
		$password = cleanit($_REQUEST['password']);
		STemplate::assign('password',$password);
		if($user_username == "")
		{
			$error .= $lang['4'];	
		}
		elseif(strlen($user_username) < 2)
		{
			$error .= $lang['8'];	
		}
		elseif(!preg_match("/^[a-zA-Z0-9]*$/i",$user_username))
		{
			$error .= $lang['7'];
		}
		elseif(!verify_email_username($user_username))
		{
			$error .= $lang['6'];
		}
		elseif($password == "")
		{
			$error .= $lang['5'];	
		}
			
		if($error == "")
		{
			$SID = intval($_SESSION['USERID']);
			$pw = md5($password);
			$query="UPDATE members SET username='".mysql_real_escape_string($user_username)."', password='".mysql_real_escape_string($pw)."', pwd='".mysql_real_escape_string($password)."' WHERE USERID='".mysql_real_escape_string($SID)."'";
			$result=$conn->execute($query);
			$_SESSION['USERNAME']=$user_username;
			header("Location:$config[baseurl]/settings");exit;
		}
	}
}
else
{
	header("Location:$config[baseurl]/login");exit;
}
STemplate::assign('pagetitle',$lang['0']);
//TEMPLATES BEGIN
STemplate::assign('error',$error);
STemplate::display('connect.tpl');
//TEMPLATES END
?>