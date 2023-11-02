import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:patrocle_education/Components/level_divider.dart';
import '../Components/level_tile.dart';

bool selected = false;

class Levels extends StatefulWidget {
  const Levels({super.key});

  @override
  State<Levels> createState() => _LevelsState();
}

class _LevelsState extends State<Levels> {
  int color = 0;

  Map<String, bool> countries = {
    "Argentina": false,
    "Australia": false,
    "Brazil": false,
    "Canada": false,
    "China": false,
    "Egypt": false,
    "France": false,
    "Germany": false,
    "Greece": false,
    "Israel": false,
    "Italy": false,
    "Japan": false,
    "Mexico": false,
    "New Zealand": false,
    "Romania": false,
    "Russia": false,
    "South Africa": false,
    "Spain": false,
    "UK": false,
    "Ukraine": false,
    "USA": false,
  };

  List<String> europeCountries = [
    "France",
    "Germany",
    "Greece",
    "Italy",
    "Romania",
    "Russia",
    "Spain",
    "UK",
    "Ukraine",
  ];

  List<String> americaCountries = [
    "Argentina", 
    "Brazil",
    "Canada",    
    "Mexico",
    "USA",
  ];

  List<String> asiaCountries = [
    "China",
    "Israel",
    "Japan",
  ];

  List<String> africaCountries = [
    "Egypt",
    "South Africa",
  ];

  List<String> australiaCountries = [
    "Australia",
    "New Zealand",
  ];

  void disableAll(){
    for(int index=0;index<europeCountries.length;index++){
      LevelTile(
        country: europeCountries[index],
        colorIndex: color,
      );//.setPlayButton();
      LevelTile(
        country: europeCountries[index],
        colorIndex: color,
      );//.setPlayButton();
      LevelTile();//.setPlayButton();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17.0),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const SizedBox(height: 12,),
                    Row(children: [
                      const SizedBox(width: 12,),
                      Lottie.network('https://lottie.host/491f2840-4c44-425a-924e-4fbc86237dfc/s8x6EccXsD.json', frameRate: FrameRate.max, height: 100),
                      const SizedBox(width: 20,),
                      Expanded(child: Text("Levels", style: TextStyle(color: Theme.of(context).colorScheme.tertiary, fontWeight: FontWeight.bold, fontSize: 40),))
                      ]
                    ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
            LevelDivider(continent: "Europe"),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  color++;
                  if (color == 3) color = 0;
                  if(selected == false){
                    return LevelTile(
                      country: europeCountries[index],
                      colorIndex: color,
                    );
                  }else{
                    return LevelTile(
                      country: europeCountries[index],
                      colorIndex: color,
                    );
                  }
                },
                childCount: europeCountries.length,
              ),
            ),
            LevelDivider(continent: "America"),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  color++;
                  if (color == 3) color = 0;
                  return LevelTile(
                    country: americaCountries[index],
                    colorIndex: color,
                  );
                },
                childCount: americaCountries.length,
              ),
            ),
            LevelDivider(continent: "Asia"),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  color++;
                  if (color == 3) color = 0;
                  return LevelTile(
                    country: asiaCountries[index],
                    colorIndex: color,
                  );
                },
                childCount: asiaCountries.length,
              ),
            ),
            LevelDivider(continent: "Africa"),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  color++;
                  if (color == 3) color = 0;
                  return LevelTile(
                    country: africaCountries[index],
                    colorIndex: color,
                  );
                },
                childCount: africaCountries.length,
              ),
            ),
            LevelDivider(continent: "Australia"),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  color++;
                  if (color == 3) color = 0;
                  return LevelTile(
                    country: australiaCountries[index],
                    colorIndex: color,
                  );
                },
                childCount: australiaCountries.length,
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 65,))
          ],
        ),
      ),
    );
  }
}
