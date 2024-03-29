import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:patrocle_education/Components/level_divider.dart';
import 'package:patrocle_education/Components/level_tile.dart';
import 'package:patrocle_education/Homepage/add_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool selected = false;

class Levels extends StatefulWidget {
  const Levels({super.key});

  @override
  State<Levels> createState() => _LevelsState();
}

class _LevelsState extends State<Levels> {
  int color = 0;
  int? selectedLanguage = 1;
  
   Map<int, Map<String, String>> languageText = {
    1 : {
      "Argentina" : "Argentina",
      "Australia" : "Australia",
      "Brazil" : "Brazil",
      "Canada" : "Canada",
      "China" : "China",
      "Egypt" : "Egypt",
      "France" : "France",
      "Germany" : "Germany",
      "Greece" : "Greece",
      "Israel" : "Israel",
      "Italy" : "Italy",
      "Japan" : "Japan",
      "Mexico" : "Mexico",
      "New Zealand" : "New Zealand",
      "Romania" : "Romania",
      "Russia" : "Russia",
      "South Africa" : "South Africa",
      "Spain" : "Spain",
      "UK" : "UK",
      "Ukraine" : "Ukraine",
      "USA" : "USA",
      "Levels" : "Levels",
      "Add test" : "Add test",
      "Create" : "Create your test!",
    },
    2 : {
      "Argentina" : "Argentina",
      "Australia" : "Australia",
      "Brazil" : "Brazilia",
      "Canada" : "Canada",
      "China" : "China",
      "Egypt" : "Egipt",
      "France" : "Franța",
      "Germany" : "Germania",
      "Greece" : "Grecia",
      "Israel" : "Israel",
      "Italy" : "Italia",
      "Japan" : "Japonia",
      "Mexico" : "Mexic",
      "New Zealand" : "Noua Zeelandă",
      "Romania" : "România",
      "Russia" : "Rusia",
      "South Africa" : "Africa de Sud",
      "Spain" : "Spania",
      "UK" : "Marea Britanie",
      "Ukraine" : "Ucraina",
      "USA" : "SUA",
      "Levels" : "Niveluri",
      "Add test" : "Adaugă test",
      "Create" : "Creați-vă testul!",
    },
    3 : {
      "Argentina" : "Argentina",
      "Australia" : "Australia",
      "Brazil" :"Brasil",
      "Canada" : "Canadá",
      "China" : "China",
      "Egypt" : "Egipto",
      "France" : "Francia",
      "Germany" : "Alemania",
      "Greece" : "Grecia",
      "Israel" : "Israel",
      "Italy" : "Italia",
      "Japan" : "Japón",
      "Mexico" : "México",
      "New Zealand" : "Nueva Zelanda",
      "Romania" : "Rumania",
      "Russia" : "Rusia",
      "South Africa" : "Sudáfrica",
      "Spain" : "España",
      "UK" : "Reino Unido",
      "Ukraine" : "Ucrania",
      "USA" : "EE.UU.",
      "Levels" : "Niveles",
      "Add test" : "Añadir test",
      "Create" : "Crea tu test!",
    },
    4 : {
      "Argentina" : "Argentína",
      "Australia" : "Ausztrália",
      "Brazil" : "Brazília",
      "Canada" : "Kanada",
      "China" : "Kína",
      "Egypt" : "Egyiptom",
      "France" : "Franciaország",
      "Germany" : "Németország",
      "Greece" : "Görögország",
      "Israel" : "Izrael",
      "Italy" : "Olaszország",
      "Japan" : "Japán",
      "Mexico" : "Mexikó",
      "New Zealand" : "Új-Zéland",
      "Romania" : "Románia",
      "Russia" : "Oroszország",
      "South Africa" : "Dél-afrikai Köztársaság",
      "Spain" : "Spanyolország",
      "UK" : "Egyesült Királyság",
      "Ukraine" : "Ukrajna",
      "USA" : "Egyesült Államok",
      "Levels" : "Szinteket",
      "Add test" : "Teszt hozzáadása",
      "Create" : "Hozza létre a tesztet!",
    },
    5 : {
      "Levels" : "Niveaux",
      "Add test" : "Ajouter un test",
      "Create" : "Créez votre test!",
    },
  };
  Map<String, bool> countries = {
    "Argentina": false,
    "Australia": false,
    "Brazil": false,
    "Canada": false,
    "China": false,
    "Egypt": false,
    "France": false,
    "Germany": false,
    "Greece": false,
    "Israel": false,
    "Italy": false,
    "Japan": false,
    "Mexico": false,
    "New Zealand": false,
    "Romania": false,
    "Russia": false,
    "South Africa": false,
    "Spain": false,
    "UK": false,
    "Ukraine": false,
    "USA": false,
  };

