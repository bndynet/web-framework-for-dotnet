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
                    if data.status > 0
                        location.href = "/admin/home/index"
                    else
                        dialog.error "Failed to log in.", 5
                    $scope.isLoading = false
                    dialog.loaded ".panel-body"
                .error (rep) ->
                    dialog.error "Request Error", 5
                    $scope.isLoading = false
                    dialog.loaded ".panel-body"
        return
]