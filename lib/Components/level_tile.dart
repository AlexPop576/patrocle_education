import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:patrocle_education/Quizpage/quizpage.dart';
import '../Homepage/levels.dart';

class LevelTile extends StatefulWidget {
  final Function setDone;
  String? continent;
  String? country;
  int? colorIndex;
  bool? geoDone = false;
  bool? hstDone = false;
  Map<String, bool>? playButtons;
  LevelTile({super.key, this.country, this.colorIndex, this.playButtons, required this.geoDone, required this.hstDone, required this.setDone, this.continent});
  @override
  State<LevelTile> createState() => _LevelTileState(country: country, colorIndex: colorIndex, playButtons: playButtons, geoDone: geoDone, hstDone: hstDone, setDone: setDone, continent: continent);
}

class _LevelTileState extends State<LevelTile> {
  final Function setDone;
  String? continent;
  String? country;
  int? colorIndex;
  bool? geoDone = false;
  bool? hstDone = false;
  Map<String, bool>? playButtons;
  _LevelTileState({this.country, this.colorIndex, this.playButtons, required this.geoDone, required this.hstDone, required this.setDone, this.continent});
  bool playButtonGeo = false;
  bool playButtonHst = false;
  bool found = false;

  getDone(bool geo,bool hst){
    setState(() {
      if(geo == true){
        geoDone = geo;
      }
      if(hst == true){
        hstDone = hst;
      }
      playButtonGeo = false;
      playButtonHst = false;
    });
  }
   
  bool getPlayButton(){
    if(playButtonGeo == true || playButtonHst == true)
    {
      return true;
    }else{
    return false;
    }
  }


  void setPlayButton(){
    setState(() {
      playButtonGeo = false;
      playButtonHst = false;
    });

  }

   
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        children: [
          SizedBox(
            height: 190,
            width: double.infinity,
            child: Container(
              decoration: BoxDecoration(color: colorIndex == 0 ?const Color.fromARGB(255, 253, 40, 40) : colorIndex == 1 ?const Color.fromARGB(255, 40, 86, 253) : const Color.fromARGB(255, 253, 161, 40), borderRadius: playButtonGeo == true || playButtonHst == true ? const BorderRadius.only(topRight: Radius.circular(15), topLeft: Radius.circular(15),) : const BorderRadius.all(Radius.circular(15))),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          children: [
                            ClipRRect(borderRadius: const BorderRadius.all(Radius.circular(15)) ,child: Image.asset('assets/Flags/${country.toString()}.png', height: 100,)),
                            const SizedBox(height: 10,),
                            Expanded(
                              child: Text(country.toString(), style: const TextStyle(
                              shadows: <Shadow>[
                              Shadow(
                                offset: Offset(3.0, 3.0),
                                blurRadius: 3.0,
                                color: Color.fromARGB(125, 0, 0, 0),
                              ),
                              Shadow(
                                offset: Offset(3.0, 3.0),
                                blurRadius: 3.0,
                                color: Color.fromARGB(0, 0, 0, 255),
                              ),
                              ],color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: VerticalDivider(thickness: 3,color: Colors.white),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 90,
                            width: 90,
                            child: IconButton(onPressed: (){setState(() {
                              if(playButtonGeo==false){
                                if(playButtonHst == true) playButtonHst = false;
                                playButtonGeo = true;
                              }else{
                                playButtonGeo = false;
                              }
                            });}, icon: geoDone == false ? playButtonGeo == false ? Image.asset('assets/Geography.png') : Image.asset('assets/GeographySelected.png') : playButtonGeo == false ? Image.asset('assets/Tick.png') : Image.asset('assets/TickOutlined.png')),
                          ),
                          SizedBox(
                            height: 90,
                            width: 90,
                            child: IconButton(onPressed: (){setState(() {
                              if(selected == false){
                                if(playButtonHst==false){
                                  if(playButtonGeo == true) playButtonGeo = false;
                                  playButtonHst = true;
                                  }else{
                                  playButtonHst = false;
                                }
                                selected == true;
                              }else{
                                  selected = false;
                                  if(playButtonHst==false){
                                  if(playButtonGeo == true) playButtonGeo = false;
                                  playButtonHst = true;
                                  }else{
                                  playButtonHst = false;
                                }
                              }
                            });}, icon: hstDone == false ? playButtonHst == false ? Image.asset('assets/History.png') : Image.asset('assets/HistorySelected.png') : playButtonHst == false ? Image.asset('assets/Tick.png') : Image.asset('assets/TickOutlined.png')),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Visibility(
              visible: playButtonGeo,
              child: SizedBox(
                height: 70,
                width: double.infinity,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(bottomRight: Radius.circular(15), bottomLeft: Radius.circular(15)),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageTransition(child: Quizpage(country: country,subject: "Geography",getDone: getDone, setDone: setDone,), type: PageTransitionType.bottomToTop,
                          duration: const Duration(milliseconds: 400),
                        ),);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 102, 102, 255),
                      ),
                      child: const Text("Play", style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 35
                        )
                      ),
                    ),
                  ),
                ),
              ),
            Visibility(
              visible: playButtonHst,
              child: SizedBox(
                height: 70,
                width: double.infinity,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(bottomRight: Radius.circular(15), bottomLeft: Radius.circular(15)),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageTransition(child: Quizpage(country: country,subject: "History",getDone: getDone, setDone: setDone,), type: PageTransitionType.bottomToTop,
                          duration: const Duration(milliseconds: 400),
                        ),);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:const Color.fromARGB(255, 102, 102, 255),
                      ),
                      child: const Text("Play", style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 35
                                    )),
                    ),
                  ),
                ),
              ),
        ],
      ),
    );
  }
}


