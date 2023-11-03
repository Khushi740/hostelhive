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
           IconButton(onPressed:(){}, icon: Icon(Icons.notifications), color: Colors.black,)
         ]
         ),

       body: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           SizedBox(height: 20,),
           Container(
             child: Padding(
               padding: EdgeInsets.only(left: 16),
             child: Text(
               "Hello, Ishita!", style: TextStyle(color: Colors.black,fontSize: 24, fontWeight: FontWeight.w500)
             ),
           ),
           ),
           Padding(
           padding: EdgeInsets.only(
             top: 25,
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
                 index= index+1;
                 return Card(
                   margin: EdgeInsets.only(bottom: 16),
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
     );
   }


 }
