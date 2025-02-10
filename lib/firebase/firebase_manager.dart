import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/model/task_model.dart';
import 'package:evently/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

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

  static Future<void> addEvent(TaskModel task ) {
    var collection = getTaskCollection();
    var docRef = collection.doc();
    task.id = docRef.id;
    return docRef.set(task);
  }

  static Stream<QuerySnapshot<TaskModel>> getEvents(int selectedIndex) {
    var collection = getTaskCollection();
  if( selectedIndex ==0){
    return collection
        .where('uID', isEqualTo: FirebaseAuth.instance.currentUser!.uid).orderBy('date',descending: false)
        .snapshots();
  }else{
    return collection
        .where('uID', isEqualTo: FirebaseAuth.instance.currentUser!.uid).where('num' , isEqualTo: selectedIndex-1).orderBy('date',descending: false)
        .snapshots();
  }
  }

  static Future<void> deleteEvent(String id) {
    var collection = getTaskCollection();
    return collection.doc(id).delete();
  }

  static Future<void> updateEvent(TaskModel model) {
    var collection = getTaskCollection();
    return collection.doc(model.id).update(model.toJson());
  }

  static Future<void> createAccount(
      String name,
      String emailAddress,
      String password,
      Function onLoading,
      Function onSuccess,
      Function onError) async {
    try {
      onLoading();
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      credential.user!.sendEmailVerification();
      UserModel userModel = UserModel(
          id: credential.user!.uid,
          name: name,
          email: emailAddress,
          createdAt: DateTime.now().millisecondsSinceEpoch);
      addUser(userModel);
      onSuccess();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        onError(e.message);
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        onError(e.message);
        print('The account already exists for that email.');
      }
    } catch (e) {
      onError('Error');

      print(e);
    }
  }

  //*****************************************************
  static CollectionReference<UserModel> getUsersCollection() {
    return FirebaseFirestore.instance
        .collection('Users')
        .withConverter<UserModel>(
      fromFirestore: (snapshot, _) {
        return UserModel.fromJson(snapshot.data()!);
      },
      toFirestore: (model, _) {
        return model.toJson();
      },
    );
  }

  static Future<void> addUser(UserModel user) {
    var collection = getUsersCollection();
    var docRef = collection.doc(user.id);
    return docRef.set(user);
  }

  static Future<void> login(String emailAddress, String password,
      Function onLoading, Function onSuccess, Function onError) async {
    try {
      onLoading();
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      if (credential.user!.emailVerified) {
        onSuccess();
      } else {
        onError('Please Verify Your Email To Continue');
      }
    } on FirebaseAuthException catch (e) {
      onError('Wrong Email Or Password');
    }
  }

  static Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }
}
