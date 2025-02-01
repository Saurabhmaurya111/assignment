import 'package:flutter/material.dart';
import 'package:flutter_assignment/home.dart';

class MyBottomNavBar extends StatefulWidget {
  const MyBottomNavBar({super.key});

  @override
  State<MyBottomNavBar> createState() => _MyButtomNavBarState();
}

class _MyButtomNavBarState extends State<MyBottomNavBar> {
  int myCurrentIndex = 0;
  List pages = [
    Home(),
    Home(),
    Home(),
    Home(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // extendBody: true,
      bottomNavigationBar: ClipRRect(
        child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            selectedItemColor: Colors.black,
            // unselectedItemColor: Colors.black,
            currentIndex: myCurrentIndex,
            onTap: (index) {
              setState(() {
                myCurrentIndex = index;
              });
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home, size: 26), label: ""),
              BottomNavigationBarItem(
                  icon: Icon(Icons.manage_search_rounded, size: 26), label: ""),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_border_outlined, size: 26), label: ""),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline, size: 26), label: ""),
            ]),
      ),
      body: pages[myCurrentIndex],
);
}
}