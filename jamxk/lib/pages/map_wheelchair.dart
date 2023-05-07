import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jamxk/%20common/assets.dart';
import 'package:jamxk/%20common/global.dart';
import 'package:jamxk/%20common/keys.dart';
import 'package:jamxk/objects/mapResultModel.dart';
import 'package:jamxk/theme/map_style.dart';
import 'package:http/http.dart' as http;

class WheelchairMap extends StatefulWidget {
  const WheelchairMap({super.key});

  @override
  State<WheelchairMap> createState() => _WheelchairMapState();
}

class _WheelchairMapState extends State<WheelchairMap> {
  final Completer<GoogleMapController> mapController = Completer();
  //GoogleMapController? mapController;
  static LatLng? _initialPosition;
  Iterable markers = [];
  List<dynamic> add = [];
  MapType _defaultMapType = MapType.normal;
  List<Marker> lstMarkers = [];
  var loading = false;
  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;

  void _onMapCreated(GoogleMapController controller) {
    mapController.complete(controller);
    controller.setMapStyle(mapStyle);
  }

  @override
  void initState() {
    super.initState();
    addCustomIcon();
    GoogleMapsQuery(1500, 'restaurant');
    _initialPosition = LatLng(latitude!, longitude!);
    markers = _markers;
  }

  void addCustomIcon() async {
    markerIcon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(),
      "assets/images/bike.png",
    );

    BitmapDescriptor.fromAssetImage(const ImageConfiguration(), wheelchairPNG)
        .then(
      (icon) {
        setState(() {
          markerIcon = icon;
        });
      },
    );
  }

  Iterable _markers = Iterable.generate(gresult[0].results.length, (index) {
    return Marker(
      markerId: MarkerId(gresult[0].results[index].placeId.toString()),
      position: LatLng(
        gresult[0].results[index].geometry!.location!.lat!,
        gresult[0].results[index].geometry!.location!.lng!,
      ),
      infoWindow: InfoWindow(
        title: gresult[0].results[index].name,
        snippet: gresult[0].results[index].openingHours!.openNow! == true
            ? "It's open"
            : "It's closed",
        onTap: () {},
      ),
    );
    // }
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          // drawer: NavigationDrawerWidget(),
          appBar: AppBar(
            centerTitle: false,
            backgroundColor: buttonColor,
            title: Text("WheelChair Accessible Map"),
          ),
          body: Stack(children: <Widget>[
            GoogleMap(
              onMapCreated: _onMapCreated,
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              zoomControlsEnabled: true,
              mapType: _defaultMapType,
              mapToolbarEnabled: true,
              zoomGesturesEnabled: true,
              initialCameraPosition:
                  CameraPosition(target: _initialPosition!, zoom: 13.0),
              markers: Set.from(markers),
              scrollGesturesEnabled: true,
            ),
            Container(
              margin: EdgeInsets.only(top: 80, right: 10),
              alignment: Alignment.topRight,
              child: Column(children: <Widget>[
                FloatingActionButton(
                    child: Icon(Icons.balance),
                    elevation: 5,
                    backgroundColor: buttonColor,
                    onPressed: () {
                      _changeMapType(1);
                      print('Changing the Map Type');
                    }),
                FloatingActionButton(
                    child: Icon(Icons.layers),
                    elevation: 5,
                    backgroundColor: buttonColor,
                    onPressed: () {
                      _changeMapType(2);
                      print('Changing the Map Type');
                    }),
                FloatingActionButton(
                    child: Icon(Icons.layers),
                    elevation: 5,
                    backgroundColor: buttonColor,
                    onPressed: () {
                      _changeMapType(3);
                      print('Changing the Map Type');
                    })
              ]),
            ),
          ]),
        ),
        onWillPop: _onWillPop);
  }

  Future _changeMapType(int value) async {
    final controller = await mapController.future;
    switch (value) {
      case 1:
        controller.setMapStyle(monochromeStyle);
        break;
      case 2:
        controller.setMapStyle(tritanopiaStyle);
        break;
      case 3:
        controller.setMapStyle(deuteranopiaStyle);
        break;
      default:
    }
  }

  void _moveMap() {}

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: new Text('Are you sure?'),
            content: new Text('Do you want to exit'),
            actions: <Widget>[
              TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: new Text('No')),
              TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: new Text('Yes'))
            ],
          ),
        )) ??
        false;
  }

  void location_permission() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        latitude = 40.6643;
        longitude = -73.9385;
        // return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      latitude = 40.6643;
      longitude = -73.9385;

      // return Future.error(
      //     'Location permissions are permanently denied, we cannot request permissions.');
    }
    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      var position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
          timeLimit: Duration(seconds: 10));
      latitude = position.latitude;
      longitude = position.longitude;
    }
    _initialPosition = LatLng(latitude!, longitude!);

    GoogleMapsQuery(1500, 'restaurant');
  }

  void GoogleMapsQuery(var radius, var type) async {
    var keyword = 'wheelchair accessible';
    var location = latitude.toString() + ',' + longitude.toString();

    var urlAccess = Uri.https(googleURL, '/maps/api/place/nearbysearch/json', {
      'keyword': keyword,
      'location': location,
      'radius': radius.toString(),
      'type': type,
      'key': googleMapsAPI
    });
    final responseS = await http.get(urlAccess);

    if (responseS.statusCode == 200) {
      var jsonResponse = json.decode(utf8.decode(responseS.bodyBytes));

      gresult.add(googleResult.fromJson(jsonResponse));
    }

    // else {
    // Fluttertoast.showToast(
    //     msg: S.of(context).errorLogin,
    //     toastLength: Toast.LENGTH_SHORT,
    //     gravity: ToastGravity.CENTER,
    //     backgroundColor: color_botones.withOpacity(0.5),
    //     textColor: Colors.white);
    // setState(() {
    //   controller.stop();
    // });
    // }
  }
}
