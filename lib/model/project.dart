class Project{
  String id;
  String tilte;
  String description;
  String objectives;
  //List<String> skills;
  List<String> others;
  List<String> tools;
  List<String> languages;
  Map<String, dynamic> students; /// name , id
  Map<String, dynamic> doctor; /// name , id
  int year;
  List<List<Map<String, dynamic>>> progress; /// flag , link
  int status; /// 0 => pending(waiting) ,, 1 => accepted,not complete ,, 2 => accepted , complete
}