import 'dart:async';
import 'dart:collection';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_ui_source/google_maps/constant/app_constant.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import 'package:maps_toolkit/maps_toolkit.dart' as mp;

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng sourceLocation = const LatLng(31.041901490334578, 31.399718038737774);

//  final destinationLocation = const LatLng(31.0162202, 31.3761024);

  List<LatLng> polygonCords = const [
    //LatLng(31.0527518, 31.3880721),
    // LatLng(31.06021, 31.3832528),
    LatLng(31.0473393, 31.3780107),
    LatLng(31.0519265, 31.4044526),
    LatLng(31.0210735, 31.4102592),
    LatLng(31.0263399, 31.392298),
    LatLng(31.0414531, 31.3416397),
  ];

  Set<Polyline> polyLine = HashSet<Polyline>();
  Set<Marker> markers = HashSet<Marker>();

  // bool isInArea = false;

  // checkIfPointInArea(LatLng point) {
  //   List<mp.LatLng> points = polygonCords
  //       .map(
  //         (e) => mp.LatLng(
  //           e.latitude,
  //           e.longitude,
  //         ),
  //       )
  //       .toList();
  //
  //   setState(() {
  //     isInArea = mp.PolygonUtil.containsLocation(
  //       mp.LatLng(point.latitude, point.longitude),
  //       points,
  //       false,
  //     );
  //   });
  // }

  Completer<GoogleMapController> mapController = Completer();

  List<LatLng> points = [];

  setUpPolyline() async {
    //await getCurrentLocation();
    polyLine.clear();
    points.clear();
    PolylinePoints polylinePoints = PolylinePoints();
    final result = await polylinePoints.getRouteBetweenCoordinates(
      AppConstant.mapApiKey,
      PointLatLng(sourceLocation.latitude, sourceLocation.longitude),
      PointLatLng(currentLocation!.latitude!, currentLocation!.longitude!),
    );
    if (result.points.isNotEmpty) {
      for (var element in result.points) {
        points.add(LatLng(element.latitude, element.longitude));
      }
      polyLine.add(
        Polyline(
          polylineId: PolylineId('${Random().nextInt(1000000)}'),
          points: points,
          color: Colors.red,
          width: 5,
        ),
      );
      setState(() {});
    }
  }

  LocationData? currentLocation;

  Future<void> getCurrentLocation() async {
    markers.add(
      Marker(
        markerId: const MarkerId('source'),
        position: sourceLocation,
        icon: sourceIcon,
      ),
    );
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    currentLocation = await location.getLocation();
    markers.add(
      Marker(
        markerId: const MarkerId('current m'),
        position:
        LatLng(currentLocation!.latitude!, currentLocation!.longitude!),
        icon: currentIcon,
      ),
    );
    setState(() {});
    GoogleMapController googleMapController = await mapController.future;
    location.onLocationChanged.listen((newLoc) {
      currentLocation = newLoc;
      googleMapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            zoom: 13.2,
            target: LatLng(
              newLoc.latitude!,
              newLoc.longitude!,
            ),
          ),
        ),
      );
      markers.removeWhere((m) => m.markerId.value == 'current m');
      markers.add(
        Marker(
          markerId: const MarkerId('current m'),
          position: LatLng(newLoc.latitude!, newLoc.longitude!),
          icon: currentIcon,
        ),
      );
      // checkIfPointInArea(
      //   LatLng(
      //     newLoc.latitude!,
      //     newLoc.longitude!,
      //   ),
      // );
      setState(() {});
    });
  }

  bool isInCircle = true;
  double circleRadius = 2000;

  BitmapDescriptor sourceIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor currentIcon = BitmapDescriptor.defaultMarker;

  Future<void> setIcons() async {
    // BitmapDescriptor.fromAssetImage(
    //         ImageConfiguration.empty, 'assets/images/loc.png')
    //     .then(
    //   (value) => currentIcon = value,
    // );
    BitmapDescriptor.fromAssetImage(
        ImageConfiguration.empty, 'assets/images/loc.png')
        .then(
          (value) => sourceIcon = value,
    );
    setState(() {});
  }

  // double getCircleRadius() => mp.SphericalUtil.computeDistanceBetween(
  //       mp.LatLng(currentLocation!.latitude!, currentLocation!.longitude!),
  //       mp.LatLng(sourceLocation.latitude, sourceLocation.longitude),
  //     ).toDouble();

  checkIfCircle() {
    var result = mp.SphericalUtil.computeDistanceBetween(
      mp.LatLng(currentLocation!.latitude!, currentLocation!.longitude!),
      mp.LatLng(sourceLocation.latitude, sourceLocation.longitude),
    );
    if (result.toDouble() > circleRadius) {
      debugPrint('yes greater');
      setState(() {
        isInCircle = false;
      });
    } else {
      setState(() {
        isInCircle = true;
      });
    }
    debugPrint('distance is $result');
    // var res = mp.SphericalUtil.computeArea(
    //   <mp.LatLng>[
    //     mp.LatLng(currentLocation!.latitude!, currentLocation!.longitude!),
    //     mp.LatLng(sourceLocation.latitude, sourceLocation.longitude),
    //   ],
    // );
    // debugPrint('area is $res');
  }

  @override
  void initState() {
    setIcons();

    getCurrentLocation().then((value) {
      setUpPolyline();
      // checkIfPointInArea(
      //   LatLng(
      //     currentLocation!.latitude!,
      //     currentLocation!.longitude!,
      //   ),
      // );
      checkIfCircle();
      // getCircleRadius();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('google maps'),
      ),
      body: currentLocation == null
          ? const Center(
        child: CircularProgressIndicator.adaptive(),
      )
          : Stack(
        children: [
          GoogleMap(
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            onTap: (LatLng tappedLoc) {
              markers.removeWhere(
                      (element) => element.markerId.value == 'source');

              sourceLocation = tappedLoc;
              markers.add(
                Marker(
                  markerId: const MarkerId('source'),
                  position: tappedLoc,
                  icon: sourceIcon,
                ),
              );
              setUpPolyline();
              //  getCircleRadius();
              checkIfCircle();
              setState(() {});
              debugPrint('tab lat is ${tappedLoc.latitude}');
              debugPrint('tab long is ${tappedLoc.longitude}');
            },
            initialCameraPosition: CameraPosition(
              target: LatLng(
                currentLocation!.latitude!,
                currentLocation!.longitude!,
              ),
              zoom: 13.2,
            ),
            markers: markers,
            circles: {
              Circle(
                circleId: const CircleId('current'),
                center: LatLng(
                  currentLocation!.latitude!,
                  currentLocation!.longitude!,
                ),
                radius: circleRadius,
                strokeWidth: 1,
                fillColor: Colors.red.withOpacity(.4),
                strokeColor: Colors.red,
              )
            },
            polylines: polyLine,
            // polylines: {
            //   Polyline(
            //     polylineId: const PolylineId('pol'),
            //     points: points,
            //     color: Colors.red,
            //     width: 5,
            //   ),
            // },
            // polygons: {
            //   Polygon(
            //     polygonId: const PolygonId('polygon'),
            //     points: polygonCords,
            //     strokeWidth: 1,
            //     strokeColor: Colors.red,
            //     fillColor: Colors.red.withOpacity(.3),
            //   ),
            // },
            onMapCreated: (controller) {
              mapController.complete(controller);
            },
          ),
          if (!isInCircle)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.red.withOpacity(.7),
                alignment: Alignment.center,
                padding: const EdgeInsets.all(25),
                child: Text(
                  'No Available Location',
                  style:
                  Theme
                      .of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
