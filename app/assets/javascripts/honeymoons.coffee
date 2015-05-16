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

window.showMap = () ->
  handler = Gmaps.build('Google')
  geocoder = new google.maps.Geocoder()
  directionsDisplay = new google.maps.DirectionsRenderer()
  directionsService = new google.maps.DirectionsService()
  handler.buildMap({provider: {styles: mapStyle, center: new google.maps.LatLng(51, 8), zoom: 5}, internal: {id: 'map-canvas'}}, ->
    directionsDisplay.setMap(handler.getMap())
    $.getJSON($('#map-canvas').data('url'), (destinations) ->
      origin = destinations.shift()
      destination = destinations.pop()
      dests = []
      destinations.forEach((destination) ->
        dests.push({location: destination.name, stopover: true})
      );
      request = {
        origin: origin.name,
        destination: destination.name,
        travelMode: google.maps.TravelMode.DRIVING,
        waypoints: dests
      };
      directionsService.route(request, (response, status) ->
        if (status == google.maps.DirectionsStatus.OK)
          directionsDisplay.setDirections(response)
      )
    )
  )