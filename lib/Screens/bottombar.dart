import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:mynotes/Screens/home.dart';
import 'package:mynotes/Screens/pprofie.dart';

import 'completed.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

final screens = [
  Home(),
  CompetedNotes(),
];

int currentIndex = 0;

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height * 0.1,
        child: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            backgroundColor: Colors.grey.shade900.withOpacity(0.45),
            currentIndex: currentIndex,
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    FeatherIcons.fileText,
                    color: Colors.white,
                  ),
                  label: 'Notes'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.done,
                    color: Colors.white,
                  ),
                  label: 'Completed'),
            ]),
      ),
    );
  }
}
