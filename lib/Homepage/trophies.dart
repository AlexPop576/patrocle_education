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

  List<String> trophiesName = [
    "Geographer", "Historian", "Curious", "Knowledgeable", "Expert", "Champion", "Legend", "Untouchable","Locked",
  ];

  List<Color> trophiesColor1 = [
  const Color.fromARGB(255, 0, 255, 132), const Color.fromARGB(255, 0, 238, 255),
  const Color.fromARGB(255, 255, 0, 0),const Color.fromARGB(255, 255, 200, 0),
  const Color.fromARGB(255, 157, 0, 255),const Color.fromARGB(255, 0, 55, 255),
  const Color.fromARGB(255, 255, 132, 0), const Color.fromARGB(255, 255, 0, 234),
  const Color.fromARGB(255, 129, 129, 129),
  ];

  List<Color> trophiesColor2 = [
  const Color.fromARGB(120, 0, 255, 132), const Color.fromARGB(120, 0, 238, 255),
  const Color.fromARGB(120, 255, 0, 0),const Color.fromARGB(120, 255, 200, 0),
  const Color.fromARGB(120, 157, 0, 255),const Color.fromARGB(120, 0, 55, 255),
  const Color.fromARGB(120, 255, 132, 0), const Color.fromARGB(120, 255, 0, 234),
  const Color.fromARGB(120, 129, 129, 129),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Theme.of(context).colorScheme.background,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
            child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: Column(
              children: [
              const SizedBox(height: 90,),
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
              ]
              ))),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) 
                {
                  int newIndex = index * 2;
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TrophieTile(trophy: trophiesName[newIndex], color1: trophiesColor1[newIndex],color2: trophiesColor2[newIndex]),
                      index < trophiesName.length~/2 ? TrophieTile(trophy: trophiesName[newIndex+1], color1: trophiesColor1[newIndex+1],color2: trophiesColor2[newIndex+1]) : Container(),
                    ],
                  );
                },
                childCount: trophiesName.length ~/ 2 + trophiesName.length%2,
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(height: 100),
              )
            ]
            ),
          );
  }
}