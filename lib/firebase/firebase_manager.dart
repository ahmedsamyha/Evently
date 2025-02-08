import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/model/task_model.dart';

class FirebaseManager {
 static CollectionReference<TaskModel> getTaskCollection() {
    return FirebaseFirestore.instance
        .collection('Tasks')
        .withConverter<TaskModel>(
      fromFirestore: (snapshot, _) {
        return TaskModel.fromJson(snapshot.data()!);
      },
      toFirestore: (model, _) {
        return model.toJson();
      },
    );
  }

  static Future<void> addEvent(TaskModel task) {
    var collection = getTaskCollection();
    var docRef = collection.doc();
    task.id = docRef.id;
    return docRef.set(task);

  }

  static Stream<QuerySnapshot<TaskModel>> getEvents(){
    var collection = getTaskCollection();
    return collection.snapshots();
  }

  static Future<void> deleteEvent(String id){
    var collection = getTaskCollection();
   return collection.doc(id).delete();
  }
}
