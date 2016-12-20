app.controller "LayoutCtrl", [
    "$scope", "$interval", "$http"
    ($scope, $interval, $http) ->
        $scope.appSettings = appSettings
        if $scope.appSettings.appNotification.url
            $interval ->
                $http.get $scope.appSettings.appNotification.url, (data) ->
                    $scope.appSettings.appNotification.data = data
            , $scope.appSettings.appNotification.interval * 60 * 1000
        if $scope.appSettings.appMenu.url
            $http.get $scope.appSettings.appMenu.url, (data) ->
                $scope.appSettings.appMenu.data = data
]