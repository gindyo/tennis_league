function initialize() {
  var markers = []
  var mapOptions = {
          zoom: 6,
          center: new google.maps.LatLng(-34.397, 150.644)
  };
  var map = new google.maps.Map(document.getElementById('map_canvas'), mapOptions);
  var input = ( document.getElementById('pac-input'));
  map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);
  var searchBox = new google.maps.places.SearchBox((input));
  var defaultBounds = new google.maps.LatLngBounds(
    new google.maps.LatLng(-33.8902, 151.1759),
    new google.maps.LatLng(-33.8474, 151.2631));
    map.fitBounds(defaultBounds);

  google.maps.event.addListener(searchBox, 'places_changed', function() {
  var places = searchBox.getPlaces();

  if (places.length == 0) {
    return;
  }
  for (var i = 0, marker; marker = markers[i]; i++) {
    marker.setMap(null);
  }

  var bounds = new google.maps.LatLngBounds();
  for (var i = 0, place; place = places[i]; i++) {
    var image = {
    url: place.icon,
    size: new google.maps.Size(71, 71),
    origin: new google.maps.Point(0, 0),
    anchor: new google.maps.Point(17, 34),
    scaledSize: new google.maps.Size(25, 25)
  };

  var marker = new google.maps.Marker({
      map: map,
      icon: image,
      title: place.name,
      position: place.geometry.location
    });

    markers.push(marker);

    bounds.extend(place.geometry.location);
  }

    map.fitBounds(bounds);
  });

}

function loadScript() {
    var script1 = document.createElement('script');
    script1.type = 'text/javascript';
    script1.src = 'https://maps.googleapis.com/maps/api/js?v=3.exp&' +
    'callback=initialize&libraries=places';
    document.body.appendChild(script1);
    }

 
window.onload = loadScript;