  Map<String, Map<String, Map<String, bool>>> countriesList = {
    "Europe": {
      "France": {
        "geoDone": false,
        "hstDone": false,
      },
      "Germany": {
        "geoDone": false,
        "hstDone": false,
      },
      "Greece": {
        "geoDone": false,
        "hstDone": false,
      },
      "Italy": {
        "geoDone": false,
        "hstDone": false,
      },
      "Romania": {
        "geoDone": false,
        "hstDone": false,
      },
      "Russia": {
        "geoDone": false,
        "hstDone": false,
      },
      "Spain": {
        "geoDone": false,
        "hstDone": false,
      },
      "UK": {
        "geoDone": false,
        "hstDone": false,
      },
      "Ukraine": {
        "geoDone": false,
        "hstDone": false,
      },
    },
    "America": {
      "Argentina": {
        "geoDone": false,
        "hstDone": false,
      },
      "Brazil": {
        "geoDone": false,
        "hstDone": false,
      },
      "Canada": {
        "geoDone": false,
        "hstDone": false,
      },
      "Mexico": {
        "geoDone": false,
        "hstDone": false,
      },
      "USA": {
        "geoDone": false,
        "hstDone": false,
      },
    },
    "Asia": {
      "China": {
        "geoDone": false,
        "hstDone": false,
      },
      "Israel": {
        "geoDone": false,
        "hstDone": false,
      },
      "Japan": {
        "geoDone": false,
        "hstDone": false,
      },
    },
    "Africa": {
      "Egypt": {
        "geoDone": false,
        "hstDone": false,
      },
      "South Africa": {
        "geoDone": false,
        "hstDone": false,
      },
    },
    "Australia": {
      "Australia": {
        "geoDone": false,
        "hstDone": false,
      },
      "New Zealand": {
        "geoDone": false,
        "hstDone": false,
      },
    }
  };

  List<String> europeCountries = [
    "France",
    "Germany",
    "Greece",
    "Italy",
    "Romania",
    "Russia",
    "Spain",
    "UK",
    "Ukraine",
  ];

  List<String> americaCountries = [
    "Argentina",
    "Brazil",
    "Canada",
    "Mexico",
    "USA",
  ];

  List<String> asiaCountries = [
    "China",
    "Israel",
    "Japan",
  ];

  List<String> africaCountries = [
    "Egypt",
    "South Africa",
  ];

  List<String> australiaCountries = [
    "Australia",
    "New Zealand",
  ];

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

