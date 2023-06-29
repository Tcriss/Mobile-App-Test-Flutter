import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:tarea6/main.dart';
import './toolboxpage.dart';
class GenderPage extends StatefulWidget {
  @override
  _GenderPageState createState() => _GenderPageState();
}

class _GenderPageState extends State<GenderPage> {
  String gender = '';

  Future<void> fetchGender(String name) async {
    final response = await http.get(Uri.parse('https://api.genderize.io/?name=$name'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        gender = data['gender'];
      });
    } else {
      throw Exception('Failed to fetch gender');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gender Prediction'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (value) {
                fetchGender(value);
              },
              decoration: InputDecoration(
                hintText: 'Enter a name',
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Gender: $gender',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 16.0),
            if (gender.toLowerCase() == 'male')
              Container(
                width: 200,
                height: 200,
                color: Colors.blue,
              ),
            if (gender.toLowerCase() == 'female')
              Container(
                width: 200,
                height: 200,
                color: Colors.pink,
              ),
          ],
        ),
      ),
    );
  }
}