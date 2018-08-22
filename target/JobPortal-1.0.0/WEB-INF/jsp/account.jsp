<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="/WEB-INF/jsp/includes.jsp"%> 
<html ng-app="app">
<style>
#myProgress {
  position: relative;
  width: 100%;
  height: 30px;
  background-color: #ddd;
}

#myBar {
  position: absolute;
  width: 1%;
  height: 100%;
  background-color: #4CAF50;
}
</style>
<script src="<c:url value="/resources/js/angular.js" />"></script> 
<!-- <script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-83848321-1', 'auto');
  ga('send', 'pageview');

</script> -->
<script>
function move() {
  var elem = document.getElementById("myBar");
  var width = 1;
  var id = setInterval(frame, 10);
  function frame() {
    if (width >= 100) {
      clearInterval(id);
    } else {
      width++;
      elem.style.width = width + '%';
    }
  }
}
</script>
<script> 
window["adrum-app-key"] = "AD-AAB-AAD-EMT";
    window['adrum-start-time']= new Date().getTime(); 

</script> 

<script src="https://cdn.appdynamics.com/adrum/adrum-latest.js"/>
 <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.3/angular.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.3/angular-touch.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.3/angular-animate.js"></script>
<script src="http://ui-grid.info/docs/grunt-scripts/csv.js"></script>
<script src="http://ui-grid.info/docs/grunt-scripts/pdfmake.js"></script>
<script src="http://ui-grid.info/docs/grunt-scripts/vfs_fonts.js"></script>
<script src="<c:url value="/resources/js/ngDialog.js" />"></script>

<link href="<c:url value="/resources/css/ngDialog.css" />" rel="stylesheet">

<link href="<c:url value="/resources/css/ngDialog-custom-width.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/ngDialog-theme-default.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/ngDialog-theme-plain.css" />" rel="stylesheet">




<script src="https://cdnjs.cloudflare.com/ajax/libs/angular-ui-grid/3.2.6/ui-grid.js"></script>
<link rel="stylesheet" type="text/css" href=" https://cdnjs.cloudflare.com/ajax/libs/angular-ui-grid/3.2.6/ui-grid.css"/>
<script type="text/javascript">

var app = angular.module('app', ['ngTouch', 'ui.grid' , 'ngDialog','ui.bootstrap']);



app.factory('UserInfoService' , ['$rootScope' , '$http' , '$q' , '$location', function($rootScope,$http  , $q ,$location) 
{

	var x=localStorage.getItem("base_url_openshift");
	var x1=localStorage.getItem("base_url_localtomcat");
	var x2=localStorage.getItem("base_url_local");
	console.log(x);
	console.log(x1);
	console.log(x2);
	var base_url = x1;
	//var base_url='http' + '://' +$location.host()+':'+'8080'+'/'+'JobPortal-1.0.0/';////For the sake of local tomcat...
return {
	getAllUserInfoServiceData: function () {
            
            var req = {
                method: 'GET',
                url: base_url+'allusersinfo'
       };

            return $http(req).then(function (result) {
                
                return result.data;
            });
        },
        updateDataToServer : function (body) {
            
            var req = {
                method: 'PUT',
                data : body ,
                url: base_url+'updateAccountInformation'
            };

            return $http(req).then(function (result) {
                
                return result.data;
            });
        },
        
        createDataToServer : function (body) {
            
            var req = {
                method: 'POST',
                data : body ,
                url: base_url+'create'
            };

            return $http(req).then(function (result) {
                
                return result.data;
            });
        },
        getLoggedInEmailAddress : function (body) {
           
            var req = {
                method: 'GET',
                data : body ,
                url: base_url+'getLoggedInMailAdd'
            };

            return $http(req).then(function (result) {
                
                return result;
            });
        },
        getLoggedInAccountDetails : function (body) {
            
            var req = {
                method: 'GET',
                data : body ,
                url: base_url+'regUserInfo'
            };

            return $http(req).then(function (result) {
                
                return result.data;
            });
        },
        getUniqueUserId: function (body) {
            
            var req = {
                method: 'GET',
                data : body ,
                url: base_url+'getNewUserId'
            };

            return $http(req).then(function (result) {
                
                return result;
            });
        }
       
        
        
};
}]);
  

