final String tableNotes = 'notes';

class NoteFields {
  static final String id = '_id';
  static final String country = 'country';
  static final String subject = 'subject';
  static final String lesson = 'lesson';
  static final String questions = 'questions';
  static final String answers = 'answers';
  static final String correctAnswers = 'correctAnswers';
}

class Note {
  final int? id;
  final String country;
  final String subject;
  final String lesson;
  final List<String> questions;
  final List<int> answers;
  final List<String> correctAnswers;

  const Note({
    this.id,
    required this.country,
    required this.subject,
    required this.lesson,
    required this.questions,
    required this.answers,
    required this.correctAnswers,
  });

  Note copy({
    int? id,
    String? country,
    String? subject,
    String? lesson,
    List<String>? questions,
    List<int>? answers,
    List<String>? correctAnswers,
  }) => Note(
          id: id ?? this.id,
          country: country ?? this.country,
          subject: subject ?? this.subject,
          lesson: lesson ?? this.lesson,
          questions: questions ?? this.questions,
          answers: answers ?? this.answers,
          correctAnswers: correctAnswers ?? this.correctAnswers,
        );


  Map<String, Object?> toJson() => {
    NoteFields.id: id,
    NoteFields.country: country,
    NoteFields.subject: subject,
    NoteFields.lesson: lesson,
    NoteFields.questions: questions,
    NoteFields.answers: answers,
    NoteFields.correctAnswers: correctAnswers,
  };
}