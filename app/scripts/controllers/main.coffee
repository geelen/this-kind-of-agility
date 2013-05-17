'use strict'

angular.module('datApp')
  .controller 'MainCtrl', ($scope, $http, $timeout) ->
    randomEp = ->
      $scope.chosenEp = $scope.episodes[Math.floor(Math.random() * $scope.episodes.length)]

    $http.get('/fuckyes.json').success (data) ->
      $scope.episodes = data
      randomEp()

    $scope.anotherEp = ->
      $scope.chosenEp = undefined
      $timeout(randomEp, 1000)
    $scope.seasonNr = ->