app.controller('UserInfoCtrl', ['$scope','UserInfoService','ngDialog', function ($scope,UserInfoService,ngDialog) {
$scope.hideUpdateInTheBeginninng = true;
	ngDialog.open({
        template: '<div class="ngdialog-buttons"><label>Please update all the Details Correctly.<BR/>Thank you.</label><button class="ngdialog-button ngdialog-button-primary" data-ng-click="closeThisDialog()">Ok</button></div>',
        plain: true,
        showclose: false
      });

$scope.showEducationalDiv = function(){
	document.getElementById('education').style.display = "block";
	$scope.hideOnShowEdDiv=true;
	
};

$scope.showEmpDiv = function(){
	 document.getElementById('employment').style.display = "block";
	 $scope.hideOnShowEmpDiv=true;
		ngDialog.open({
	        template: '<div class="ngdialog-buttons"><label>If you are a fresher or <br/>not employed earlier leave it as is..<BR/></label><button class="ngdialog-button ngdialog-button-primary" data-ng-click="closeThisDialog()">Ok</button></div>',
	        plain: true,
	        showclose: false
	      });
	
};
	
$scope.successShow = false;
$scope.usersInfo=[];
$scope.id="";
$scope.title="";
$scope.email="";
$scope.firstname="";
$scope.lastname="";
$scope.housenumber="";
$scope.street="";
$scope.city="";
$scope.country="";
$scope.postcode="";
$scope.nationality="";
$scope.contactnumber="";
$scope.highesteduqual="";
$scope.experience="";
$scope.primaryskill="";
$scope.interests="";
$scope.strengths="";
$scope.weaknesses="";
$scope.nativelanguage="";
$scope.intlangkn="";
$scope.aboutself="";


$scope.specgrad="";
$scope.gradfrom="";
$scope.gradyear="";
$scope.cgpgrad="";
$scope.specinter="";
$scope.interfrom="";
$scope.interyear="";
$scope.cgpinter="";
$scope.specschool="";
$scope.schoolfrom="";
$scope.schoolyear="";
$scope.cgpschool="";
$scope.certifications="";
$scope.recentemp="Not Applicable";
$scope.lastdesig="Not Applicable";
$scope.lastdomain="Not Applicable";
$scope.lasttoolsused="Not Applicable";
$scope.lastresps="Not Applicable";
$scope.currentctc="Not Applicable";
$scope.expectedctc="Not Applicable";
$scope.achievements="Not Applicable";
$scope.expectedwork="Not Applicable";


$scope.userinfo = 
{
		  "id":$scope.id,
		  "title":$scope.title,
		  "firstname":$scope.firstname,
		  "lastname":$scope.lastname,
		  "housenumber":$scope.housenumber,
		  "street":$scope.street,
		  "city":$scope.city,
		  "country":$scope.country,
		  "postcode":$scope.postcode,
		  "nationality":$scope.nationality,
		  "contactnumber":$scope.contactnumber,
		  "highesteduqual":$scope.highesteduqual,
		  "experience":$scope.experience,
		  "primaryskill":$scope.primaryskill,
		  "interests":$scope.interests,
		  "strengths":$scope.strengths,
		  "weaknesses":$scope.weaknesses,
		  "nativelanguage":$scope.nativelanguage,
		  "intlangkn":$scope.intlangkn,
		  "aboutself":$scope.aboutself,

		  "specgrad":$scope.specgrad,
		  "gradfrom":$scope.gradfrom,
		"gradyear":$scope.gradyear,
		"cgpgrad":$scope.cgpgrad,
		"specinter":$scope.specinter,
		"interfrom":$scope.interfrom,
		"interyear":$scope.interyear,
		"cgpinter":$scope.cgpinter,
		"specschool":$scope.specschool,
		"schoolfrom":$scope.schoolfrom,
		"schoolyear":$scope.schoolyear,
		"cgpschool":$scope.cgpschool,
		"certifications":$scope.certifications,
		"recentemp":$scope.recentemp,
		"lastdesig":$scope.lastdesig,
		"lastdomain":$scope.lastdomain,
		"lasttoolsused":$scope.lasttoolsused,
		"lastresps":$scope.lastresps,
		"currentctc":$scope.currentctc,
		"expectedctc":$scope.expectedctc,
		"achievements":$scope.achievements,
		"expectedwork":$scope.expectedwork
}
			


var mycolumn =[
{name:'id' , displayName : 'Id' ,enableFiltering : true , width : 100},
 {name:'email' , displayName : 'Email Id' ,enableFiltering : true , width : 100}, 
{name:'title' , displayName : 'Title' ,enableFiltering : true , width : 100},
{name:'firstname' , displayName : 'firstname' ,enableFiltering : true , width : 100},
{name:'lastname' , displayName : 'lastname' ,enableFiltering : true , width : 100},
{name:'housenumber' , displayName : 'housenumber' ,enableFiltering : true , width : 100},
{name:'street' , displayName : 'street' ,enableFiltering : true , width : 100},
{name:'city' , displayName : 'city' ,enableFiltering : true , width : 100},
{name:'country' , displayName : 'country' ,enableFiltering : true , width : 100},
{name:'postcode' , displayName : 'postcode' ,enableFiltering : true , width : 100},
{name:'nationality' , displayName : 'nationality' ,enableFiltering : true , width : 100},
{name:'contactnumber' , displayName : 'contactnumber' ,enableFiltering : true , width : 100},
{name:'highesteduqual' , displayName : 'highesteduqual' ,enableFiltering : true , width : 100},
{name:'experience' , displayName : 'experience' ,enableFiltering : true , width : 100},
{name:'primaryskill' , displayName : 'primaryskill' ,enableFiltering : true , width : 100},
{name:'interests' , displayName : 'interests' ,enableFiltering : true , width : 100},
{name:'strengths' , displayName : 'strengths' ,enableFiltering : true , width : 100},
{name:'weaknesses' , displayName : 'weaknesses' ,enableFiltering : true , width : 100},
{name:'nativelanguage' , displayName : 'nativelanguage' ,enableFiltering : true , width : 100},
{name:'intlangkn' , displayName : 'intlangkn' ,enableFiltering : true , width : 100},
{name:'aboutself' , displayName : 'aboutself' ,enableFiltering : true , width : 100}
];
$scope.gridOptions = {
			    data : 'usersInfo',
			   enableFiltering: true,
			  paginationPageSizes: [25, 50, 75],
			    paginationPageSize: 25,
			    columnDefs: mycolumn,
			    enableGridMenu: true,
			    editableOnFocus:true,
			    enableSelectAll: true,
			    exporterCsvFilename: 'Users Info.csv',
			    exporterPdfDefaultStyle: {fontSize: 9},
			    exporterPdfTableStyle: {margin: [30, 30, 30, 30]},
			    exporterPdfTableHeaderStyle: {fontSize: 10, bold: true, italics: true, color: 'red'},
			    exporterPdfHeader: { text: "Users Info", style: 'header' },
			    exporterPdfFooter: function ( currentPage, pageCount ) {
			      return { text: currentPage.toString() + ' of ' + pageCount.toString(), style: 'footerStyle' };
			    },
			    exporterPdfCustomFormatter: function ( docDefinition ) {
			      docDefinition.styles.headerStyle = { fontSize: 22, bold: true };
			      docDefinition.styles.footerStyle = { fontSize: 10, bold: true };
			      return docDefinition;
			    },
			    exporterPdfOrientation: 'portrait',
			    exporterPdfPageSize: 'LETTER',
			    exporterPdfMaxGridWidth: 500,
			    exporterCsvLinkElement: angular.element(document.querySelectorAll(".custom-csv-link-location")),
			    onRegisterApi: function(gridApi){
			      $scope.gridApi = gridApi;
			    }
};
			  
$scope.titles =
	  ["Ms", "Mr"];

$scope.titldata = {"option1":"Mr",
					"option2":"Mr/Mrs"
				  };


$scope.states = ['kurnool,Andhra Pradesh', 'hyderabad,Telangana', 'bangalore,Karnataka', 'vizag,Andhra Pradesh', 'kadapa,Andhra Pradesh', 'nandyala,Andhra Pradesh', 'Emmiganur,Andhra Pradesh',
                 'Bheemavaram,Andhra Pradesh', 'Vijayawada,Andhra Pradesh', 'Rajahmundry,Andhra Pradesh','Agra,Uttar Pradesh','Kanpur,Uttar Pradesh','Bhopal,Madhya Prradesh',
                 'Chennai,Tamil Nadu','Coimbattore,Tamil Nadu','MTV Puram,Tamil Nadu','Kerala','Gujarat','J&K','Rajasthan','Delhi,NCR','Noida,NCR','Gurgaon,NCR'];


$scope.nationalitys=['INDIAN','CHINESE','AMERICAN','DEUTCHEN','JAPANESE','OTHER'];
$scope.highesteduquals=['B-TECH','BE','BSC','MSC','PHD','INTERMEDIATE','M-TECH','BCOM','MCOM','BBA','MBA','DOCTORATE','OTHER GRADUATE','OTHER POSTGRADUATE','TENTH'];
$scope.experiences=['1','2','3','4','5','6','7','8','9','10','11','12','13','>13'];
$scope.primaryskills=['JAVA','TEACHING','RESEARCH','ECLIPSE','JENKINS','TESTING','SOFTWARE DEVELOPMENT','AUTOMATION TESTING','MARKETING','CLIENT RELATIONS','ENGINEERING',
                      'DESIGNING','OTHER'];
$scope.interestss=['CODING','PLAYING FOOTBALL','READING BOOKS','CHESS','OBSERVATIONS','PUBLIC SPEAKING','BLOGS','CHATTING','BROWSING','WRITING BLOGS','SOCIAL HELP','OTHER'];
$scope.countries=['INDIA','USA','GERMANY','FRANCE','BANGALADESH','CHINA','NEPAL','U.K','SRILANKA'];
$scope.currentctcs=['1lakhs to 3lakhs','3lakhs to 5lakhs','5lakhs to 6lakhs','6lakhs to 9lakhs','9lakhs to 12lakhs'];
$scope.expectedctcs=['1lakhs','3lakhs','5lakhs','6lakhs','7lakhs','8lakhs','9lakhs','10lakhs','12lakhs','15lakhs'];
$scope.intlangkns=['GERMAN,ENGLISH,FRENCH','ENGLISH','SPANISCH,GERMAN,ENGLISH','FRENCH,GERMAN','JAPANESE,ENGLISH','CHINESE,ENGLISH','OTHER','GERMAN,ENGLISH','ENGLISH,FRENCH'];
$scope.nativelanguages=['TELUGU','KANNADA','MALAYALAM','TAMIL','HINDI','BENGALI','BHOJPURI','MARATHI','GUJARATHI','KASHMIRI'];
$scope.gradfroms=['DEI(DEEMED UNIVERSITY),AGRA','GPULLAREDDY ENGINEERING COLLEGE,KURNOOL','G.PULLAYA ENGINEERING COLLEGE,KURNOOL','BITS,KURNOOL','BITS,DELHI','IIT,DELHI','NIIT,DELHI','IIT,KANPUR','OTHER'];
$scope.schoolyears = ['1995','1996','1997','1998','1999','2000','2001','2002','2003','2004','2005','2006','2007','2008','2009','2010','2011','2012','2013','2014','2015','2016','2017','2018','2019','2020'];


$scope.upDataToServer = function(updatedJsonStr){
	
	UserInfoService.createDataToServer(updatedJsonStr).
	then(function (data) {
		
		$scope.usersInfo=data;
		
	      ngDialog.open({
	            template: '<div class="ngdialog-buttons"><label>Data Successfully Inserted</label><button class="ngdialog-button ngdialog-button-primary" data-ng-click="closeThisDialog()">Ok</button></div>',
	            plain: true,
	            showclose: false
	          });
	      $scope.successShow = true;
		  $scope.hideUpdateInTheBeginninng=false;   

	});

	};
	$scope.upDataToServerUpdate = function(updatedJsonStr){
		
		UserInfoService.updateDataToServer(updatedJsonStr).
		then(function (data) {
			
			$scope.usersInfo=data;
			
		      ngDialog.open({
		            template: '<div class="ngdialog-buttons"><label>Data Successfully updated</label><button class="ngdialog-button ngdialog-button-primary" data-ng-click="closeThisDialog()">Ok</button></div>',
		            plain: true,
		            showclose: false
		          });
		      $scope.successShow = true;
			      

		});

		};
	

$scope.getLoggedInEmailAddress = function(){
	
	UserInfoService.getLoggedInEmailAddress().
    then(function (data)
	 {
   	 console.log(JSON.stringify(data));
      if(data.length == 0)
      {
    	  $scope.successShow = false;
      }
      
      $scope.email = data.data.username;
      $scope.firstname=data.data.firstname;
      $scope.contactnumber=data.data.contactnumber;
     
        
    });
	
};

$scope.getLoggedInAccountDetails = function()
{
	UserInfoService.getLoggedInAccountDetails().
	then(function(data){
	if(data.length == 0)
		{
		$scope.successShow=false;
		}
	else
		{
		move();
		
		$scope.title=data[0].title;
		$scope.firstname=data[0].firstname;
		$scope.lastname = data[0].lastname;
		$scope.housenumber=data[0].housenumber;
		$scope.street=data[0].street;
		$scope.city=data[0].city;
		$scope.country=data[0].country;
		$scope.postcode=data[0].postcode;
		$scope.nationality=data[0].nationality;
		$scope.contactnumber=data[0].contactnumber;
		$scope.highesteduqual=data[0].highesteduqual;
		$scope.experience=data[0].experience;
		$scope.primaryskill=data[0].primaryskill;
		$scope.interests=data[0].interests;
		$scope.strengths=data[0].strengths;
		$scope.weaknesses=data[0].weaknesses;
		$scope.nativelanguage=	data[0].nativelanguage;
		$scope.intlangkn=data[0].intlangkn;
		$scope.aboutself=data[0].aboutself;
		$scope.specgrad=data[0].specgrad;
		$scope.gradfrom=data[0].gradfrom;
		$scope.gradyear=data[0].gradyear;
		$scope.cgpgrad=data[0].cgpgrad;
		$scope.specinter=data[0].specinter;
		$scope.interfrom=data[0].interfrom;
		$scope.interyear=data[0].interyear;
		$scope.cgpinter=data[0].cgpinter;
		$scope.specschool=data[0].specschool;
		$scope.schoolfrom=data[0].schoolfrom;
		$scope.schoolyear=data[0].schoolyear;
		$scope.cgpschool=data[0].cgpschool;
		$scope.certifications=data[0].certifications;
		$scope.recentemp=data[0].recentemp;
		$scope.lastdesig=data[0].lastdesig;
		$scope.lastdomain=data[0].lastdomain;
		$scope.lasttoolsused=data[0].lasttoolsused;
		$scope.lastresps=data[0].lastresps;
		$scope.currentctc=data[0].currentctc
		$scope.expectedctc=data[0].expectedctc;
		$scope.achievements=data[0].achievements;
		$scope.expectedwork=data[0].expectedwork;






		
		$scope.successShow=true;


		}
	
	
		});
	
}


$scope.saveAccInfo = function()
{
	if($scope.title=="" || $scope.firstname=="" || $scope.email==""||
		$scope.lastname==""|| $scope.housenumber==""||$scope.street==""||
		$scope.city =="" ||$scope.country ==""||$scope.postcode ==""||$scope.nationality==""||
		$scope.contactnumber ==""||$scope.highesteduqual==""||
		$scope.experience ==""||$scope.primaryskill ==""||$scope.interests ==""||
		$scope.strengths ==""||$scope.weaknesses ==""||$scope.nativelanguage ==""||
		$scope.intlangkn==""||
		$scope.aboutself=="" || $scope.specgrad=="")
		{
		

		
		return;
		}
	else
	{
		 ngDialog.openConfirm({
	         template:
	             '<p>Are you sure you want to save the information ?<br/>Dont worry..You ca update it later if needed.</p>' +
	             '<div>' +
	               '<button type="button" class="btn btn-default" ng-click="closeThisDialog(0)">No&nbsp;' +
	               '<button type="button" class="btn btn-primary" ng-click="confirm(1)">Yes' +
	             '</button></div>',
	         plain: true,
	         className: 'ngdialog-theme-default'
	     }).then(function (value) {
	        
	    	
	        $scope.userinfo=
	        {		"id":$scope.id,
	        		"title":$scope.title,
	        		"email":$scope.email,
	        		"firstname": $scope.firstname,
	        		"lastname":$scope.lastname,
	        		"housenumber":$scope.housenumber,
	        		"street": $scope.street,
	        		"city":$scope.city,
	        		"country":$scope.country,
	        		"postcode": $scope.postcode,
	        		"nationality":$scope.nationality,
	        		"contactnumber": $scope.contactnumber,
	        		"highesteduqual": $scope.highesteduqual,
	        		"experience": $scope.experience,
	        		"primaryskill": $scope.primaryskill,
	        		"interests": $scope.interests,
	        		"strengths":$scope.strengths,
	        		"weaknesses": $scope.weaknesses,
	        		"nativelanguage":$scope.nativelanguage,
	        		"intlangkn": $scope.intlangkn,
	        		"aboutself":$scope.aboutself,
	        		"specgrad":$scope.specgrad,
	        		"gradfrom":$scope.gradfrom,
	        		"gradyear":$scope.gradyear,
	        		"cgpgrad":$scope.cgpgrad,
	        		"specinter":$scope.specinter,
	        		"interfrom":$scope.interfrom,
	        		"interyear":$scope.interyear,
	        		"cgpinter":$scope.cgpinter,
	        		"specschool":$scope.specschool,
	        		"schoolfrom":$scope.schoolfrom,
	        		"schoolyear":$scope.schoolyear,
	        		"cgpschool":$scope.cgpschool,
	        		"certifications":$scope.certifications,
	        		"recentemp":$scope.recentemp,
	        		"lastdesig":$scope.lastdesig,
	        		"lastdomain":$scope.lastdomain,
	        		"lasttoolsused":$scope.lasttoolsused,
	        		"lastresps":$scope.lastresps,
	        		"currentctc":$scope.currentctc,
	        		"expectedctc":$scope.expectedctc,
	        		"achievements":$scope.achievements,
	        		"expectedwork":$scope.expectedwork
	        		
	        		
	        };


	        $scope.updatedJsonStr = JSON.stringify($scope.userinfo);
	        $scope.upDataToServer($scope.updatedJsonStr);
	     }, function (value) {
	         console.log("down value"+value);
	     });




		
	}
	

};

$scope.updateAccInfo = function(){

	if($scope.title=="" || $scope.firstname=="" || $scope.email==""||
			$scope.lastname==""|| $scope.housenumber==""||$scope.street==""||
			$scope.city =="" ||$scope.country ==""||$scope.postcode ==""||$scope.nationality==""||
			$scope.contactnumber ==""||$scope.highesteduqual==""||
			$scope.experience ==""||$scope.primaryskill ==""||$scope.interests ==""||
			$scope.strengths ==""||$scope.weaknesses ==""||$scope.nativelanguage ==""||
			$scope.intlangkn==""||
			$scope.aboutself=="" || $scope.specgrad=="")
			{
			

			
			return;
			}
		else
		{
			 ngDialog.openConfirm({
		         template:
		             '<p>Are you sure you want to update the information ?<br/>The information provided can be updated any time..</p>' +
		             '<div>' +
		               '<button type="button" class="btn btn-default" ng-click="closeThisDialog(0)">No&nbsp;' +
		               '<button type="button" class="btn btn-primary" ng-click="confirm(1)">Yes' +
		             '</button></div>',
		         plain: true,
		         className: 'ngdialog-theme-default'
		     }).then(function (value) {
		        
		    	
		        $scope.userinfo=
		        {		"id":$scope.id,
		        		"title":$scope.title,
		        		"email":$scope.email,
		        		"firstname": $scope.firstname,
		        		"lastname":$scope.lastname,
		        		"housenumber":$scope.housenumber,
		        		"street": $scope.street,
		        		"city":$scope.city,
		        		"country":$scope.country,
		        		"postcode": $scope.postcode,
		        		"nationality":$scope.nationality,
		        		"contactnumber": $scope.contactnumber,
		        		"highesteduqual": $scope.highesteduqual,
		        		"experience": $scope.experience,
		        		"primaryskill": $scope.primaryskill,
		        		"interests": $scope.interests,
		        		"strengths":$scope.strengths,
		        		"weaknesses": $scope.weaknesses,
		        		"nativelanguage":$scope.nativelanguage,
		        		"intlangkn": $scope.intlangkn,
		        		"aboutself":$scope.aboutself,
		        		"specgrad":$scope.specgrad,
		        		"gradfrom":$scope.gradfrom,
		        		"gradyear":$scope.gradyear,
		        		"cgpgrad":$scope.cgpgrad,
		        		"specinter":$scope.specinter,
		        		"interfrom":$scope.interfrom,
		        		"interyear":$scope.interyear,
		        		"cgpinter":$scope.cgpinter,
		        		"specschool":$scope.specschool,
		        		"schoolfrom":$scope.schoolfrom,
		        		"schoolyear":$scope.schoolyear,
		        		"cgpschool":$scope.cgpschool,
		        		"certifications":$scope.certifications,
		        		"recentemp":$scope.recentemp,
		        		"lastdesig":$scope.lastdesig,
		        		"lastdomain":$scope.lastdomain,
		        		"lasttoolsused":$scope.lasttoolsused,
		        		"lastresps":$scope.lastresps,
		        		"currentctc":$scope.currentctc,
		        		"expectedctc":$scope.expectedctc,
		        		"achievements":$scope.achievements,
		        		"expectedwork":$scope.expectedwork
		        		
		        		
		        };


		        $scope.updatedJsonStr = JSON.stringify($scope.userinfo);
		        $scope.upDataToServerUpdate($scope.updatedJsonStr);
		     }, function (value) {
		         console.log("down value"+value);
		     });




			
		}


	
};
$scope.getUniqueUserId = function(){
	
	UserInfoService.getUniqueUserId().
    then(function (data)
	 {
   	 console.log(JSON.stringify(data));
      if(data.length == 0)
      {
    	  
      }
      function randomInt(min, max) {
    	    return Math.round(min + Math.random()*(max-min));
    	}
      var number = randomInt(1, 100);
      
      $scope.id = data.data.uniqueUserId;
      
      $scope.id= $scope.id+number;
      console.log($scope.id);
     
        
    });
	
};
$scope.getAllUsersInfo = function(){

	
	UserInfoService.getAllUserInfoServiceData().
	        then(function (data)
	    	         {
	          if(data.length == 0)
	          {
	           
	          }
	          $scope.usersInfo = data;
	            
	        });
	};
$scope.showUpdateButton = false;
$scope.updateMyInfo = function(){

$scope.successShow = false;
$scope.showUpdateButton = true;
$scope.hideUpdateInTheBeginninng=false;
	
};
	$scope.getAllUsersInfo();	
	$scope.getLoggedInEmailAddress(); 
	
	$scope.getLoggedInAccountDetails();

	
		

	$scope.getUniqueUserId(); 
	 
}]);
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Profile Information</title>
<%@ include file="/WEB-INF/jsp/includes.jsp"%> 
</head>
<body ng-controller="UserInfoCtrl">

