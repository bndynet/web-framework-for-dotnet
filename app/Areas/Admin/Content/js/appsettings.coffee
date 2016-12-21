appSettings = 
  appName: "Web Framework Admin"
  appShortName: "WF Admin"
  appLogoName: "<b>WF</b> Admin"
  appVersion: "v1.0"
  appCopyright: "Super-powered by <a href='http://www.bndy.net' target='_blank'>Bndy.Net</a> &copy; 2015-#{new Date().getFullYear()}, based on AdminLTE"
  
  appNotification:
    url: "/admin/api/getnotifications"
    interval: 0.5   # minutes
    more: ""     # the link to show all
    moreLabel: "View all"
    
  appMenu: url: "/admin/api/getmenus"

window.appSettings = appSettings