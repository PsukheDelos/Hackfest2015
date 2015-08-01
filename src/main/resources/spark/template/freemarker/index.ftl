<!DOCTYPE html>
<html>
<head>
  <#include "header.ftl">
</head>

<body> 
  
  <!-- Navigation Bar -->
    <nav class="navbar navbar-default navbar-fixed-top">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#page-top">Safe Roading</a>
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
                        <a href="#about">About</a>
                    </li>
                    <li class="page-scroll">
                        <a href="#contact">Our Team</a>
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
          <div class="col-lg-12">
            <img class="img-responsive" src="images/car-accident.png" alt="">
            <div class="intro-text">
              <span class="name">Safe Roading</span>
              <span class="subtext">Crash Data Over Time</span>
            </div>
          </div>
        </div>
      </div>
    </section>
    </header>
  
  <!-- Map Section -->
    <section id="map">
    <div class="row">
      <script>
        L.mapbox.accessToken = 'pk.eyJ1IjoicHN1a2hlZGVsb3MiLCJhIjoiZmYwMTc1NDNjZGM3NjE5ODdmYjc3NWM3MzFiNmZmNjUifQ.NFvyZqxbpAJKvTbPBVrZ6Q';
        var map = L.mapbox.map('map', 'mapbox.outdoors')
        .setView([-41.2749311,174.7790948], 11);
        .eventHandlers[3].remove();
        // L.marker is a low-level marker constructor in Leaflet.
        omnivore.csv('coords.csv').addTo(map);
        //remove mouse wheel function
        // mapbox.auto('map', 'psukhedelos.n27d3khm', function(map) {
        // map.eventHandlers[3].remove();
    });
      </script>
          </div>
    </section>

    <!-- About Section -->
    <section class="about" id="about">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2>About</h2>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 col-lg-offset-2">
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque at tristique neque, in fermentum mauris. Proin tempor risus nisi, a cursus turpis fermentum ac. Cras finibus purus convallis dictum semper. Mauris metus nulla, elementum in pharetra eget, mollis sed quam. Curabitur sagittis nec purus a pellentesque.</p>
                </div>
                <div class="col-lg-4">
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque at tristique neque, in fermentum mauris. Proin tempor risus nisi, a cursus turpis fermentum ac. Cras finibus purus convallis dictum semper. Mauris metus nulla, elementum in pharetra eget, mollis sed quam. Curabitur sagittis nec purus a pellentesque.</p>
                </div>
            </div>
        </div>
    </section>
  
  
  
  <!-- jQuery -->
    <script src="js/jquery.js"></script>
  
  <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>


</body>
</html>
