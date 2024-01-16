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
    if(pref.getInt('iq')!=null){
      iq = pref.getInt('iq');
    }else{
      iq=0;
    }
    if(pref.getInt('trophies')!=null){
    trophies = pref.getInt('trophies');
    }else{
      trophies = 0;
    }
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
    "Greece": {
      "Geography": [2,2,1,4,2,4,4,1,4,4],
      "History": [3,4,2,3,1,2,2,3,3,3]
    },
  };

  Map<String, Map<String, Map<String, String>>> allAnswersQuiz = {
    "Greece": {
      "Geography": {
        "Answer11": "Deșerturi extinse",
        "Answer12": "Munți înalți, cum ar fi Pindus",
        "Answer13": "Câmpii întinse",
        "Answer14": "Stepă bogată în resurse",
        "Answer21": "Marea Adriatică",
        "Answer22": "Marea Egee",
        "Answer23": "Marea Neagră",
        "Answer24": "Marea Caspică",
        "Answer31": "Creta",
        "Answer32": "Santorini",
        "Answer33": "Rodos",
        "Answer34": "Corfu",
        "Answer41": "În Cipru",
        "Answer42": "În Grecia continentală",
        "Answer43": "Pe insula Creta",
        "Answer44": "În nordul Greciei",
        "Answer51": "Salonic",
        "Answer52": "Atena",
        "Answer53": "Corint",
        "Answer54": "Delphi",
        "Answer61": "Tisa",
        "Answer62": "Danubiu",
        "Answer63": "Pindus",
        "Answer64": "Ahaia",
        "Answer71": "Golful Patras",
        "Answer72": "Golful Corint",
        "Answer73": "Golful Salonic",
        "Answer74": "Golful Corintului",
        "Answer81": "Rodos ",
        "Answer82": "Creta",
        "Answer83": "Santorini",
        "Answer84": "Mykonos",
        "Answer91": "Păduri întinse",
        "Answer92": "Delta râului",
        "Answer93": "Insule izolate",
        "Answer94": "Mări accesibile",
        "Answer101": "În insula Creta",
        "Answer102": "Pe malurile râului Acheron",
        "Answer103": "În Munții Pindus",
        "Answer104": "În regiunea centrală a Greciei",
      },
      "History": {
        "Answer11": "Secolul al IV-lea î.Hr.",
        "Answer12": "Secolul al III-lea î.Hr.",
        "Answer13": "Secolul al V-lea î.Hr.",
        "Answer14": "Secolul al II-lea î.Hr.",
        "Answer21": "Poseidon",
        "Answer22": "Ares",
        "Answer23": "Hades",
        "Answer24": "Zeus",
        "Answer31": "În anul 500 î.Hr.",
        "Answer32": "În anul 776 î.Hr.",
        "Answer33": "În anul 300 î.Hr.",
        "Answer34": "În anul 1000 î.Hr.",
        "Answer41": "Aristotel",
        "Answer42": "Platon",
        "Answer43": "Socrate ",
        "Answer44": "Herodot",
        "Answer51": "Anul 490 î.Hr.",
        "Answer52": "Anul 300 î.Hr.",
        "Answer53": "Anul 200 î.Hr.",
        "Answer54": "Anul 100 î.Hr.",
        "Answer61": "Socrate",
        "Answer62": "Alexandru cel Mare",
        "Answer63": "Pericle",
        "Answer64": "Leonidas",
        "Answer71": "Atena",
        "Answer72": "Olimpia",
        "Answer73": "Delphi",
        "Answer74": "Sparta",
        "Answer81": "Secolul al VI-lea î.Hr.",
        "Answer82": "Secolul al V-lea î.Hr.",
        "Answer83": "Secolul al IV-lea î.Hr. ",
        "Answer84": "Secolul al III-lea î.Hr.",
        "Answer91": "Hera",
        "Answer92": "Demeter",
        "Answer93": "Atena",
        "Answer94": "Artemis",
        "Answer101": "Egiptul",
        "Answer102": "Imperiul Roman",
        "Answer103": "Persia",
        "Answer104": "Babilonul",
      },
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
    "Greece": {
      "Geography": {
        "Lesson": '''
        În inima Mării Mediterane și Mării Egee, Grecia dezvăluia un peisaj desprins din mituri, în care munții înalți, văile adânci și insulele fermecătoare se contopeau într-un tablou geografic de o frumusețe rară. Între aceste meleaguri, Muntele Olimp, cu vârfurile sale mărețe, se înălța ca un tron al zeilor, veghind asupra întregii țări.

        La nord, Munții Pindus se întindeau ca o spina dorsală, oferind nu doar priveliști spectaculoase, ci și văi fertile unde râurile curgeau cu o adiere de fertilitate. Aceste văi erau adesea locul de naștere al unor orașe-stat puternice, unde comunitățile grecilor antici prosperau datorită resurselor naturale generoase.

        Pe coasta de sud, Marea Mediterană își dezvăluia apele sale senine, îmbrățișând cu afecțiune orașele-port precum Atena și Corint. Erau puncte de întâlnire a comerțului, culturii și istoriei, plasate strategic pentru a facilita interacțiunile cu alte civilizații antice.

        Și totuși, adevărata magie a Greciei se desfășura pe marea Egee, unde insulele păreau să plutească ca petalele unei flori pe apele albastre. Creta, insula legendară asociată cu mitul Minotaurului, se ridica cu mândrie din Marea Egee, amintind oamenilor de legătura lor cu mitologia și istoria bogată.

        La sud-est, Delos și Rhodos erau perle în coroana Greciei, fiecare cu povestea sa unică. Rhodos, cunoscută pentru Colosul său, strălucea sub soarele generos, iar Delos, insula sacrală, găzduia templul lui Apollo și oracolul care atrăgea călători din toate colțurile lumii antice.

        Între aceste frumuseți geografice, Grecia nu era doar o țară, ci un teatru magic în care se desfășurau legende și descoperiri. Fiecare colțișor al ei păstra o bucată din istoria sa, contribuind la fascinanta ei moștenire culturală. ''',
        "Question1": "Care este principala caracteristică geografică a Greciei care a influențat dezvoltarea sa?",
        "Question2": "Care dintre aceste mări înconjoară Grecia la sud?",
        "Question3": "Care insulă grecească este asociată cu legenda Minotaurului?",
        "Question4": "Unde se află Muntele Olimp, considerat reședința zeilor în mitologia greacă?",
        "Question5": "Care oraș-port este cunoscut pentru Partenonul său și pentru fiind centrul istoric și cultural al Greciei antice?",
        "Question6": "Ce râu celebru curge prin văile fertile ale Greciei?",
        "Question7": "În ce golful grecesc se afla orașul-port Corint?",
        "Question8": "Care insulă grecească este recunoscută pentru Colosul său?",
        "Question9": "Ce caracteristică naturală a contribuit la apariția unor orașe-state puternice în Grecia antică?",
        "Question10": "Unde se afla orașul antic Delphi, cunoscut pentru oracolul său?"
      },
      "History": {
        "Lesson": '''
        Cu mult timp în urmă, în anii 2000 î.Hr., o țară frumoasă numită Grecia strălucea sub privirea zeilor Olimpului. Zeus, regele cerului, domnea peste această lume plină de mituri și legendele înfiorătoare ale titanilor.
        
        În orașul Atena, în anii 400 î.Hr., s-a înălțat un templu măreț numit Partenonul, dedicat zeiței înțelepciunii, Atena. Legenda spunea că Atena îi învățase pe oameni să planteze semințele și să-și clădească casele, oferindu-le darul înțelepciunii.
        
        În aceste vremuri, în jurul anilor 400-300 î.Hr., marii filozofi precum Socrate, Platon și Aristotel călătoreau pe meleagurile Greciei, împărtășind înțelepciunea lor prin dialoguri și scrieri care au rezistat timpului.
        
        La fiecare patru ani, în anii 776 î.Hr., grecii se adunau la Olimpia pentru Jocurile Olimpice, un festival dedicat zeilor. Aici, atleții se întreceau în diverse discipline, etalându-și abilitățile în numele divinităților.
        
        În anii 490 î.Hr., Grecia a fost amenințată de marele Imperiu Persan. În Bătălia de la Maraton, grecii au arătat curaj și hotărâre, obținând o victorie neașteptată și marcând astfel un moment de glorie în istoria lor.
        
        Cu trecerea timpului, în anii 300 î.Hr., Grecia a intrat în perioada elenistică, sub influența lui Alexandru cel Mare. Călătorind peste hotare, cultura și cunoștințele grecilor s-au răspândit pe întreg mapamondul.
        
        Astfel, Grecia a fost martora unei istorii bogate, cuprinzând epoci clasice, filozofie înțeleaptă și momente de eroism înfruntate cu curaj. O istorie care a modelat lumea antichității și care continuă să inspire și astăzi.''',
        "Question1": "În ce secol a fost construit Partenonul din Atena?",
        "Question2": "Cine a fost regele zeilor în mitologia greacă?",
        "Question3": "Când au avut loc primele Jocuri Olimpice în Grecia antică?",
        "Question4": "Care filozof grec este cunoscut pentru metoda sa de a pune întrebări pentru a stimula gândirea critică?",
        "Question5": "În ce an a avut loc Bătălia de la Maraton, unde grecii au obținut o victorie notabilă?",
        "Question6": "Cine a fost cunoscut ca cel Mare și a influențat perioada elenistică a Greciei?",
        "Question7": "Unde se desfășurau Jocurile Olimpice în Grecia antică?",
        "Question8": "În ce secol a trăit filozoful Aristotel?",
        "Question9": "Cine a fost zeița înțelepciunii în mitologia greacă, căreia i-a fost dedicat Partenonul?",
        "Question10": "Cine a fost adversarul Greciei în timpul Războaielor Persane?"
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
                    answer1: allAnswersQuiz[country]?[subject]?["Answer11"],
                    answer2: allAnswersQuiz[country]?[subject]?["Answer12"],
                    answer3: allAnswersQuiz[country]?[subject]?["Answer13"],
                    answer4: allAnswersQuiz[country]?[subject]?["Answer14"],
                  )
                : pageIndex == 2
                    ? Test2(
                        getAnswerFunction: getAnswer,
                        selected: 0,
                        questionText: countryQuiz["$country"]?["$subject"]
                            ?["Question2"],
                        answer1: allAnswersQuiz[country]?[subject]?["Answer21"],
                        answer2: allAnswersQuiz[country]?[subject]?["Answer22"],
                        answer3: allAnswersQuiz[country]?[subject]?["Answer23"],
                        answer4: allAnswersQuiz[country]?[subject]?["Answer24"],
                      )
                    : pageIndex == 3
                        ? Test(
                            getAnswerFunction: getAnswer,
                            selected: 0,
                            questionText: countryQuiz["$country"]?["$subject"]
                                ?["Question3"],
                            answer1: allAnswersQuiz[country]?[subject]?["Answer31"],
                            answer2: allAnswersQuiz[country]?[subject]?["Answer32"],
                            answer3: allAnswersQuiz[country]?[subject]?["Answer33"],
                            answer4: allAnswersQuiz[country]?[subject]?["Answer34"],
                          )
                        : pageIndex == 4
                            ? Test2(
                                getAnswerFunction: getAnswer,
                                selected: 0,
                                questionText: countryQuiz["$country"]
                                    ?["$subject"]?["Question4"],
                                answer1: allAnswersQuiz[country]?[subject]?["Answer41"],
                                answer2: allAnswersQuiz[country]?[subject]?["Answer42"],
                                answer3: allAnswersQuiz[country]?[subject]?["Answer43"],
                                answer4: allAnswersQuiz[country]?[subject]?["Answer44"],
                              )
                            : pageIndex == 5
                                ? Test(
                                    getAnswerFunction: getAnswer,
                                    selected: 0,
                                    questionText: countryQuiz["$country"]
                                        ?["$subject"]?["Question5"],
                                    answer1: allAnswersQuiz[country]?[subject]?["Answer51"],
                                    answer2: allAnswersQuiz[country]?[subject]?["Answer52"],
                                    answer3: allAnswersQuiz[country]?[subject]?["Answer53"],
                                    answer4: allAnswersQuiz[country]?[subject]?["Answer54"],
                                  )
                                : pageIndex == 6
                                    ? Test2(
                                        getAnswerFunction: getAnswer,
                                        selected: 0,
                                        questionText: countryQuiz["$country"]
                                            ?["$subject"]?["Question6"],
                                        answer1: allAnswersQuiz[country]?[subject]?["Answer61"],
                                        answer2: allAnswersQuiz[country]?[subject]?["Answer62"],
                                        answer3: allAnswersQuiz[country]?[subject]?["Answer63"],
                                        answer4: allAnswersQuiz[country]?[subject]?["Answer64"],
                                      )
                                    : pageIndex == 7
                                        ? Test(
                                            getAnswerFunction: getAnswer,
                                            selected: 0,
                                            questionText:
                                                countryQuiz["$country"]
                                                    ?["$subject"]?["Question7"],
                                            answer1: allAnswersQuiz[country]?[subject]?["Answer71"],
                                            answer2: allAnswersQuiz[country]?[subject]?["Answer72"],
                                            answer3: allAnswersQuiz[country]?[subject]?["Answer73"],
                                            answer4: allAnswersQuiz[country]?[subject]?["Answer74"],
                                          )
                                        : pageIndex == 8
                                            ? Test2(
                                                getAnswerFunction: getAnswer,
                                                selected: 0,
                                                questionText:
                                                    countryQuiz["$country"]
                                                            ?["$subject"]
                                                        ?["Question8"],
                                                answer1: allAnswersQuiz[country]?[subject]?["Answer81"],
                                                answer2: allAnswersQuiz[country]?[subject]?["Answer82"],
                                                answer3: allAnswersQuiz[country]?[subject]?["Answer83"],
                                                answer4: allAnswersQuiz[country]?[subject]?["Answer84"],
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
                                                    answer1: allAnswersQuiz[country]?[subject]?["Answer91"],
                                                    answer2: allAnswersQuiz[country]?[subject]?["Answer92"],
                                                    answer3: allAnswersQuiz[country]?[subject]?["Answer93"],
                                                    answer4: allAnswersQuiz[country]?[subject]?["Answer94"],
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
                                                        answer1: allAnswersQuiz[country]?[subject]?["Answer101"],
                                                        answer2: allAnswersQuiz[country]?[subject]?["Answer102"],
                                                        answer3: allAnswersQuiz[country]?[subject]?["Answer103"],
                                                        answer4: allAnswersQuiz[country]?[subject]?["Answer104"],
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
