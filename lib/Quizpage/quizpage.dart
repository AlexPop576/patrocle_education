import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:patrocle_education/Quizpage/lesson.dart';
import 'package:patrocle_education/Quizpage/test.dart';
import 'package:patrocle_education/Quizpage/test2.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:just_audio/just_audio.dart';

// ignore: must_be_immutable
class Quizpage extends StatefulWidget {
  final Function getDone, setDone;
  String? continent, country, subject;
  Quizpage(
      {super.key,
      this.country,
      this.subject,
      required this.getDone,
      required this.setDone,
      this.continent});

  @override
  // ignore: no_logic_in_create_state
  State<Quizpage> createState() => _QuizpageState(
      country: country,
      subject: subject,
      getDone: getDone,
      setDone: setDone,
      continent: continent);
}

class _QuizpageState extends State<Quizpage> {
  final Function getDone, setDone;
  String? continent, country, subject;
  int pageIndex = 0, correctAnswers = 0;
  int? givenAnswer = 1,
      iq = 0,
      trophies = 0,
      geographerTrophy = 0,
      historianTrophy = 0,
      selectedLanguage = 1;
  List<String> trophyList = [];
  late AudioPlayer _correct;
  late AudioPlayer _incorrect;

 Map<int,Map<String,String> > languageText = {
    1 : {
      "Play" : "Play",
      "Continue" : "Continue",
      "Check" : "Check",
      "Quit" : "Quit",
      "Wrong!" : "Wrong!",
      "Well done!" : "Well done!",
      "Do you want to end your learning session? If you quit, you`ll lose your progress." : "Do you want to end your learning session? If you quit, you`ll lose your progress.",
      "Try again" : "Try again",
      "Almost there!" : "Almost there!",
      "Good job!" : "Good job!",
      "Fantastic!" : "Fantastic!",
      "Almost perfect!" : "Almost perfect!",
      "Perfect!" : "Perfect!",
      "You`ve got correct answers!" : "You`ve got correct answers!",
      "You`ve got 1 correct answer!" : "You`ve got 1 correct answer!",
      "TOTAL IQ" : "TOTAL IQ",
      "SCORE" : "SCORE",

    },
    2 : {
      "Play" : "Joacă",
      "Continue" : "Continuă",
      "Check" : "Verifică",
      "Quit" : "Renunță",
      "Wrong!" : "Greșit!",
      "Well done!" : "Foarte bine!",
      "Do you want to end your learning session? If you quit, you`ll lose your progress." : "Doriți să încheiați sesiunea de învățare? Dacă renunți, vei pierde progresul.",
      "Try again" : "Încearcă din nou",
      "Almost there!" : "Aproape!",
      "Good job!" : "Bine!",
      "Fantastic!" : "Fantastic!",
      "Almost perfect!" : "Aproape perfect!",
      "Perfect!" : "Perfect!",
      "You`ve got correct answers!" : "Ai răspunsuri corecte!",
      "You`ve got 1 correct answer!" : "Ai 1 răspuns corect!",
      "TOTAL IQ" : "TOTAL IQ",
      "SCORE" : "SCOR",
    },
    3 : {
      "Play" : "Juega",
      "Continue" : "Continuar",
      "Check" : "Comprobar",
      "Quit" : "Salir",
      "Wrong!" : "Incorrecto!",
      "Well done!" : "Bien hecho!",
      "Do you want to end your learning session? If you quit, you`ll lose your progress." : "¿Quieres terminar tu sesión de aprendizaje? Si te rindes, perderás tu progreso.",
      "Try again" : "Inténtalo de nuevo",
      "Almost there!" : "Casi!",
      "Good job!" : "Buen trabajo!",
      "Fantastic!" : "Fantástico!",
      "Almost perfect!" : "Casi perfecto!",
      "Perfect!" : "Perfecto!",
      "You`ve got correct answers!" : "Tienes respuestas correctas!",
      "You`ve got 1 correct answer!" : "Tienes 1 respuesta correcta!",
      "TOTAL IQ" : "IQ TOTAL",
      "SCORE" : "PUNTUACIÓN",
    },
    4 : {
      "Play" : "Imir",
      "Continue" : "Leanúint",
      "Check" : "Seiceáil",
      "Quit" : "Fág",
      "Wrong!" : "Mícheart!",
      "Well done!" : "Maith thú!",
      "Do you want to end your learning session? If you quit, you`ll lose your progress." : "An bhfuil ort do sheisiún foghlama a chríochnú? Má éiríonn tú as, caillfidh tú do chuid dul chun cinn.",
      "Try again" : "Triail Arís",
      "Almost there!" : "Gan iomlán!",
      "Good job!" : "Obair maith!",
      "Fantastic!" : "Fantaisc!",
      "Almost perfect!" : "Gan iomlán!",
      "Perfect!" : "Perfect!",
      "You`ve got correct answers!" : "Tá freagra ceart agat!",
      "You`ve got 1 correct answer!" : "Tá 1 freagra ceart agat!",
      "TOTAL IQ" : "IQ IOMLÁN",
      "SCORE" : "SCÓR",
    },
    5 : {
      "Play" : "Jouer",
      "Continue" : "Continuer",
      "Check" : "Vérifier",
      "Quit" : "Quitter",
      "Wrong!" : "Faux!",
      "Well done!" : "Bien joué!",
      "Do you want to end your learning session? If you quit, you`ll lose your progress." : "Voulez-vous mettre fin à votre session d`apprentissage? Si vous abandonnez, vous perdrez votre progression.",
      "Try again" : "Réessayer",
      "Almost there!" : "Presque!",
      "Good job!" : "Bon travail!",
      "Fantastic!" : "Fantastique!",
      "Almost perfect!" : "Presque parfait!",
      "Perfect!" : "Parfait!",
      "You`ve got correct answers!" : "Vous avez des réponses correctes!",
      "You`ve got 1 correct answer!" : "Vous avez 1 bonne réponse!",
      "TOTAL IQ" : "IQ TOTAL",
      "SCORE" : "SCORE",
    }
 };

