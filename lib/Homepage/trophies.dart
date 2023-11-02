import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:patrocle_education/Components/level_tile.dart';

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
              SizedBox(width: 12,),
              Lottie.network('https://lottie.host/491f2840-4c44-425a-924e-4fbc86237dfc/s8x6EccXsD.json', frameRate: FrameRate.max, height: 100),
              SizedBox(width: 20,),
              Expanded(child: Text("Your trophies", style: TextStyle(color: Theme.of(context).colorScheme.tertiary, fontWeight: FontWeight.bold, fontSize: 40),))
              ]
              ),
              SizedBox(height: 12,),
              Divider(color: Theme.of(context).colorScheme.primary, thickness: 3,),
            ]
          ),
        ),
      )
    );
  }
}
//Container(child: Image.asset('assets/Romania.png'));