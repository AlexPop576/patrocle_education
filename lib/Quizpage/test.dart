import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

// ignore: must_be_immutable
class Test extends StatefulWidget {
  final Function getAnswerFunction;
  int? selected = 0;
  String? questionText, answer1, answer2, answer3, answer4;
  Test(
      {super.key,
      required this.getAnswerFunction,
      this.selected,
      this.questionText,
      this.answer1,
      this.answer2,
      this.answer3,
      this.answer4});

  @override
  // ignore: no_logic_in_create_state
  State<Test> createState() => _TestState(
      getAnswerFunction: getAnswerFunction,
      selected: selected,
      questionText: questionText,
      answer1: answer1,
      answer2: answer2,
      answer3: answer3,
      answer4: answer4);
}

class _TestState extends State<Test> {
  int? questionAnswer = 1, selected;
  String? questionText, answer1, answer2, answer3, answer4;
  final Function getAnswerFunction;

  _TestState(
      {required this.getAnswerFunction,
      this.selected,
      this.questionText,
      this.answer1,
      this.answer2,
      this.answer3,
      this.answer4});

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
                  Lottie.network(
                      'https://lottie.host/491f2840-4c44-425a-924e-4fbc86237dfc/s8x6EccXsD.json',
                      frameRate: FrameRate.max,
                      height: 100),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Text(
                      questionText.toString(),
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary,
                          fontWeight: FontWeight.bold,
                          fontSize: 28),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Divider(
                  color: Theme.of(context).colorScheme.primary, thickness: 3),
              const SizedBox(height: 24),
              Column(children: [
                SizedBox(
                  height: 58,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          getAnswerFunction(1);
                          selected = 1;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        side: selected == 1
                            ? const BorderSide(
                                color: Color.fromARGB(255, 102, 102, 255),
                                width: 3)
                            : BorderSide(
                                color: Theme.of(context).colorScheme.primary,
                                width: 3),
                      ),
                      child: Center(
                          child: Text(answer1.toString(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30))),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                SizedBox(
                  height: 58,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          getAnswerFunction(2);
                          selected = 2;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        side: selected == 2
                            ? const BorderSide(
                                color: Color.fromARGB(255, 102, 102, 255),
                                width: 3)
                            : BorderSide(
                                color: Theme.of(context).colorScheme.primary,
                                width: 3),
                      ),
                      child: Center(
                          child: Text(answer2.toString(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30))),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                SizedBox(
                  height: 58,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          getAnswerFunction(3);
                          selected = 3;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        side: selected == 3
                            ? const BorderSide(
                                color: Color.fromARGB(255, 102, 102, 255),
                                width: 3)
                            : BorderSide(
                                color: Theme.of(context).colorScheme.primary,
                                width: 3),
                      ),
                      child: Center(
                          child: Text(answer3.toString(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30))),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                SizedBox(
                  height: 58,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          getAnswerFunction(4);
                          selected = 4;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        side: selected == 4
                            ? const BorderSide(
                                color: Color.fromARGB(255, 102, 102, 255),
                                width: 3)
                            : BorderSide(
                                color: Theme.of(context).colorScheme.primary,
                                width: 3),
                      ),
                      child: Center(
                          child: Text(answer4.toString(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30))),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
              ]),
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