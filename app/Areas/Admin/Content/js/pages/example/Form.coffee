app.controller "FormCtrl", [
    "$scope", "$http"
    ($scope, $http) ->
        $scope.model = {} 
        $scope.submitForm = ->
            if $scope.form.$invalid
                dialog.error "Form is invalid"
                return
            else
                dialog.success angular.toJson $scope.model
        return
]