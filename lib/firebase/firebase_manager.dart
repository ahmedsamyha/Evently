import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/model/task_model.dart';
import 'package:evently/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
        .where('uID', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .where('num' , isEqualTo: selectedIndex-1).orderBy('date',descending: false)
        .snapshots();
  }
  }
  static Stream<QuerySnapshot<TaskModel>> getFavorites() {
    var collection = getTaskCollection();
    return collection
        .where('uID', isEqualTo: FirebaseAuth.instance.currentUser!.uid).where('isFave' , isEqualTo: true).orderBy('date',descending: false)
        .snapshots();
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
    } on FirebaseAuthException {
      onError('Wrong Email Or Password');
    }
  }

  static Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }

 /* static Future<String?> getUserName(String userId) async {
    var doc = await getUsersCollection().doc(userId).get();
    if (doc.exists) {
      return doc.data()?.name;
    }
    return null;
  }*/

  static Future<UserModel?> userData()async{
    var collection = getUsersCollection();
    DocumentSnapshot<UserModel> docRef = await collection.doc(FirebaseAuth.instance.currentUser!.uid).get();
    return docRef.data();
  }


  static Future<void> loginWithGoogle(Function onLoading, Function onSuccess, Function onError) async {
    try {
      onLoading();

      // Ensure previous Google session is disconnected
      await GoogleSignIn().signOut();

      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return; // User canceled login

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
      final User? firebaseUser = userCredential.user;
      if (firebaseUser == null) return;

      final CollectionReference usersCollection = FirebaseFirestore.instance.collection('Users');
      final DocumentSnapshot userDoc = await usersCollection.doc(firebaseUser.uid).get();

      if (!userDoc.exists) {
        UserModel userModel = UserModel(
          id: firebaseUser.uid,
          name: firebaseUser.displayName ?? 'No Name',
          email: firebaseUser.email ?? 'No Email',
          createdAt: DateTime.now().millisecondsSinceEpoch,
        );

        await usersCollection.doc(firebaseUser.uid).set(userModel.toJson());
      } else {
        print("User already exists, skipping Firestore update.");
      }

      onSuccess();
    } catch (e) {
      print("Google Sign-In Error: $e");
      onError(e.toString());
    }
  }
}
