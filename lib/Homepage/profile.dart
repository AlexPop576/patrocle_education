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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17.0),
              child: Center(
                child: Column(
                  children: [
                    Container(decoration: BoxDecoration(color: Colors.blue),),
                    Divider(color: Theme.of(context).colorScheme.primary, thickness: 3,),
                    SizedBox(height: 8,),
                    Row(children: 
                      [
                      Text("Username", style: TextStyle(color: Theme.of(context).colorScheme.tertiary, fontSize: 30, fontWeight: FontWeight.bold),),
                      Spacer(),
                      TextButton(child: Text("Edit profile", style: TextStyle(color: Theme.of(context).colorScheme.primary, fontSize: 20, fontWeight: FontWeight.w400),), onPressed: () {},),
                      ],
                    ),
                    SizedBox(height: 8,),
                    Divider(color: Theme.of(context).colorScheme.primary, thickness: 3,),
                    SizedBox(height: 8,),
                    Row(
                      children: [
                        Text("Statistics", style: TextStyle(color: Theme.of(context).colorScheme.tertiary, fontSize: 27, fontWeight: FontWeight.w500),),
                      ],
                    ),
                    Row(
                      children: [

                      ],
                    ),
                    SizedBox(height: 8,),
                    Divider(color: Theme.of(context).colorScheme.primary, thickness: 3,),
                    SizedBox(height: 8,),
                    Row(
                      children: [
                        Expanded(flex: 1,child: Center(child: Text("Geography", style: TextStyle(color: Theme.of(context).colorScheme.tertiary, fontSize: 27, fontWeight: FontWeight.w500),))),
                        Expanded(flex: 1,child: Center(child: Text("History", style: TextStyle(color: Theme.of(context).colorScheme.tertiary, fontSize: 27, fontWeight: FontWeight.w500),))),
                      ],
                    ),
                    SizedBox(height: 8,),
                    Divider(color: Theme.of(context).colorScheme.primary, thickness: 3,),
                    SizedBox(height: 8,),
                    Row(
                      children: [
                        Text("Settings", style: TextStyle(color: Theme.of(context).colorScheme.tertiary, fontSize: 27, fontWeight: FontWeight.w500),),
                      ],
                    ),
                    SizedBox(height: 12,),
                    SizedBox(
                      height: 58,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: TextButton(
                          style: ButtonStyle(backgroundColor:  MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.primary,),),
                          onPressed: () {
                            //Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
                          },
                          child: Center(child: Text("Light mode", style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30
                              ))),
                          ),
                      ),
                      ),
                      SizedBox(height: 12,),
                      SizedBox(
                      height: 58,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: TextButton(
                          style: ButtonStyle(backgroundColor:  MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.primary,),),
                          onPressed: () {
                            //Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
                          },
                          child: Center(child: Text("Language", style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30
                              ))),
                          ),
                      ),
                      ),
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

class ThemeProvider {
}