import 'package:flutter/material.dart';

class NameCardWidget extends StatelessWidget {
  const NameCardWidget({
    super.key,
    required this.myText,
    required TextEditingController nameController,
  }) : _nameController = nameController;

  final String myText;
  final TextEditingController _nameController;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(
            "/Users/jabirmyra/Repos/flutter_learn/flutter_application_1/assets/code.jpeg",
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            myText,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: "Enter Some Text",
                labelText: "Name",
                border: OutlineInputBorder(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
