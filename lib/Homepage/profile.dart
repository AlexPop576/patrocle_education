import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:patrocle_education/Themes/theme_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Components/trophie_tile.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String? username, language = "English";
  Color backgroundColor = Colors.blue;
  List<String> geography = ["Argentina", "Romania", "Spain"];
  List<String> history = ["Canada"];
  int? iq = 0,
      trophies = 0,
      selectedProfile = 0,
      color = 0,
      selectedLanguage = 1,
      tempSelectedLanguage = 1;
  final usernameController = TextEditingController();

  Map<int?, Map<String, String>> languageText = {
    1 : {
      "Edit profile" : "Edit profile",
      "Statistics" : "Statistics",
      "New username" : "New username",
      "Save" : "Save",
      "Cancel" : "Cancel",
      "Total IQ" : "Total IQ",
      "Trophies" : "Trophies",
      "Geography" : "Geography",
      "History" : "History",
      "No level" : "No level has been completed yet...",
      "Settings" : "Settings",
      "Select language" : "Select language",
      "Light mode" : "Light mode",
      "Dark mode" : "Dark mode",
    },
    2 : {
      "Edit profile" : "Editare profil",
      "Statistics" : "Statistici",
      "New username" : "Nume de utilizator nou",
      "Save" : "Salvare",
      "Cancel" : "Anulare",
      "Total IQ" : "IQ total",
      "Trophies" : "Trofee",
      "Geography" : "Geografie",
      "History" : "Istorie",
      "No level" : "Niciun nivel nu a fost completat încă...",
      "Settings" : "Setări",
      "Select language" : "Selecteaza limba",
      "Light mode" : "Mod luminos",
      "Dark mode" : "Mod întunecat",
    },
    3 : {
      "Edit profile" : "Editar perfil",
      "Statistics" : "Estadísticas",
      "New username" : "Nombre nuevo",
      "Save" : "Salvar",
      "Cancel" : "Cancelar",
      "Total IQ" : "IQ total",
      "Trophies" : "Trofeos",
      "Geography" : "Geografia",
      "History" : "Historia",
      "No level" : "Ningún nivel ha sido completado todavía...",
      "Settings" : "Ajustes",
      "Select language" : "Seleccionar idioma",
      "Light mode" : "Modo claro",
      "Dark mode" : "Modo oscuro",
    },
    4 : {
      "Edit profile" : "Profil szerkesztése",
      "Statistics" : "Statisztika",
      "New username" : "Új felhasználónév",
      "Save" : "Mentés",
      "Cancel" : "Mégse",
      "Total IQ" : "Összes IQ",
      "Trophies" : "Trófeák",
      "Geography" : "Földrajz",
      "History" : "Történelem",
      "No level" : "Még nem lett befejezve egy szint sem...",
      "Settings" : "Beállítások",
      "Select language" : "Nyelv kiválasztása",
      "Light mode" : "Világos mód",
      "Dark mode" : "Sötét mód",
    },
  };

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> saveNameColor(name, color) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('name', name);
    pref.setInt('color', color);
  }

  Future<void> saveLanguage(language) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt('language', language);
  }

  void getData() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    username = pref.getString('name');
    color = pref.getInt('color');
    if(pref.getInt('iq')!=null){
      iq = pref.getInt('iq');
    }else{
      iq=0;
    }
    if(pref.getInt('language')!=null){
      selectedLanguage = pref.getInt('language');
    }else{
      selectedLanguage = 1;
    }
    if(pref.getInt('trophies')!=null){
    trophies = pref.getInt('trophies');
    }else{
      trophies = 0;
    }
    if (color == 0) {
      backgroundColor = Colors.blue;
    } else if (color == 1) {
      backgroundColor = Colors.red;
    } else if (color == 2) {
      backgroundColor = Colors.green;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Theme.of(context).colorScheme.background,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                Center(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(color: backgroundColor),
                        width: double.infinity,
                        height: 280,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 70, 0, 0),
                          child: Image.asset('assets/Face.png',
                              fit: BoxFit.contain),
                        ),
                      ),
                      Divider(
                          color: Theme.of(context).colorScheme.primary,
                          thickness: 3,
                          height: 0),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17.0),
                  child: Center(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            Text(
                              username == null ? 'Username' : username!,
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.tertiary,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Spacer(),
                            TextButton(
                              child: Text(
                                languageText[selectedLanguage]!["Edit profile"] ?? "Edit profile",
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400),
                              ),
                              onPressed: () {
                                showModalBottomSheet(
                                  backgroundColor: Colors.transparent,
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Container(
                                      height: 650,
                                      decoration: BoxDecoration(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .background,
                                        borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(25),
                                            topRight: Radius.circular(25)),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 17),
                                        child: SingleChildScrollView(
                                          physics: const BouncingScrollPhysics(),
                                          child: Column(
                                            children: [
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              Text(languageText[selectedLanguage]!["Edit profile"] ?? "Edit profile",
                                                  style: TextStyle(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .tertiary,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 30,
                                                  )),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Divider(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary,
                                                thickness: 3,
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              SizedBox(
                                                height: 58,
                                                child: TextField(
                                                  controller: usernameController,
                                                  cursorColor: Colors.white,
                                                  maxLength: 10,
                                                  decoration: InputDecoration(
                                                    focusedBorder:
                                                        const OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  15)),
                                                      borderSide: BorderSide(
                                                          color: Colors.white,
                                                          width: 2.0),
                                                    ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          const BorderRadius.all(
                                                              Radius.circular(
                                                                  15)),
                                                      borderSide: BorderSide(
                                                          color: Theme.of(context)
                                                              .colorScheme
                                                              .primary,
                                                          width: 1.0),
                                                    ),
                                                    labelText: languageText[selectedLanguage]!["New username"] ??'New username',
                                                    labelStyle: TextStyle(
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .primary),
                                                    counterText: '',
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Row(children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.symmetric(
                                                          horizontal: 4),
                                                  child: SizedBox(
                                                      height: 150,
                                                      width: 130,
                                                      child: ElevatedButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(15),
                                                          ),
                                                          backgroundColor:
                                                              Colors.blue,
                                                          side: selectedProfile ==
                                                                  0
                                                              ? const BorderSide(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          102,
                                                                          102,
                                                                          255),
                                                                  width: 3)
                                                              : const BorderSide(
                                                                  color:
                                                                      Colors.blue,
                                                                  width: 3),
                                                        ),
                                                        onPressed: () {
                                                          setState(() {
                                                            selectedProfile = 0;
                                                          });
                                                        },
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .fromLTRB(
                                                                  0, 35, 0, 0),
                                                          child: Image.asset(
                                                              "assets/Face.png"),
                                                        ),
                                                      )),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.symmetric(
                                                          horizontal: 4),
                                                  child: SizedBox(
                                                      height: 150,
                                                      width: 130,
                                                      child: ElevatedButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(15),
                                                          ),
                                                          backgroundColor:
                                                              Colors.red,
                                                          side: selectedProfile ==
                                                                  1
                                                              ? const BorderSide(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          102,
                                                                          102,
                                                                          255),
                                                                  width: 3)
                                                              : const BorderSide(
                                                                  color:
                                                                      Colors.red,
                                                                  width: 3),
                                                        ),
                                                        onPressed: () {
                                                          setState(() {
                                                            selectedProfile = 1;
                                                          });
                                                        },
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .fromLTRB(
                                                                  0, 35, 0, 0),
                                                          child: Image.asset(
                                                              "assets/Face.png"),
                                                        ),
                                                      )),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.symmetric(
                                                          horizontal: 4),
                                                  child: SizedBox(
                                                      height: 150,
                                                      width: 130,
                                                      child: ElevatedButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(15),
                                                          ),
                                                          backgroundColor:
                                                              Colors.green,
                                                          side: selectedProfile ==
                                                                  2
                                                              ? const BorderSide(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          102,
                                                                          102,
                                                                          255),
                                                                  width: 3)
                                                              : const BorderSide(
                                                                  color: Colors
                                                                      .green,
                                                                  width: 3),
                                                        ),
                                                        onPressed: () {
                                                          setState(() {
                                                            selectedProfile = 2;
                                                          });
                                                        },
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .fromLTRB(
                                                                  0, 35, 0, 0),
                                                          child: Image.asset(
                                                              "assets/Face.png"),
                                                        ),
                                                      )),
                                                ),
                                              ]),
                                              const SizedBox(
                                                height: 30,
                                              ),
                                              SizedBox(
                                                height: 58,
                                                width: double.infinity,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(15)),
                                                  child: ElevatedButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                      setState(() {
                                                        username =
                                                            usernameController
                                                                .text;
                                                        saveNameColor(
                                                            usernameController
                                                                .text,
                                                            selectedProfile);
                                                        if (selectedProfile ==
                                                            0) {
                                                          backgroundColor =
                                                              Colors.blue;
                                                        } else if (selectedProfile ==
                                                            1) {
                                                          backgroundColor =
                                                              Colors.red;
                                                        } else if (selectedProfile ==
                                                            2) {
                                                          backgroundColor =
                                                              Colors.green;
                                                        }
                                                      });
                                                    },
                                                    style:
                                                        ElevatedButton.styleFrom(
                                                      backgroundColor:
                                                          const Color.fromARGB(
                                                              255, 102, 102, 255),
                                                    ),
                                                    child: Center(
                                                        child: Text(languageText[selectedLanguage]!["Save"] ?? "Save",
                                                            style: const TextStyle(
                                                              color: Colors.white,
                                                              fontWeight:
                                                                  FontWeight.bold,
                                                              fontSize: 30,
                                                            ))),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 12,
                                              ),
                                              SizedBox(
                                                height: 58,
                                                width: double.infinity,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(15)),
                                                  child: ElevatedButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    style:
                                                        ElevatedButton.styleFrom(
                                                      backgroundColor:
                                                          const Color.fromARGB(
                                                              255, 219, 64, 64),
                                                    ),
                                                    child: Center(
                                                        child: Text(languageText[selectedLanguage]!["Cancel"] ?? "Cancel",
                                                            style: const TextStyle(
                                                              color: Colors.white,
                                                              fontWeight:
                                                                  FontWeight.bold,
                                                              fontSize: 30,
                                                            ))),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Divider(
                          color: Theme.of(context).colorScheme.primary,
                          thickness: 3,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Text(
                              languageText[selectedLanguage]!["Statistics"] ?? "Statistics",
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.tertiary,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: SizedBox(
                                height: 85,
                                child: Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(0, 0, 8.3, 0),
                                  padding: const EdgeInsets.all(2.8),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        width: 3.2),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15)),
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 2),
                                      child: Column(
                                        children: [
                                          Text(
                                            iq == 0 ? '0 IQ' :
                                            "$iq IQ",
                                            style: const TextStyle(
                                                color: Color.fromARGB(
                                                    255, 102, 102, 255),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 27),
                                          ),
                                          Text(
                                            languageText[selectedLanguage]!["Total IQ"] ?? 'Total IQ',
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: SizedBox(
                                height: 85,
                                child: Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(8.3, 0, 0, 0),
                                  padding: const EdgeInsets.all(2.8),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        width: 3.2),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15)),
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 2),
                                      child: Column(
                                        children: [
                                          Text(
                                            trophies == 0 ? '0/6' :
                                            '$trophies/6',
                                            style: const TextStyle(
                                                color: Color.fromARGB(
                                                    255, 255, 200, 0),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 27),
                                          ),
                                          Text(
                                            languageText[selectedLanguage]!["Trophies"] ??'Trophies',
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Divider(
                          color: Theme.of(context).colorScheme.primary,
                          thickness: 3,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Center(
                              child: Text(
                            languageText[selectedLanguage]!["Geography"] ?? "Geography",
                            style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .tertiary,
                                fontSize: 30,
                                fontWeight: FontWeight.w500),
                          )
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Center(
                              child: Text(
                            languageText[selectedLanguage]!["History"] ?? "History",
                            style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .tertiary,
                                fontSize: 30,
                                fontWeight: FontWeight.w500),
                          )
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
              ],
            ),
          ),
          geography.length + history.length == 0 ? SliverToBoxAdapter(
            child: Center(child: Column(
              children: [
                const SizedBox(height: 20),
                Text(languageText[selectedLanguage]!["No level"] ?? "No level has been completed yet...", style: TextStyle(fontSize: 20, color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.bold)),
                const SizedBox(height: 5),
              ],
            )),
          ): SliverToBoxAdapter(child: Container(),),
          SliverList(
              delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 70.0, vertical: 7),
                        child: Center(
                          child: ClipRRect(
                            borderRadius: const BorderRadius.all(
                                  Radius.circular(15)),
                            child: geography.length > index ? Image.asset(
                                    "assets/flags/${geography[index]}.png", height: 57) : Container(),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 70.0, vertical: 7),
                        child: Center(
                          child: ClipRRect(
                            borderRadius: const BorderRadius.all(
                                  Radius.circular(15)),
                            child: history.length > index ? Image.asset(
                                    "assets/flags/${history[index]}.png", height: 57) : Container(),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
              childCount: geography.length>history.length ? geography.length : history.length),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Padding(padding: const EdgeInsets.symmetric(horizontal: 17.0),
                  child: Center(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 8,
                        ),
                        Divider(
                          color: Theme.of(context).colorScheme.primary,
                          thickness: 3,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Text(
                              languageText[selectedLanguage]!["Settings"] ?? "Settings",
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.tertiary,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        SizedBox(
                          height: 58,
                          width: double.infinity,
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            child: ElevatedButton(
                              onPressed: () {
                                Provider.of<ThemeProvider>(context,
                                        listen: false)
                                    .toggleTheme();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Theme.of(context).colorScheme.primary,
                              ),
                              child: Center(
                                  child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                      Provider.of<ThemeProvider>(context,
                                                      listen: false)
                                                  .getTheme() ==
                                              1
                                          ? languageText[selectedLanguage]!["Light mode"] ?? "Light mode"
                                          : languageText[selectedLanguage]!["Dark mode"] ?? "Dark mode",
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30,
                                      )),
                                  const SizedBox(width: 10),
                                  Icon(
                                    Provider.of<ThemeProvider>(context,
                                                    listen: false)
                                                .getTheme() ==
                                            1
                                        ? Icons.brightness_7_rounded
                                        : Icons.brightness_2,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                ],
                              )),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 58,
                          width: double.infinity,
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            child: ElevatedButton(
                              onPressed: () {
                                showModalBottomSheet(
                                  backgroundColor: Colors.transparent,
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Container(
                                      height: 650,
                                      decoration: BoxDecoration(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .background,
                                        borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(25),
                                            topRight: Radius.circular(25)),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 17),
                                        child: SingleChildScrollView(
                                          physics: const BouncingScrollPhysics(),
                                          child: Column(
                                            children: [
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              Text(languageText[selectedLanguage]!["Select language"] ?? "Select language",
                                                  style: TextStyle(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .tertiary,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 30,
                                                  )),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Divider(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary,
                                                thickness: 3,
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              SizedBox(
                                                height: 58,
                                                width: double.infinity,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(15)),
                                                  child: ElevatedButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        tempSelectedLanguage = 1;
                                                      });
                                                    },
                                                    style:
                                                        ElevatedButton.styleFrom(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                15),
                                                      ),
                                                      backgroundColor:
                                                          Theme.of(context)
                                                              .colorScheme
                                                              .primary,
                                                      side: tempSelectedLanguage == 1
                                                          ? const BorderSide(
                                                              color:
                                                                  Color.fromARGB(
                                                                      255,
                                                                      102,
                                                                      102,
                                                                      255),
                                                              width: 3)
                                                          : BorderSide(
                                                              color: Theme.of(
                                                                      context)
                                                                  .colorScheme
                                                                  .primary,
                                                              width: 3),
                                                    ),
                                                    child: const Center(
                                                        child: Text("English",
                                                            style: TextStyle(
                                                                color:
                                                                    Colors.white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 30))),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              SizedBox(
                                                height: 58,
                                                width: double.infinity,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(15)),
                                                  child: ElevatedButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        tempSelectedLanguage = 2;
                                                      });
                                                    },
                                                    style:
                                                        ElevatedButton.styleFrom(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                15),
                                                      ),
                                                      backgroundColor:
                                                          Theme.of(context)
                                                              .colorScheme
                                                              .primary,
                                                      side: tempSelectedLanguage == 2
                                                          ? const BorderSide(
                                                              color:
                                                                  Color.fromARGB(
                                                                      255,
                                                                      102,
                                                                      102,
                                                                      255),
                                                              width: 3)
                                                          : BorderSide(
                                                              color: Theme.of(
                                                                      context)
                                                                  .colorScheme
                                                                  .primary,
                                                              width: 3),
                                                    ),
                                                    child: const Center(
                                                        child: Text("Română",
                                                            style: TextStyle(
                                                                color:
                                                                    Colors.white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 30))),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              SizedBox(
                                                height: 58,
                                                width: double.infinity,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(15)),
                                                  child: ElevatedButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        tempSelectedLanguage = 3;
                                                      });
                                                    },
                                                    style:
                                                        ElevatedButton.styleFrom(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                15),
                                                      ),
                                                      backgroundColor:
                                                          Theme.of(context)
                                                              .colorScheme
                                                              .primary,
                                                      side: tempSelectedLanguage == 3
                                                          ? const BorderSide(
                                                              color:
                                                                  Color.fromARGB(
                                                                      255,
                                                                      102,
                                                                      102,
                                                                      255),
                                                              width: 3)
                                                          : BorderSide(
                                                              color: Theme.of(
                                                                      context)
                                                                  .colorScheme
                                                                  .primary,
                                                              width: 3),
                                                    ),
                                                    child: const Center(
                                                        child: Text("Español",
                                                            style: TextStyle(
                                                                color:
                                                                    Colors.white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 30))),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              SizedBox(
                                                height: 58,
                                                width: double.infinity,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(15)),
                                                  child: ElevatedButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        tempSelectedLanguage = 4;
                                                      });
                                                    },
                                                    style:
                                                        ElevatedButton.styleFrom(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                15),
                                                      ),
                                                      backgroundColor:
                                                          Theme.of(context)
                                                              .colorScheme
                                                              .primary,
                                                      side: tempSelectedLanguage == 4
                                                          ? const BorderSide(
                                                              color:
                                                                  Color.fromARGB(
                                                                      255,
                                                                      102,
                                                                      102,
                                                                      255),
                                                              width: 3)
                                                          : BorderSide(
                                                              color: Theme.of(
                                                                      context)
                                                                  .colorScheme
                                                                  .primary,
                                                              width: 3),
                                                    ),
                                                    child: const Center(
                                                        child: Text("Magyar",
                                                            style: TextStyle(
                                                                color:
                                                                    Colors.white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 30))),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              SizedBox(
                                                height: 58,
                                                width: double.infinity,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(15)),
                                                  child: ElevatedButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        tempSelectedLanguage = 4;
                                                      });
                                                    },
                                                    style:
                                                        ElevatedButton.styleFrom(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                15),
                                                      ),
                                                      backgroundColor:
                                                          Theme.of(context)
                                                              .colorScheme
                                                              .primary,
                                                      side: tempSelectedLanguage == 5
                                                          ? const BorderSide(
                                                              color:
                                                                  Color.fromARGB(
                                                                      255,
                                                                      102,
                                                                      102,
                                                                      255),
                                                              width: 3)
                                                          : BorderSide(
                                                              color: Theme.of(
                                                                      context)
                                                                  .colorScheme
                                                                  .primary,
                                                              width: 3),
                                                    ),
                                                    child: const Center(
                                                        child: Text("Française",
                                                            style: TextStyle(
                                                                color:
                                                                    Colors.white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 30))),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 30,
                                              ),
                                              SizedBox(
                                                height: 58,
                                                width: double.infinity,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(15)),
                                                  child: ElevatedButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                      setState(() {
                                                        selectedLanguage = tempSelectedLanguage;
                                                        saveLanguage(selectedLanguage);
                                                      });
                                                    },
                                                    style:
                                                        ElevatedButton.styleFrom(
                                                      backgroundColor:
                                                          const Color.fromARGB(
                                                              255, 102, 102, 255),
                                                    ),
                                                    child: Center(
                                                        child: Text(languageText[selectedLanguage]!["Save"] ?? "Save",
                                                            style: const TextStyle(
                                                              color: Colors.white,
                                                              fontWeight:
                                                                  FontWeight.bold,
                                                              fontSize: 30,
                                                            ))),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 12,
                                              ),
                                              SizedBox(
                                                height: 58,
                                                width: double.infinity,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(15)),
                                                  child: ElevatedButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    style:
                                                        ElevatedButton.styleFrom(
                                                      backgroundColor:
                                                          const Color.fromARGB(
                                                              255, 219, 64, 64),
                                                    ),
                                                    child: Center(
                                                        child: Text(languageText[selectedLanguage]!["Cancel"] ?? "Cancel",
                                                            style: const TextStyle(
                                                              color: Colors.white,
                                                              fontWeight:
                                                                  FontWeight.bold,
                                                              fontSize: 30,
                                                            ))),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Theme.of(context).colorScheme.primary,
                              ),
                              child: Center(
                                child: Text(
                                    selectedLanguage == 1
                                        ? "English"
                                        : selectedLanguage == 2
                                            ? "Română"
                                            : selectedLanguage == 3
                                                ? "Español"
                                                : "Magyar",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                    )),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 90,
                        ),
                      ],
                    ),
                  ),
                )
              ]
            ),
          ),
        ]
      ),
    );
  }
}