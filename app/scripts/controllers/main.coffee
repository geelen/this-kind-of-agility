'use strict'

angular.module('datApp')
  .controller 'MainCtrl', ($scope, $http) ->
    $http.get('/fuckyes.json').success (data) ->
      $scope.episodes = data
