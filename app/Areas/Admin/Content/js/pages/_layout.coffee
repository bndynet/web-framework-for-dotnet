app.controller "LayoutCtrl", [
    "$scope", "$interval", "$http"
    ($scope, $interval, $http) ->
        $scope.appSettings = appSettings
        
        # set notifications
        $scope.appNotifications = []
        getNotification = ->
            $http.get $scope.appSettings.appNotification.url
                .success (data) ->
                    angular.forEach data, (item) ->
                        $scope.appNotifications.push item
                    dialog.error "You have #{data.length} messages." if data.length > 0
        if $scope.appSettings.appNotification.url
            getNotification()
            $interval ->
                getNotification()
            , $scope.appSettings.appNotification.interval * 60 * 1000
            
        # set menus
        $scope.appMenus = []
        if $scope.appSettings.appMenu.url
            $http.get $scope.appSettings.appMenu.url
                .success (data) ->
                    $scope.appMenus = data
                    $scope.menuClick($scope.appMenus[0], null) if $scope.appMenus.length > 0
        # TODO
        $scope.onNotificationClick = (item) ->
            $scope.appNotifications.splice $scope.appNotifications.indexOf(item), 1
            dialog.alert item.content, null, {title: item.title}
            
        # click menu
        $scope.activedMenus = []
        $scope.menuClick = (menu, $event) ->
            if menu.url and menu.url.indexOf("#") < 0
                m.actived = false for m in $scope.activedMenus
                menu.actived = true
                if $scope.activedMenus.indexOf(menu) < 0
                    $scope.activedMenus.push menu
            $event.stopPropagation() if $event and $($event.target).parents(".with-sidebar-horizontal").length
            
        # search on sidebar
        $scope.search = ->
            $scope.menuClick({ text: "Search", url: "/admin/home/search?q=#{$scope.searchKeywords}" }, null) if $scope.searchKeywords
                
        
            
        # destroy menu
        $scope.destoryMenu = (menu) ->
            $scope.activedMenus.splice $scope.activedMenus.indexOf(menu), 1
            $scope.activedMenus[0].actived = true if menu.actived
            
        # set tools
        $scope.tools = [
            {
                text: "Call Me"
                icon: "fa fa-phone fa-fw"
                onclick: ->
                    dialog.alert "You clicked `#{this.text}` tool."
            }
            {
                text: "Task"
                icon: "fa fa-calendar fa-fw"
                onclick: ->
                    dialog.alert "You clicked `#{this.text}` tool."
            }
        ]
            
        # log out
        $scope.logout = ->
            dialog.confirm "Are you sure you want to log out?", ->
                dialog.success "Logged out"
                location.href = "/admin/account/logout"
        
        return
]