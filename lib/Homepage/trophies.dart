import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:patrocle_education/Components/level_tile.dart';
import 'package:patrocle_education/Components/trophie_tile.dart';

class Trophies extends StatefulWidget {
  const Trophies({super.key});

  @override
  State<Trophies> createState() => _TrophiesState();
}

class _TrophiesState extends State<Trophies> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          child: Column(
            children: [
            SizedBox(height: 12,),
            Row(children: [
              const SizedBox(width: 12,),
              Lottie.network('https://lottie.host/491f2840-4c44-425a-924e-4fbc86237dfc/s8x6EccXsD.json', frameRate: FrameRate.max, height: 100),
              const SizedBox(width: 20,),
              Expanded(child: Text("Your trophies", style: TextStyle(color: Theme.of(context).colorScheme.tertiary, fontWeight: FontWeight.bold, fontSize: 40),))
              ]
              ),
              const SizedBox(height: 12,),
              Divider(color: Theme.of(context).colorScheme.primary, thickness: 3,),
              const SizedBox(height: 24,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TrophieTile(trophy: "Geographer", color1: Color.fromARGB(255, 0, 255, 132),color2: Color.fromARGB(120, 0, 255, 132)),
                  TrophieTile(trophy: "Historian", color1: Color.fromARGB(255, 0, 238, 255),color2: Color.fromARGB(120, 0, 238, 255)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TrophieTile(trophy: "Curious", color1: Color.fromARGB(255, 255, 0, 0),color2: Color.fromARGB(120, 255, 0, 0)),
                  TrophieTile(trophy: "Knowledgeable", color1: Color.fromARGB(255, 255, 200, 0),color2: Color.fromARGB(120, 255, 200, 0)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TrophieTile(trophy: "Expert", color1: Color.fromARGB(255, 157, 0, 255),color2: Color.fromARGB(120, 157, 0, 255)),
                  TrophieTile(trophy: "Champion", color1: Color.fromARGB(255, 129, 129, 129),color2: Color.fromARGB(120, 129, 129, 129)),
                ],
              ),
              const SizedBox(height: 24,),
            ]
          ),
        ),
      )
    );
  }
}
//Container(child: Image.asset('assets/Romania.png'));