<!DOCTYPE html>
<html lang="en">
    <!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
    <!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
    <!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
    <!--[if gt IE 8]><!--> <html class="no-js" lang=""> <!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title><?php echo isset($title) ? $title : 'Metiz B Shipping'; ?></title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="apple-touch-icon" href="apple-touch-icon.png">
    <link rel="stylesheet" href="<?php echo base_url("assets/css/bootstrap.css"); ?>" />
    <link rel="stylesheet" href="<?php echo base_url("assets/css/custom.css"); ?>" />
    <script type="text/javascript" src="<?php echo base_url("assets/js/jquery-1.12.3.min.js"); ?>"></script>
	<script type="text/javascript" src="<?php echo base_url("assets/js/jquery.validate.min.js"); ?>"></script>
	  <script src='https://ajax.googleapis.com/ajax/libs/angularjs/1.6.1/angular.min.js'></script>
    

	
	    <script src="<?=base_url("assets/js/jquery.min.js"); ?>" type="text/javascript" ></script>
		<script type="text/javascript" src="<?php echo base_url("assets/js/jquery-ui.min.js"); ?>"></script>
		<script type="text/javascript" src="<?php echo base_url("assets/js/jquery.validate.min.js"); ?>"></script>
		<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
		<script type="text/javascript" src="<?php echo base_url("assets/js/bootstrap.min.js"); ?>"></script>
	
</head>
<body>

   <div ng-app="myApp" ng-controller="personCtrl">
   <p>The name is {{ lastName | currency }}</p>
   <p><input type="text" ng-model="test"></p>

   <ul>
   <li ng-repeat="x in onlynames | filter: test">
    {{ x }}
  </li>
  </ul>

  <table border="1" width="100%">
  <tr>
    <th ng-click="orderByMe('name')">Name</th>
    <th ng-click="orderByMe('country')">Country</th>
  </tr>
  <tr ng-repeat="x in names | orderBy:myOrderBy">
    <td>{{x.name}}</td>
    <td>{{x.country}}</td>
  </tr>
  
  
  <select ng-model="selectedCar">
		<option ng-repeat="x in cars" value="{{x.model}}">{{x.model}}</option>
  </select>
  
  <h1>You selected: {{selectedCar}}</h1>
  
</table>





</div>
 
    


		
<script>	
// angular.module('myApp', []).controller('personCtrl', function($scope) {
    // $scope.firstName = "John",
    // $scope.lastName = "monikmammdkjwd"
// });

angular.module('myApp',[]).controller('personCtrl',function($scope){
	$scope.onlynames = [
        'Jani',
        'Carl',
        'Margareth',
        'Hege',
        'Joe',
        'Gustav',
        'Birgit',
        'Mary',
        'Kai'
    ];
	$scope.lastName=56
	
	
	$scope.names = [	
    {name:'Jani',country:'Norway'},
    {name:'Carl',country:'Sweden'},
    {name:'Margareth',country:'England'},
    {name:'Hege',country:'Norway'},
    {name:'Joe',country:'Denmark'},
    {name:'Gustav',country:'Sweden'},
    {name:'Birgit',country:'Denmark'},
    {name:'Mary',country:'England'},
    {name:'Kai',country:'Norway'}
    ];
  $scope.orderByMe = function(x) {
	//  console.log(x);
    $scope.myOrderBy = x;
  }
  
    $scope.cars = [
        {model : "Ford Mustang", color : "red"},
        {model : "Fiat 500", color : "white"},
        {model : "Volvo XC90", color : "black"}
    ];
});
</script>
</body>