import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AddTest extends StatefulWidget {
  const AddTest({super.key});

  @override
  State<AddTest> createState() => _AddTestState();
}

class _AddTestState extends State<AddTest> {
  List<int> answers = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 60),
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 25.0,
              sigmaY: 25.0,
            ),
            child: Opacity(
              opacity: 0.7,
              child: AppBar(
                flexibleSpace: Container(color: Colors.transparent),
                backgroundColor: Theme.of(context).colorScheme.primary,
                leading: IconButton(
                  icon: const Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 29,
                  ),
                  onPressed: (){
                    showModalBottomSheet(
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            height: double.infinity,
                            decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.background,
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(25),
                                    topRight: Radius.circular(25))),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 17),
                              child: SingleChildScrollView(
                                physics: const BouncingScrollPhysics(),
                                child: Column(children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Lottie.network(
                                      'https://lottie.host/491f2840-4c44-425a-924e-4fbc86237dfc/s8x6EccXsD.json',
                                      frameRate: FrameRate.max,
                                      height: 100),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 40),
                                    child: Text(
                                      "Do you want to quit adding the test? If you quit, you`ll lose your work.",
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .tertiary,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 40,
                                  ),
                                  SizedBox(
                                    height: 58,
                                    width: double.infinity,
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(15)),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color.fromARGB(
                                              255, 102, 102, 255),
                                        ),
                                        child: const Center(
                                            child: Text("Continue",
                                                style: TextStyle(
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
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(15)),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color.fromARGB(
                                              255, 219, 64, 64),
                                        ),
                                        child: const Center(
                                            child: Text("Quit",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 30))),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                ]),
                              ),
                            ),
                          );
                        });
                  }
                ),
                title: const Text(
                  "Add test",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 35),
                ),
                centerTitle: true,
                elevation: 0,
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17.0),
        child:
            CustomScrollView(physics: const BouncingScrollPhysics(), slivers: [
          SliverToBoxAdapter(
            child: Column(children: [
              const SizedBox(height: 80),
              const Row(
                children: [
                  Text(
                    "Add test details",
                    style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 58,
                child: TextField(
                  //controller: usernameController,
                  cursorColor: Colors.white,
                  maxLength: 50,
                  decoration: InputDecoration(
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(color: Colors.white, width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.tertiary,
                          width: 1.0),
                    ),
                    labelText: 'Country name',
                    labelStyle: TextStyle(
                        color: Theme.of(context).colorScheme.tertiary),
                    counterText: '',
                  ),
                ),
              ),
              Divider(
                color: Theme.of(context).colorScheme.primary,
                thickness: 3,
              ),
              const SizedBox(height: 7),
              Textfield(height: 300, text: "Lesson"),
              Divider(
                color: Theme.of(context).colorScheme.primary,
                thickness: 3,
              ),
              const SizedBox(
                height: 5,
              ),
            ]),
          ),
          SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return NewQuestion(
                answers: answers,
                index: index+1,
              );
            }, childCount: 10),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                const SizedBox(
                    height: 5,
                ),
                SizedBox(
                  height: 58,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius:
                      const BorderRadius.all(Radius.circular(15)),
                    child: ElevatedButton(
                    onPressed: () async {
                      Navigator.pop(context);
                      
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                        const Color.fromARGB(255,102,102,255)
                    ),
                    child: const Center(
                      child: Text(
                          "Continue",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          )
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                    height: 15,
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}

// ignore: must_be_immutable
class NewQuestion extends StatefulWidget {
  int index;
  List<int> answers;

  NewQuestion({
    super.key,
    required this.answers,
    required this.index,
  });

  @override
  // ignore: no_logic_in_create_state
  State<NewQuestion> createState() =>
      _NewQuestionState(answers: answers, index: index);
}

class _NewQuestionState extends State<NewQuestion> {
  int index;
  List<int> answers;
  _NewQuestionState({
    required this.answers,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15),
        Row(
          children: [
            Text(
              "Question ${widget.index}",
              style: const TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Textfield(height: 58, text: "Question"),
        const SizedBox(height: 20),
        Textfield(height: 58, text: "Answer 1"),
        const SizedBox(height: 10),
        Textfield(height: 58, text: "Answer 2"),
        const SizedBox(height: 10),
        Textfield(height: 58, text: "Answer 3"),
        const SizedBox(height: 10),
        Textfield(height: 58, text: "Answer 4"),
        const SizedBox(height: 15),
        SizedBox(
          height: 60,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        answers[index] == 1 ? Colors.green : Colors.red,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
                    ),
                  ),
                  child: Icon(
                    answers[index] == 1 ? Icons.check : Icons.close,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      answers[widget.index] = 1;
                    });
                  },
                ),
              ),
              Expanded(
                flex: 1,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        answers[widget.index] == 2 ? Colors.green : Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                  child: Icon(
                    answers[widget.index] == 2 ? Icons.check : Icons.close,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      answers[widget.index] = 2;
                    });
                  },
                ),
              ),
              Expanded(
                flex: 1,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        answers[widget.index] == 3 ? Colors.green : Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                  child: Icon(
                    answers[widget.index] == 3 ? Icons.check : Icons.close,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      answers[widget.index] = 3;
                    });
                  },
                ),
              ),
              Expanded(
                flex: 1,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        answers[widget.index] == 4 ? Colors.green : Colors.red,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15)),
                    ),
                  ),
                  child: Icon(
                    answers[widget.index] == 4 ? Icons.check : Icons.close,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      answers[widget.index] = 4;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
        Divider(
          color: Theme.of(context).colorScheme.primary,
          thickness: 3,
        ),
        const SizedBox(
          height: 5,
        ),
      ],
    );
  }
}

// ignore: must_be_immutable
class Textfield extends StatelessWidget {
  double? height;
  String? text;
  Textfield({
    super.key,
    this.height,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: TextField(
        //controller: usernameController,
        cursorColor: Colors.white,
        maxLength: 50,
        decoration: InputDecoration(
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(color: Colors.white, width: 2.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(
                color: Theme.of(context).colorScheme.tertiary, width: 1.0),
          ),
          labelText: text,
          labelStyle: TextStyle(color: Theme.of(context).colorScheme.tertiary),
          counterText: '',
        ),
      ),
    );
  }
}
