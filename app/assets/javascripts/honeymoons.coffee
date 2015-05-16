# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
mapStyle = [{"featureType": "administrative", "elementType": "labels.text.fill", "stylers": [{"color": "#444444"}]},
  {"featureType": "landscape", "elementType": "all", "stylers": [{"color": "#f2f2f2"}]},
  {"featureType": "poi", "elementType": "all", "stylers": [{"visibility": "off"}]},
  {"featureType": "road", "elementType": "all", "stylers": [{"saturation": -100}, {"lightness": 45}]},
  {"featureType": "road.highway", "elementType": "all", "stylers": [{"visibility": "simplified"}]},
  {"featureType": "road.arterial", "elementType": "labels.icon", "stylers": [{"visibility": "off"}]},
  {"featureType": "transit", "elementType": "all", "stylers": [{"visibility": "off"}]},
  {"featureType": "water", "elementType": "all", "stylers": [{"color": "#46bcec"}, {"visibility": "on"}]}]

geocoder = null
handler = null
directionsDisplay = null
directionsService = null

addDestinationToMap = (destination) ->
  geocoder.geocode({'address': destination.name}, (results, status) ->
    if (status == google.maps.GeocoderStatus.OK)
      marker = handler.addMarker({
        "lat": results[0].geometry.location.lat(),
        "lng": results[0].geometry.location.lng(),
        "infowindow": destination.name
      })
      handler.bounds.extendWith(marker)
      handler.fitMapToBounds()
  )

window.showMap = () ->
  handler = Gmaps.build('Google')
  geocoder = new google.maps.Geocoder()
  directionsDisplay = new google.maps.DirectionsRenderer()
  directionsService = new google.maps.DirectionsService()
  handler.buildMap({provider: {styles: mapStyle}, internal: {id: 'map-canvas'}}, ->
    $.getJSON($('#map-canvas').data('url'), (destinations) ->
      destinations.forEach((destination) ->
        addDestinationToMap(destination)
      );
    )
  );