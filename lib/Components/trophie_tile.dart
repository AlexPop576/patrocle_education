import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class TrophieTile extends StatefulWidget {
  String? trophy;
  Color color1 = Colors.white, color2 = Colors.white;
  TrophieTile(
      {super.key,
      required this.trophy,
      required this.color1,
      required this.color2});

  @override
  State<TrophieTile> createState() =>
      // ignore: no_logic_in_create_state
      _TrophieTileState(trophy: trophy, color1: color1, color2: color2);
}

class _TrophieTileState extends State<TrophieTile> {
  String? trophy;
  Color color1 = Colors.white, color2 = const Color.fromARGB(255, 255, 255, 255);
  int? selectedLanguage = 1;
  _TrophieTileState(
      {required this.trophy, required this.color1, required this.color2});

  Map<int, Map<String, String>> languageText = {
    1 : {
      "Locked" : "Locked",
      "Geographer": "Geographer",
      "Historian": "Historian",
      "Curious": "Curious",
      "Knowledgeable": "Knowledgeable",
      "Expert": "Expert",
      "Champion": "Champion",
      "Untouchable": "Untouchable",
      "Legend": "Legend",
    },
    2 : {
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
      "Locked" : "Zárva",
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
      "Locked" : "Verrouillé",
      "Geographer" : "Géographe",
      "Historian" : "Historien",
      "Curious" : "Curieux",
      "Knowledgeable" : "Savant",
      "Expert" : "Expert",
      "Champion" : "Champion",
      "Untouchable" : "Intouchable",
      "Legend" : "Légende",
    }
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.5),
      child: Container(
        height: 200,
        width: MediaQuery.of(context).size.width * 0.43,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              color1,
              color2,
            ],
          ),
          borderRadius: const BorderRadius.all(Radius.circular(15)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(children: [
            SizedBox(
                height: 125,
                child: Image.asset(
                  "assets/$trophy.png",
                )),
            const SizedBox(height: 20),
            Text(languageText[selectedLanguage]![trophy] ?? trophy.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: MediaQuery.of(context).size.width * 0.054 < 25
                      ? MediaQuery.of(context).size.width * 0.054
                      : 25,
                  fontWeight: FontWeight.w500,
                  shadows: const <Shadow>[
                    Shadow(
                      offset: Offset(3.0, 3.0),
                      blurRadius: 3.0,
                      color: Color.fromARGB(125, 0, 0, 0),
                    ),
                    Shadow(
                      offset: Offset(3.0, 3.0),
                      blurRadius: 3.0,
                      color: Color.fromARGB(0, 0, 0, 255),
                    ),
                  ],
                )),
          ]),
        ),
      ),
    );
  }
}
