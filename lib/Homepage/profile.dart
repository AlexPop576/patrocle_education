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
  int? iq = 0, trophies = 0, selectedProfile = 0, color = 0;
  final usernameController = TextEditingController();

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

  void getData() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    username = pref.getString('name');
    color = pref.getInt('color');
    iq = pref.getInt('iq');
    trophies = pref.getInt('trophies');
    if (iq == null && trophies == null) {
      pref.setInt('iq', 0);
      pref.setInt('trophies', 0);
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
      body: SafeArea(
        child: CustomScrollView(
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
                            padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
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
                                    color:
                                        Theme.of(context).colorScheme.tertiary,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              TextButton(
                                child: Text(
                                  "Edit profile",
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
                                          child: Column(
                                            children: [
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              Text("Edit profile",
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
                                                  controller:
                                                      usernameController,
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
                                                          const BorderRadius
                                                                  .all(
                                                              Radius.circular(
                                                                  15)),
                                                      borderSide: BorderSide(
                                                          color:
                                                              Theme.of(context)
                                                                  .colorScheme
                                                                  .primary,
                                                          width: 1.0),
                                                    ),
                                                    labelText: 'New username',
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
                                                  padding: const EdgeInsets
                                                      .symmetric(horizontal: 4),
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
                                                                    .circular(
                                                                        15),
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
                                                                  color: Colors
                                                                      .blue,
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
                                                  padding: const EdgeInsets
                                                      .symmetric(horizontal: 4),
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
                                                                    .circular(
                                                                        15),
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
                                                                  color: Colors
                                                                      .red,
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
                                                  padding: const EdgeInsets
                                                      .symmetric(horizontal: 4),
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
                                                                    .circular(
                                                                        15),
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
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      backgroundColor:
                                                          const Color.fromARGB(
                                                              255,
                                                              102,
                                                              102,
                                                              255),
                                                    ),
                                                    child: const Center(
                                                        child: Text("Save",
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
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
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      backgroundColor:
                                                          const Color.fromARGB(
                                                              255, 219, 64, 64),
                                                    ),
                                                    child: const Center(
                                                        child: Text("Cancel",
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
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
                                "Statistics",
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.tertiary,
                                    fontSize: 27,
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
                                              "$iq IQ",
                                              style: const TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 102, 102, 255),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 27),
                                            ),
                                            Text(
                                              'Total IQ',
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
                                              '$trophies/6',
                                              style: const TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 255, 200, 0),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 27),
                                            ),
                                            Text(
                                              'Trophies',
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
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Column(
                                  children: [
                                    Center(
                                        child: Text(
                                      "Geography",
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .tertiary,
                                          fontSize: 27,
                                          fontWeight: FontWeight.w500),
                                    )),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  children: [
                                    Center(
                                        child: Text(
                                      "History",
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .tertiary,
                                          fontSize: 27,
                                          fontWeight: FontWeight.w500),
                                    )),
                                    //ListView.builder(itemCount: 10,itemBuilder: (BuildContext context, int index){

                                    //})
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 70.0, vertical: 20),
                                      child: ClipRRect(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10)),
                                          child: Center(
                                              child: Image.asset(
                                                  "assets/flags/Romania.png"))),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 70.0, vertical: 20),
                                      child: ClipRRect(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10)),
                                          child: Center(
                                              child: Image.asset(
                                                  "assets/flags/Romania.png"))),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 70.0, vertical: 20),
                                      child: ClipRRect(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10)),
                                          child: Center(
                                              child: Image.asset(
                                                  "assets/flags/Spain.png"))),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 70.0, vertical: 5),
                                      child: ClipRRect(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10)),
                                          child: Center(
                                              child: Image.asset(
                                                  "assets/flags/Germany.png"))),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          //End the sliver list here and start a new one
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
                                "Settings",
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.tertiary,
                                    fontSize: 27,
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
                                            ? "Light mode"
                                            : "Dark mode",
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
                          //const SizedBox(
                          //  height: 12,
                          //),
                          // SizedBox(
                          //   height: 58,
                          //   width: double.infinity,
                          //   child: Container(
                          //     color: Colors.transparent,
                          //     child: ClipRRect(
                          //         borderRadius: const BorderRadius.all(Radius.circular(15)),
                          //       child: Container(
                          //         color: Theme.of(context).colorScheme.primary,
                          //         child: DropdownButton(
                          //           dropdownColor: Theme.of(context).colorScheme.primary,
                          //           items: const [
                          //             DropdownMenuItem(value: "English", child: Text("English", style: TextStyle(color: Colors.white))),
                          //             DropdownMenuItem(value: "Romana", child: Text("Romana", style: TextStyle(color: Colors.white))),
                          //             DropdownMenuItem(value: "Mogyor", child: Text("Mogyor", style: TextStyle(color: Colors.white))),
                          //             ],
                          //           onChanged: (String? value){ setState(() {
                          //               language = value!;
                          //           }); 
                          //           }
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          const SizedBox(
                            height: 12,
                          ),
                          SizedBox(
                            height: 58,
                            width: double.infinity,
                            child: Container(
                              decoration: BoxDecoration(
                                //color: Theme.of(context).colorScheme.primary, // Set background color to grey
                                borderRadius: BorderRadius.circular(10), // Set border radius
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: DropdownButtonHideUnderline(
                                  //backgroundColor: Theme.of(context).colorScheme.primary,
                                  child: DropdownButtonFormField(
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(color: Colors.transparent),),
                                    ),
                                    value: language,
                                    dropdownColor: Theme.of(context).colorScheme.primary, // Set dropdown background color to grey
                                    //style: const TextStyle(color: Colors.white),
                                    icon: const Icon(Icons.arrow_drop_down, color: Colors.white), // Dropdown icon color
                                    focusColor: Colors.transparent,
                                    items: const [
                                      DropdownMenuItem(value: "English", child: Center(child: Text("English", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w500)))),
                                      DropdownMenuItem(value: "Espanol", child: Center(child: Text("Espanol", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w500)))),
                                      DropdownMenuItem(value: "Romanian", child: Center(child: Text("Romanian", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w500)))),
                                      DropdownMenuItem(value: "Mogyor", child: Center(child: Text("Mogyor", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w500)))),
                                    ],
                                    onChanged: (String? value) {
                                      setState(() {
                                        language = value!;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),

                          TrophieTile(
                              trophy: "Champion",
                              color1: Colors.red,
                              color2: Colors.blue),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
