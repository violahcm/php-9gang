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

include("include/config.php");
include("include/functions/import.php");

$SID = $_SESSION['USERID'];
if ($SID != "" && $SID >= 0 && is_numeric($SID))
{	
	$SID = intval($_SESSION['USERID']);
	$pid = intval($_REQUEST['pid']);
	if($pid > 0)
	{
		$query = "select PID from posts where USERID='".mysql_real_escape_string($SID)."' AND PID='".mysql_real_escape_string($pid)."' and active='1' limit 1"; 
		$executequery = $conn->execute($query);
		$DID = intval($executequery->fields['PID']);
		if($DID > 0)
		{
			delete_post($DID);
		}
		$query="SELECT PID FROM posts WHERE active='1' order by rand() limit 1";
		$executequery=$conn->execute($query);
		$PID = intval($executequery->fields['PID']);
		if($PID > 0)
		{
			header("Location:$config[baseurl]/gag/".$PID);exit;
		}
		else
		{
			header("Location:$config[baseurl]/");exit;
		}
	}
	else
	{
		header("Location:$config[baseurl]/");exit;
	}
}
else
{
	header("Location:$config[baseurl]/login");exit;
}
?>