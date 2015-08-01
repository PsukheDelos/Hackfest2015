<!DOCTYPE html>
<html>
<head>
<<<<<<< HEAD
    <#include "header.ftl">
</head>

<body id="page-top" class="index">
  
  <!-- Navigation Bar -->
    <nav class="navbar navbar-default navbar-fixed-top navbar-color">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#page-top">Crash Watch</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li class="hidden">
                        <a href="#page-top"></a>
                    </li>
                    <li class="page-scroll">
                        <a href="#map-section">Map</a>
                    </li>
                    <li class="page-scroll">
                        <a href="#about">About</a>
                    </li>
                    <li class="page-scroll">
                        <a href="#team">Our Team</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>

  <!-- Header Section -->
    <header>
    <section id="page-top">
      <div class="container">
        <div class="row">
          <div class="col-lg-6 col-lg-offset-3">
            <img class="img-responsive" src="images/car-accident.png" alt="">
            <div class="intro-text">
              <span class="name">Crash Watch</span>
              <span class="subtext">Keeping track of past crashes so you can be safer</span>
            </div>
          </div>
        </div>
      </div>
    </section>
    </header>
  
  <!-- Map Section -->
    <section id="map-section" class="">
      <!-- <div class="container"> -->
        <!-- <div class="row"> -->
          <!-- <div id="map"> -->
          <div id="map">
              <img class="img-responsive" src="images/placeholder-map.png" alt="">
                <script>
                  
                $.get('coords.csv', function(data) {
                    var csvString = data;
                  });



                  // csv2geojson.csv2geojson(csvString, {
                  //     latfield: 'latitude',
                  //     lonfield: 'longitude',
                  //     delimiter: ','
                  // }, function(err, data) 
                  //     var gJson = data;
                  // });


                  L.mapbox.accessToken = 'pk.eyJ1IjoicHN1a2hlZGVsb3MiLCJhIjoiZmYwMTc1NDNjZGM3NjE5ODdmYjc3NWM3MzFiNmZmNjUifQ.NFvyZqxbpAJKvTbPBVrZ6Q';
                  var map = L.mapbox.map('map', 'mapbox.outdoors').setView([-41.2749311,174.7790948], 11);
                  map.scrollWheelZoom.disable();

                  // Omnivore will AJAX-request this file behind the scenes and parse it:
