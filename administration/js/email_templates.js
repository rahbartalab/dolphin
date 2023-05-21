
function getTranslations(oSelect) {
    var iLangId = $(oSelect).val();
    var sTemplName = $(oSelect).attr('name').replace('_Language', '');
    
    $('#adm-email-loading').bx_loading();
    
    $.post(
        sAdminUrl + 'email_templates.php',
        {
            action: 'get_translations',
            lang_id: iLangId,
            templ_name: sTemplName
        },
        function(oResult) {
            $('#adm-email-loading').bx_loading();
            
            $("[name='" + sTemplName + "_Subject']").val(oResult.subject);
            $("[name='" + sTemplName + "_Body']").val(oResult.body);
        },
        'json'
    );
}

function onChangeType(oLink) {
    var $this = this;
    var sType = $(oLink).attr('id').replace('adm-etempl-btn-', '');
    var sName = '#adm-etempl-cnt-' + sType;
    
    $(oLink).parent('.notActive').hide().siblings('.notActive:hidden').show().siblings('.active').hide().siblings('#' + $(oLink).attr('id') + '-act').show();
    $(sName).siblings('div:visible').bx_anim('hide', 'fade', 'slow', function(){
        $(sName).bx_anim('show', 'fade', 'slow');
    });
}