<div class="row">
<div ng-show="successShow">
<div id="myProgress">
 <div class="progress-bar progress-bar-success progress-bar-striped" id="myBar"></div>
</div>
<br/>
<br/>
<input type="button" onclick="location.href = 'acknowledge';" class="btn btn-success" value="Continue>>"></input>
<input type="button" ng-click="updateMyInfo()" class="btn btn-primary" value="I want to Update My Information"></input>
</div>
<footer class="container-fluid text-center">
 <p><b><u>My Information</u></b></p>
</footer>
</div>


<div class="row">
<div class="col-md-6">
<input class="btn btn-success" type="button"  ng-hide="hideOnShowEdDiv" value="Educational Information" ng-click="showEducationalDiv()" required></input>
<div  id="education"  style="display:none;"> 
<div class="form-group">
*<input placeholder="Specialization in Graduation" ng-disabled="successShow" class="form-control" ng-model="specgrad" type="text" required></input>
</div>
<div class="form-group">
*<input placeholder="Graduated  from"   ng-disabled="successShow" class="form-control" typeahead="gradfrom for gradfrom in gradfroms | filter:$viewValue" ng-model="gradfrom"  type="text" required></input>
</div>
<div class="form-group">
*<input placeholder="Graduated  Year"   ng-disabled="successShow" class="form-control"  typeahead="gradyear for gradyear in schoolyears | filter:$viewValue" ng-model="gradyear"  type="text" required></input>
</div>
<div class="form-group">
*<input placeholder="Percentage of Marks scored" ng-disabled="successShow" class="form-control" ng-model="cgpgrad"  type="text" required></input>
</div>
<div class="form-group">
*<input placeholder="Specialization in Plus One/Two" ng-disabled="successShow" class="form-control" ng-model="specinter"  type="text" required></input>
</div>
<div class="form-group">
*<input placeholder="Plus One/Plus Two From" ng-disabled="successShow" class="form-control" ng-model="interfrom"  type="text" required></input>
</div>
<div class="form-group">
*<input placeholder="Plus One/Plus  passed out Year" ng-disabled="successShow" class="form-control" typeahead="interyear for interyear in schoolyears | filter:$viewValue"  ng-model="interyear"  type="text" required></input>
</div>
<div class="form-group">
*<input placeholder="Percentage of Marks scored in PlusTwo" ng-disabled="successShow" class="form-control" ng-model="cgpinter"  type="text" required></input>
</div>
<div class="form-group">
*<input placeholder="Course in High school" ng-disabled="successShow" class="form-control" ng-model="specschool"  type="text" required></input>
</div>
<div class="form-group">
*<input placeholder="Schooling From" ng-disabled="successShow" class="form-control" ng-model="schoolfrom"  type="text" required></input>
</div>
<div class="form-group">
*<input placeholder="Passed out Year" ng-disabled="successShow" class="form-control" typeahead="schoolyear for schoolyear in schoolyears | filter:$viewValue" ng-model="schoolyear"  type="text" required></input>
</div>
<div class="form-group">
*<input placeholder="Percentage of Marks scored in School" ng-disabled="successShow" class="form-control" ng-model="cgpschool" type="text" required></input>
</div>
<div class="form-group">
*<input placeholder="Certifications Mention any one Type N/A if you donot have any."  ng-disabled="successShow" class="form-control" ng-model="certifications"  type="text" required></input>
</div>
</div>
</div>

 <div class="col-md-6">
