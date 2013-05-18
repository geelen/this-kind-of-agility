'use strict'

angular.module('datApp')
  .controller 'MainCtrl', ($scope, $http, $timeout) ->
    $scope.chosenEp = undefined
    $scope.randomEp = ->
      $scope.choosing = true
      $scope.chosenEp = $scope.episodes[Math.floor(Math.random() * $scope.episodes.length)]
      $timeout (-> $scope.choosing = false), 0

    $http.get('/fuckyes.json').success (data) ->
      $scope.episodes = data
      $scope.randomEp()

    count = 0
    $scope.tobiasImage = ->
      if !($scope.chosenEp && $scope.choosing)
        "url(../images/tobias-jumping.gif#2)"
      else
        "url(../images/tobias-jumping.gif#1)"
