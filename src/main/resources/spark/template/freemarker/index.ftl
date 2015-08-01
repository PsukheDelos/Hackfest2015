<!DOCTYPE html>
<html>
<head>
  <#include "header.ftl">
</head>

<body>

  <#include "nav.ftl">

<div class="jumbotron text-center">
  <div class="container">
    
    <script src='https://api.mapbox.com/mapbox.js/v2.2.1/mapbox.js'></script>
<link href='https://api.mapbox.com/mapbox.js/v2.2.1/mapbox.css' rel='stylesheet' />
<style>
.leaflet-marker-icon,
.leaflet-marker-shadow {
  -webkit-animation: fadein 3s; /* Safari, Chrome and Opera > 12.1 */
  -moz-animation: fadein 3s; /* Firefox < 16 */
  -ms-animation: fadein 3s; /* Internet Explorer */
  -o-animation: fadein 3s; /* Opera < 12.1 */
  animation: fadein 3s;
}

@keyframes fadein {
    from { opacity: 0; }
    to   { opacity: 1; }
}

/* Firefox < 16 */
@-moz-keyframes fadein {
    from { opacity: 0; }
    to   { opacity: 1; }
}

/* Safari, Chrome and Opera > 12.1 */
@-webkit-keyframes fadein {
    from { opacity: 0; }
    to   { opacity: 1; }
}

/* Internet Explorer */
@-ms-keyframes fadein {
    from { opacity: 0; }
    to   { opacity: 1; }
}

/* Opera < 12.1 */
@-o-keyframes fadein {
    from { opacity: 0; }
    to   { opacity: 1; }
}
  body { margin:0; padding:0; }
  #map { position:absolute; top:0; bottom:0; width:100%; }
</style>

  <div id='map'></div>
  <script>
  L.mapbox.accessToken = 'pk.eyJ1IjoicHN1a2hlZGVsb3MiLCJhIjoiZmYwMTc1NDNjZGM3NjE5ODdmYjc3NWM3MzFiNmZmNjUifQ.NFvyZqxbpAJKvTbPBVrZ6Q';
  var map = L.mapbox.map('map', 'mapbox.outdoors')
      .setView([-41.2749311,174.7790948], 9);

      // L.marker is a low-level marker constructor in Leaflet.
L.marker([-41.2749311,174.7790948], {
    icon: L.mapbox.marker.icon({
        'marker-size': 'large',
        'marker-symbol': 'bus',
        'marker-color': '#fa0'
    })
}).addTo(map);
  </script>


  </div>
</div>


</body>
</html>
