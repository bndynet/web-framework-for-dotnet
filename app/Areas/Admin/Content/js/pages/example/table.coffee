app.controller "TableCtrl", [
    "$scope", "$http"
    ($scope, $http) ->
        $scope.search = (p) ->
            $http.get "search?page=#{p}&pagesize=10"
            .success (d) ->
                $scope.model = d
        $scope.search 1
        
        $scope.remove = (item) ->
            dialog.confirm "Are you sure you want to remove this item?", ->
                $scope.$apply ->
                    $scope.model.data.splice $scope.model.data.indexOf(item), 1
            # $scope.search $scope.model.currentPage
]