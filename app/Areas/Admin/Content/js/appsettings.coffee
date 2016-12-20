appSettings = 
  appName: "Web Framework Admin"
  appShortName: "WF Admin"
  appLogoName: "<b>WF</b> Admin"
  appVersion: "v1.0"
  appCopyright: "Super-powered by <a href='http://www.bndy.net' target='_blank'>Bndy.Net</a> &copy; 2015-#{new Date().getFullYear()}, based on AdminLTE"
  
  appNotification:
    url: ""
    interval: 0.5   # minutes
    more: ""        # the link to show all
    data: [ 
        {url: "http://www.bndy.net", text: "5 new members joined today", icon: "fa fa-users text-aqua"}
        {url: "", text: "no link", icon: "fa fa-users text-yellow"}
        {url: "http://www.bndy.net", text: "no icon", icon: "fa fa-fw"}
        {url: "http://www.bndy.net", text: "5 new members joined today", icon: "fa fa-users text-aqua"}
        {url: "http://www.bndy.net", text: "5 new members joined today", icon: "fa fa-users text-green"}
    ]
    
  appMenu:
    url: ""
    data: [
        {url: "/home", text: "My Home", icon: "fa fa-home fa-fw"}
        {url: "/dashboard", text: "Dashboard", icon: "fa fa-dashboard fa-fw"}
        {url: "", text: "Level 1", icon: "fa fa-tags fa-fw", children: [
            {url: "", text: "Level 2-A", icon: "fa fa-tag fa-fw", children: [
                {url: "", text: "Level 3-A", icon: "fa fa-tag fa-fw", label: 5, labelClass: "label-success"}
            ]}
            {url: "", text: "Level 2-B", icon: "fa fa-tag fa-fw", label: 3}
            {url: "", text: "Level 2-C", icon: "fa fa-tag fa-fw", label: "new", labelClass: "label-primary"}
            {url: "", text: "Level 2-D", icon: "fa fa-tag fa-fw"}
            {url: "", text: "Level 2-E", icon: "fa fa-tag fa-fw"}
            {url: "", text: "Level 2-F", icon: "fa fa-tag fa-fw"}
        ]}
    ]


window.appSettings = appSettings