// note that there are considerations:
// - The CSV file must contain latitude and longitude values, in column
//   named roughly latitude and longitude
// - The file must either be on the same domain as the page that requests it,
//   or both the server it is requested from and the user's browser must
//   support CORS.
omnivore.csv('coords.csv')
    .on('ready', function(layer) {
        // An example of customizing marker styles based on an attribute.
        // In this case, the data, a CSV file, has a column called 'state'
        // with values referring to states. Your data might have different
        // values, so adjust to fit.
        this.eachLayer(function(marker) {

            var injuries = "No Injuries";

            marker.setIcon(L.mapbox.marker.icon({
                'marker-color': '#3366FF',
                'marker-size': 'small'
            }));
            
            if (parseInt(marker.toGeoJSON().properties['CRASH MIN CNT']) > 0) {
                marker.setIcon(L.mapbox.marker.icon({
                    'marker-color': '#FFFF00',
                    'marker-size': 'medium'
                }));
                injuries = 'Minor Injuries'
            } 
            if (parseInt(marker.toGeoJSON().properties['CRASH SEV CNT']) > 0) {
                marker.setIcon(L.mapbox.marker.icon({
                    'marker-color': '#FF3300',
                    'marker-size': 'large'
                }));
                injuries = 'Serious Injuries'
            } 
            if (parseInt(marker.toGeoJSON().properties['CRASH FATAL CNT']) > 0) {
                marker.setIcon(L.mapbox.marker.icon({
                    'marker-color': '#000000',
                    'marker-size': 'large'
                }));
                injuries = 'Fatal Injuries'
            } 



            //Converts movement codes to Movement text
            var mvmt = "Unknown";
            if (marker.toGeoJSON().properties['MVMT'].charAt(0) === 'A') {
              mvmt = "Overtaking and Lane Change";
            } 
            else if (marker.toGeoJSON().properties['MVMT'].charAt(0) === 'B') {
              mvmt = "Head On";
            } 
            else if (marker.toGeoJSON().properties['MVMT'].charAt(0) === 'C') {
              mvmt = "Lost Control or Off Road (Straight Roads)";
            }
            else if (marker.toGeoJSON().properties['MVMT'].charAt(0) === 'D') {
              mvmt = "Cornering";
            }
            else if (marker.toGeoJSON().properties['MVMT'].charAt(0) === 'E') {
              mvmt = "Collision with Obstruction";
            } 
            else if (marker.toGeoJSON().properties['MVMT'].charAt(0) === 'F') {
              mvmt = "Rear End";
            }
            else if (marker.toGeoJSON().properties['MVMT'].charAt(0) === 'G') {
              mvmt = "Turning Versus Same Direction";
            }
            else if (marker.toGeoJSON().properties['MVMT'].charAt(0) === 'H') {
              mvmt = "Crossing (No Turns)";
            }  
            else if (marker.toGeoJSON().properties['MVMT'].charAt(0) === 'J') {
              mvmt = "Crossing (Vehicle Turning)";
            } 
            else if (marker.toGeoJSON().properties['MVMT'].charAt(0) === 'K') {
              mvmt = "Merging";
            } 
            else if (marker.toGeoJSON().properties['MVMT'].charAt(0) === 'L') {
              mvmt = "Right Against Turn";
            } 
            else if (marker.toGeoJSON().properties['MVMT'].charAt(0) === 'M') {
              mvmt = "Manoeuvring";
            } 
            else if (marker.toGeoJSON().properties['MVMT'].charAt(0) === 'N') {
              mvmt = "Pedestrians Crossing Road";
            }
            else if (marker.toGeoJSON().properties['MVMT'].charAt(0) === 'P') {
              mvmt = "Pedestrians Other";
            } 
            else if (marker.toGeoJSON().properties['MVMT'].charAt(0) === 'Q') {
              mvmt = "Miscellaneous";
            }  



            //Converts light codes to Text 
            var light = "Unknown";
            if(marker.toGeoJSON().properties['LIGHT'].charAt(0)==='B'){
              light = "Bright Sun";
            }
            else if(marker.toGeoJSON().properties['LIGHT'].charAt(0)==='O'){
              light = "Overcast";
            }
            else if(marker.toGeoJSON().properties['LIGHT'].charAt(0)==='T'){
              light = "Twilight";
            }
            else if(marker.toGeoJSON().properties['LIGHT'].charAt(0)==='D'){
              light = "Dark";
            }

            if(marker.toGeoJSON().properties['LIGHT'].charAt(1)==='O'){
              light = light + " / Street Lights On";
            }
            else if(marker.toGeoJSON().properties['LIGHT'].charAt(1)==='F'){
              light = light + " / Street Lights Off";
            }
            else if(marker.toGeoJSON().properties['LIGHT'].charAt(1)==='N'){
              light = light + " / No Street Lights Present";
            }


            // Bind a popup to each icon based on the same properties
            marker.bindPopup(
                '<b>' + mvmt + '</b><br>' + 
                '<b>[' + injuries + ']</b><br>' + 
                '<b>Road: </b>' + marker.toGeoJSON().properties['CRASH ROAD'].capitalize(true) + '<br>' +
                '<b>Light: </b>' + light
            );
        });
    })
    .addTo(map);

                  // var geoJson = new L.geoJson();
                  // geoJson.addTo(map);

                  // $.ajax({
                  // dataType: "json",
                  // url: "geojson.txt",
                  // success: function(data) {
                  //     $(data.features).each(function(key, data) {
                  //         geoJson.addData(data);
                  //     });
                  // }
                  // }).error(function() {});
                  var myLayer = L.mapbox.featureLayer().addTo(map);
                  if (navigator.geolocation) {
                          map.locate();
                  }
                  //This is for my location
                  // Once we've got a position, zoom and center the map
                  // on it, and add a single marker.
                  map.on('locationfound', function(e) {

                      myLayer.setGeoJSON({
                          type: 'Feature',
                          geometry: {
                              type: 'Point',
                              coordinates: [e.latlng.lng, e.latlng.lat]
                          },
                          properties: {
                              'marker-color': '#ff8888',
                              'marker-symbol': 'star'
                          }
                      });

                  });

                  // If the user chooses not to allow their location
                  // to be shared, display an error message.
                  map.on('locationerror', function() {
                      geolocate.innerHTML = 'Position could not be found';
                  });

                  // L.marker is a low-level marker constructor in Leaflet.
                  // omnivore.csv('coords.csv').addTo(map);
                  //returns Strings with first letter of each word capitalised
                  String.prototype.capitalize = function(lower) { return (lower ? this.toLowerCase() : this).replace(/(?:^|\s)\S/g, function(a) { return a.toUpperCase(); });
};
                </script>
          </div>


    </section>

    <!-- About Section -->
    <section class="about padded" id="about">
        <div class="container">
            <div class="row info-title">
                <div class="col-lg-12 text-center">
                    <h2>About</h2>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 col-lg-offset-2">
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque at tristique neque, in fermentum mauris. Proin tempor risus nisi, a cursus turpis fermentum ac. Cras finibus purus convallis dictum semper. Mauris metus nulla, elementum in pharetra eget, mollis sed quam. Curabitur sagittis nec purus a pellentesque. Cras finibus purus convallis dictum semper. Mauris metus nulla, elementum in pharetra eget, mollis sed quam. Curabitur sagittis nec purus a pellentesque.</p>
                </div>
                <div class="col-lg-4">
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque at tristique neque, in fermentum mauris. Proin tempor risus nisi, a cursus turpis fermentum ac. Cras finibus purus convallis dictum semper. Mauris metus nulla, elementum in pharetra eget, mollis sed quam. Curabitur sagittis nec purus a pellentesque. Cras finibus purus convallis dictum semper. Mauris metus nulla, elementum in pharetra eget, mollis sed quam. Curabitur sagittis nec purus a pellentesque.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Our Team Section -->
    <section class="team padded" id="team">
        <div class="container">
            <div class="row info-title">
                <div class="col-lg-12 text-center">
                    <h2>Our Team</h2>
                </div>
            </div>
            <div class="row">
                <div class="col-md-2 col-lg-offset-2">
                    <p>Person #1</p>
                    <img class="img-responsive" src="images/placeholder-photo.jpg" alt="">
                </div>
                <div class="col-lg-2">
                    <p>Person #2</p>
                    <img class="img-responsive" src="images/placeholder-photo.jpg" alt="">
                </div>
                <div class="col-lg-2">
                    <p>Person #3</p>
                    <img class="img-responsive" src="images/placeholder-photo.jpg" alt="">
                </div>
                <div class="col-lg-2">
                    <p>Person #4</p>
                    <img class="img-responsive" src="images/placeholder-photo.jpg" alt="">
                </div>
            </div>
        </div>
    </section>

    <div class="white-break"></div>

  <!-- jQuery -->
    <script src="js/jquery.js"></script>
  
  <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
    <script src="js/classie.js"></script>
    <script src="js/cbpAnimatedHeader.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="js/custom.js"></script>
  
