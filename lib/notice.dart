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
  final String recentNoticeTitle = "Recent Notice";
  final String recentNoticeDescription = "This is a small description of the recent notice.";
   @override
   Widget build(BuildContext context) {
     final screenWidth = MediaQuery.of(context).size.width;
     final screenHeight = MediaQuery.of(context).size.height;
     final paddingFromTop = screenHeight * 0.1;
     final paddingFromSides = screenWidth * 0.1;
     final cardWidth = screenWidth * 0.8;
     return Scaffold(
       appBar: AppBar(
         backgroundColor: Colors.white,
         elevation: 0,
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

       body: Column(
         children: [
           Padding(
           padding: EdgeInsets.only(
             top: paddingFromTop,
             left: paddingFromSides,
             right: paddingFromSides,
           ),
     child: Container(
               width: cardWidth,
               height: 200,
               decoration: BoxDecoration(
                 color: Colors.amber,
                 borderRadius: BorderRadius.circular(20),
               ),
               child: Card(
                 shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(20),
                 ),
                 child: Padding(
                   padding: const EdgeInsets.all(16),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text(
                         recentNoticeTitle,
                         style: TextStyle(
                           fontSize: 18,
                           fontWeight: FontWeight.bold,
                         ),
                       ),
                       SizedBox(height: 50),
                       Text(
                         recentNoticeDescription,
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
           SizedBox(height: 16),
           Expanded(
             child: ListView.builder(
               itemCount: 5,
               itemBuilder: (BuildContext context, int index) {
                 index=1;
                 return Card(
                   margin: EdgeInsets.only(bottom: 16), // Add margin for spacing between cards
                   child: ListTile(
                     title: Text('Previous Notice $index'),
                     subtitle: Text('Description of Previous Notice $index'),
                   ),
                 );
               },
             ),
           ),
         ],
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
