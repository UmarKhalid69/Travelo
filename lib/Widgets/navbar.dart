import 'package:flutter/material.dart';
import 'package:travel_app_se/Home.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.history),
          label: 'History',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home_filled),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle_rounded),
          label: 'Profile',
        ),
      ],
      currentIndex: 1,
      onTap: (index) {
        if (index == 1) {
          Navigator.pushNamed(context, '/history');
        } else if (index == 0) {
          Navigator.pushNamed(context, const HomeScreen().toStringShort());
        } else if (index == 2) {
          Navigator.pushNamed(context, '/profile');
        }
      },
    );
  }
}
