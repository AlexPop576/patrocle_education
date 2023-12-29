import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:patrocle_education/Components/trophie_tile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Trophies extends StatefulWidget {
  int? index;
  Trophies({super.key, this.index});

  @override
  // ignore: no_logic_in_create_state
  State<Trophies> createState() => _TrophiesState(index: index);
}

class _TrophiesState extends State<Trophies> {
  int? geographerTrophy = 0, historianTrophy = 0, c = 0;
  List<String> trophiesName = [];
  int? selectedLanguage = 1;
  int? index;
  _TrophiesState({this.index});

  @override
  void initState() {
    super.initState();
    ask();
    getData();
    //trophiesName = trophiesList;
  }

  void getData() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    //pref.setStringList('trophyList', trophiesList);
    trophiesName = pref.getStringList('trophyList')!;
    //if(pref.getInt('Geographer')==1){trophiesName.add("Geographer");}

    selectedLanguage = pref.getInt('language');
  }

  void ask() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setStringList('trophyList', trophiesList);
  }

  List<String> trophiesList = [
    "Geographer",
    "Historian",
    "Curious",
    "Knowledgeable",
    "Expert",
    "Champion",
    "Untouchable",
    "Legend",
  ];

  Map<int, Map<String, String>> languageText = {
    1: {
      "Your trophies": "Your trophies",
      "Locked": "Locked",
      "Geographer": "Geographer",
      "Historian": "Historian",
      "Curious": "Curious",
      "Knowledgeable": "Knowledgeable",
      "Expert": "Expert",
      "Champion": "Champion",
      "Untouchable": "Untouchable",
      "Legend": "Legend",
    },
    2: {
      "Your trophies": "Trofeele tale",
      "Locked": "Blocat",
      "Geographer": "Geograf",
      "Historian": "Istoric",
      "Curious": "Curios",
      "Knowledgeable": "Cunoscător",
      "Expert": "Expert",
      "Champion": "Campion",
      "Untouchable": "De neatis",
      "Legend": "Legendă",
    },
    3 : {
      "Your trophies" : "Tus trofeos",
      "Locked" : "Bloqueado",
      "Geographer" : "Geógrafo",
      "Historian" : "Historiador",
      "Curious" : "Curioso",
      "Knowledgeable" : "Conocedor",
      "Expert" : "Experto",
      "Champion" : "Campeón",
      "Untouchable" : "Intocable",
      "Legend" : "Leyenda",
    },
    4 : {
      "Your trophies" : "Az Ön trófeái",
      "Locked" : "Dúnta",
      "Geographer" : "Geagrafaí",
      "Historian" : "Staraí",
      "Curious" : "Fiosrach",
      "Knowledgeable" : "Eolach",
      "Expert" : "Eispéireas",
      "Champion" : "Craobh",
      "Untouchable" : "Neamhthocach",
      "Legend" : "Scealaí",
    },
    5 : {
      "Your trophies" : "Vos trophées",
      "Locked" : "Verrouillé",
      "Geographer" : "Géographe",
      "Historian" : "Historien",
      "Curious" : "Curieux",
      "Knowledgeable" : "Savant",
      "Expert" : "Expert",
      "Champion" : "Champion",
      "Untouchable" : "Intouchable",
      "Legend" : "Légende",
    },
    
  };

  List<Color> trophiesColor1 = [
    const Color.fromARGB(255, 0, 255, 132),
    const Color.fromARGB(255, 0, 238, 255),
    const Color.fromARGB(255, 255, 0, 0),
    const Color.fromARGB(255, 255, 200, 0),
    const Color.fromARGB(255, 157, 0, 255),
    const Color.fromARGB(255, 0, 55, 255),
    const Color.fromARGB(255, 255, 132, 0),
    const Color.fromARGB(255, 255, 0, 234),
  ];

  List<Color> trophiesColor2 = [
    const Color.fromARGB(120, 0, 255, 132),
    const Color.fromARGB(120, 0, 238, 255),
    const Color.fromARGB(120, 255, 0, 0),
    const Color.fromARGB(120, 255, 200, 0),
    const Color.fromARGB(120, 157, 0, 255),
    const Color.fromARGB(120, 0, 55, 255),
    const Color.fromARGB(120, 255, 132, 0),
    const Color.fromARGB(120, 255, 0, 234),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Theme.of(context).colorScheme.background,
      body: CustomScrollView(physics: const BouncingScrollPhysics(), slivers: [
        SliverToBoxAdapter(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17),
                child: Column(children: [
                  const SizedBox(
                    height: 90,
                  ),
                  Row(children: [
                    const SizedBox(
                      width: 12,
                    ),
                    Lottie.network(
                        'https://lottie.host/491f2840-4c44-425a-924e-4fbc86237dfc/s8x6EccXsD.json',
                        frameRate: FrameRate.max,
                        height: 100),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        child: Text(
                          languageText[selectedLanguage]!["Your trophies"]! ??
                          "Your trophies",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary,
                          fontWeight: FontWeight.bold,
                          fontSize: 40
                          ),
                        )
                      )
                    ]
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Divider(
                    color: Theme.of(context).colorScheme.primary,
                    thickness: 3,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                ]))),
        SliverList(
          delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
            int newIndex = index * 2;
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TrophieTile(
                    trophy: newIndex < trophiesName.length
                        ? trophiesName[newIndex]
                        : languageText[selectedLanguage]!["Locked"] ?? "Locked",
                    color1: newIndex + 1 < trophiesName.length
                        ? trophiesColor1[newIndex]
                        : const Color.fromARGB(255, 129, 129, 129),
                    color2: newIndex + 1 < trophiesName.length
                        ? trophiesColor2[newIndex]
                        : const Color.fromARGB(120, 129, 129, 129)),
                TrophieTile(
                    trophy: newIndex + 1 < trophiesName.length
                        ? trophiesName[newIndex + 1]
                        : languageText[selectedLanguage]!["Locked"] ?? "Locked",
                    color1: newIndex + 2 < trophiesName.length
                        ? trophiesColor1[newIndex + 1]
                        : const Color.fromARGB(255, 129, 129, 129),
                    color2: newIndex + 2 < trophiesName.length
                        ? trophiesColor2[newIndex + 1]
                        : const Color.fromARGB(120, 129, 129, 129)),
              ],
            );
          }, childCount: 4),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 100),
        ),
        SliverToBoxAdapter(
            child: IconButton(
                onPressed: () {
                  setState(() {
                    ask();
                  });
                  c = c! + 1;
                },
                icon: const Icon(Icons.abc))),
        const SliverToBoxAdapter(
          child: SizedBox(height: 100),
        ),
        SliverToBoxAdapter(
          child: Text(
              c.toString() + trophiesName.toString()), //SizedBox(height: 100),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 10000),
        ),
      ]),
    );
  }
}
