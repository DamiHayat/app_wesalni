import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // متغير ديال الـMarkers
  Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();

    // إضافة Marker للداخلة
    _markers.add(
      Marker(
        markerId: MarkerId('dakhlah'), // تعريف الـMarker
        position: LatLng(23.6847, -15.9570), // إحداثيات الداخلة
        infoWindow: InfoWindow(
          title: 'الداخلة',
          snippet: 'مدينة جميلة في الصحراء المغربية',
        ),
        icon: BitmapDescriptor.defaultMarker, // تخصيص أيقونة marker
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          // GoogleMap خلفية الصفحة
          Container(
            height: size.height,
            width: double.infinity,
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(23.6847, -15.9570), // الداخلة
                zoom: 13,
              ),
              markers: _markers, // إضافة الـMarker
            ),
          ),

          // شريط البحث العائم
          Positioned(
            top: 40, // وضعه في الأعلى
            left: 16,
            right: 16,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7), // خلفية أغمق
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.search,
                    color: Colors.white, // لون الأيقونة أبيض
                  ),
                  const Expanded(
                    child: TextField(
                      showCursor: true, // لتفعيل المؤشر في الـTextField
                      style: TextStyle(
                        color: Colors.white, // نص أبيض
                      ),
                      decoration: InputDecoration(
                        hintText: 'Rechercher un lieu...',
                        hintStyle: TextStyle(
                          color: Colors.white54, // النص التلميحي أبيض شفاف
                        ),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.mic,
                    color: Colors.white, // لون الأيقونة أبيض
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
