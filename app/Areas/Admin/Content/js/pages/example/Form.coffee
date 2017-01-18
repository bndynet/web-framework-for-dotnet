app.controller "FormCtrl", [
    "$scope", "$http"
    ($scope, $http) ->
        $scope.model =  
            select: "2"
            radio: 1
            checkbox: [1,3]
        $scope.options =
                "Option 1": 1
                "Option 2": 2
                "Option 3": 3
        $scope.submitForm = ->
            if $scope.form.$invalid
                dialog.error "Form is invalid"
                return
            else
                dialog.success angular.toJson $scope.model
        return
]