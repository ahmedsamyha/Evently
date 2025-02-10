import 'package:evently/firebase/firebase_manager.dart';
import 'package:evently/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier{

  UserModel? userModel;
  User? firebaseUser;


  UserProvider(){
    firebaseUser = FirebaseAuth.instance.currentUser;

    if(firebaseUser !=null){
          initUser();
    }
  }

  initUser()async{
    userModel = await  FirebaseManager.userData();
    notifyListeners();
  }
}