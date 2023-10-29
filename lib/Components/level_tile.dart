import 'package:flutter/material.dart';

class LevelTileYellow extends StatelessWidget {
  const LevelTileYellow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: SizedBox(
        height: 190,
        width: double.infinity,
        child: Container(
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
                        Image.asset('assets/Romania.png', height: 100,),
                        SizedBox(height: 10,),
                        Text("Romania", style: TextStyle(
                        shadows: <Shadow>[
                        Shadow(
                          offset: Offset(3.0, 3.0),
                          blurRadius: 3.0,
                          color: Color.fromARGB(125, 0, 0, 0),
                        ),
                        Shadow(
                          offset: Offset(3.0, 3.0),
                          blurRadius: 3.0,
                          color: Color.fromARGB(125, 0, 0, 255),
                        ),
                      ],color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: VerticalDivider(thickness: 3,color: Colors.white),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      IconButton(onPressed: (){}, icon: Image.asset('assets/Geography.png'), iconSize: 75,),
                      IconButton(onPressed: (){}, icon: Image.asset('assets/History.png'), iconSize: 75,),
                    ],
                  ),
                )
              ],
            ),
          ),
          decoration: BoxDecoration(color: Color.fromARGB(255, 253, 161, 40), borderRadius: const BorderRadius.all(Radius.circular(15)),),
        ),
      ),
    );
  }
}

class LevelTileBlue extends StatelessWidget {
  const LevelTileBlue({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: SizedBox(
        height: 190,
        width: double.infinity,
        child: Container(
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
                        Image.asset('assets/Romania.png', height: 100,),
                        SizedBox(height: 10,),
                        Text("Romania", style: TextStyle(
                        shadows: <Shadow>[
                        Shadow(
                          offset: Offset(3.0, 3.0),
                          blurRadius: 3.0,
                          color: Color.fromARGB(125, 0, 0, 0),
                        ),
                        Shadow(
                          offset: Offset(3.0, 3.0),
                          blurRadius: 3.0,
                          color: Color.fromARGB(125, 0, 0, 255),
                        ),
                      ],color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: VerticalDivider(thickness: 3,color: Colors.white),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      IconButton(onPressed: (){}, icon: Image.asset('assets/Geography.png'), iconSize: 75,),
                      IconButton(onPressed: (){}, icon: Image.asset('assets/History.png'), iconSize: 75,),
                    ],
                  ),
                )
              ],
            ),
          ),
          decoration: BoxDecoration(color: Color.fromARGB(255, 40, 86, 253), borderRadius: const BorderRadius.all(Radius.circular(15)),),
        ),
      ),
    );
  }
}

class LevelTile extends StatefulWidget {
  String? country;
  int? colorIndex;
  LevelTile({super.key, this.country, this.colorIndex});
  @override
  State<LevelTile> createState() => _LevelTileState(country: country, colorIndex: colorIndex);
}

class _LevelTileState extends State<LevelTile> {
  String? country;
  int? colorIndex;
  _LevelTileState({this.country, this.colorIndex});
  bool playButtonGeo = false;
  bool playButtonHst = false;

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
                            Image.asset('assets/Romania.png', height: 100,),
                            SizedBox(height: 10,),
                            Text(country.toString(), style: TextStyle(
                            shadows: <Shadow>[
                            Shadow(
                              offset: Offset(3.0, 3.0),
                              blurRadius: 3.0,
                              color: Color.fromARGB(125, 0, 0, 0),
                            ),
                            Shadow(
                              offset: Offset(3.0, 3.0),
                              blurRadius: 3.0,
                              color: Color.fromARGB(125, 0, 0, 255),
                            ),
                          ],color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
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
                            });}, icon: Image.asset('assets/Geography.png')),
                          ),
                          SizedBox(
                            height: 90,
                            width: 90,
                            child: IconButton(onPressed: (){setState(() {
                              if(playButtonHst==false){
                                if(playButtonGeo == true) playButtonGeo = false;
                                playButtonHst = true;
                              }else{
                                playButtonHst = false;
                              }
                            });}, icon: Image.asset('assets/History.png')),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              decoration: BoxDecoration(color: colorIndex == 0 ? Color.fromARGB(255, 253, 40, 40) : colorIndex == 1 ? Color.fromARGB(255, 40, 86, 253) : Color.fromARGB(255, 253, 161, 40), borderRadius: playButtonGeo == true || playButtonHst == true ? BorderRadius.only(topRight: Radius.circular(15), topLeft: Radius.circular(15),) : BorderRadius.all(Radius.circular(15))),
            ),
          ),
          Visibility(
              visible: playButtonGeo,
              child: SizedBox(
                height: 70,
                width: double.infinity,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(topRight: Radius.circular(0), topLeft: Radius.circular(0), bottomRight: Radius.circular(15), bottomLeft: Radius.circular(15)),
                    child: ElevatedButton(
                      onPressed: () {
                        // Your button action here
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 102, 102, 255),
                      ),
                      child: Text("Play", style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 35
                                    )),
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
                    borderRadius: const BorderRadius.only(topRight: Radius.circular(0), topLeft: Radius.circular(0), bottomRight: Radius.circular(15), bottomLeft: Radius.circular(15)),
                    child: ElevatedButton(
                      onPressed: () {
                        // Your button action here
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 102, 102, 255),
                      ),
                      child: Text("Play", style: TextStyle(
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



