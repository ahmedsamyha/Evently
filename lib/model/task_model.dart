class TaskModel {
  String id;
  String title;
  String description;
  String image;
  bool isDone;
  int date;
  String time;
  int num;

  TaskModel(
      {
        this.id = "",
      required this.title,
      required this.description,
      required this.image,
      this.isDone = false,
      required this.date,
      required this.time,
        required this.num
      });

  TaskModel.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          title: json['title'],
          description: json['description'],
          image: json['image'],
          isDone: json['isDone'],
          date: json['date'],
          time: json['time'],
          num: json['num'],
        );

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "image": image,
      'isDone': isDone,
      "date": date,
      "time":time,
      "num":num,
    };
  }
}
