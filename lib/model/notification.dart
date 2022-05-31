class Notification {
  String title;

  String description;
  String id;

  String sendAt;

  int type;

  Notification({
    required this.title,
    required this.description,
    required this.id,
    required this.type,
    required this.sendAt,
  });
}
