import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_minor/controller/RegController.dart';
import 'package:final_minor/screens/notice.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:final_minor/screens/login.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import '../controller/get-user-data-controller.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:validators/validators.dart';
import 'Header.dart';
import 'package:email_validator/email_validator.dart';
import 'package:phone_form_field/phone_form_field.dart';


class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final RegController regController = Get.put(RegController());
  TextEditingController username = TextEditingController();
  TextEditingController userEmail = TextEditingController();
  TextEditingController userMobile_number = TextEditingController();
  TextEditingController userPassword = TextEditingController();

  //User? user = FirebaseAuth.instance.currentUser;

  bool showPassword = false;
  bool confirmPassword = false;
  bool stayLoggedIn = false;

  String? validateMobile(String phone) {
    String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = new RegExp(patttern);
    if (phone.length == 0) {
      return 'Please enter mobile number';
    }
    else if (!regExp.hasMatch(phone)) {
      return 'Please enter valid mobile number';
    }
    return phone!.isNotEmpty && !regExp.hasMatch(phone)
        ? 'Enter a valid phone number'
        : null;
  }

  String? validateEmail(String? email) {
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final regex = RegExp(pattern);

    return email!.isNotEmpty && !regex.hasMatch(email)
        ? 'Enter a valid email address'
        : null;

  }


  void _toggle(){
    setState(() {
      showPassword = !showPassword;
    });
  }

  void _toggleConfirmPassword(){
    setState(() {
      confirmPassword = !confirmPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body:NestedScrollView(headerSliverBuilder: (BuildContext context , bool innerBoxIsScrolled){
        return <Widget> [
          const SliverAppBar(
            toolbarHeight: 70, expandedHeight: 200,
            backgroundColor:  Colors.amber,
            floating: false,
            flexibleSpace: FlexibleSpaceBar(
              background: Header(title:'Register Yourself'),
            ),
          )

        ];
      },
        body: Container(
          decoration:  const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))
          ),
          child:  Padding(
            padding:   const EdgeInsets.fromLTRB(15, 40, 15, 20),
            child: SingleChildScrollView(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,children:  [
                const Text('Name',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700,fontFamily: 'Quickend')),

                TextField(
                  controller: username,
                  decoration: InputDecoration(
                    hintText: 'Enter your name',
                    hintStyle: TextStyle(color: Colors.grey,fontSize: 12)
                  ),
                ),
                const SizedBox(height: 20),

                const Text('Email',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700,fontFamily: 'Quickend')),

                TextFormField(
                  controller: userEmail,
                  decoration: InputDecoration(
                      hintText: 'Enter your Email',
                      hintStyle: TextStyle(color: Colors.grey,fontSize: 12)
                  ),
                    autofillHints: [AutofillHints.email],
                    validator: validateEmail,
                    /*validator: (email) {
                      if (email != null && EmailValidator.validate(email)) {
                        // The email is not null and is valid
                      } else {
                        Fluttertoast.showToast(
                            msg: "Please enter valid email",
                            toastLength: Toast.LENGTH_SHORT, // Duration: Toast.LENGTH_SHORT or Toast.LENGTH_LONG
                            gravity: ToastGravity.BOTTOM,    // Position: ToastGravity.TOP, ToastGravity.CENTER
                            timeInSecForIosWeb: 1,         // Duration for iOS and web (in seconds)
                            backgroundColor: Colors.orange,   // Background color
                            textColor: Colors.white,       // Text color
                            fontSize: 16.0,
                        );
                        }

                    }*/

                ),


                const SizedBox(height: 20),

                const Text('Mobile number',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700,fontFamily: 'Quickend')),

                 TextFormField(
                  controller: userMobile_number,
                  decoration: InputDecoration(
                      hintText: 'Enter your mobile number',
                      hintStyle: TextStyle(color: Colors.grey,fontSize: 12)
                  ),
                   keyboardType: TextInputType.phone,

                 ),

                const SizedBox(height: 20),

                const Text('Password',style: TextStyle(fontWeight: FontWeight.w700,fontFamily:'Quicksand',fontSize: 18 )),
                TextField(
                    controller:userPassword ,
                    decoration: InputDecoration(
                  hintText: 'Create your password',
                  hintStyle: const TextStyle(color: Colors.grey,fontSize: 12),
                  suffixIcon: InkWell(onTap: _toggleConfirmPassword,
                      child: Icon(confirmPassword? CupertinoIcons.eye_slash: CupertinoIcons.eye_fill,size: 20,)),
                ),
                  obscureText: confirmPassword
                ),
                const SizedBox(height: 30),

                Container(decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(100)
                ),
                  width: MediaQuery.of(context).size.width,height: 40,
                  child: ElevatedButton( onPressed: () async {
                    String name = username.text.trim();
                    String email = userEmail.text.trim();
                    String phone = userMobile_number.text.trim();
                    String password = userPassword.text.trim();
                    String userDeviceToken ='';
                    if(name.isEmpty|| email.isEmpty || phone.isEmpty|| password.isEmpty){
                      Fluttertoast.showToast(
                        msg: "Enter all details",
                        toastLength: Toast.LENGTH_SHORT, // Duration: Toast.LENGTH_SHORT or Toast.LENGTH_LONG
                        gravity: ToastGravity.BOTTOM,    // Position: ToastGravity.TOP, ToastGravity.CENTER
                        timeInSecForIosWeb: 1,         // Duration for iOS and web (in seconds)
                        backgroundColor: Colors.orange,   // Background color
                        textColor: Colors.white,       // Text color
                        fontSize: 16.0,                // Font size
                      );

                    } else if(validateEmail(email) != null){
                      Fluttertoast.showToast(
                        msg: "Please enter valid email",
                        toastLength: Toast.LENGTH_SHORT, // Duration: Toast.LENGTH_SHORT or Toast.LENGTH_LONG
                        gravity: ToastGravity.BOTTOM,    // Position: ToastGravity.TOP, ToastGravity.CENTER
                        timeInSecForIosWeb: 1,         // Duration for iOS and web (in seconds)
                        backgroundColor: Colors.orange,   // Background color
                        textColor: Colors.white,       // Text color
                        fontSize: 16.0,
                      );

                    } else if(validateMobile(phone) != null){
                      Fluttertoast.showToast(
                        msg: "Please enter valid mobile number",
                        toastLength: Toast.LENGTH_SHORT, // Duration: Toast.LENGTH_SHORT or Toast.LENGTH_LONG
                        gravity: ToastGravity.BOTTOM,    // Position: ToastGravity.TOP, ToastGravity.CENTER
                        timeInSecForIosWeb: 1,         // Duration for iOS and web (in seconds)
                        backgroundColor: Colors.orange,   // Background color
                        textColor: Colors.white,       // Text color
                        fontSize: 16.0,
                      );

                    }
                    else{
                      UserCredential? userCredential = await regController.regMethod(
                        name,
                        email,
                        phone,
                        password,
                        userDeviceToken,
                      );
                      if(userCredential!= null){
                        Fluttertoast.showToast(
                          msg: "Verification Email sent",
                          toastLength: Toast.LENGTH_SHORT, // Duration: Toast.LENGTH_SHORT or Toast.LENGTH_LONG
                          gravity: ToastGravity.BOTTOM,    // Position: ToastGravity.TOP, ToastGravity.CENTER
                          timeInSecForIosWeb: 1,         // Duration for iOS and web (in seconds)
                          backgroundColor: Colors.orange,   // Background color
                          textColor: Colors.white,       // Text color
                          fontSize: 16.0,                // Font size
                        );
                        FirebaseAuth.instance.signOut();
                        Navigator.push(context, MaterialPageRoute(builder: (_)=> LoginPage()));
                      }
                    }

                  },
                    child: Text("Register", style: TextStyle(color: Colors.black),),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.amber,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                    ),
                  ),
                ),
              ],
              ),
            ),
          ),
        ),
      )
    );
  }
}


