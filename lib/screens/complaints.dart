import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_connect/http/src/_http/_io/_file_decoder_io.dart';


class Complaints extends StatefulWidget {
  const Complaints({Key? key}) : super(key: key);

  @override
  State<Complaints> createState() => ComplaintsScreenState();
}

class ComplaintsScreenState extends State<Complaints> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Complaints",
          style: TextStyle(color: Colors.black,),
        ),
        elevation: 0,
        backgroundColor: Colors.amberAccent,
      ),
      body: SingleChildScrollView(
      child: ComplaintsForm(),
      ),
    );
  }
}

class ComplaintsForm extends StatefulWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  _ComplaintsFormState createState() => _ComplaintsFormState();
}

class _ComplaintsFormState extends State<ComplaintsForm> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String? hostel;
  String? category;
  int? room;
  int? bed;
  TextEditingController descriptionController = TextEditingController();

  var hostelNumbers = ["A", "B", "C", "D"];
  var categories = ["Carpentry", "Cleaning", "Electrical", "Plumbing"];

  void handleSubmit() {
    setState(() {
      hostel = null;
      room = null;
      bed = null;
      category = null;
      descriptionController.clear();
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Container(padding: EdgeInsets.only(bottom: 16.0),
          child: Text("Complaint submitted successfully", style: TextStyle(backgroundColor: Colors.amber, color: Colors.black),),
      ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          DropdownButton<String>(
            value: hostel,
            hint: Text("Select Hostel"),
            onChanged: (newvalue) {
              setState(() {
                hostel = newvalue;
               // writeToFirestore(hostel);
              });
            },
            items: hostelNumbers.map((hcategory) {
              return DropdownMenuItem<String>(
                value: hcategory,
                child: Text(hcategory),
              );
            }).toList(),
          ),
          SizedBox(height: 16),
          DropdownButton<int>(
            value: room,
            hint: Text("Room no"),
            onChanged: (newRoom) {
              setState(() {
                room = newRoom;
                //writeToFirestore('room');
              });
            },
            items: List.generate(36, (index) {
              return DropdownMenuItem<int>(
                value: index + 1,
                child: Text((index + 1).toString()),
              );
            }),
          ),

          SizedBox(height: 16),
          DropdownButton<int>(
            value: bed,
            hint: Text("Bed no"),
            onChanged: (newBed) {
              setState(() {
                bed = newBed;
                //writeToFirestore('bed');
              });
            },
            items: List.generate(4, (index) {
              return DropdownMenuItem<int>(
                value: index + 1,
                child: Text((index + 1).toString()),
              );
            }),
          ),

          SizedBox(height: 16),
          DropdownButton<String>(
            value: category,
            hint: Text("Select Category"),
            onChanged: (newvalue) {
              setState(() {
                category = newvalue;
                //writeToFirestore(category);
              });
            },
            items: categories.map((ccategory) {
              return DropdownMenuItem<String>(
                value: ccategory,
                child: Text(ccategory),
              );
            }).toList(),
          ),
          SizedBox(height: 16),
          Container(
      padding: EdgeInsets.symmetric(horizontal:16),
          child: TextFormField(
            controller: descriptionController,
            decoration: InputDecoration(
              hintText: "Describe your complaint",
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.amber)),
            ),
            maxLines: 6,
          ),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed:(){
               writeToFirestore( );
               handleSubmit();
            },
            child: Text("Submit", style: TextStyle(color: Colors.black),),
            style: ElevatedButton.styleFrom(
              primary: Colors.amber,
            ),
          ),
        ],
      //),
   // ),
      //  ),

      );
  }
  void writeToFirestore() {
    if (hostel != null && room != null && bed != null && category != null) {
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      firestore.collection('complaints').add({
        'hostel': hostel,
        'room': room,
        'bed': bed,
        'category': category,
        'timestamp': FieldValue.serverTimestamp(),
        'description': descriptionController.text,
      })
          .then((value) => print("submitted))
          .catchError((error) => print("Failed to add data: $error"));
    } else {
      print("Please fill in all the details");
    }
  }
}
