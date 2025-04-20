import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import '../../controller/user_home_controller.dart';
import '../../core/constant/routes.dart';
import '../../utils/constants.dart' as constants;

class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({Key? key}) : super(key: key);

  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  GoogleMapController? mapController;
  Location location = Location();

  bool _serviceEnabled = false;
  PermissionStatus _permissionGranted = PermissionStatus.denied;
  LocationData? _locationData;

  PolylinePoints polylinePoints = PolylinePoints();
  Map<PolylineId, Polyline> polylines = {};

  @override
  void initState() {
    super.initState();
    _checkLocationPermission();
  }

  Future<void> _checkLocationPermission() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) return;
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) return;
    }

    _locationData = await location.getLocation();
    if (mounted && _locationData != null) {
      setState(() {
        mapController?.animateCamera(
          CameraUpdate.newLatLngZoom(
            LatLng(_locationData!.latitude!, _locationData!.longitude!),
            14,
          ),
        );
      });
    }
  }

  Future<void> _drawPolyline({
    required LatLng from,
    required LatLng to,
    required String id,
  }) async {
    List<LatLng> polylineCoordinates = [];
// النقطة الأصلية
    double _originLatitude = 6.9271;
    double _originLongitude = 79.8612; // كولومبو

// النقطة النهائية
    double _destLatitude = 7.0924;
    double _destLongitude = 79.9892; // غامبها
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleApiKey: constants.googleMapAPiKey,
      request: PolylineRequest(
        origin: PointLatLng(_originLatitude, _originLongitude),  // نقطة البداية
        destination: PointLatLng(_destLatitude, _destLongitude),  // نقطة الوصول
        mode: TravelMode.driving,  // النوع ديال التنقل (هنا السيارة)
        wayPoints: [
          PolylineWayPoint(location: "Sabo, Yaba Lagos Nigeria")  // نقطة اضافية كـ waypoint
        ],
      ),
    );

    print(result.points);  // طباعة النقاط باش تشوف الطريق


    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }

      setState(() {
        polylines.clear();
        polylines[PolylineId(id)] = Polyline(
          polylineId: PolylineId(id),
          points: polylineCoordinates,
          width: 6,
          color: Theme.of(context).primaryColor,
        );
      });
    } else {
      print('Polyline error: ${result.errorMessage}');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GetBuilder<UserHomeController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: const Text('Wesalni'),
          actions: [
            IconButton(
              onPressed: () {
                Get.toNamed(AppRoute.userProfileScreen);
              },
              icon: const Icon(Icons.account_circle),
            ),
          ],
        ),
        body: SizedBox(
          height: size.height,
          width: size.width,
          child: GoogleMap(
            zoomGesturesEnabled: true,
            zoomControlsEnabled: false,
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            mapToolbarEnabled: false,
            onMapCreated: (GoogleMapController controller) {
              mapController = controller;
            },
            initialCameraPosition: const CameraPosition(
              target: LatLng(34.020882, -6.841650), // مكان مبدئي
              zoom: 14,
            ),
            markers: {
              Marker(
                markerId: MarkerId('regency'),
                position: LatLng(34.020882, -6.841650),
                infoWindow: InfoWindow(title: 'Rond-point Regency'),
                icon:
                BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
                onTap: () async {
                  await _drawPolyline(
                    from: LatLng(34.020882, -6.841650),
                    to: LatLng(34.028000, -6.836000),
                    id: 'regency_to_ecole',
                  );
                },
              ),
              Marker(
                markerId: MarkerId('ecole'),
                position: LatLng(34.028000, -6.836000),
                infoWindow: InfoWindow(title: 'École El Irfane'),
                icon:
                BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
              ),
            },
            polylines: Set<Polyline>.of(polylines.values),
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: _checkLocationPermission,
              child: const Icon(Icons.my_location),
            ),
            const SizedBox(height: 10),
            FloatingActionButton(
              onPressed: () {
                Get.bottomSheet(
                  Container(
                    height: size.height * 0.3,
                    color: Colors.white,
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Where are you going?',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        DropdownButtonFormField<String>(
                          onChanged: (value) {},
                          validator: (value) {
                            if (value == null) {
                              return 'Please select a destination';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: 'Select destination stop',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            prefixIcon: const Icon(Icons.search_rounded),
                          ),
                          items: const [
                            DropdownMenuItem(
                              value: '34.028000,-6.836000',
                              child: Text('École El Irfane'),
                            ),
                            DropdownMenuItem(
                              value: '34.020882,-6.841650',
                              child: Text('Rond-point Regency'),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              // هنا تقدر دير navigation ولا رسم route
                            },
                            style: ElevatedButton.styleFrom(
                              fixedSize: const Size(0, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text('Submit'),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              child: const Icon(Icons.directions),
            ),
          ],
        ),
      ),
    );
  }
}
