{if $error ne ""}
<p class="form-message error">{$error}</p>
{elseif $message ne ""}
<p class="form-message success">{$message}</p>
{/if}
<div id="main">
    <div id="content-holder">
        <div id="scriptolution-soft-post" class="scriptolution-soft-box static">
        
            <div class="head">
                <ul class="switch">
                	<li class="tab_photo "><a class="photo" href="{$baseurl}/submit">{$lang100}</a></li>
                	<li class="tab_video current"><a class="video" href="{$baseurl}/submit?t=v">{$lang101}</a></li>
                </ul>
            </div>
        
            <div class="content form_photo">
                <form id="form-scriptolution-soft-post-image" class="modal" action="{$baseurl}/submit?t=v" enctype="multipart/form-data" method="post">
                    <input type="hidden" name="type" value="Video"/>
                    <input id="post_type" type="hidden" name="post_type" value="Video"/>
                    <h3>{$lang108}</h3>
                    <div class="field">
                        <label>
                            <h4>{$lang109}</h4>                        
                            <input id="photo_post_url" type="text" class="text" name="url" value="{$url|stripslashes}" style="display:block;" />
                            <p class="info" style="visibility:hidden">{$lang110}</p>
                        </label>
                    </div>
                    <div class="field">
                        <label>
                            <h4>{$lang111}</h4>
                            <input id="post_title" type="text" class="text tipped" name="title" maxlength="60" value=""/>
                            <p class="info" style="visibility:hidden">{$lang112}</p>
                        </label>
                    </div>
                    <div class="field">
                        <label>
                            <h4>{$lang113}<span>({$lang114})</span></h4>
                            <input id="photo_tag_input" type="text" class="text tag_input tipped" name="tags" value="" placeholder="tag 1, tag 2, tag 3, tag 4, tag 5"/>
                            <p class="info" style="visibility:hidden">{$lang118}</p>
                        </label>
                    </div>
                    <div class="field">
                        <label>
                            <h4>{$lang115}<span>({$lang114})</span></h4>
                            <input type="text" class="text tipped" name="source" value="" maxlength="300"/>
                            <p class="info" style="visibility:hidden">{$lang116}</p>
                        </label>                    
                    </div>
                    <hr />
                    <div class="field checkbox">
                    	<label for="submit-nsfw">
                    	<input id="submit-nsfw" type="checkbox" class="checkbox" name="nsfw" value="1" />{$lang117}</label>
                    </div>                
                </form>
            </div>
        
        
            <div class="actions">
                <ul class="buttons">
                    <li class="loading-btn" style="visibility:hidden"><a class="button loading"></a></li>
                    <li class="form-btn"><a class="cancel" href="/">{$lang119}</a></li>
                    <li class="form-btn"><a class="button send" id="ekle" >{$lang120}</a></li>
                </ul>
            </div>
        	{literal}
			<script type="text/javascript">
            $('input').each(function()
			{
            	$(this).focus(function()
				{
            		$(this ).next('.info').css('visibility','visible');
            	})
            	$(this).blur(function()
				{
            		$(this).next('.info').css('visibility','hidden');
            	})
            });
            $('#ekle').click(function(){
            	$('#form-scriptolution-soft-post-image').submit();
            });
            </script>
            {/literal}
        </div>
    </div>
</div>

<div class="side-bar">
    <div class="msg-box notice">
    	<h3>{$lang121}</h3>
    	<p>{$quota} {$lang122}</p>
    </div>

    <div class="msg-box">
        <h3>{$lang123}</h3>
        <ul class="submit-info">
            <li><b>{$lang124}</b></li>
            <li><b>{$lang125} </b><a href=\"http://www.google.com/imghp\" target=\"blank\">{$lang126}</a><b></b></li>
            <li><b>{$lang127}</b></li>
            <li><b>{$lang128}</b></li>
            <li><b>{$lang129}</b></li>
            <li>{$lang130}</li>
            <li>{$lang131}</li>
            <li><b>{$lang132}</b></li>
            <li><b>{$lang133}</b></li>
            <li>{$lang134} <a href="{$baseurl}/rules" target="blank">{$lang135}</a>.</li>                        
        </ul>
        <p class="memo"><b>{$lang136}:</b> {$lang137}<span class="badge-js" key="!"></span></p>
    </div>
</div>
<div id="footer" class="">