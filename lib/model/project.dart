


class Project{
    Project({
    required this.id,
    required this.description,
    this.doctor,
    required this.languages,
    required this.objectives,
    required this.others,
    this.progress,
    required this.status,
    this.students,
    required this.title,
    required this.tools,
    required this.year,
  });

  String id ;
  String description;
  Map<String, dynamic>? doctor;
  List<String> languages;
  String objectives;
  List<String> others;
  Progress? progress;
  int status;
  List<Map<String, dynamic>>? students;
  String title;
  List<String> tools;
  String year;

  factory Project.fromJson(Map<String, dynamic> json,String id) => Project(
    description: json["description"],
    languages: List<String>.from(json["languages"].map((x) => x)),
    objectives: json["objectives"],
    others: List<String>.from(json["others"].map((x) => x)),
    progress: Progress.fromJson(json["progress"]),
    status: json["status"],
    students: List<Map<String,dynamic>>.from(json["students"].map((x) => x)),
    title: json["title"],
    tools: List<String>.from(json["tools"].map((x) => x)),
    year: json["year"],
    id:id,
  );
}

class Progress {
  Progress({
    required this.chapters,
    this.fileWord,
    required this.mainPercent,
    this.powerPoint,
  });

  List<Chapter> chapters;
  String? fileWord;
  int mainPercent;
  String? powerPoint;
  factory Progress.fromJson(Map<String, dynamic> json) => Progress(
    chapters: List<Chapter>.from(json["chapters"].map((x) => Chapter.fromJson(x))),
    fileWord: json["file_word"],
    mainPercent: json["main_percent"],
    powerPoint: json["power_point"],
  );

}

class Chapter {
  Chapter({
    required this.contextDiagram,
    required this.inputsOutputs,
    required this.introduction,
    required this.objectives,
    required this.percent,
    required this.problemStatement,
    required this.tools,
    required this.users,
    required this.analysis,
    required this.literatureReview,
    required this.databaseDesign,
    required this.interfaceDesign,
    required this.implementation,
    required this.matrixWorkingProcess,
    required this.testing,
    required this.conclusion,
    required this.futureWork,
  });

  int percent;
  Topic contextDiagram;
  Topic inputsOutputs;
  Topic introduction;
  Topic objectives;
  Topic problemStatement;
  Topic tools;
  Topic users;
  Topic analysis;
  Topic literatureReview;
  Topic databaseDesign;
  Topic interfaceDesign;
  Topic implementation;
  Topic matrixWorkingProcess;
  Topic testing;
  Topic conclusion;
  Topic futureWork;
  factory Chapter.fromJson(Map<String, dynamic> json) => Chapter(
    contextDiagram: Topic.fromJson(json["context_diagram"]),
    inputsOutputs: Topic.fromJson(json["inputs_outputs"]),
    introduction: Topic.fromJson(json["introduction"]),
    objectives: Topic.fromJson(json["objectives"]),
    percent: json["percent"],
    problemStatement: Topic.fromJson(json["problem_statement"]),
    tools: Topic.fromJson(json["tools"]),
    users: Topic.fromJson(json["users"]),
    analysis: Topic.fromJson(json["analysis"]),
    literatureReview:Topic.fromJson(json["literature_review"]),
    databaseDesign: Topic.fromJson(json["database_design"]),
    interfaceDesign:Topic.fromJson(json["interface_design"]),
    implementation:Topic.fromJson(json["implementation"]),
    matrixWorkingProcess: Topic.fromJson(json["matrix_working_process"]),
    testing: Topic.fromJson(json["testing"]),
    conclusion:Topic.fromJson(json["conclusion"]),
    futureWork: Topic.fromJson(json["future_work"]),
  );

}



 class Topic {
   Topic({
     required this.chat,
     required this.lastUpdate,
     required this.link,
   });

   List<Map<String, dynamic>> chat;
   DateTime lastUpdate;
   String link;
   factory Topic.fromJson(Map<String, dynamic> json) => Topic(
    chat: List<Map<String, dynamic>>.from(json["chat"].map((x) => x)),
    lastUpdate: DateTime.parse(json["last_update"]),
    link: json["link"],
  );

 }



