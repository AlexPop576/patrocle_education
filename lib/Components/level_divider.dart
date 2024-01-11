import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class LevelDivider extends StatefulWidget {
  String? continent;
  LevelDivider({super.key, this.continent});

  @override
  // ignore: no_logic_in_create_state
  State<LevelDivider> createState() => _LevelDividerState(continent: continent);
}

class _LevelDividerState extends State<LevelDivider> {
  String? continent;
  _LevelDividerState({this.continent});
  int? selectedLanguage = 1;

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

  Map<int, Map<String, String>> languageText = {
    1 : {
      "Add test" : "Add test",
      "Europe" : "Europe",
      "America" : "America",
      "Asia" : "Asia",
      "Africa" : "Africa",
      "Australia" : "Australia",
    },
    2 : {
      "Add test" : "Adaugă test",
      "Europe" : "Europa",
      "America" : "America",
      "Asia" : "Asia",
      "Africa" : "Africa",
      "Australia" : "Australia",
    },
    3 : {
      "Add test" : "Añadir test",
      "Europe" : "Europa",
      "America" : "América",
      "Asia" : "Asia",
      "Africa" : "África",
      "Australia" : "Australia",
    },
    4 : {
      "Add test" : "Teszt hozzáadása",
      "Europe" : "Európa",
      "America" : "Amerika",
      "Asia" : "Ázsia",
      "Africa" : "Afrika",
      "Australia" : "Ausztrália",
    },
    5 : {
      "Add test" : "Ajouter un test",
      "Europe" : "Europe",
      "America" : "Amérique",
      "Asia" : "Asie",
      "Africa" : "Afrique",
      "Australia" : "Australie",
    },
  };
  
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
                child: Column(
                  children: [
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: Theme.of(context).colorScheme.primary,
                            thickness: 3,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Text(languageText[selectedLanguage]![continent] ?? continent.toString(), style: TextStyle(color: Theme.of(context).colorScheme.tertiary, fontWeight: FontWeight.bold, fontSize: 40),),
                        ),
                        Expanded(
                          child: Divider(
                            color: Theme.of(context).colorScheme.primary,
                            thickness: 3,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                  ]
                ),
            );
  }
}
