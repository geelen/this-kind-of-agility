'use strict'

angular.module('datApp')
  .controller 'MainCtrl', ($scope, EpisodeScreencaps) ->
    $scope.demImages = EpisodeScreencaps
