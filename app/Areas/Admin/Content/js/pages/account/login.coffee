app.controller "LoginCtrl", [
    "$scope", "$http"
    ($scope, $http) ->
        $scope.appSettings = appSettings
        $scope.model = {} 
        $scope.login = ->
            $http.post "/admin/account/login", $scope.model
                .success (data) ->
                    console.debug data
        
        return
]