<input class="btn btn-success" type="button"  ng-hide="hideOnShowEmpDiv" value="Employment Information" ng-click="showEmpDiv()" />
<div  id="employment"  style="display:none;"> 
<div class="form-group">
* <input placeholder="Recent Employer Name" ng-disabled="successShow" class="form-control" ng-model="recentemp"  type="text" required></input>
</div>
<div class="form-group">
*<input placeholder="Last Designation" ng-disabled="successShow" class="form-control" ng-model="lastdesig"  type="text" required></input>
</div>
<div class="form-group">
*<input placeholder="Domain Worked In" ng-disabled="successShow" class="form-control" ng-model="lastdomain"  type="text" required></input>
</div>
<div class="form-group">
*<input placeholder="Tools Technology Used" ng-disabled="successShow" class="form-control" ng-model="lasttoolsused"  type="text" required></input>
</div>
<div class="form-group">
*<input placeholder="Responsibilities Any Two" ng-disabled="successShow" class="form-control" ng-model="lastresps"  type="text" required></input>
</div>
<div class="form-group">
*<input placeholder="Current CTC Per Annum in INR" ng-disabled="successShow" class="form-control" typeahead="currentctc for currentctc in currentctcs | filter:$viewValue" ng-model="currentctc"  type="text" required></input>
</div>
<div class="form-group">
*<input placeholder="Expected CTC Per Annum in INR" ng-disabled="successShow" class="form-control" typeahead="expectedctc for expectedctc in expectedctcs | filter:$viewValue" ng-model="expectedctc"  type="text" required></input>
</div>
<div class="form-group">
*<input placeholder="Achievements/Awards at Work" ng-disabled="successShow" class="form-control" ng-model="achievements"  type="text" required></input>
</div>
<div class="form-group">
*<input placeholder="Expected Work Profile" ng-disabled="successShow" class="form-control" ng-model="expectedwork"  type="text" required></input>
</div>