// // To parse this JSON data, do
// //
// //     final project = projectFromJson(jsonString);
//
// import 'dart:convert';
//
// Project projectFromJson(String str) => Project.fromJson(json.decode(str));
//
// String projectToJson(Project data) => json.encode(data.toJson());
//
// class Project {
//   Project({
//     required this.id,
//     required this.description,
//     this.doctor,
//     required this.languages,
//     required this.objectives,
//     required this.others,
//     this.progress,
//     required this.status,
//     this.students,
//     required this.title,
//     required this.tools,
//     required this.year,
//   });
//
//   String id ;
//   String description;
//   Doctor? doctor;
//   List<String> languages;
//   String objectives;
//   List<String> others;
//   Progress? progress;
//   int status;
//   List<Doctor>? students;
//   String title;
//   List<String> tools;
//   String year;
//
//   factory Project.fromJson(Map<String, dynamic> json,String id) => Project(
//     description: json["description"],
//     doctor: Doctor.fromJson(json["doctor"]),
//     languages: List<String>.from(json["languages"].map((x) => x)),
//     objectives: json["objectives"],
//     others: List<String>.from(json["others"].map((x) => x)),
//     progress: Progress.fromJson(json["progress"]),
//     status: json["status"],
//     students: List<Doctor>.from(json["students"].map((x) => Doctor.fromJson(x))),
//     title: json["title"],
//     tools: List<String>.from(json["tools"].map((x) => x)),
//     year: json["year"],
//     id:id,
//   );
//
//   Map<String, dynamic> toJson() => {
//     "description": description,
//     "doctor": doctor?.toJson(),
//     "languages": List<dynamic>.from(languages.map((x) => x)),
//     "objectives": objectives,
//     "others": List<dynamic>.from(others.map((x) => x)),
//     "progress": progress?.toJson(),
//     "status": status,
//     "students": students !=null?List<dynamic>.from(students!.map((x) => x.toJson())):null,
//     "title": title,
//     "tools": List<dynamic>.from(tools.map((x) => x)),
//     "year": year,
//   };
// }
//
// class Doctor {
//   Doctor({
//     required this.id,
//     required this.name,
//   });
//
//   String id;
//   String name;
//
//   factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
//     id: json["id"],
//     name: json["name"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "name": name,
//   };
// }
//
// class Progress {
//   Progress({
//     required this.chapters,
//      this.fileWord,
//     required this.mainPercent,
//      this.powerPoint,
//   });
//
//   List<Chapter> chapters;
//   String? fileWord;
//   int mainPercent;
//   String? powerPoint;
//
//   factory Progress.fromJson(Map<String, dynamic> json) => Progress(
//     chapters: List<Chapter>.from(json["chapters"].map((x) => Chapter.fromJson(x))),
//     fileWord: json["file_word"],
//     mainPercent: json["main_percent"],
//     powerPoint: json["power_point"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "chapters": List<dynamic>.from(chapters.map((x) => x.toJson())),
//     "file_word": fileWord,
//     "main_percent": mainPercent,
//     "power_point": powerPoint,
//   };
// }
//
// class Chapter {
//   Chapter({
//     this.contextDiagram,
//     this.inputsOutputs,
//     this.introduction,
//     this.objectives,
//     this.percent,
//     this.problemStatement,
//     this.tools,
//     this.users,
//     this.analysis,
//     this.literatureReview,
//     this.databaseDesign,
//     this.interfaceDesign,
//     this.implementation,
//     this.matrixWorkingProcess,
//     this.testing,
//     this.conclusion,
//     this.futureWork,
//   });
//
//   Topic contextDiagram;
//   Topic inputsOutputs;
//   Topic introduction;
//   Topic objectives;
//   int percent;
//   Topic problemStatement;
//   Topic tools;
//   Topic users;
//   Topic analysis;
//   Topic literatureReview;
//   Topic databaseDesign;
//   Topic interfaceDesign;
//   Topic implementation;
//   MatrixWorkingProcess matrixWorkingProcess;
//   Topic testing;
//   Topic conclusion;
//   Topic futureWork;
//
//   factory Chapter.fromJson(Map<String, dynamic> json) => Chapter(
//     contextDiagram: json["context_diagram"] == null ? null : Topic.fromJson(json["context_diagram"]),
//     inputsOutputs: json["inputs_outputs"] == null ? null : Topic.fromJson(json["inputs_outputs"]),
//     introduction: json["introduction"] == null ? null : Topic.fromJson(json["introduction"]),
//     objectives: json["objectives"] == null ? null : Topic.fromJson(json["objectives"]),
//     percent: json["percent"],
//     problemStatement: json["problem_statement"] == null ? null : Topic.fromJson(json["problem_statement"]),
//     tools: json["tools"] == null ? null : Topic.fromJson(json["tools"]),
//     users: json["users"] == null ? null : Topic.fromJson(json["users"]),
//     analysis: json["analysis"] == null ? null : Topic.fromJson(json["analysis"]),
//     literatureReview: json["literature_review"] == null ? null : Topic.fromJson(json["literature_review"]),
//     databaseDesign: json["database_design"] == null ? null : Topic.fromJson(json["database_design"]),
//     interfaceDesign: json["interface_design"] == null ? null : Topic.fromJson(json["interface_design"]),
//     implementation: json["implementation"] == null ? null : Topic.fromJson(json["implementation"]),
//     matrixWorkingProcess: json["matrix_working_process"] == null ? null : MatrixWorkingProcess.fromJson(json["matrix_working_process"]),
//     testing: json["testing"] == null ? null : Topic.fromJson(json["testing"]),
//     conclusion: json["conclusion"] == null ? null : Topic.fromJson(json["conclusion"]),
//     futureWork: json["future_work"] == null ? null : Topic.fromJson(json["future_work"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "context_diagram": contextDiagram == null ? null : contextDiagram.toJson(),
//     "inputs_outputs": inputsOutputs == null ? null : inputsOutputs.toJson(),
//     "introduction": introduction == null ? null : introduction.toJson(),
//     "objectives": objectives == null ? null : objectives.toJson(),
//     "percent": percent,
//     "problem_statement": problemStatement == null ? null : problemStatement.toJson(),
//     "tools": tools == null ? null : tools.toJson(),
//     "users": users == null ? null : users.toJson(),
//     "analysis": analysis == null ? null : analysis.toJson(),
//     "literature_review": literatureReview == null ? null : literatureReview.toJson(),
//     "database_design": databaseDesign == null ? null : databaseDesign.toJson(),
//     "interface_design": interfaceDesign == null ? null : interfaceDesign.toJson(),
//     "implementation": implementation == null ? null : implementation.toJson(),
//     "matrix_working_process": matrixWorkingProcess == null ? null : matrixWorkingProcess.toJson(),
//     "testing": testing == null ? null : testing.toJson(),
//     "conclusion": conclusion == null ? null : conclusion.toJson(),
//     "future_work": futureWork == null ? null : futureWork.toJson(),
//   };
// }
//
// class Topic {
//   Topic({
//     required this.chat,
//     required this.lastUpdate,
//     required this.link,
//   });
//
//   List<Chat> chat;
//   DateTime lastUpdate;
//   Link link;
//
//   factory Topic.fromJson(Map<String, dynamic> json) => Topic(
//     chat: List<Chat>.from(json["chat"].map((x) => Chat.fromJson(x))),
//     lastUpdate: DateTime.parse(json["last_update"]),
//     link: linkValues.map[json["link"]],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "chat": List<dynamic>.from(chat.map((x) => x.toJson())),
//     "last_update": lastUpdate.toIso8601String(),
//     "link": linkValues.reverse[link],
//   };
// }
//
// class Chat {
//   Chat({
//     this.feedback,
//     this.sendAt,
//     this.type,
//   });
//
//   Feedback feedback;
//   DateTime sendAt;
//   int type;
//
//   factory Chat.fromJson(Map<String, dynamic> json) => Chat(
//     feedback: feedbackValues.map[json["feedback"]],
//     sendAt: json["send_at"] == null ? null : DateTime.parse(json["send_at"]),
//     type: json["type"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "feedback": feedbackValues.reverse[feedback],
//     "send_at": sendAt == null ? null : sendAt.toIso8601String(),
//     "type": type,
//   };
// }
//
// enum Feedback { FEEDBACK_BODY }
//
// final feedbackValues = EnumValues({
//   "feedback body": Feedback.FEEDBACK_BODY
// });
//
// enum Link { PDF_LINK }
//
// final linkValues = EnumValues({
//   "pdf link": Link.PDF_LINK
// });
//
// class MatrixWorkingProcess {
//   MatrixWorkingProcess({
//     this.chat,
//     this.lastUpdate,
//     this.link,
//   });
//
//   List<MatrixWorkingProcessChat> chat;
//   DateTime lastUpdate;
//   Link link;
//
//   factory MatrixWorkingProcess.fromJson(Map<String, dynamic> json) => MatrixWorkingProcess(
//     chat: List<MatrixWorkingProcessChat>.from(json["chat"].map((x) => MatrixWorkingProcessChat.fromJson(x))),
//     lastUpdate: DateTime.parse(json["last_update"]),
//     link: linkValues.map[json["link"]],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "chat": List<dynamic>.from(chat.map((x) => x.toJson())),
//     "last_update": lastUpdate.toIso8601String(),
//     "link": linkValues.reverse[link],
//   };
// }
//
// class MatrixWorkingProcessChat {
//   MatrixWorkingProcessChat({
//     this.feedback,
//     this.type,
//   });
//
//   Feedback feedback;
//   int type;
//
//   factory MatrixWorkingProcessChat.fromJson(Map<String, dynamic> json) => MatrixWorkingProcessChat(
//     feedback: feedbackValues.map[json["feedback"]],
//     type: json["type"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "feedback": feedbackValues.reverse[feedback],
//     "type": type,
//   };
// }
//
// class EnumValues<T> {
//   Map<String, T> map;
//   Map<T, String> reverseMap;
//
//   EnumValues(this.map);
//
//   Map<T, String> get reverse {
//     if (reverseMap == null) {
//       reverseMap = map.map((k, v) => new MapEntry(v, k));
//     }
//     return reverseMap;
//   }
// }
