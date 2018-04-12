angular.module('myApp').service('Posts', function ($http) {
    var baseUrl = 'http://0.0.0.0:3000/';
    var apiPrefix = 'api/v1/';
    var fetchPosts = function () {

        return $http.get(baseUrl + apiPrefix+ 'posts').then(function (response) {
            return response.data
        })
    };
    var fetchPost = function(id){
        path = 'posts/' + id
        return $http.get(baseUrl + apiPrefix + path).then(function (response) {
            console.log(response)
            return response.data
        })
    };
    var deletePost = function(id){
        path = 'posts/' + id;
        return $http.delete(baseUrl + apiPrefix+  path).then(function (response) {
            console.log(response)
        })
    };
    var createPost = function(attributes){
        return $http.post(baseUrl +  'posts', {post: attributes}).then(function (response) {
            console.log(response)
            return response.data;

        })
    };
    return {
        fetchPosts: fetchPosts,
        fetchPost: fetchPost,
        deletePost: deletePost,
        createPost: createPost,
    }

});