  void setDone(String? continent, String? country, String done, bool value) {
    setState(() {
      countriesList[continent]?[country]?[done] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17.0),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const SizedBox(height: 90),
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
                      languageText[selectedLanguage]!["Levels"] ?? "Levels",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary,
                          fontWeight: FontWeight.bold,
                          fontSize: 40),
                    ))
                  ]),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            LevelDivider(continent: "Europe"),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  color = 0;
                  color = (index + 1) % 3;
                  String? countryName =
                      countriesList["Europe"]?[index].toString() ?? "Romania";
                  return LevelTile(
                    country: europeCountries[index],
                    colorIndex: color,
                    geoDone: countriesList["Europe"]?[countryName]
                                ?["geoDone"] ==
                            false
                        ? true
                        : false,
                    hstDone: countriesList["Europe"]?[countryName]
                                ?["hstDone"] ==
                            false
                        ? true
                        : false,
                    setDone: setDone,
                    continent: "Europe",
                  );
                },
                childCount: countriesList["Europe"]?.length,
              ),
            ),
            LevelDivider(continent: "America"),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  color = 0;
                  color = (index + 1) % 3;
                  String? countryName =
                      countriesList["America"]?[index].toString();
                  return LevelTile(
                    country: americaCountries[index],
                    colorIndex: color,
                    geoDone: countriesList["America"]?[countryName]
                                ?["geoDone"] ==
                            false
                        ? true
                        : false,
                    hstDone: countriesList["America"]?[countryName]
                                ?["hstDone"] ==
                            false
                        ? true
                        : false,
                    setDone: setDone,
                    continent: "America",
                  );
                },
                childCount: countriesList["America"]?.length,
              ),
            ),
            LevelDivider(continent: "Asia"),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  color = 0;
                  color = (index + 1) % 3;
                  String? countryName =
                      countriesList["Asia"]?[index].toString();
                  return LevelTile(
                    country: asiaCountries[index],
                    colorIndex: color,
                    geoDone:
                        countriesList["Asia"]?[countryName]?["geoDone"] == false
                            ? true
                            : false,
                    hstDone:
                        countriesList["Asia"]?[countryName]?["hstDone"] == false
                            ? true
                            : false,
                    setDone: setDone,
                    continent: "Asia",
                  );
                },
                childCount: countriesList["Asia"]?.length,
              ),
            ),
            LevelDivider(continent: "Africa"),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  color = 0;
                  color = (index + 1) % 3;
                  String? countryName =
                      countriesList["Africa"]?[index].toString();
                  return LevelTile(
                    country: africaCountries[index],
                    colorIndex: color,
                    geoDone: countriesList["Africa"]?[countryName]
                                ?["geoDone"] ==
                            false
                        ? true
                        : false,
                    hstDone: countriesList["Africa"]?[countryName]
                                ?["hstDone"] ==
                            false
                        ? true
                        : false,
                    setDone: setDone,
                    continent: "Africa",
                  );
                },
                childCount: countriesList["Africa"]?.length,
              ),
            ),
            LevelDivider(continent: "Australia"),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  color = 0;
                  color = index % 3;
                  String? countryName =
                      countriesList["Australia"]?[index].toString();
                  return LevelTile(
                    country: australiaCountries[index],
                    colorIndex: color,
                    geoDone: countriesList["Australia"]?[countryName]
                                ?["geoDone"] ==
                            false
                        ? true
                        : false,
                    hstDone: countriesList["Australia"]?[countryName]
                                ?["hstDone"] ==
                            false
                        ? true
                        : false,
                    setDone: setDone,
                    continent: "Australia",
                  );
                },
                childCount: countriesList["Australia"]?.length,
              ),
            ),
            LevelDivider(continent: "Add test"),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 190,
                width: double.infinity,
                child: Container(
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 79, 79, 79),
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                              children: [
                                ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15)),
                                    child: Image.asset(
                                      'assets/Flags/addFlag.png',
                                      height: 100,
                                    )),
                                const SizedBox(
                                  height: 20,
                                ),
                                Expanded(
                                  child: Text(
                                     languageText[selectedLanguage]!["Create"] ?? "Create your test!",
                                    style: const TextStyle(
                                        shadows: <Shadow>[
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
                                        color: Colors.white,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: VerticalDivider(
                              thickness: 3, color: Colors.white),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: SizedBox(
                              height: 160,
                              child: ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      PageTransition(
                                        child: AddTest(),
                                        type: PageTransitionType.bottomToTop,
                                        duration:
                                            const Duration(milliseconds: 400),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color.fromARGB(
                                        255, 102, 102, 255),
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      Icons.add,
                                      size: 50,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 100,
              ),
            )
          ],
        ),
      ),
    );
  }
}
