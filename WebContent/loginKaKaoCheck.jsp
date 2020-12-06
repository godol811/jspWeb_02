<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Simple Markers</title>
    <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
    <script
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDFg2V1t9yHFnpoPxoNjwYxfoDruN8EE6M&callback=initMap&libraries=&v=weekly"
      defer
    ></script>
    <style type="text/css">
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 100%;
      }

      /* Optional: Makes the sample page fill the window. */
      html,
      body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
    </style>
    <script>
      "use strict";

      function initMap() {
        const myLatLng = {
          lat: 37.4221,
          lng: -122.0841
        };
        const map = new google.maps.Map(document.getElementById("map"), {
          zoom: 13,
          center: myLatLng,
          fullscreenControl: true,
          zoomControl: true,
          streetViewControl: false
        });
        new google.maps.Marker({
          position: myLatLng,
          map,
          title: "Hello World!"
        });
      }
    </script>
  </head>
  <body>
    <div id="map"></div>
  </body>
</html>