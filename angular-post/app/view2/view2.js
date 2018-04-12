'use strict';

angular.module('myApp.view2', ['ngRoute'])

    .config(['$routeProvider', function ($routeProvider) {
        $routeProvider.when('/posts/:id', {
            templateUrl: 'view2/view2.html',
            controller: 'View2Ctrl'
        });
    }])

    .controller('View2Ctrl', function ($scope, $routeParams, $window, Posts) {
        Posts.fetchPost($routeParams.id).then(function (data) {
            $scope.post = data
        });
        $scope.deletePost = function(id){
            Posts.deletePost(id).then(function(){
                $window.history.back();
            })
        }
    });