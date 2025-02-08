class TaskModel {
  String id;
  String title;
  String description;
  String image;
  bool isDone;
  int date;

  TaskModel(
      {this.id = "",
      required this.title,
      required this.description,
      required this.image,
      this.isDone = false,
      required this.date});

  TaskModel.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          title: json['title'],
          description: json['description'],
          image: json['image'],
          isDone: json['isDone'],
          date: json['date'],
        );

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "image": image,
      'isDone': isDone,
      "date": date,
    };
  }
}
