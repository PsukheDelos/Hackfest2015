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
          var map = L.mapbox.map('map', 'mapbox.outdoors').setView([-41.2749311,174.7790948], 11);
          map.scrollWheelZoom.disable();

          $(document).ready(function() {
            $.ajax({
                type: "GET",
                url: "coords.csv",
                dataType: "text",
                success: function(data) {processData(data);}
             });
        });

    function processData(allText) {
        var allTextLines = allText.split(/\r\n|\n/);
        var headers = allTextLines[0].split(',');
        //var lines = [];

        for (var i=1; i<allTextLines.length; i++) {
            var data = allTextLines[i].split(',');
            if (data.length == headers.length) {
                // var tarr = [];
                L.mapbox.featureLayer({
    // this feature is in the GeoJSON format: see geojson.org
    // for the full specification
    type: 'Feature',
    geometry: {
        type: 'Point',
        // coordinates here are in longitude, latitude order because
        // x, y is the standard for GeoJSON and many formats
        coordinates: [
          data[29],
          data[30] 
        ]
    },
    properties: {
        title: data[1],
        description: data[5],
        // one can customize markers by adding simplestyle properties
        // https://www.mapbox.com/guides/an-open-platform/#simplestyle
        'marker-size': 'large',
        'marker-color': '#BE9A6B',
        'marker-symbol': 'cafe'
    }
}).addTo(map);
                // for (var j=0; j<headers.length; j++) {



                    //tarr.push(headers[j]+":"+data[j]);
                // }
            }
    }
}

          // var csvArray = CSVToArray('coords.csv');
          // var data = $.csv.toObjects('coords.csv'):

              
          // L.marker is a low-level marker constructor in Leaflet.
          // omnivore.csv('coords.csv').addTo(map);
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
<script> 
function CSVToArray( strData, strDelimiter ){
        // Check to see if the delimiter is defined. If not,
        // then default to comma.
        strDelimiter = (strDelimiter || ",");

        // Create a regular expression to parse the CSV values.
        var objPattern = new RegExp(
            (
                // Delimiters.
                "(\\" + strDelimiter + "|\\r?\\n|\\r|^)" +

                // Quoted fields.
                "(?:\"([^\"]*(?:\"\"[^\"]*)*)\"|" +

                // Standard fields.
                "([^\"\\" + strDelimiter + "\\r\\n]*))"
            ),
            "gi"
            );


        // Create an array to hold our data. Give the array
        // a default empty first row.
        var arrData = [[]];

        // Create an array to hold our individual pattern
        // matching groups.
        var arrMatches = null;


        // Keep looping over the regular expression matches
        // until we can no longer find a match.
        while (arrMatches = objPattern.exec( strData )){

            // Get the delimiter that was found.
            var strMatchedDelimiter = arrMatches[ 1 ];

            // Check to see if the given delimiter has a length
            // (is not the start of string) and if it matches
            // field delimiter. If id does not, then we know
            // that this delimiter is a row delimiter.
            if (
                strMatchedDelimiter.length &&
                strMatchedDelimiter !== strDelimiter
                ){

                // Since we have reached a new row of data,
                // add an empty row to our data array.
                arrData.push( [] );

            }

            var strMatchedValue;

            // Now that we have our delimiter out of the way,
            // let's check to see which kind of value we
            // captured (quoted or unquoted).
            if (arrMatches[ 2 ]){

                // We found a quoted value. When we capture
                // this value, unescape any double quotes.
                strMatchedValue = arrMatches[ 2 ].replace(
                    new RegExp( "\"\"", "g" ),
                    "\""
                    );

            } else {

                // We found a non-quoted value.
                strMatchedValue = arrMatches[ 3 ];

            }


            // Now that we have our value string, let's add
            // it to the data array.
            arrData[ arrData.length - 1 ].push( strMatchedValue );
        }

        // Return the parsed data.
        return( arrData );
    }
    </script>

</body>
</html>
