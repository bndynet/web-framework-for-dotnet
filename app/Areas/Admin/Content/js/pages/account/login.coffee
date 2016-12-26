app.controller "LoginCtrl", [
    "$scope", "$http"
    ($scope, $http) ->
        $scope.appSettings = appSettings
        $scope.model = {} 
        $scope.login = ->
            $scope.isLoading = true
            dialog.loading ".panel-body"
            $http.post "/admin/account/login", $scope.model
                .success (data) ->
                    console.debug data
                    $scope.isLoading = false
                    dialog.loaded ".panel-body"
                .error (rep) ->
                    dialog.error "Failed to log in.", 5
                    $scope.isLoading = false
        return
]