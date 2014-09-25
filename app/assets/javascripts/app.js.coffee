#Hangman controller

UserApp = angular.module("UserApp", ["ngRoute", "templates"])

#Setup the angular router

UserApp.config ["$routeProvider", "$locationProvider", ($routeProvider, $locationProvider) ->
	$routeProvider
		.when '/',
			templateUrl: "index.html",
			controller: "TodoCtrl"
		.when '/signup',
			templateUrl: "signup.html",
			controller: "SignupCtrl"
		.when '/login',
			templateUrl: "login.html",
			controller: "LoginCtrl"

	.otherwise
		redirectTo: "/"

	$locationProvider.html5Mode(true)
]


UserApp.config ["$httpProvider", ($httpProvider)->

]
# UserApp.run ["$rootScope", "$location", ($rootScope, $location)->
# 	$rootScope.$on("$routeChangeStart", (event, next, current)->
# 		debugger;
# 		if $rootScope.loggedInuser == undefined
# 			if next.templateUrl == "login.html" || next.templateUrl == "signup.html"
# 			else
# 				$location.path("/login")
# 	)
# ]



UserApp.controller "LoginCtrl", ["$scope", "$location", "$rootScope",($scope, $location, $rootScope) ->
	$scope.login = ->
		$http.get = ->
		$rootScope.loggedInuser = $scope.user
		$location.path '/'
		return
]



UserApp.controller "SignupCtrl", ["$scope","$http", ($scope, $http) ->
	$scope.create = ->
		console.log($scope.user)
		$http.post("/users.json", {user: $scope.user})
		.success (data)->
			console.log data
]
UserApp.controller "TodoCtrl", ["$scope", ($scope) ->
	$scope.todoitems = [];
]











#Define Config for CSRF token
UserApp.config ["$httpProvider", ($httpProvider)->
  $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
]