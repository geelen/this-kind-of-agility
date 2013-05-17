'use strict'

angular.module('datApp')
  .controller 'MainCtrl', ($scope, EpisodeScreencaps) ->
    $scope.image = EpisodeScreencaps[0]