<b>Personal Information</b>
<form  method="POST" name="userForm" novalidate> 
<div class="row">
<div class="col-md-6">
<div class="form-group">
*
<select ng-disabled="successShow" class="form-control" name="title" id="title" ng-model="title">
      <option value="">---Please select title---</option> 
      <option value="{{titldata.option1}}">Mr</option> 
      <option value="{{titldata.option2}}">Ms/Mrs</option>
</select>
</div>
<div class="form-group">
*
<input placeholder="First name"  class="form-control" ng-model="firstname" type="text" disabled></input>
</div>
<div class="form-group">
*
<input placeholder="Email"   class="form-control" ng-model="email"  type="text" disabled></input>
</div>
<div class="form-group">
*
<input placeholder="Last name" ng-disabled="successShow" class="form-control" ng-model="lastname"  type="text" required></input>
</div>
<div class="form-group">
*
<input placeholder="House number" ng-disabled="successShow" class="form-control" ng-model="housenumber"  type="text" required></input>
</div>
<div class="form-group">
*
<input placeholder="Street address" ng-disabled="successShow" class="form-control" ng-model="street"  type="text" required></input>
</div>
<div class="form-group">
*
<input placeholder="City" ng-disabled="successShow" class="form-control" typeahead="city for city in states | filter:$viewValue" ng-model="city"  type="text" required></input>
</div>
<div class="form-group">
*
<input placeholder="Country" ng-disabled="successShow" class="form-control" typeahead="country for country in countries | filter:$viewValue"  ng-model="country"  type="text" required></input>
</div>
<div class="form-group">
*
<input placeholder="Postal Code" ng-disabled="successShow" class="form-control" ng-model="postcode"  type="text" required></input>
</div>
<div class="form-group">
*
<input placeholder="Nationality" ng-disabled="successShow" class="form-control" typeahead="nationality for nationality in nationalitys | filter:$viewValue" ng-model="nationality" type="text" required></input>
</div>
<div class="form-group" ng-class="{ 'has-error' : userForm.contactnumber.$invalid && !userForm.contactnumber.$pristine }">
*<input placeholder="Contact number"  ng-disabled="successShow" name="contactnumber" class="form-control"  ng-minlength="10" ng-maxlength="13" ng-model="contactnumber"  type="text" ng-required></input>
<p ng-show="userForm.contactnumber.$error.minlength" class="help-block">contactnumber is too short.</p>
<p ng-show="userForm.contactnumber.$error.maxlength" class="help-block">contactnumber is too long.</p>
</div>
</div>
<div class="col-md-6">

