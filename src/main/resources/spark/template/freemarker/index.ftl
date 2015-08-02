<!DOCTYPE html>
<html>
<head>
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
              <div id="field_name">Date</div>
              <img class="img-responsive" src="images/placeholder-map.png" alt="">
                <script>

                  L.mapbox.accessToken = 'pk.eyJ1IjoicHN1a2hlZGVsb3MiLCJhIjoiZmYwMTc1NDNjZGM3NjE5ODdmYjc3NWM3MzFiNmZmNjUifQ.NFvyZqxbpAJKvTbPBVrZ6Q';
                  var map = L.mapbox.map('map', 'mapbox.outdoors').setView([-41.2749311,174.7790948], 11);
                  map.scrollWheelZoom.disable();

                  var fieldNameElement = document.getElementById('field_name');
                  var geoJson = L.geoJson(geoJson, {
                      pointToLayer: L.mapbox.marker.style,
                      style: function(feature) { return feature.properties; }
                  }).addTo(map);

                  var count = 0;
                  var time = 500;
                  $.ajax({
                  dataType: "json",
                  url: "data/CrashDataFormated.txt",
                  success: function(data) {
                      $(data.features).each(function(key, feature) {
                          var parts = feature.properties['CRASH DATE'].split("/");
                          var dt = new Date(parseInt(parts[2], 10),
                                            parseInt(parts[1], 10) - 1,
                                            parseInt(parts[0], 10)); 
                              console.log(count++);
                              console.log(feature);
                              setTimeout(function(){
                                console.log("setTimeout");
                                geoJson.addData(feature);
                                fieldNameElement.innerHTML = dt.toString();
                              }, time);
                              time = time + 500;
                      });
                  }
                  }).error(function() {});

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
  
</body>
</html>
