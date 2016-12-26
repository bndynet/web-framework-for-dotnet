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
        # TODO
        $scope.onNotificationClick = (item) ->
            $scope.appNotifications.splice $scope.appNotifications.indexOf(item), 1
            dialog.alert item.title
        #TODO: Logout
        $scope.logout = ->
            dialog.confirm "Are you sure you want to log out?", ->
                dialog.success "Logged out"
                location.href = "/admin/account/logout"
        
        return
]