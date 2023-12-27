import 'dart:ui';
import 'package:flutter/material.dart';

class AddTest extends StatefulWidget {
  const AddTest({super.key});

  @override
  State<AddTest> createState() => _AddTestState();
}

class _AddTestState extends State<AddTest> {
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
        child: Column(children: [
          SizedBox(height: 80),
          Row(
            children: [
              Text("Add test details", style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),),
            ],
          ),
          SizedBox(height: 20),
          SizedBox(
            height: 58,
            child: TextField(
              //controller: usernameController,
              cursorColor: Colors.white,
              maxLength: 50,
              decoration: InputDecoration(
                focusedBorder:
                    const OutlineInputBorder(
                  borderRadius:
                      BorderRadius.all(
                          Radius.circular(
                              15)),
                  borderSide: BorderSide(
                      color: Colors.white,
                      width: 2.0),
                ),
                enabledBorder:
                    OutlineInputBorder(
                  borderRadius:
                      const BorderRadius.all(
                          Radius.circular(
                              15)),
                  borderSide: BorderSide(
                      color: Theme.of(context)
                          .colorScheme
                          .tertiary,
                      width: 1.0),
                ),
                labelText: 'Country name',
                labelStyle: TextStyle(
                    color: Theme.of(context)
                        .colorScheme
                        .tertiary),
                counterText: '',
              ),
            ),
            ),
            Divider(
              color: Theme.of(context)
                  .colorScheme
                  .primary,
              thickness: 3,
            ),
            SizedBox(height: 7),
            Textfield(height: 300,text: "Lesson"),
            Divider(
              color: Theme.of(context)
                  .colorScheme
                  .primary,
              thickness: 3,
            ),
            SizedBox(height: 5,),
            Row(
            children: [
              Text("Question 1", style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),),
            ],
          ),
          const SizedBox(height: 20),
          Textfield(height: 58, text: "Question"),
          const SizedBox(height: 20),
          Textfield(height: 58, text: "Answer 1"),
          Textfield(height: 58, text: "Answer 2"),
          Textfield(height: 58, text: "Answer 3"),
          Textfield(height: 58, text: "Answer 4"),
        ]),
      ),
    );
  }
}

class Textfield extends StatelessWidget {
  double? height;
  String? text;
  Textfield({
    super.key, this.height, this.text,
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
          focusedBorder:
              const OutlineInputBorder(
            borderRadius:
                BorderRadius.all(
                    Radius.circular(
                        15)),
            borderSide: BorderSide(
                color: Colors.white,
                width: 2.0),
          ),
          enabledBorder:
              OutlineInputBorder(
            borderRadius:
                const BorderRadius.all(
                    Radius.circular(
                        15)),
            borderSide: BorderSide(
                color: Theme.of(context)
                    .colorScheme
                    .tertiary,
                width: 1.0),
          ),
          labelText: text,
          labelStyle: TextStyle(
              color: Theme.of(context)
                  .colorScheme
                  .tertiary),
          counterText: '',
        ),
      ),
      );
  }
}