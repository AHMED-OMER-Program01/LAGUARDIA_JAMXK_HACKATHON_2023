import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:jamxk/%20common/assets.dart';
import 'package:jamxk/%20common/global.dart';
import 'package:jamxk/%20common/keys.dart';
import 'package:jamxk/%20common/magic_numbers.dart';
import 'package:jamxk/Menu/main_menu.dart';
import 'package:jamxk/home/bloc/home_bloc.dart';
import 'package:jamxk/objects/mapResultModel.dart';
import 'package:jamxk/pages/carbon_input.dart';
import 'package:jamxk/pages/chart.dart';
import 'package:jamxk/pages/map_wheelchair.dart';
import 'package:jamxk/pages/profile.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    location_permission();
    super.initState();
  }

  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
        listenWhen: (previous, current) => previous.status != current.status,
        listener: (context, state) {
          if (state.status == HomeStatus.loaded) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Carbon Foot Print Solution',
                  style: const TextStyle(
                    fontSize: 22.0,
                  ),
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
              bottomNavigationBar: AppBottonBar(
                currentIndex: state.index,
              ),
              body: state.index == 0
                  ? const _HomeBody()
                  : state.index == 1
                      ? const WheelchairMap()
                      : state.index == 2
                          ? ChartPage()
                          : state.index == 3
                              ? WheelchairMap()
                              : WheelchairMap());
        });
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
    // _initialPosition = LatLng(latitude!, longitude!);

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

class _HomeBody extends StatelessWidget {
  const _HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [purple, deepBlue],
            transform: GradientRotation(gradientRotation),
          ),
        ),
      ),
    );
  }
}
