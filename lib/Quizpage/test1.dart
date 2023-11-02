import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Test1 extends StatefulWidget {
  const Test1({super.key});

  @override
  State<Test1> createState() => _Test1State();
}
class _Test1State extends State<Test1> {
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
               Text("Question"),
               const SizedBox(width: 12),
             Container(
  margin: EdgeInsets.symmetric(vertical: 10),
  child: ClipRRect(
    borderRadius: BorderRadius.circular(10),
    child: Row(
  children: [
    createSection(Colors.green),
    createSection(Colors.red), // Add as many sections as you want
    Expanded(
      flex: 7, // Remaining 70% of the bar
      child: Container(
        height: 20, // Altura de la barra
        color: Colors.white, // Transparent color
      ),
    ),
  ],
)
  ),
)

             
            ],
          ),
        ),
      ),
    );
  }
}
Widget createSection(Color color) {
  return Expanded(
    flex: 1, // 10% of the entire bar
    child: Container(
      height: 20, // Altura de la barra
      color: color,
    ),
  );
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