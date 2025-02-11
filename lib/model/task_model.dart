class TaskModel {
  String id;
  String uID;
  String title;
  String description;
  String image;
  bool isDone;
  bool isFave;
  int date;
  String time;
  int num;

  TaskModel(
      {this.id = "",
      required this.title,
      required this.uID,
      required this.description,
      required this.image,
      this.isDone = false,
      this.isFave = false,
      required this.date,
      required this.time,
      required this.num});

  TaskModel.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          uID: json['uID'],
          title: json['title'],
          description: json['description'],
          image: json['image'],
          isDone: json['isDone'],
          date: json['date'],
          time: json['time'],
          num: json['num'],
          isFave: json['isFave'] ?? false,
        );

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "uID": uID,
      "title": title,
      "description": description,
      "image": image,
      'isDone': isDone,
      "date": date,
      "time": time,
      "num": num,
      "isFave": isFave,
    };
  }
}
