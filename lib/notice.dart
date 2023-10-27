import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:final_minor/login.dart';

class notice extends StatefulWidget {
  const notice({super.key});

  @override
  State<notice> createState()=> noticeScreen();

  }

 class noticeScreen extends State<notice> {
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       bottomNavigationBar: CurvedNavigationBar(
         backgroundColor: Colors.white,
         color: Colors.amberAccent,
         animationDuration: Duration(milliseconds: 300),
         items: <Widget>[
           Icon(Icons.tips_and_updates, size: 30, color: Colors.black,),
           Icon(Icons.rate_review, size: 30, color: Colors.black,),
           Icon(Icons.settings, size: 30, color: Colors.black,),
         ],
         onTap: (index) {
           //Handle button tap
         },
       ),
       body: Container(color: Colors.white),
     );
     
   }


 }
