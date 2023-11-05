import 'package:final_minor/controller/loginController.dart';
import 'package:final_minor/screens/notice.dart';
import 'package:final_minor/screens/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Header.dart';
import 'navbar.dart';
import '../controller/get-user-data-controller.dart';
import 'package:fluttertoast/fluttertoast.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final loginController loginCon = Get.put(loginController());
  final GetUserDataController getUserDataController =
  Get.put(GetUserDataController());
  TextEditingController userEmail = TextEditingController();
  TextEditingController userPassword = TextEditingController();
  bool showPassword = true;
  bool stayLoggedIn = false;
  void _toggle(){
    setState(() {
      showPassword = !showPassword;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return<Widget>[
            const SliverAppBar(
              backgroundColor:Colors.amber,
              expandedHeight: 200,
              floating: false,
              flexibleSpace: FlexibleSpaceBar(
                background:Header(title: 'Welcome') ,

              ),
            )


          ];
        },body: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))
        ),
        child:Padding(
          padding: const   EdgeInsets.fromLTRB(15,40,15,20),
          child: SingleChildScrollView(
            child: Column(crossAxisAlignment :CrossAxisAlignment.start,
              children:  [
              const Text('Email',style: TextStyle(fontWeight: FontWeight.w700,fontFamily:'Quicksand',fontSize: 18 )),
                TextField(
                  controller: userEmail,
                decoration: InputDecoration(
                    hintText: 'Enter your email',
                    hintStyle: TextStyle(color: Colors.grey,fontSize: 12)
                ),
              ),
              const SizedBox(height: 20),
              const Text('Password',style: TextStyle(fontWeight: FontWeight.w700,fontFamily:'Quicksand',fontSize: 18 )),
              TextField(
                controller: userPassword,
                decoration: InputDecoration(
                hintText: 'Enter your password',
                hintStyle: const TextStyle(color: Colors.grey,fontSize: 12),
                suffixIcon: InkWell(onTap: _toggle,
                    child: Icon(showPassword? CupertinoIcons.eye_slash: CupertinoIcons.eye_fill,size: 20,)),
              ),
                obscureText: showPassword,
              ),

              const SizedBox(height: 10),

              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    SizedBox(width: 15,
                      child: Checkbox(value: stayLoggedIn,
                        activeColor: Colors.blueAccent,
                        checkColor: Colors.white,
                         onChanged: (bool? value) {setState(() {
                           stayLoggedIn = !stayLoggedIn;
                         });
                        }),
                    ),
                    const Padding(padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text('Stay logged in?',style: TextStyle(fontSize: 15,color: Colors.grey),),)
                  ],),


                ],
              ),
              const SizedBox(height: 20),
              Container(decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(100)
              ),
                width: MediaQuery.of(context).size.width,height: 40,
                child: ElevatedButton( onPressed: (

                    )async {
                  String email = userEmail.text.trim();
                  String password = userPassword.text.trim();

                  if(email.isEmpty|| password.isEmpty){
                    Fluttertoast.showToast(
                      msg: "Enter all details",
                      toastLength: Toast.LENGTH_SHORT, // Duration: Toast.LENGTH_SHORT or Toast.LENGTH_LONG
                      gravity: ToastGravity.BOTTOM,    // Position: ToastGravity.TOP, ToastGravity.CENTER
                      timeInSecForIosWeb: 1,         // Duration for iOS and web (in seconds)
                      backgroundColor: Colors.orange,   // Background color
                      textColor: Colors.white,       // Text color
                      fontSize: 16.0,                // Font size
                    );
                  }else{
                    UserCredential? userCredential = await loginCon.loginMethod(
                        email,
                        password);
                    var userData = await getUserDataController
                        .getUserData(userCredential!.user!.uid);
                    if(userCredential != null){
                      if(userCredential.user!.emailVerified){
                        Fluttertoast.showToast(
                          msg: "Login Successful",
                          toastLength: Toast.LENGTH_SHORT, // Duration: Toast.LENGTH_SHORT or Toast.LENGTH_LONG
                          gravity: ToastGravity.BOTTOM,    // Position: ToastGravity.TOP, ToastGravity.CENTER
                          timeInSecForIosWeb: 1,         // Duration for iOS and web (in seconds)
                          backgroundColor: Colors.orange,   // Background color
                          textColor: Colors.white,       // Text color
                          fontSize: 16.0,                // Font size
                        );
                        Navigator.push(context, MaterialPageRoute(builder: (_)=> NavBar()));
                      }else{
                        Fluttertoast.showToast(
                          msg: "Please  verify email",
                          toastLength: Toast.LENGTH_SHORT, // Duration: Toast.LENGTH_SHORT or Toast.LENGTH_LONG
                          gravity: ToastGravity.BOTTOM,    // Position: ToastGravity.TOP, ToastGravity.CENTER
                          timeInSecForIosWeb: 1,         // Duration for iOS and web (in seconds)
                          backgroundColor: Colors.orange,   // Background color
                          textColor: Colors.white,       // Text color
                          fontSize: 16.0,                // Font size
                        );
                      }
                    }else{
                      Fluttertoast.showToast(
                        msg: "error occured! try again later",
                        toastLength: Toast.LENGTH_SHORT, // Duration: Toast.LENGTH_SHORT or Toast.LENGTH_LONG
                        gravity: ToastGravity.BOTTOM,    // Position: ToastGravity.TOP, ToastGravity.CENTER
                        timeInSecForIosWeb: 1,         // Duration for iOS and web (in seconds)
                        backgroundColor: Colors.orange,   // Background color
                        textColor: Colors.white,       // Text color
                        fontSize: 16.0,                // Font size
                      );
                    }
                  }
                },
                  child: Text("Login", style: TextStyle(color: Colors.black),),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.amber,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.all(30),
             child: Center(
                child: InkWell(onTap: ()=> Navigator.push(context,MaterialPageRoute(builder: (_)=> const SignUp())),
                  child: const Text.rich(TextSpan(children: [
                    TextSpan(text:"Don't have an account yet? Register",style: TextStyle(fontSize:12 )),
                    TextSpan(text: '   here',style: TextStyle(fontSize: 12,color: Colors.amberAccent, fontWeight: FontWeight.w900)),
                  ])),
                ),
              ),
              )

             // Padding(padding: const EdgeInsets.symmetric(vertical: 20),
                //child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  //Container(color: Colors.grey,width: 75,height: 1,),
                  //const Padding(padding: EdgeInsets.symmetric(horizontal: 10),
                  //  child: Text('Or login with', style: TextStyle(color: Colors.grey)),),
                  //Container(color: Colors.grey,width: 75,height: 1,),
                //],
             // ),
             ],
          ),
        ),

      ),),
    ),
    );
  }
}
