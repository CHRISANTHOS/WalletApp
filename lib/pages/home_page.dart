import 'package:flutter/material.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'home_screen.dart';
import 'analysis_screen.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  PageController controller = PageController(initialPage: 0);

  Widget _buttomNav(){
    return Align(
      alignment: Alignment.bottomCenter,
      child: FloatingNavbar(
        margin: const EdgeInsets.all(15),
        padding: const EdgeInsets.all(15),
        selectedBackgroundColor: Colors.transparent,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white30,
        backgroundColor: Colors.black,
        borderRadius: 24,
        iconSize: 30,
        items: [
          FloatingNavbarItem(icon: Iconsax.home1),
          FloatingNavbarItem(icon: Iconsax.chart),
          FloatingNavbarItem(icon: Iconsax.notification),
          FloatingNavbarItem(icon: Iconsax.setting)
        ],
        currentIndex: index,
        onTap: (i) {
          setState(() {
            index = i;
            controller.jumpToPage(index);
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              controller: controller,
              children: const [
                HomeScreen(),
                AnalysisScreen()
              ],
            ),
            _buttomNav(),
          ],
        ),
      ),
    );
  }
}