  _QuizpageState(
      {this.country,
      this.subject,
      required this.getDone,
      required this.setDone,
      this.continent});

  @override
  void initState() {
    super.initState();
    getData();
    _correct = AudioPlayer();
    _incorrect = AudioPlayer();
    _loadSound();
  }

  void _loadSound() async {
    _correct = AudioPlayer();
    _incorrect = AudioPlayer();
    await _correct.setAsset('assets/correct_sfx.mp3');
    await _incorrect.setAsset('assets/incorrect_sfx.mp3');
  }

  @override
  void dispose() {
    _correct.dispose();
    _incorrect.dispose();
    super.dispose();
  }

  Future<void> saveTrophiesAndIQ(trophies, iq) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt('trophies', trophies);
    pref.setInt('iq', iq);
  }

  Future<void> saveTrophyData(trophyList) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setStringList('trophyList', trophyList);
  }

  void getData() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    iq = pref.getInt('iq');
    //historianTrophy = pref.getInt('Historian');
    //geographerTrophy = pref.getInt('Geographer');
    if(pref.getInt('language')!=null){
      selectedLanguage = pref.getInt('language');
    }else{
      selectedLanguage = 1;
    }
    setState(() {});
  }

  getAnswer(int answer) {
    setState(() {
      givenAnswer = answer;
    });
  }

  void correct() {
    setState(() {
      sections.add(createSection(Colors.green));
    });
  }

  void wrong() {
    setState(() {
      sections.add(createSection(Colors.red));
    });
  }

  Map<String, Map<String, List<int>>> answersQuiz = {
    "France": {
      "Geography": [1, 2, 3, 4, 1, 2, 3, 4, 1, 2],
      "History": [4, 4, 4, 4, 4, 4, 4, 4, 4, 4]
    },
    "Germany": {
      "Geography": [1, 2, 3, 4, 1, 2, 3, 4, 1, 2],
      "History": [4, 4, 4, 4, 4, 4, 4, 4, 4, 4]
    },
    "Spain": {
      "Geography": [1, 2, 3, 4, 1, 2, 3, 4, 1, 2],
      "History": [4, 4, 4, 4, 4, 4, 4, 4, 4, 4]
    },
  };

  Map<String, Map<String, Map<String, String>>> countryQuiz = {
    "France": {
      "Geography": {
        "Lesson": "Lectie geografie Franta",
        "Question1": "Cati ani are Patrocle?",
        "Question2": "Ce mai face Patrocle?",
        "Question3": "Cati frati are Patrocle?",
        "Question4": "Iti place de Patrocle?",
        "Question5": "La ce instrument stie sa cante Patrocle?",
        "Question6": "Ce este Patrocle?",
        "Question7": "Cat de frumos e Patrocle?",
        "Question8": "Ce culoare are Patrocle?",
        "Question9": "Ce IQ are Patrocle?",
        "Question10": "Ce IQ NU are Patrocle?"
      },
      "History": {
        "Lesson": "Lectie istorie Franta",
        "Question1": "France1",
        "Question2": "France2",
        "Question3": "France3",
        "Question4": "France4",
        "Question5": "France5",
        "Question6": "France6",
        "Question7": "France7",
        "Question8": "France8",
        "Question9": "France9",
        "Question10": "France10"
      },
    },
    "Germany": {
      "Geography": {
        "Lesson": "Lectie geografie Germania",
        "Question1": "1",
        "Question2": "2",
        "Question3": "3",
        "Question4": "4",
        "Question5": "5",
        "Question6": "6",
        "Question7": "7",
        "Question8": "8",
        "Question9": "9",
        "Question10": "10"
      },
      "History": {
        "Lesson": "Lectie istorie Germania",
        "Question1": "Germany1",
        "Question2": "Germany2",
        "Question3": "Germany3",
        "Question4": "Germany4",
        "Question5": "Germany5",
        "Question6": "Germany6",
        "Question7": "Germany7",
        "Question8": "Germany8",
        "Question9": "Germany9",
        "Question10": "Germany10"
      },
    },
    "Spain": {
      "Geography": {
        "Lesson": "Lectie geografie Spania",
        "Question1": "1",
        "Question2": "2",
        "Question3": "3",
        "Question4": "4",
        "Question5": "5",
        "Question6": "6",
        "Question7": "7",
        "Question8": "8",
        "Question9": "9",
        "Question10": "10"
      },
      "History": {
        "Lesson":
            "Această lecție vă va purta prin momentele semnificative ale istoriei Spaniei, dezvăluind transformările și evenimentele cheie care au modelat această țară de-a lungul secolelor. Iberii au fost locuitorii indigeni ai Peninsulei Iberice înaintea veniri romane. Acești oameni erau cunoscuți pentru agricultura lor și abilitățile în comerț. Peninsula Iberică avea o geografie variată, cu munți, râuri și un climat variabil, ceea ce a favorizat dezvoltarea unor culturi distincte în diferite regiuni. Romanii au cucerit Peninsula Iberică începând din secolul III î.Hr. Acest proces a dus la o puternică influență asupra culturii, limbii și infrastructurii zonei. Romanizarea a adus cu ea limba latină, care a stat la baza limbii spaniole moderne. De asemenea, romanii au construit o rețea de drumuri și poduri care au facilitat comerțul și mișcarea trupelor. Romanizarea a provocat o serie de schimbări culturale în rândul populației iberice. Aceasta a dus la amestecul culturilor și la adoptarea elementelor romane în viața de zi cu zi. Religia romană a fost răspândită, iar arhitectura romană a fost folosită în construcții civile și militare. Literatura și arta romană au avut, de asemenea, un impact semnificativ asupra societății spaniole. În cele din urmă, Imperiul Roman a intrat într-o perioadă de declin, iar Peninsula Iberică nu a fost o excepție. Invaziile barbarilor, precum vandalii, vizigoții și suebii, au perturbat viața în regiune și au marcat sfârșitul dominației romane în Spania. Aceste evenimente au pregătit terenul pentru următoarele etape ale istoriei spaniole.",
        "Question1": "Spain1",
        "Question2": "Spain2",
        "Question3": "Spain3",
        "Question4": "Spain4",
        "Question5": "Spain5",
        "Question6": "Spain6",
        "Question7": "Spain7",
        "Question8": "Spain8",
        "Question9": "Spain9",
        "Question10": "Spain10",
      },
    },
  };

  List<Widget> sections = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: pageIndex != 11
          ? AppBar(
              backgroundColor: Theme.of(context).colorScheme.primary,
              leading: IconButton(
                  icon: const Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 29,
                  ),
                  onPressed: () {
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
                                      languageText[selectedLanguage]!["Do you want to end your learning session? If you quit, you`ll lose your progress."]! ??
                                      "Do you want to end your learning session? If you quit, you`ll lose your progress.",
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
                                        child: Center(
                                            child: Text(
                                               languageText[selectedLanguage]!["Continue"]! ??
                                              "Continue",
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
                                        child: Center(
                                            child: Text( languageText[selectedLanguage]!["Quit"]! ??
                                              "Quit",
                                                style: const TextStyle(
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
                  }),
              title: pageIndex == 0
                  ? Text(
                      country.toString(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 35),
                    )
                  : Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Row(
                            children: [
                              ...sections,
                              Expanded(
                                flex: 11 - pageIndex,
                                child: Container(
                                  height: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          )),
                    ),
              centerTitle: true,
              elevation: 0,
            )
          : null,
      body: PageTransitionSwitcher(
        duration: const Duration(seconds: 1),
        transitionBuilder: (child, animation, secondaryAnimation) =>
            SharedAxisTransition(
          animation: animation,
          secondaryAnimation: secondaryAnimation,
          transitionType: SharedAxisTransitionType.horizontal,
          fillColor: Theme.of(context).colorScheme.background,
          child: child,
        ),
        child: pageIndex == 0
            ? Lesson(lesson: countryQuiz["$country"]?["$subject"]?["Lesson"])
            : pageIndex == 1
                ? Test(
                    getAnswerFunction: getAnswer,
                    selected: 0,
                    questionText: countryQuiz["$country"]?["$subject"]
                        ?["Question1"],
                    answer1: "1",
                    answer2: "2",
                    answer3: "14",
                    answer4: "100",
                  )
                : pageIndex == 2
                    ? Test2(
                        getAnswerFunction: getAnswer,
                        selected: 0,
                        questionText: countryQuiz["$country"]?["$subject"]
                            ?["Question2"],
                        answer1: "Rau",
                        answer2: "Potrivit",
                        answer3: "Decent",
                        answer4: "Bine",
                      )
                    : pageIndex == 3
                        ? Test(
                            getAnswerFunction: getAnswer,
                            selected: 0,
                            questionText: countryQuiz["$country"]?["$subject"]
                                ?["Question3"],
                            answer1: "1",
                            answer2: "2",
                            answer3: "14",
                            answer4: "100",
                          )
                        : pageIndex == 4
                            ? Test2(
                                getAnswerFunction: getAnswer,
                                selected: 0,
                                questionText: countryQuiz["$country"]
                                    ?["$subject"]?["Question4"],
                                answer1: "Meh",
                                answer2: "Nu prea",
                                answer3: "Nu",
                                answer4: "Normal",
                              )
                            : pageIndex == 5
                                ? Test(
                                    getAnswerFunction: getAnswer,
                                    selected: 0,
                                    questionText: countryQuiz["$country"]
                                        ?["$subject"]?["Question5"],
                                    answer1: "Flexaton",
                                    answer2: "Chitara",
                                    answer3: "Flaut",
                                    answer4: "Pian",
                                  )
                                : pageIndex == 6
                                    ? Test2(
                                        getAnswerFunction: getAnswer,
                                        selected: 0,
                                        questionText: countryQuiz["$country"]
                                            ?["$subject"]?["Question6"],
                                        answer1: "Veverita",
                                        answer2: "Caine",
                                        answer3: "Pinguin",
                                        answer4: "Girafa",
                                      )
                                    : pageIndex == 7
                                        ? Test(
                                            getAnswerFunction: getAnswer,
                                            selected: 0,
                                            questionText:
                                                countryQuiz["$country"]
                                                    ?["$subject"]?["Question7"],
                                            answer1: "1/10",
                                            answer2: "7/10",
                                            answer3: "10/10",
                                            answer4: "4/10",
                                          )
                                        : pageIndex == 8
                                            ? Test2(
                                                getAnswerFunction: getAnswer,
                                                selected: 0,
                                                questionText:
                                                    countryQuiz["$country"]
                                                            ?["$subject"]
                                                        ?["Question8"],
                                                answer1: "Rosu",
                                                answer2: "Verde",
                                                answer3: "Alb",
                                                answer4: "NEGRU",
                                              )
                                            : pageIndex == 9
                                                ? Test(
                                                    getAnswerFunction:
                                                        getAnswer,
                                                    selected: 0,
                                                    questionText:
                                                        countryQuiz["$country"]
                                                                ?["$subject"]
                                                            ?["Question9"],
                                                    answer1: "1",
                                                    answer2: "385",
                                                    answer3: "2",
                                                    answer4: "100",
                                                  )
                                                : pageIndex == 10
                                                    ? Test2(
                                                        getAnswerFunction:
                                                            getAnswer,
                                                        selected: 0,
                                                        questionText: countryQuiz[
                                                                    "$country"]
                                                                ?["$subject"]
                                                            ?["Question10"],
                                                        answer1: "1",
                                                        answer2: "385",
                                                        answer3: "2",
                                                        answer4: "100",
                                                      )
                                                    : FinishPage(
                                                        correctAnswers:
                                                            correctAnswers,
                                                            languageText: languageText,
                                                            selectedLanguage: selectedLanguage,),
      ),
      bottomNavigationBar: SizedBox(
        height: 100,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          child: Column(
            children: [
              Divider(
                color: Theme.of(context).colorScheme.primary,
                thickness: 3,
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 58,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  child: ElevatedButton(
                    onPressed: () async {
                      if (givenAnswer != 0 && pageIndex != 11) {
                        if (pageIndex > 0 && pageIndex < 11) {
                          if (answersQuiz[country]?[subject]?[pageIndex - 1] ==
                              givenAnswer) {
                            correct();
                            correctAnswers++;
                            showModalBottomSheet(
                              backgroundColor: Colors.transparent,
                              context: context,
                              isScrollControlled: true,
                              isDismissible: false,
                              enableDrag: false, // Disable dragging
                              builder: (BuildContext context) {
                                return GestureDetector(
                                  onTap: () {
                                    // Do nothing on tap outside
                                  },
                                  child: Container(
                                    height: 170,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background,
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(25),
                                        topRight: Radius.circular(25),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 17),
                                      child: SingleChildScrollView(
                                        physics: const BouncingScrollPhysics(),
                                        child: Column(
                                          children: [
                                            const SizedBox(height: 15),
                                            Row(
                                              children: [
                                                Image.asset('assets/Correct.png', height: 30,),
                                                const SizedBox(width: 15),
                                                 Text(
                                                  languageText[selectedLanguage]!["Well done!"]! ??
                                                  "Well done!",
                                                  style: const TextStyle(
                                                    color: Colors.green,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 30,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 20),
                                            SizedBox(
                                              height: 58,
                                              width: double.infinity,
                                              child: ClipRRect(
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(15)),
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                    setState(() {
                                                      if (pageIndex < 11) {
                                                        pageIndex++;
                                                        givenAnswer = 0;
                                                      }
                                                    });
                                                  },
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        Colors.green,
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      languageText[selectedLanguage]!["Continue"]! ??
                                                      "Continue",
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 30,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                            await _correct.seek(Duration.zero);
                            await _correct.play();
                          } else {
                            wrong();
                            showModalBottomSheet(
                              backgroundColor: Colors.transparent,
                              context: context,
                              isScrollControlled: true,
                              isDismissible: false,
                              enableDrag: false, // Disable dragging
                              builder: (BuildContext context) {
                                return GestureDetector(
                                  onTap: () {
                                    // Do nothing on tap outside
                                  },
                                  child: Container(
                                    height: 170,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background,
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(25),
                                        topRight: Radius.circular(25),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 17),
                                      child: SingleChildScrollView(
                                        physics: const BouncingScrollPhysics(),
                                        child: Column(
                                          children: [
                                            const SizedBox(height: 15),
                                            Row(
                                              children: [
                                                Image.asset('assets/Wrong.png', height: 30,),
                                                const SizedBox(width: 15),
                                                 Text(
                                                  languageText[selectedLanguage]!["Wrong!"]! ??
                                                  "Wrong!",
                                                  style: const TextStyle(
                                                    color: Colors.red,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 30,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 20),
                                            SizedBox(
                                              height: 58,
                                              width: double.infinity,
                                              child: ClipRRect(
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(15)),
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                    setState(() {
                                                      if (pageIndex < 11) {
                                                        pageIndex++;
                                                        givenAnswer = 0;
                                                      }
                                                    });
                                                  },
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        Colors.red,
                                                  ),
                                                  child:  Center(
                                                    child: Text(
                                                      languageText[selectedLanguage]!["Continue"]! ??
                                                      "Continue",
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 30,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                            await _incorrect.seek(Duration.zero);
                            await _incorrect.play();
                          }
                        }
                        setState(() {
                          if (pageIndex < 1) {
                            pageIndex++;
                            givenAnswer = 0;
                          }
                        });
                      } else if (pageIndex == 11) {
                        Navigator.pop(context);
                        saveTrophiesAndIQ(trophies, iq! + correctAnswers * 10);
                        if (subject == "Geography" && correctAnswers >= 5) {
                          getDone(true, false);
                          setDone(continent, country, "geoDone", true);
                        }
                        if (subject == "History" && correctAnswers >= 5) {
                          getDone(false, true);
                          setDone(continent, country, "geoDone", true);
                        }
                        if (subject == "Geography" && correctAnswers == 10) {
                          trophyList.add("Geographer");
                          print("added");
                        }
                        if (subject == "History" && correctAnswers == 10) {
                          trophyList.add("Historian");
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: givenAnswer == 0 && pageIndex != 11
                          ? const Color.fromARGB(255, 59, 59, 73)
                          : const Color.fromARGB(255, 102, 102, 255),
                    ),
                    child: Text(
                        pageIndex == 0 || pageIndex == 11
                            ? languageText[selectedLanguage]!["Continue"]! ??
                                "Continue"

                            : languageText[selectedLanguage]!["Check"]! ??
                                "Check",

                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 35)),
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

class FinishPage extends StatelessWidget {
  Map<int, Map<String, String>> languageText;
  FinishPage({
    super.key,
    required this.correctAnswers,
    required this.languageText,
    required this.selectedLanguage,
  });

  final int correctAnswers;
  int? selectedLanguage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17),
        child: Column(children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.07,
          ),
          SizedBox(
              height: 220,
              child: Lottie.network(
                  'https://lottie.host/491f2840-4c44-425a-924e-4fbc86237dfc/s8x6EccXsD.json',
                  frameRate: FrameRate.max,
                  fit: BoxFit.contain)),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.06,
          ),
          correctAnswers == 0 || correctAnswers == 1 || correctAnswers == 2
              ? Text(
                  languageText[selectedLanguage]!["Try again"]! ??
                  "Try again",
                  style: const TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.w900,
                    color: Color.fromARGB(255, 219, 64, 64),
                  ),
                )
              : correctAnswers == 3 || correctAnswers == 4
                  ? Text(
                     languageText[selectedLanguage]!["Almost there!"]! ??
                      "Almost there!",
                      style: const TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.w900,
                        color: Color.fromARGB(255, 219, 121, 64),
                      ),
                    )
                  : correctAnswers == 5 || correctAnswers == 6
                      ?  Text(
                         languageText[selectedLanguage]!["Good job!"]! ??
                          "Good job!",
                          style: const TextStyle(
                            fontSize: 45,
                            fontWeight: FontWeight.w900,
                            color: Color.fromARGB(255, 216, 219, 64),
                          ),
                        )
                      : correctAnswers == 7 || correctAnswers == 8
                          ?  Text(
                             languageText[selectedLanguage]!["Fantastic!"]! ??
                              "Fantastic!",
                              style: const TextStyle(
                                fontSize: 45,
                                fontWeight: FontWeight.w900,
                                color: Color.fromARGB(255, 196, 219, 64),
                              ),
                            )
                          : correctAnswers == 9
                              ? Text(
                                  languageText[selectedLanguage]!["Almost perfect!"]! ??
                                  "Almost perfect!",
                                  style: const TextStyle(
                                    fontSize: 45,
                                    fontWeight: FontWeight.w900,
                                    color: Color.fromARGB(255, 131, 219, 64),
                                  ),
                                )
                              :  Text(
                                  languageText[selectedLanguage]!["Perfect!"]! ??
                                  "Perfect!",
                                  style: const TextStyle(
                                    fontSize: 45,
                                    fontWeight: FontWeight.w900,
                                    color: Color.fromARGB(255, 77, 219, 64),
                                  ),
                                ),
          const SizedBox(
            height: 10,
          ),
          Text(
            correctAnswers != 1
                ? "You`ve got $correctAnswers correct answers!"
                : "You`ve got 1 correct answer!",
            style: TextStyle(fontSize: 23),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.07,
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: SizedBox(
                  height: 100,
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 8.3, 0),
                    //padding: const EdgeInsets.all(2.8),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: Color.fromARGB(255, 102, 102, 255),
                    ),
                    child: Center(
                      child: Column(
                        children: [
                           const SizedBox(
                            height: 4,
                          ),
                          Text(
                            languageText[selectedLanguage]!["TOTAL IQ"]! ??
                            "TOTAL IQ",
                              style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.background,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 17)),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                                height: 68,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(15)),
                                  color:
                                      Theme.of(context).colorScheme.background,
                                ),
                                child: Center(
                                    child: Text(
                                  "+${correctAnswers * 10} IQ",
                                  style: const TextStyle(
                                      color: Color.fromARGB(255, 102, 102, 255),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 27),
                                ))),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: SizedBox(
                  height: 100,
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(8.3, 0, 0, 0),
                    //padding: const EdgeInsets.all(2.8),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      color: correctAnswers == 0 ||
                              correctAnswers == 1 ||
                              correctAnswers == 2
                          ? const Color.fromARGB(255, 219, 64, 64)
                          : correctAnswers == 3 || correctAnswers == 4
                              ? const Color.fromARGB(255, 219, 121, 64)
                              : correctAnswers == 5 || correctAnswers == 6
                                  ? const Color.fromARGB(255, 216, 219, 64)
                                  : correctAnswers == 7 || correctAnswers == 8
                                      ? const Color.fromARGB(255, 196, 219, 64)
                                      : correctAnswers == 9
                                          ? const Color.fromARGB(
                                              255, 131, 219, 64)
                                          : const Color.fromARGB(
                                              255, 77, 219, 64),
                    ),
                    child: Center(
                      child: Column(
                        children: [
                           const SizedBox(
                            height: 4,
                          ),
                          Text( languageText[selectedLanguage]!["SCORE"]! ??
                            "SCORE",
                              style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.background,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 17)),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                                height: 68,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(15)),
                                  color:
                                      Theme.of(context).colorScheme.background,
                                ),
                                child: Center(
                                    child: Text(
                                  "$correctAnswers/10",
                                  style: TextStyle(
                                      color: correctAnswers == 0 ||
                                              correctAnswers == 1 ||
                                              correctAnswers == 2
                                          ? const Color.fromARGB(
                                              255, 219, 64, 64)
                                          : correctAnswers == 3 ||
                                                  correctAnswers == 4
                                              ? const Color.fromARGB(
                                                  255, 219, 121, 64)
                                              : correctAnswers == 5 ||
                                                      correctAnswers == 6
                                                  ? const Color.fromARGB(
                                                      255, 216, 219, 64)
                                                  : correctAnswers == 7 ||
                                                          correctAnswers == 8
                                                      ? const Color.fromARGB(
                                                          255, 196, 219, 64)
                                                      : correctAnswers == 9
                                                          ? const Color
                                                                  .fromARGB(
                                                              255, 131, 219, 64)
                                                          : const Color
                                                                  .fromARGB(
                                                              255, 77, 219, 64),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 27),
                                ))),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}

Widget createSection(Color color) {
  return Expanded(
    flex: 1,
    child: Container(
      height: 20,
      color: color,
    ),
  );
}
