<!DOCTYPE html>
<html>
<head>
    <#include "header.ftl">
</head>

  <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    
<body id="page-top" class="index">
  
  <!-- Navigation Bar -->
    <nav class="navbar navbar-fixed-top navbar-color">
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
                        <a href="#map">Map</a>
                    </li>
                    <li class="page-scroll">
                        <a href="#key">Key</a>
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
            <div>
                <div id="img_container">
                    <img class="img-responsive" src="images/titlepage.png" alt="">
                    <a href="#map">
                        <img class="img-responsive start-button" src="images/logo.png" alt="">
                    </a>
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
              <div id="field_name">Date</div>
              <img class="img-responsive" src="images/placeholder-map.png" alt="">
                <script>
                  L.mapbox.accessToken = 'pk.eyJ1IjoicHN1a2hlZGVsb3MiLCJhIjoiZmYwMTc1NDNjZGM3NjE5ODdmYjc3NWM3MzFiNmZmNjUifQ.NFvyZqxbpAJKvTbPBVrZ6Q';
                  var map = L.mapbox.map('map', 'mapbox.outdoors').setView([-41.2749311,174.7790948], 11);
                  map.scrollWheelZoom.disable();
                  var myLayer = L.mapbox.featureLayer().addTo(map);

                  // // var fieldNameElement = document.getElementById('field_name');
                  // // var geoJson = L.geoJson(geoJson, {
                  // //     pointToLayer: L.mapbox.marker.style,
                  // //     style: function(feature) { return feature.properties; }
                  // // }).addTo(map);
                  // var geoJson = new L.geoJson();
                  // // var count = 0;
                  // // var time = 500;
                  // $.ajax({
                  // dataType: "json",
                  // url: "data/geojson-small-icon.txt",
                  // success: function(data) {
                  //     $(data.features).each(function(key, feature) {
                  //         geoJson.addData(feature);
                  //         console.log(feature);
                  //         // var parts = feature.properties['CRASH DATE'].split("/");
                  //         // var dt = new Date(parseInt(parts[2], 10),
                  //         //                   parseInt(parts[1], 10) - 1,
                  //         //                   parseInt(parts[0], 10)); 
                  //         //     setTimeout(function(){
                  //         //       geoJson.addData(feature);
                  //         //       fieldNameElement.innerHTML = dt.toString();
                  //         //     }, time);
                  //         //     time = time + 500;
                  //     });
                  // }
                  // }).error(function() {});

                  //Hard coding geoJSON for a test
                  var geoJson = [{
                      "type": "Feature",
                      "geometry": {
                          "type": "Point",
                          "coordinates": [174.7826949,-41.29151999]
                      },
                      "properties": {
                          "title": "Small astronaut",
                          "icon": {
                              "iconUrl": "/images/1.png",
                              "iconSize": [50, 50], // size of the icon
                              "iconAnchor": [25, 25], // point of the icon which will correspond to marker's location
                              "popupAnchor": [0, -25], // point from which the popup should open relative to the iconAnchor
                              "className": "dot"
                          }
                      }
                  }, {
                      "type": "Feature",
                      "geometry": {
                          "type": "Point",
                          "coordinates": [174.7683061,-41.26505353]
                      },
                      "properties": {
                          "title": "Big astronaut",
                          "icon": {
                              "iconUrl": "/images/1.png",
                              "iconSize": [100, 100],
                              "iconAnchor": [50, 50],
                              "popupAnchor": [0, -55],
                              "className": "dot"
                          }
                      }
                  }];

                  myLayer.on('layeradd', function(e) {
                    var marker = e.layer,
                    feature = marker.feature;
                    marker.setIcon(L.icon(feature.properties.icon));
                  });

                  myLayer.setGeoJSON(geoJson);


                </script>
          </div>


    </section>

    <div class="white-break"></div>

    <!-- About Section -->
    <section class="about padded" id="key">
        <div class="container">
            <div class="row info-title">
                <div class="col-lg-12 text-center">
                    <h2>Key</h2>
                </div>
            </div>
            <div class="row key-row-pad">
                <div class="col-md-2 col-md-offset-2">
                    <img class="img-responsive icon-image" src="images/icons/1.png" alt="">
                </div>
                <div class="col-md-2">
                    <img class="img-responsive icon-image" src="images/icons/2.png" alt="">
                </div>
                <div class="col-md-2">
                    <img class="img-responsive icon-image" src="images/icons/3.png" alt="">
                </div>
                <div class="col-md-2">
                    <img class="img-responsive icon-image" src="images/icons/4.png" alt="">
                </div>
            </div>
            <div class="row key-row-pad">
                <div class="col-md-2 col-md-offset-2">
                    <p>Overtaking</p>
                </div>
                <div class="col-md-2">
                    <p>Head On</p>
                </div>
                <div class="col-md-2">
                    <p>Lost Control / Off Road</p>
                </div>
                <div class="col-md-2">
                    <p>Cornering</p>
                </div>
            </div>
            <div class="row key-row-pad">
                <div class="col-md-2 col-md-offset-2">
                    <img class="img-responsive icon-image" src="images/icons/5.png" alt="">
                </div>
                <div class="col-md-2">
                    <img class="img-responsive icon-image" src="images/icons/6.png" alt="">
                </div>
                <div class="col-md-2">
                    <img class="img-responsive icon-image" src="images/icons/7.png" alt="">
                </div>
                <div class="col-md-2">
                    <img class="img-responsive icon-image" src="images/icons/8.png" alt="">
                </div>
            </div>
            <div class="row key-row-pad">
                <div class="col-md-2 col-md-offset-2">
                    <p>Rear End</p>
                </div>
                <div class="col-md-2">
                    <p>Turning Versus Same Direction</p>
                </div>
                <div class="col-md-2">
                    <p>Crossing (No Turns)</p>
                </div>
                <div class="col-md-2">
                    <p>Merging</p>
                </div>
            </div>
            <div class="row key-row-pad">
                <div class="col-md-2 col-md-offset-2">
                    <img class="img-responsive icon-image" src="images/icons/9.png" alt="">
                </div>
                <div class="col-md-2">
                    <img class="img-responsive icon-image" src="images/icons/10.png" alt="">
                </div>
                <div class="col-md-2">
                    <img class="img-responsive icon-image" src="images/icons/11.png" alt="">
                </div>
                <div class="col-md-2">
                    <img class="img-responsive icon-image" src="images/icons/12.png" alt="">
                </div>
            </div>
            <div class="row key-row-pad">
                <div class="col-md-2 col-md-offset-2">
                    <p>Right Turn Against</p>
                </div>
                <div class="col-md-2">
                    <p>Maneuvering</p>
                </div>
                <div class="col-md-2">
                    <p>Pedestrians Crossing Road / Other</p>
                </div>
                <div class="col-md-2">
                    <p>Miscellaneous</p>
                </div>
            </div>
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
                <div class="col-lg-8 col-lg-offset-2">
                    <p>Crash Watch allows New Zealanders to view past car accident data with the aim to increase awareness of dangerous driving areas. More aware drivers means a safer New Zealand. The data includes the cause of crash for each entry and conditions at the time. Data can be played through from a set time to show the trends of accidents by location over time.  The system is expandable with potential for more features such as comprehensive filters and more statistics. Proper process of statistics could allow applications such as GPS to display severity of risk in real-time. Drivers would know where to be careful on the road. The system could also have application with the NZTA, their awareness of crash trends could enable them to build safer road systems.</p>
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
                <div class="col-md-3 col-lg-offset-0">
                    <p class="pad-bottom">Glen Peek</p>
                    <img class="img-responsive pad-bottom " src="images/profiles/glen.jpg" alt="">
                    <p>Software Developer</p>
                    <p>glen.peek@gmail.com</p>
                </div>
                <div class="col-lg-3">
                    <p class="pad-bottom">Alex Dent</p>
                    <img class="img-responsive pad-bottom " src="images/profiles/alex.jpg" alt="">
                    <p>Software Developer</p>
                    <p>aldent95@hotmail.com</p>
                </div>
                <div class="col-lg-3">
                    <p class="pad-bottom">Marina Voronova</p>
                    <img class="img-responsive pad-bottom " src="images/profiles/marina.jpg" alt="">
                    <p>Front End Designer</p>
                    <p>marina.lion21@mail.ru</p>
                </div>
                <div class="col-lg-3">
                    <p class="pad-bottom">Jack Purvis</p>
                    <img class="img-responsive pad-bottom " src="images/profiles/jack.jpg" alt="">
                    <p>Software Developer</p>
                    <p>emperorpurvis@gmail.com</p>
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
  
</body>
</html>
