import 'dart:ui';

import 'package:flutter/material.dart';
import 'levels.dart';
import 'trophies.dart';
import 'profile.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  int selectedIndex = 0;

  void navigate(int index){
    setState(() {
      selectedIndex = index;
    });
  }

  final List<Widget> pages = [
    const Trophies(),
    const Levels(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 60),
        child: Opacity(
          opacity: 0.9,
          child: AppBar(
            flexibleSpace:
            BackdropFilter(filter: ImageFilter.blur(
              sigmaX: 10.0,
              sigmaY: 10.0,
              ),
              child: Container(
              color: Colors.transparent,
            ),
            ),
            backgroundColor: Theme.of(context).colorScheme.primary,
            title: const Text("Patrocle", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 35),),
            centerTitle: true,
            elevation: 0,
          ),
        ),
      ),
      body: pages[selectedIndex],
      bottomNavigationBar: SizedBox(
        height: 70,
        child: ClipRRect(
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(0), topRight: Radius.circular(0)),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 10.0,
              sigmaY: 10.0,
            ),
            child: Opacity(
              opacity: 0.90,
              child: BottomNavigationBar(
                backgroundColor: Theme.of(context).colorScheme.primary,
                type: BottomNavigationBarType.fixed,
                currentIndex: selectedIndex,
                onTap: navigate,
                unselectedItemColor: Colors.white,
                selectedItemColor: const Color.fromARGB(255, 102, 102, 255),
                showUnselectedLabels: false,
                items: [
                BottomNavigationBarItem(icon: Image.asset("assets/TrophyIcon.png", height: 35, color: selectedIndex == 0 ? const Color.fromARGB(255, 102, 102, 255) : Colors.white), label: "Trophies"),
                BottomNavigationBarItem(icon: Image.asset("assets/HouseIcon.png", height: 35, color: selectedIndex == 1 ? const Color.fromARGB(255, 102, 102, 255) : Colors.white), label: "Levels"),
                BottomNavigationBarItem(icon: Image.asset("assets/ProfileIcon.png", height: 35, color: selectedIndex == 2 ? const Color.fromARGB(255, 102, 102, 255) : Colors.white), label: "Profile"),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}