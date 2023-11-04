import 'package:flutter/material.dart';

class TrophieTile extends StatefulWidget {
  String? trophy;
  Color color1 = Colors.white, color2 = Colors.white; 
  TrophieTile({super.key, required this.trophy, required this.color1, required this.color2});

  @override
  State<TrophieTile> createState() => _TrophieTileState(trophy: trophy, color1: color1, color2: color2);
}

class _TrophieTileState extends State<TrophieTile> {
  String? trophy;
  Color color1 = Colors.white, color2 = Colors.white;  
  _TrophieTileState({required this.trophy, required this.color1, required this.color2});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.5),
      child: Container(
        height: 190,
        width: 190,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                color1, color2,
              ],
            ),
          borderRadius: const BorderRadius.all(Radius.circular(15)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(height: 125, child: Image.asset("assets/$trophy.png",)),
              const SizedBox(height: 10,),
              Text(trophy.toString(), style: TextStyle(color: Theme.of(context).colorScheme.tertiary, fontSize: 25, fontWeight: FontWeight.w500)),
            ]
          ),
        ),
      ),
    );
  }
}