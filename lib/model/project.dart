class Project {
  Project({
    required this.id,
    required this.description,
    this.doctor,
    required this.languages,
    required this.objectives,
    required this.others,
    this.progress,
    required this.status,
    required this.students,
    required this.title,
    required this.tools,
    required this.year,
    required this.type,
    required this.teamId,
  });

  String id;

  int type; // 0 => mobile,,, 1 => desktop,,, 2 => web
  String description;
  Map? doctor;
  String teamId;
  List languages;
  String objectives;
  List others;
  int status; // 0 => waiting,,, 1 => accepted & available,,, 2 => accepted & completed
  List students;
  String title;
  List tools;
  String year;
  Map? progress;

  factory Project.fromJson(Map<String, dynamic> json, String id) => Project(
        description: json["description"],
        languages: json["languages"],
        objectives: json["objectives"],
        others: json["others"],
        progress: json["progress"],
        status: json["status"],
        students: json["students"],
        title: json["title"],
        doctor: json["doctor"],
        tools: json["tools"],
        year: json["year"],
        id: id,
        type: json["type"],
        teamId: json["team_id"],
      );
}
//
// class Progress {
//   Progress({
//     required this.chapters,
//     this.fileWord,
//     required this.mainPercent,
//     this.powerPoint,
//   });
//
//   List<Chapter> chapters;
//   String? fileWord;
//   int mainPercent;
//   String? powerPoint;
//
//   factory Progress.fromJson(Map<String, dynamic> json) => Progress(
//         chapters: List<Chapter>.from(
//             json["chapters"].map((x) => Chapter.fromJson(x))),
//         fileWord: json["file_word"],
//         mainPercent: json["main_percent"],
//         powerPoint: json["power_point"],
//       );
// }
//
// class Chapter {
//   Chapter({
//     required this.contextDiagram,
//     required this.inputsOutputs,
//     required this.introduction,
//     required this.objectives,
//     required this.percent,
//     required this.problemStatement,
//     required this.tools,
//     required this.users,
//     required this.analysis,
//     required this.literatureReview,
//     required this.databaseDesign,
//     required this.interfaceDesign,
//     required this.implementation,
//     required this.matrixWorkingProcess,
//     required this.testing,
//     required this.conclusion,
//     required this.futureWork,
//   });
//
//   int percent;
//   Topic contextDiagram;
//   Topic inputsOutputs;
//   Topic introduction;
//   Topic objectives;
//   Topic problemStatement;
//   Topic tools;
//   Topic users;
//   Topic analysis;
//   Topic literatureReview;
//   Topic databaseDesign;
//   Topic interfaceDesign;
//   Topic implementation;
//   Topic matrixWorkingProcess;
//   Topic testing;
//   Topic conclusion;
//   Topic futureWork;
//
//   factory Chapter.fromJson(Map<String, dynamic> json) => Chapter(
//         contextDiagram: Topic.fromJson(json["context_diagram"]),
//         inputsOutputs: Topic.fromJson(json["inputs_outputs"]),
//         introduction: Topic.fromJson(json["introduction"]),
//         objectives: Topic.fromJson(json["objectives"]),
//         percent: json["percent"],
//         problemStatement: Topic.fromJson(json["problem_statement"]),
//         tools: Topic.fromJson(json["tools"]),
//         users: Topic.fromJson(json["users"]),
//         analysis: Topic.fromJson(json["analysis"]),
//         literatureReview: Topic.fromJson(json["literature_review"]),
//         databaseDesign: Topic.fromJson(json["database_design"]),
//         interfaceDesign: Topic.fromJson(json["interface_design"]),
//         implementation: Topic.fromJson(json["implementation"]),
//         matrixWorkingProcess: Topic.fromJson(json["matrix_working_process"]),
//         testing: Topic.fromJson(json["testing"]),
//         conclusion: Topic.fromJson(json["conclusion"]),
//         futureWork: Topic.fromJson(json["future_work"]),
//       );
// }
//
// class Topic {
//   Topic({
//     required this.chat,
//     required this.lastUpdate,
//     required this.link,
//   });
//
//   List<Map<String, dynamic>> chat;
//   DateTime lastUpdate;
//   String link;
//
//   factory Topic.fromJson(Map<String, dynamic> json) => Topic(
//         chat: List<Map<String, dynamic>>.from(json["chat"].map((x) => x)),
//         lastUpdate: DateTime.parse(json["last_update"]),
//         link: json["link"],
//       );
// }
