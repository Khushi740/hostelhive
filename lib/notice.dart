import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class notice extends StatefulWidget {
  const notice({super.key});

  @override
  State<notice> createState()=> noticeScreen();
  }
String getCurrentDate() {
  final now = DateTime.now();
  final formattedDate = DateFormat('d MMMM').format(now); // Customize the date format as needed
  return formattedDate;
}


class noticeScreen extends State<notice> {
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         backgroundColor: Colors.white,
         shadowColor: Colors.white,
         leading: IconButton(
               icon: const Icon(Icons.dehaze_outlined),
               color: Colors.black,
               onPressed: () { Scaffold.of(context).openDrawer(); },
               tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
             ),
         centerTitle: true,
         title: Text(getCurrentDate(), style: TextStyle(color: Colors.black),),
         actions: <Widget>[
           IconButton(onPressed:(){}, icon: Icon(Icons.notifications_outlined), color: Colors.black,)
         ]
         ),

       body: Padding(
       padding: const EdgeInsets.all(50),
     child: Container(
           width: MediaQuery.of(context).size.width * 0.4,
           height: 100,
           decoration: BoxDecoration(
             color: Colors.amber,
             borderRadius: BorderRadius.circular(20),
           ),
           child: Card(
             shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(20),
             ),
             child: Padding(
               padding: const EdgeInsets.all(40),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text(
                     'Recent Notice',
                     style: TextStyle(
                       fontSize: 18,
                       fontWeight: FontWeight.bold,
                     ),
                   ),
                   SizedBox(height: 4),
                   Text(
                     'This is a small description of the recent notice.',
                     style: TextStyle(
                       fontSize: 14,
                     ),
                   ),
                 ],
               ),
             ),
           ),
         ),
       ),

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
       //body: Container(color: Colors.white),
     );
   }


 }
