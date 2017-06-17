app.controller "FormCtrl", [
    "$scope", "$http", "FileUploader"
    ($scope, $http, FileUploader) ->
        $scope.model =  
            select: "2"
            radio: 1
            checkbox: [1,3]
        $scope.options =
                "Option 1": 1
                "Option 2": 2
                "Option 3": 3
                
        uploader = $scope.uploader = new FileUploader({url: '/admin/file/upload'})

        uploader.filters.push 
            name: 'customFilter'
            fn: (item, options) ->
               this.queue.length < 10

        uploader.onWhenAddingFileFailed = (item, filter, options) ->
            console.info('onWhenAddingFileFailed', item, filter, options)
        uploader.onAfterAddingFile = (fileItem) ->
            console.info('onAfterAddingFile', fileItem)
        uploader.onAfterAddingAll = (addedFileItems) ->
            console.info('onAfterAddingAll', addedFileItems)
        uploader.onBeforeUploadItem = (item) ->
            console.info('onBeforeUploadItem', item)
        uploader.onProgressItem = (fileItem, progress) ->
            console.info('onProgressItem', fileItem, progress)
        uploader.onProgressAll = (progress) ->
            console.info('onProgressAll', progress)
        uploader.onSuccessItem = (fileItem, response, status, headers) ->
            console.info('onSuccessItem', fileItem, response, status, headers)
        uploader.onErrorItem = (fileItem, response, status, headers) ->
            console.info('onErrorItem', fileItem, response, status, headers)
        uploader.onCancelItem = (fileItem, response, status, headers) ->
            console.info('onCancelItem', fileItem, response, status, headers)
        uploader.onCompleteItem = (fileItem, response, status, headers) ->
            console.info('onCompleteItem', fileItem, response, status, headers)
        uploader.onCompleteAll = () ->
            console.info('onCompleteAll')

        console.info('uploader', uploader)
                
        $scope.submitForm = ->
            if $scope.form.$invalid
                dialog.error "Form is invalid"
                return
            else
                dialog.success angular.toJson $scope.model
                
                
        
        return
]