=======
  <#include "header.ftl">
</head>

<body>

  <#include "nav.ftl">

<div class="jumbotron text-center">
  <div class="container">
    <a href="/" class="lang-logo">
      <img src="/lang-logo.png">
    </a>
    <h1>Getting Started with Java on Heroku</h1>
    <p>This is a sample Java application deployed to Heroku. It's a reasonably simple app - but a good foundation for understanding how to get the most out of the Heroku platform.</p>
    <a type="button" class="btn btn-lg btn-default" href="https://devcenter.heroku.com/articles/getting-started-with-java"><span class="glyphicon glyphicon-flash"></span> Getting Started with Java</a>
    <a type="button" class="btn btn-lg btn-primary" href="https://github.com/heroku/java-getting-started"><span class="glyphicon glyphicon-download"></span> Source on GitHub</a>
  </div>
</div>
<div class="container">
  <div class="alert alert-info text-center" role="alert">
    To deploy your own copy, and learn the fundamentals of the Heroku platform, head over to the <a href="https://devcenter.heroku.com/articles/getting-started-with-java" class="alert-link">Getting Started with Java on Heroku</a> tutorial.
  </div>
  <hr>
  <div class="row">
    <div class="col-md-6">
      <h3><span class="glyphicon glyphicon-info-sign"></span> How this sample app works</h3>
      <ul>
        <li>This app was deployed to Heroku, either using Git or by using <a href="https://github.com/heroku/java-getting-started">Heroku Button</a> on the repository.</li>

        <li>When Heroku received the source code, it grabbed all the dependencies in the <a href="https://github.com/heroku/java-getting-started/blob/master/pom.xml">pom.xml</a>.</li>
        <li>The platform then spins up a dyno, a lightweight container that provides an isolated environment in which the slug can be mounted and executed.</li>
        <li>You can scale your app, manage it, and deploy over <a href="https://addons.heroku.com/">150 add-on services</a>, from the Dashboard or CLI.</li>
        <li>Check out the <a href="https://devcenter.heroku.com/articles/getting-started-with-java">Getting Started</a> guide to learn more!</li>
      </ul>
    </div>
    <div class="col-md-6">
      <h3><span class="glyphicon glyphicon-link"></span> Helpful Links</h3>
      <ul>
        <li><a href="https://www.heroku.com/home">Heroku</a></li>
        <li><a href="https://devcenter.heroku.com/">Heroku Dev Center</a></li>
        <li><a href="https://devcenter.heroku.com/articles/getting-started-with-java">Getting Started with Java on Heroku</a></li>
        <li><a href="https://devcenter.heroku.com/articles/deploying-java">Deploying Java Apps on Heroku</a></li>
      </ul>
    </div>
  </div> <!-- row -->
   <div class="alert alert-info text-center" role="alert">
    Please do work through the Getting Started guide, even if you do know how to build such an application.  The guide covers the basics of working with Heroku, and will familiarize you with all the concepts you need in order to build and deploy your own apps.
  </div>
</div>


>>>>>>> aldent95/master
</body>
</html>
