import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:patrocle_education/Quizpage/lesson.dart';
import 'package:patrocle_education/Quizpage/test1.dart';
import 'package:patrocle_education/Quizpage/test2.dart';

class Quizpage extends StatefulWidget {
  String? country;
  String? subject;
  Quizpage({super.key, this.country, this.subject});

  @override
  State<Quizpage> createState() => _QuizpageState(country: country, subject: subject);
}

class _QuizpageState extends State<Quizpage> {
  String? country;
  String? subject;
  _QuizpageState({this.country, this.subject});
  int pageIndex = 0;

  final List<Widget> pages = [
    Lesson(),
    const Test1(),
    const Test2(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.white, size: 29,),
          onPressed: () {
            showModalBottomSheet(backgroundColor: Colors.transparent,context: context,
             builder: (BuildContext context) {
                return Container(
                  height: 450,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25))
                  ),
                  child:  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 17),
                    child: Column(children: [
                      const SizedBox(height: 20,),
                      Lottie.network('https://lottie.host/491f2840-4c44-425a-924e-4fbc86237dfc/s8x6EccXsD.json', frameRate: FrameRate.max, height: 100),
                      const SizedBox(height: 30,),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        child: Text("Do you want to end your learning session? If you quit, you`ll lose your progress.", style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ), textAlign: TextAlign.center,),
                      ),
                      const SizedBox(height: 40,),
                      SizedBox(
                        height: 58,
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(15)),
                          child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 64, 219, 79),
                        ),
                        child: const Center(child: Text("Continue", style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30
                              ))),
                        ),
                      ),
                      ),
                      const SizedBox(height: 12,),
                      SizedBox(
                        height: 58,
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(15)),
                          child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 219, 64, 64),
                        ),
                        child: const Center(child: Text("Quit", style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30
                              ))),
                        ),
                      ),
                      ),
                      const SizedBox(height: 20,),
                    ]),
                  ),
                );
             }
            );
          }
        ),
        title: pageIndex == 0 ? Text(country.toString(), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 35),) 
        : Container(),
        centerTitle: true,
        elevation: 0,      
      ),
      body: pages[pageIndex],
      bottomNavigationBar: SizedBox(
        height: 100,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          child: Column(
            children: [
              Divider(color: Theme.of(context).colorScheme.primary, thickness: 3,),
              const SizedBox(height: 10),
              SizedBox(
                height: 58,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    if(pageIndex<2){
                      pageIndex++;
                    }
                  });
                },
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 102, 102, 255),
                ),
                child: Text(pageIndex == 0 ? "Continue" : "Check", style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 35
                              )),
                ),
              ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}