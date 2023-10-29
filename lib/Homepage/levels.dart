import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../Components/level_tile.dart';

class Levels extends StatefulWidget {
  const Levels({super.key});

  @override
  State<Levels> createState() => _LevelsState();
}

class _LevelsState extends State<Levels> {

  int color = 0;

  List<String> Countries = [
    "Romania",
    "USA",
    "Germany",
    "France",
    "Israel",
    "Belgium",
    "Spain",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17),
        child: Column(
          children: [
          SizedBox(height: 12,),
          Row(children: [
            const SizedBox(width: 12,),
            Lottie.network('https://lottie.host/491f2840-4c44-425a-924e-4fbc86237dfc/s8x6EccXsD.json', frameRate: FrameRate.max, height: 100),
            const SizedBox(width: 20,),
            Text("Levels", style: TextStyle(color: Theme.of(context).colorScheme.tertiary, fontWeight: FontWeight.bold, fontSize: 40),)
            ]
            ),
            const SizedBox(height: 12,),
            Divider(color: Theme.of(context).colorScheme.primary, thickness: 3,),
            const SizedBox(height: 12,),
            Expanded(
              child: ListView.builder(
                itemCount: Countries.length,
                itemBuilder: (BuildContext context, int index) 
              {
                color++; 
                if(color==3) color = 0;
                return LevelTile(country: Countries[index],colorIndex: color,);
              }
              ),
            )
          ]
        ),
      ),
    );
  }
}