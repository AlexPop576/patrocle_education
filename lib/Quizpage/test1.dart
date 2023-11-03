import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Test1 extends StatefulWidget {
  const Test1({super.key});

  @override
  State<Test1> createState() => _Test1State();
}
class _Test1State extends State<Test1> {
  int answer = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          child: Column(
            children: [
              const SizedBox(height: 12),
              Row(
                children: [
                  const SizedBox(width: 12),
                  Lottie.network('https://lottie.host/491f2840-4c44-425a-924e-4fbc86237dfc/s8x6EccXsD.json', frameRate: FrameRate.max, height: 100),
                  const SizedBox(width: 20),
                  Text("Patrocle:", style: TextStyle(color: Theme.of(context).colorScheme.tertiary, fontWeight: FontWeight.bold, fontSize: 40),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Divider(color: Theme.of(context).colorScheme.primary, thickness: 3),
              const Text("Question"),
              const SizedBox(height: 12,),
                      SizedBox(
                        height: 58,
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(15)),
                          child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            answer = 1;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).colorScheme.primary,
                        ),
                        child: const Center(child: Text("Answer 1", style: TextStyle(
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
                          setState(() {
                            answer = 2;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).colorScheme.primary
                        ),
                        child: const Center(child: Text("Answer 2", style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30
                              ))),
                        ),
                      ),
                      ),      
            ],
          ),
        ),
      ),
    );
  }
}
// class _Test1State extends State<Test1> {
//   List<Widget> sections = [
//     createSection(Colors.green),
//     createSection(Colors.red),
//     // Add more sections here
//   ];

//   @override
//   Widget build(BuildContext context) {
//     int remainingSpace = 10 - sections.length;

//     return Scaffold(
//       body: Column(
//         children: [
//           // Your other widgets here
//           Row(
//             children: [
//               ...sections,
//               Expanded(
//                 flex: remainingSpace, // Remaining space of the bar
//                 child: Container(
//                   height: 20, // Altura de la barra
//                   color: Colors.transparent, // Transparent color
//                 ),
//               ),
//             ],
//           ),
//           ElevatedButton(
//             onPressed: () {
//               if (remainingSpace > 0) {
//                 setState(() {
//                   sections.add(createSection(Colors.blue)); // Add a new section
//                 });
//               }
//             },
//             child: Text('Add Section'),
//           ),
//         ],
//       ),
//     );
//   }