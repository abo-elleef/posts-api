'use strict';

angular.module('myApp.view1', ['ngRoute'])

    .config(['$routeProvider', function ($routeProvider) {
        $routeProvider.when('/posts', {
            templateUrl: 'view1/view1.html',
            controller: 'View1Ctrl'
        });
    }])

    .controller('View1Ctrl', function ($scope, Posts) {
        $scope.new_post = {};
        $scope.posts = []
        Posts.fetchPosts().then(function (data) {
            $scope.posts = data;
        });
        $scope.createPost = function(){
            Posts.createPost($scope.new_post).then(function (data) {
                $scope.posts.push(data);
                $scope.new_post = {};
            })
        }
    });