import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:first_project_flutter/view/screen/show_map.dart';
import 'package:first_project_flutter/view/screen/user_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'bus_detail_screen.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _bottomNavIndex = 0;

  // List of the pages
  final List<Widget> pages = [
    UserHomeScreen(),
    BusDetailScreen(),
    Home(),
    Home()
  ];

  // List of the pages icons
  final List<IconData> iconList = [
    Icons.home,
    Icons.favorite,
    Icons.map_outlined,
    Icons.person,
  ];

  // List of the pages titles
  final List<String> titleList = [
    'Home',
    'Favorite',
    'Cart',
    'Profile',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              titleList[_bottomNavIndex],
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 24,
              ),
            ),
            Icon(
              Icons.notifications,
              color: Colors.black,
              size: 30.0,
            ),
          ],
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
      ),
      body: IndexedStack(
        index: _bottomNavIndex,
        children: pages,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            PageTransition(
              child: Home(),
              type: PageTransitionType.bottomToTop,
            ),
          );
        },
        child: Image.asset(
          'assets/images/code-scan.png',
          height: 40.0,
        ),
        backgroundColor: Colors.white,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        splashColor: Colors.deepOrangeAccent,
        activeColor: Colors.deepOrangeAccent,
        inactiveColor: Colors.black.withOpacity(.5),
        icons: iconList,
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        onTap: (index) {
          setState(() {
            _bottomNavIndex = index;
          });
        },
      ),
    );
  }
}
