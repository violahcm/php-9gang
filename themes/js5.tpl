{literal}
<script type="text/javascript">
$('.keyboard_link').click(function(){
$("#overlay-shadow").removeClass("hide");
$("#overlay-container").removeClass("hide");
$(".keyboard-instruction").removeClass("hide");
$("#overlay-container").click(function(){
$("#overlay-shadow").addClass("hide");
$("#overlay-container").addClass("hide");
$(".keyboard-instruction").addClass("hide");	
});
});
$('.report').click(function(){
$('#report_entry_id').val($(this).attr('entryId'));	
$('#repost_link').val('{/literal}{$baseurl}{literal}/gag/' + $(this).attr('entryId'));	
$('#overlay-shadow').removeClass('hide');
$('#overlay-container').removeClass('hide');
$('#scriptolution-soft-report').removeClass('hide');
});
$('.close-btn').click(function(){
$('#overlay-shadow').addClass('hide');
$('#overlay-container').addClass('hide');
$('#scriptolution-soft-report').addClass('hide');
});
$('#report-submit').click(function(){
var e=0;
if($('input[name="report-reason"]:checked').val()){
if($('input[name="report-reason"]:checked').val()==4){
var x=$('#repost_link').val();
if(! (x.match('{/literal}{$baseurl}{literal}/gag/'))){ 
$('#repost_link').addClass('failed');
e=1;
}else{
$('#repost_link').removeClass('failed');
$('#repost_link').addClass('success');
};
}
}else{
e=1;
}
if(e){
return false;
}else{
var pid=$('#report_entry_id').val();
var x=$('#repost_link').val();
var n=$('input[name="report-reason"]:checked').val();
sendreport(x,n,pid);
}
});
function sendreport(x,n,pid){
jQuery.ajax({
type:'POST',
url:' {/literal}{$baseurl}{literal}'+ '/report.php',
data:'number='+n+'&repost_link='+x+'&pid=' + pid,
success:function(e){
$('#overlay-shadow').addClass('hide');
$('#overlay-container').addClass('hide');
$('#scriptolution-soft-report').addClass('hide');
}
});
}
</script>
{/literal}