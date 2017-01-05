app.controller "FormCtrl", [
    "$scope", "$http"
    ($scope, $http) ->
        $scope.formModel = {} 
        $scope.submitForm = ->
            if $scope.form.$invalid
                dialog.error "Form is invalid"
                return
            else
                dialog.success angular.toJson $scope.formModel
        return
]