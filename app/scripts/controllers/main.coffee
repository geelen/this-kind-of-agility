'use strict'

angular.module('datApp')
  .controller 'MainCtrl', ($scope, $http, $timeout) ->
    $scope.tobiases = [1]
    $scope.chosenEp = undefined
    $scope.randomEp = ->
      $scope.choosing = true
      $scope.chosenEp = $scope.episodes[Math.floor(Math.random() * $scope.episodes.length)]
      $scope.tobiases = []
      $timeout (->
        $scope.choosing = false
        $scope.tobiases = [1]
      ), 1000

    $http.get('/fuckyes.json').success (data) ->
      $scope.episodes = data
      $scope.randomEp()

    count = 0
    $scope.tobiases = [1]
