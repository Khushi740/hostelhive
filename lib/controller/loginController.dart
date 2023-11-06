import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_minor/model/UserModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';

class loginController extends GetxController{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //for password visibility
  //var isPasswordVisible = false.obs;
  Future<UserCredential?> loginMethod(
      String userEmail,
      String userPassword,
      ) async{
    try{
      EasyLoading.show(status: "Please wait");
      UserCredential userCredential= await _auth.signInWithEmailAndPassword(
          email: userEmail,
          password: userPassword
      );
      EasyLoading.dismiss();
      return userCredential;

    } on FirebaseAuthException catch(e){
      EasyLoading.dismiss();
      Fluttertoast.showToast(
        msg: "$e",
        toastLength: Toast.LENGTH_SHORT, // Duration: Toast.LENGTH_SHORT or Toast.LENGTH_LONG
        gravity: ToastGravity.BOTTOM,    // Position: ToastGravity.TOP, ToastGravity.CENTER
        timeInSecForIosWeb: 1,         // Duration for iOS and web (in seconds)
        backgroundColor: Colors.amber,   // Background color
        textColor: Colors.white,       // Text color
        fontSize: 16.0,                // Font size
      );
    }
  }
}

