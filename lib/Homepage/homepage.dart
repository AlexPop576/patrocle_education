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

  final List<Widget> Pages = [
    Trophies(),
    Levels(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text("Patrocle", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 35),),
        centerTitle: true,
        elevation: 0,
      ),
      body: Pages[selectedIndex],
      bottomNavigationBar: SizedBox(
        height: 60,
        child: ClipRRect(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          child: BottomNavigationBar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            type: BottomNavigationBarType.fixed,
            currentIndex: selectedIndex,
            onTap: navigate,
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.white,
            items: [
            BottomNavigationBarItem(icon: Icon(Icons.price_change), label: "Trophies"),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Levels"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ]),
        ),
      ),
    );
  }
}