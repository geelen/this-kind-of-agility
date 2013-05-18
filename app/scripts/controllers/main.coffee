'use strict'

angular.module('datApp')
  .controller 'MainCtrl', ($scope, $http, $timeout) ->
    $scope.chosenEp = undefined
    $scope.randomEp = ->
      $scope.choosing = true
      $timeout (-> $scope.chosenEp = $scope.episodes[Math.floor(Math.random() * $scope.episodes.length)]), 300
      $timeout (-> $scope.choosing = false), 1000

    $http.get('/fuckyes.json').success (data) ->
      $scope.episodes = data
      $scope.randomEp()

    count = 0
