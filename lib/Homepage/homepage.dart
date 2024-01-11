import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  int? selectedLanguage = 1;
  int a = 1;

  Map<int, Map<String, String>> languageText = {
    1 : {
      "Trophies" : "Trophies",
      "Levels" : "Levels",
      "Profile" : "Profile",
    },
    2 : {
      "Trophies" : "Trofee",
      "Levels" : "Nivele",
      "Profile" : "Profil",
    },
    3 : {
      "Trophies" : "Trofeos",
      "Levels" : "Niveles",
      "Profile" : "Perfil",
    },
    4 : {
      "Trophies" : "Trófeák",
      "Levels" : "Szintek",
      "Profile" : "Profil",
    },
    5 : {
      "Trophies" : "Trophées",
      "Levels" : "Niveaux",
      "Profile" : "Profil",
    },
  };

  void getData() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    if(pref.getInt('language')!=null){
      selectedLanguage = pref.getInt('language');
    }else{
      selectedLanguage = 1;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  void navigate(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 60),
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 25.0,
              sigmaY: 25.0,
            ),
            child: Opacity(
              opacity: 0.7,
              child: AppBar(
                flexibleSpace: Container(color: Colors.transparent),
                backgroundColor: Theme.of(context).colorScheme.primary,
                title: const Text(
                  "Patrocle",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 35),
                ),
                centerTitle: true,
                elevation: 0,
              ),
            ),
          ),
        ),
      ),
      body: selectedIndex == 0 ? Trophies(index: selectedIndex,) : selectedIndex == 1 ? Levels() : Profile(),
      bottomNavigationBar: SizedBox(
        height: 68,
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(0), topRight: Radius.circular(0)),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 25.0,
              sigmaY: 25.0,
            ),
            child: Opacity(
              opacity: 0.7,
              child: BottomNavigationBar(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  type: BottomNavigationBarType.fixed,
                  currentIndex: selectedIndex,
                  onTap: navigate,
                  unselectedItemColor: const Color.fromARGB(160, 255, 255, 255),
                  selectedItemColor: const Color.fromARGB(255, 102, 102, 255),
                  showUnselectedLabels: false,
                  items: [
                    BottomNavigationBarItem(
                        icon: Image.asset("assets/TrophyIcon.png",
                            height: 35,
                            color: selectedIndex == 0
                                ? const Color.fromARGB(255, 102, 102, 255)
                                : Colors.white),
                        label: languageText[selectedLanguage]!["Trophies"] ?? "Trophies"),
                    BottomNavigationBarItem(
                        icon: Image.asset("assets/HouseIcon.png",
                            height: 35,
                            color: selectedIndex == 1
                                ? const Color.fromARGB(255, 102, 102, 255)
                                : Colors.white),
                        label: languageText[selectedLanguage]!["Levels"] ?? "Levels"),
                    BottomNavigationBarItem(
                        icon: Image.asset("assets/ProfileIcon.png",
                            height: 35,
                            color: selectedIndex == 2
                                ? const Color.fromARGB(255, 102, 102, 255)
                                : Colors.white),
                        label: languageText[selectedLanguage]!["Profile"] ?? "Profile"),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
