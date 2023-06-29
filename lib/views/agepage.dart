import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AgePage extends StatefulWidget {
  @override
  _AgePageState createState() => _AgePageState();
}

class _AgePageState extends State<AgePage> {
  String name = '';
  int age = 0;

  Future<void> fetchAge(String name) async {
    final response = await http.get(Uri.parse('https://api.agify.io/?name=$name'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        age = data['age'];
      });
    } else {
      throw Exception('Failed to fetch age');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Age Determination'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Enter a name',
              ),
              onChanged: (value) {
                setState(() {
                  name = value;
                });
              },
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                fetchAge(name);
              },
              child: Text('Get Age'),
            ),
            SizedBox(height: 20),
            Text(
              'Name: $name',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Age: $age',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}