import 'package:flutter/material.dart';
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
          onPressed: () => Navigator.of(context).pop(),
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