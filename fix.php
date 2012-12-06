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
	$pid = intval($_REQUEST['pid']);
	if (does_post_exist($pid))
	{
		$query = "SELECT PID, story, tags, nsfw, pic FROM posts WHERE PID='".mysql_real_escape_string($pid)."' AND active='1'";
       	$executequery = $conn->execute($query);
       	$parray = $executequery->getarray();
		STemplate::assign('p',$parray[0]);	
		
		$ctime = 24 * 60 * 60;
		$utime = time() - $ctime;
		$query = "select count(*) as total from posts where time_added>='$utime'"; 
		$executequery = $conn->execute($query);
		$myuploads = $executequery->fields['total'];
		$quota = $config['quota'];
		if($myuploads >= $quota)
		{
			$error = $lang['188'];
			$theme = "empty.tpl";
		}
		else
		{
			$theme = "fix.tpl";
			
			$fixsub = cleanit($_REQUEST['fixsub']);
			if($fixsub == "1")
			{
				$nsfw = intval(cleanit($_REQUEST['nsfw']));
				$tags = cleanit($_REQUEST['tags']);
				$title = stripslashes($parray[0]['story'])."[Fixed]";
				$uploadedimage = $_FILES['image']['tmp_name'];
				
				if($uploadedimage == "")
				{
					$error = $lang['93'];
				}
				else
				{
					$theimageinfo = getimagesize($uploadedimage);
					if($theimageinfo[2] != 1 && $theimageinfo[2] != 2 && $theimageinfo[2] != 3)
					{
						$error = $lang['94'];
					}
					else
					{
						$approve_stories = $config['approve_stories'];
						if($approve_stories == "1")
						{
							$active = "0";
						}
						else
						{
							$active = "1";
						}
						$query="INSERT INTO posts SET USERID='".mysql_real_escape_string($SID)."', story='".mysql_real_escape_string($title)."', tags='".mysql_real_escape_string($tags)."', nsfw='".mysql_real_escape_string($nsfw)."', fix='".mysql_real_escape_string($pid)."', time_added='".time()."', date_added='".date("Y-m-d")."', active='$active', pip='".$_SERVER['REMOTE_ADDR']."'";
						$result=$conn->execute($query);
						$pid = mysql_insert_id();
						
						if($uploadedimage != "")
						{
							$thepp = $pid;
							if($theimageinfo[2] == 1)
							{
								$thepp .= ".gif";
							}
							elseif($theimageinfo[2] == 2)
							{
								$thepp .= ".jpg";
							}
							elseif($theimageinfo[2] == 3)
							{
								$thepp .= ".png";
							}
							if($error == "")
							{
								$myvideoimgnew=$config['pdir']."/".$thepp;
								if(file_exists($myvideoimgnew))
								{
									unlink($myvideoimgnew);
								}
								$myconvertimg = $_FILES['image']['tmp_name'];
								move_uploaded_file($myconvertimg, $myvideoimgnew);
								do_resize_image($myvideoimgnew, "700", "5000", true, $config['pdir']."/t/l-".$thepp);
								do_resize_image($myvideoimgnew, "460", "3000", true, $config['pdir']."/t/".$thepp);
								do_resize_image($myvideoimgnew, "220", "220", true, $config['pdir']."/t/s-".$thepp);
								if(file_exists($config['pdir']."/".$thepp))
								{
									$query = "UPDATE posts SET pic='$thepp' WHERE PID='".mysql_real_escape_string($pid)."'";
									$conn->execute($query);
									header("Location:$config[baseurl]/gag/".$pid."?new=1");exit;
								}
							}
						}
					}
				}
			}	
		}
	}
	else
	{
		$theme = "empty.tpl";
		$error = $lang['183'];
	}
}
else
{
	header("Location:$config[baseurl]/login");exit;
}

//TEMPLATES BEGIN
STemplate::assign('pagetitle',$lang['142']);
STemplate::assign('menu',3);
STemplate::assign('error',$error);
STemplate::assign('message',$message);
STemplate::display('header.tpl');
STemplate::display($theme);
STemplate::display('footer.tpl');
//TEMPLATES END
?>