<!DOCTYPE html>
<html lang="en" xmlns:og="http://opengraphprotocol.org/schema/" xmlns:fb="http://www.facebook.com/2008/fbml">
<head>
<title>{$pagetitle|stripslashes}</title>
<link rel="shortcut icon" href="{$baseurl}/favicon.ico" />
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<meta content="width=device-width; initial-scale=1.0;" name="viewport" />
<link rel="stylesheet" href="{$baseurl}/css/connect.css" media="screen,projection" type="text/css" />
</head>

<body id="page-signup">
    <div class="signup-wrapper">
        <a class="signup-login-btn" href="{$baseurl}/signup">{$lang23}<b>{$lang24}</b></a>
        <div class="header">
        	<a href="{$baseurl}"><h1></h1></a>
        </div>
        <div class="content">
            <div class="description">
                <h2>{$lang91}</h2>
                <div class="spcl-button-wrap">
                	<a class="spcl-button facebook badge-facebook-connect" label="LoginFormFacebookButton" next="" <a class="spcl-button facebook badge-facebook-connect" label="LoginFormFacebookButton" next="" href="https://www.facebook.com/dialog/permissions.request?app_id={$FACEBOOK_APP_ID}&display=page&next={$baseurl}/&response_type=code&fbconnect=1&perms=email,user_birthday,user_about_me">{$lang25}</a>
                </div>
                <p class="message"> </p>
            </div>
            <form id="form-signup-login" class="generic" action="{$baseurl}/login" method="post">
            	{if $error ne ""}
                <p id="setup-msg" class="message red">{$error}</p>
                {/if}
                <div id="login-username-block" class="field">
                	<label>{$lang36}</label>
                	<input id="login-username" type="text" class="text" name="username" placeholder="{$lang36}" tabindex="1" maxlength="200" value=""/>
                </div>
                <div id="login-password-block" class="field">
                    <label>{$lang2}
                    <span>(<a id="login-to-recover" href="{$baseurl}/forgot">{$lang28}<span class="badge-js" style="color:#a900f0;" key="?"></span></a>)</span>
                    </label>
                    <input id="login-password" type="password" class="text" name="password" placeholder="{$lang2}" tabindex="3" maxlength="32"/>
                </div>
                <div class="action">
                	<input id="logsub" type="hidden" name="logsub" value="1"></input>
                	<input id="login-submit" type="submit" class="submit-button" value="{$lang29}"></input>
                </div>
            </form>
        </div>
    </div>
    <div id="fb-root"></div>
    <script type="text/javascript" src="{$baseurl}/js/connect.js"></script>
</body>
</html>