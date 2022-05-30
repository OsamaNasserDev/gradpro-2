// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

UserModel userFromJson(String str) => UserModel.fromJson(json.decode(str));

String userToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.skills,
    this.image,
    required this.role,
    this.languages,
    this.projectsIds,
    this.teamId,
    required this.name,
    this.bio,
    required this.id,
    this.tools,
    required this.email,
    this.others,
  });

  List<String>? skills;
  String? image;
  int role;
  List<String>? languages;
  List<ProjectsId>? projectsIds;
  String? teamId;
  String name;
  String? bio;
  String id;
  List<String>? tools;
  String email;
  List<String>? others;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    skills: List<String>.from(json["skills"].map((x) => x)),
    image: json["image"],
    role: json["role"],
    languages: List<String>.from(json["languages"].map((x) => x)),
    projectsIds: List<ProjectsId>.from(json["projectsIds"].map((x) => ProjectsId.fromJson(x))),
    teamId: json["teamId"],
    name: json["name"],
    bio: json["bio"],
    id: json["id"],
    tools: List<String>.from(json["tools"].map((x) => x)),
    email: json["email"],
    others: List<String>.from(json["others"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "skills": skills != null? List<dynamic>.from(skills!.map((x) => x)):null,
    "image": image,
    "role": role,
    "languages": languages != null?List<dynamic>.from(languages!.map((x) => x)):null,
    "projectsIds":projectsIds != null? List<dynamic>.from(projectsIds!.map((x) => x.toJson())):null,
    "teamId": teamId,
    "name": name,
    "bio": bio,
    "id": id,
    "tools": tools != null?List<dynamic>.from(tools!.map((x) => x)):null,
    "email": email,
    "others": others != null?List<dynamic>.from(others!.map((x) => x)):null,
  };
}

class ProjectsId {
  ProjectsId({
    required this.name,
    required this.id,
  });

  String name;
  String id;

  factory ProjectsId.fromJson(Map<String, dynamic> json) => ProjectsId(
    name: json["name"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "id": id,
  };
}
