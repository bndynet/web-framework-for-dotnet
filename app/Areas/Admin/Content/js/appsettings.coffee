"use strict"

#moment.locale "zh-cn" if moment?

appSettings = 
  appName: "Web Framework Admin"
  appShortName: "WF Admin"
  appLogoName: "<b>WF</b> Admin"
  appVersion: "v1.0"
  appCopyright: "Super-powered by <a href='http://www.bndy.net' target='_blank'>Bndy.Net</a> &copy; 2015-#{new Date().getFullYear()}, based on AdminLTE"
  
  appNotification:
    url: "/admin/api/getnotifications"
    interval: 0.5   # minutes
    more: "#"     # the link to show all
    moreLabel: "View all"
    
  appMenu: url: "/admin/api/getmenus"

window.appSettings = appSettings


 # dialog
if typeof dialog isnt "undefined"
    dialog.set 
        title: appSettings.appShortName
        shade: [0.2, "#000"]
        shadeClose: false
        shift: 0    # 0-9
        maxmin: true
        fix: true
        btn: ["OK", "Cancel"]
        closeBtn: 1     #0-2
        tips: [1, "#f0ad4e"]
        tipsTime: 3000
        loadingIcon: 1      #0-2
        loadingShade: [0.6, "#fff"]
        useAlertify: true
        wait: 0

$ ->

    $("textarea.html").wysihtml5() if $.fn.wysihtml5
    
    if $.fn.datepicker
        $(".date").datepicker
#            language: "zh-CN"
#            format: "yyyy-mm-dd"
            todayHighlight: true
            autoclose: true
    
    if moment?
        $(".daterange").daterangepicker 
#            locale:
#                format: "YYYY-MM-DD"
#                separator: " 至 "
#                applyLabel: "确定"
#                cancelLabel: "取消"
#                customRangeLabel: "自定义"
            ranges: 
#                "今日": [moment(), moment()]
#                "昨日": [moment().subtract(1, "days"), moment().subtract(1, "days")]
#                "最近7日": [moment().subtract(6, "days"), moment()]
#                "最近30日": [moment().subtract(29, "days"), moment()]
#                "本月": [moment().startOf("month"), moment().endOf("month")]
#                "上个月": [moment().subtract(1, "month").startOf("month"), moment().subtract(1, "month").endOf("month")]
                "Today": [moment(), moment()]
                "Yesterday": [moment().subtract(1, "days"), moment().subtract(1, "days")]
                "Last 7 Days": [moment().subtract(6, "days"), moment()]
                "Last 30 Days": [moment().subtract(29, "days"), moment()]
                "This Month": [moment().startOf("month"), moment().endOf("month")]
                "Last Month": [moment().subtract(1, "month").startOf("month"), moment().subtract(1, "month").endOf("month")]
#            startDate: moment().subtract(29, "days")
#            endDate: moment()
            , (start, end) ->
                # nothing to do
              
    # iCheck, iRadio
    if $.fn.iCheck
        $("input:checkbox, input:radio").iCheck 
            checkboxClass: "icheckbox_minimal"
            radioClass: "iradio_minimal"
            increaseArea: "20%" # optional
            
    # jquery slimscroll
    if $.fn.slimScroll
        $('.slim-scroll').each ->
            $(this).slimScroll height: $(this).height()
                
    # read-only form
    $("form.readonly").find("input,select,button").each ->
        tag = $(this)[0].tagName
        tagType = $(this).attr "type"
        val = ""
        switch tag
            when "INPUT"
                $(this).attr "readonly", true
                $(this).attr "disabled", true
                switch tagType
                    when "radio", "checkbox"
                        wrapper = $(this).parent()
                        wrapper = wrapper.parent() if wrapper.parent().hasClass "checkbox" or wrapper.parent().hasClass "radio"
                        if $(this).is ":checked"
                            val = wrapper.text()
                            wrapper.after "<div class='form-control-static'>#{val}</div>"
                        wrapper.remove()
                    when "file"
                        wrapper = $(this).parents('.form-group')
                        wrapper.remove()
                    else
                        val = $(this).val()
                        $(this).after "<div class='form-control-static'>#{val}</div>"
                        $(this).remove()
            when "SELECT"
                val = $(this).val()
                $(this).after "<div class='form-control-static'>#{val}</div>"
                $(this).remove()
    $("form.readonly:not(:visible)").show()
    
    return
    