import 'package:flutter/material.dart';

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
  @override
  _ComplaintsFormState createState() => _ComplaintsFormState();
}

class _ComplaintsFormState extends State<ComplaintsForm> {
  String? hostel;
  String? category;
  int? room;
  int? bed;
  TextEditingController descriptionController = TextEditingController();

  var hostelNumbers = ["A", "B", "C", "D"];
  var categories = ["Carpentry", "Cleaning", "Electrical", "Plumbing"];

  @override
  Widget build(BuildContext context) {
    return
    //   Padding(
    //   padding: EdgeInsets.all(16.0),
    //   child: Card(
    // child: Padding(
    //   padding: EdgeInsets.all(16.0),
    // child:
    Column(
      children: [
        DropdownButton<String>(
          value: hostel,
          hint: Text("Select Hostel"),
          onChanged: (newvalue) {
            setState(() {
              hostel = newvalue;
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
            });
          },
          items: List.generate(40, (index) {
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

          onPressed: () {
            // Handle submission of the complaint form
            // You can access the selected values and description using the corresponding variables.
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
}
