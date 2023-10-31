import 'package:flutter/material.dart';

class complaints extends StatefulWidget {
  const complaints({super.key});

  @override
  State<complaints> createState() => complaintsScreen();
}

class complaintsScreen extends State<complaints> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Complaints"),
    ),
    body: ComplaintsForm(),
    );
  }
}
class ComplaintsForm extends StatefulWidget {
  @override
  _ComplaintsFormState createState() => _ComplaintsFormState();
}

class _ComplaintsFormState extends State<ComplaintsForm> {
  String selectedCategory = '';
  String selectedSeverity = '';
  String selectedPriority = '';
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField<String>(
          value: selectedCategory,
          hint: Text("Select Category"),
          items: ["Category 1", "Category 2", "Category 3"].map((category) {
            return DropdownMenuItem(
              value: category,
              child: Text(category),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              selectedCategory = value ?? '';
            });
          },
        ),
        SizedBox(height: 16),
        DropdownButtonFormField<String>(
          value: selectedSeverity,
          hint: Text("Select Severity"),
          items: ["Low", "Medium", "High"].map((severity) {
            return DropdownMenuItem(
              value: severity,
              child: Text(severity),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              selectedSeverity = value ?? '';
            });
          },
        ),
        SizedBox(height: 16),
        DropdownButtonFormField<String>(
          value: selectedPriority,
          hint: Text("Select Priority"),
          items: ["Low", "Medium", "High"].map((priority) {
            return DropdownMenuItem(
              value: priority,
              child: Text(priority),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              selectedPriority = value ?? '';
            });
          },
        ),
        SizedBox(height: 16),
        TextFormField(
          controller: descriptionController,
          decoration: InputDecoration(
            hintText: "Describe your complaint",
            border: OutlineInputBorder(),
          ),
          maxLines: 4,
        ),
        SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            // Handle submission of the complaint form
            // You can access the selected values and description using the corresponding variables.
          },
          child: Text("Submit"),
        ),
      ],
    );
  }
}

