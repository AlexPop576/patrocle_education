import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

// ignore: must_be_immutable
class Lesson extends StatefulWidget {
  String? lesson;
  Lesson({super.key, this.lesson});

  @override
  // ignore: no_logic_in_create_state
  State<Lesson> createState() => _LessonState(lesson: lesson);
}

class _LessonState extends State<Lesson> {
  String? lesson;
  _LessonState({this.lesson});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          child: SingleChildScrollView(
            child: Column(children: [
              const SizedBox(
                height: 12,
              ),
              Row(children: [
                const SizedBox(
                  width: 12,
                ),
                Lottie.network(
                    'https://lottie.host/491f2840-4c44-425a-924e-4fbc86237dfc/s8x6EccXsD.json',
                    frameRate: FrameRate.max,
                    height: 100),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  "Patrocle:",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.tertiary,
                      fontWeight: FontWeight.bold,
                      fontSize: 40),
                )
              ]),
              const SizedBox(
                height: 12,
              ),
              Divider(
                color: Theme.of(context).colorScheme.primary,
                thickness: 3,
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                lesson.toString(),
                style: TextStyle(fontSize: 27),
              ),
              const SizedBox(
                height: 12,
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
