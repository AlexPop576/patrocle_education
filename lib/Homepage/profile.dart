import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:patrocle_education/Themes/theme_provider.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
                      Text("Username", style: TextStyle(color: Theme.of(context).colorScheme.tertiary, fontSize: 30, fontWeight: FontWeight.bold),),
                      Spacer(),
                      TextButton(child: Text("Edit profile", style: TextStyle(color: Theme.of(context).colorScheme.primary, fontSize: 20, fontWeight: FontWeight.w400),), onPressed: () {},),
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
                                    const Text('580IQ', style: TextStyle(color: Color.fromARGB(255, 102, 102, 255), fontWeight: FontWeight.bold, fontSize: 27),),
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
                                    const Text('3/6', style: TextStyle(color: Color.fromARGB(255, 255, 200, 0), fontWeight: FontWeight.bold, fontSize: 27),),
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