<div class="form-group" ng-class="{ 'has-error' : userForm.highesteduqual.$invalid && !userForm.highesteduqual.$pristine }">
*<input placeholder="Highest Educational Qualification" ng-disabled="successShow" class="form-control" typeahead="highesteduqual for highesteduqual in highesteduquals | filter:$viewValue" name="highesteduqual" ng-model="highesteduqual"  ng-minlength="1" ng-maxlength="25" type="text" ng-required="true"></input>
<p ng-show="userForm.highesteduqual.$error.minlength" class="help-block">Qualification Information is too less.</p>
<p ng-show="userForm.highesteduqual.$error.maxlength" class="help-block">Qualification Information is too long.</p>
</div>
<div class="form-group">
*<input placeholder="Work Experience in Years Note:If 3 years just type 3" ng-disabled="successShow" class="form-control" typeahead="experience for experience in experiences | filter:$viewValue" ng-model="experience"  type="text" required></input>
</div>
<div class="form-group">
*<input placeholder="Primary Skill" ng-disabled="successShow" class="form-control" typeahead="primaryskill for primaryskill in primaryskills | filter:$viewValue" ng-model="primaryskill"  type="text" required></input>
</div>
<div class="form-group">
*<input placeholder="Interests" ng-disabled="successShow" class="form-control" typeahead="interests for interests in interestss | filter:$viewValue" ng-model="interests"  type="text" required></input>
</div>
<div class="form-group">
*<input placeholder="Added advantage? e.g:Communication,etc.." ng-disabled="successShow" class="form-control" ng-model="strengths"  type="text" required></input>
</div>
<div class="form-group">
*<input placeholder="Oppurtunities? e.g:I want to learn programming,etc.." ng-disabled="successShow" class="form-control" ng-model="weaknesses"  type="text" required></input>
</div>
<div class="form-group">
*<input placeholder="Nativelanguage" ng-disabled="successShow" class="form-control" typeahead="nativelanguage for nativelanguage in nativelanguages | filter:$viewValue" ng-model="nativelanguage"  type="text" required></input>
</div>
<div class="form-group">
*<input placeholder="International Languages" ng-disabled="successShow" class="form-control" typeahead="intlangkn for intlangkn in intlangkns | filter:$viewValue" ng-model="intlangkn"  type="text" required></input>
</div>
<div class="form-group">
*<input placeholder="About Yourself in One Line" ng-disabled="successShow" class="form-control" ng-model="aboutself"  type="text" required></input>
</div>

</div>
</div>




<div class="form-group">
<button  class="btn btn-primary" ng-hide="showUpdateButton" ng-disabled="successShow || userForm.$invalid" onclick="move()" ng-click="saveAccInfo()" >SAVE</button>
<button  class="btn btn-primary" ng-hide="successShow || hideUpdateInTheBeginninng"  ng-click="updateAccInfo()" >Update</button>
</div>
</div>
</div>

</div>
</form>
</body>
</html>