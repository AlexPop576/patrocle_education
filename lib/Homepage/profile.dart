import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:patrocle_education/Themes/theme_provider.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String username = "Username";
  int iq = 576, trophies = 4;
  final usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Center(
              child: Column(children: [
                Image.asset('assets/Profile.png',fit: BoxFit.fill),
                Divider(color: Theme.of(context).colorScheme.primary, thickness: 3,),
              ],),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17.0),
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(height: 8,),
                    Row(children: 
                      [
                      Text(username, style: TextStyle(color: Theme.of(context).colorScheme.tertiary, fontSize: 30, fontWeight: FontWeight.bold),),
                      Spacer(),
                      TextButton(child: Text("Edit profile", style: TextStyle(color: Theme.of(context).colorScheme.primary, fontSize: 20, fontWeight: FontWeight.w400),),
                       onPressed: () {
                        showModalBottomSheet(backgroundColor: Colors.transparent,context: context,
             builder: (BuildContext context) {
                return Container(
                  height: 450,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25))
                  ),
                  child:  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 17),
                    child: Column(children: [
                      const SizedBox(height: 20,),
                      Text("Edit profile", style: TextStyle(
                                  color: Theme.of(context).colorScheme.tertiary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30
                                  )),
                      const SizedBox(height: 10,),
                      Divider(color: Theme.of(context).colorScheme.primary, thickness: 3,),
                      const SizedBox(height: 10,),
                      SizedBox(
                        height: 58,
                        child: TextField(
                          controller: usernameController,
                          cursorColor: Colors.white,
                          maxLength: 10,
                          decoration: InputDecoration(
                            focusedBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                              borderSide: BorderSide(color: Colors.white, width: 2.0), // Color and thickness when the TextField is selected
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                              borderSide: BorderSide(color: Theme.of(context).colorScheme.primary, width: 1.0), // Default color and thickness
                            ),
                            labelText: 'New username',
                            labelStyle: TextStyle(color: Colors.white), // Color of the label text
                            counterText: '',
                          ),
                        ),
                      ),
                      const SizedBox(height: 20,),
                      SizedBox(
                        height: 58,
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(15)),
                          child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            username = usernameController.text;
                          });
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 102, 102, 255),
                        ),
                        child: const Center(child: Text("Save", style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30
                              ))),
                        ),
                      ),
                      ),
                      const SizedBox(height: 12,),
                      SizedBox(
                        height: 58,
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(15)),
                          child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 219, 64, 64),
                        ),
                        child: const Center(child: Text("Cancel", style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30
                              ))),
                        ),
                      ),
                      ),
                      const SizedBox(height: 20,),
                    ]),
                  ),
                );
             }
            );
                      },),
                    ],
                  ),
                  const SizedBox(height: 8,),
                  Divider(color: Theme.of(context).colorScheme.primary, thickness: 3,),
                  const SizedBox(height: 8,),
                  Row(
                    children: [
                      Text("Statistics", style: TextStyle(color: Theme.of(context).colorScheme.tertiary, fontSize: 27, fontWeight: FontWeight.w500),),
                    ],
                  ),
                  const SizedBox(height: 12,),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: SizedBox(
                          height: 85,
                          child: Container(
                            margin: const EdgeInsets.fromLTRB(0,0,8.3,0),
                            padding: const EdgeInsets.all(2.8),
                            decoration: BoxDecoration(
                              border: Border.all(color: Theme.of(context).colorScheme.primary, width: 3.2),
                              borderRadius: const BorderRadius.all(Radius.circular(15)),
                            ),
                            child: Center(child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 2),
                              child: Column(
                                children: [
                                  Text("$iq IQ", style: TextStyle(color: Color.fromARGB(255, 102, 102, 255), fontWeight: FontWeight.bold, fontSize: 27),),
                                  Text('Total IQ', style: TextStyle(color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.bold, fontSize: 20),),
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
                            margin: const EdgeInsets.fromLTRB(8.3,0,0,0),
                            padding: const EdgeInsets.all(2.8),
                            decoration: BoxDecoration(
                              border: Border.all(color: Theme.of(context).colorScheme.primary, width: 3.2),
                              borderRadius: const BorderRadius.all(Radius.circular(15)),
                            ),
                            child: Center(child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 2),
                              child: Column(
                                children: [
                                  Text('$trophies/6', style: TextStyle(color: Color.fromARGB(255, 255, 200, 0), fontWeight: FontWeight.bold, fontSize: 27),),
                                  Text('Trophies', style: TextStyle(color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.bold, fontSize: 20),),
                                ],
                              ),
                            ),),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8,),
                  Divider(color: Theme.of(context).colorScheme.primary, thickness: 3,),
                  const SizedBox(height: 8,),
                  Row(
                    children: [
                      Expanded(flex: 1,child: Center(child: Text("Geography", style: TextStyle(color: Theme.of(context).colorScheme.tertiary, fontSize: 27, fontWeight: FontWeight.w500),))),
                      Expanded(flex: 1,child: Center(child: Text("History", style: TextStyle(color: Theme.of(context).colorScheme.tertiary, fontSize: 27, fontWeight: FontWeight.w500),))),
                    ],
                  ),         
                  const SizedBox(height: 8,),
                  Divider(color: Theme.of(context).colorScheme.primary, thickness: 3,),
                  const SizedBox(height: 8,),
                  Row(
                    children: [
                      Text("Settings", style: TextStyle(color: Theme.of(context).colorScheme.tertiary, fontSize: 27, fontWeight: FontWeight.w500),),
                    ],
                  ),
                  const SizedBox(height: 24,),
                  SizedBox(
                    height: 58,
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      child: ElevatedButton(
                    onPressed: () {
                      Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).colorScheme.primary,
                    ),
                    child: Center(child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(Provider.of<ThemeProvider>(context, listen: false).getTheme() == 1 ? "Light mode" : "Dark mode", style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30
                              )),
                          const SizedBox(width: 10),
                          Icon(Provider.of<ThemeProvider>(context, listen: false).getTheme() == 1 ? Icons.brightness_7_rounded : Icons.brightness_2, size: 30, color: Colors.white,),
                        ],
                      )),
                    ),
                    ),
                  ),
                  const SizedBox(height: 12,),
                  SizedBox(
                    height: 58,
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      child: ElevatedButton(
                    onPressed: () {
                      
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).colorScheme.primary,
                    ),
                    child: const Center(child: Text("Language", style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30
                          ))),
                    ),
                  ),
                  ),
                  const SizedBox(height: 12,),
                  ]
              ),
            ),
          ),
          ],
        ),
      )
    );
  }
}