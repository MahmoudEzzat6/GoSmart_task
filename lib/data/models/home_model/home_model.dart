class LessonModel {
  List<Lesson>? lessons;

  LessonModel({this.lessons});

  factory LessonModel.fromJson(Map<String, dynamic> json) {
    return LessonModel(
      lessons: (json["lessons"] as List?)
          ?.map((lesson) => Lesson.fromJson(lesson))
          .toList(),
    );
  }
}
class Lesson {
  String? name;
  String? description;
  double? classDuration;
  double? numOfClasses;
  String? clubName;
  String? lessontype;

  Lesson({
    this.name,
    this.description,
    this.classDuration,
    this.numOfClasses,
    this.clubName,
    this.lessontype,
  });

  factory Lesson.fromJson(Map<String, dynamic> json) => Lesson(
    name: json["name"] as String?,
    description: json["description"] as String? ?? "Not Avliable",
    classDuration: (json["class_duration"] as num?)?.toDouble(),
    numOfClasses: json["num_of_classes"] ,
    clubName: json["club_name"] as String?,
    lessontype: json["lessontype"] as String?,
  );
}
