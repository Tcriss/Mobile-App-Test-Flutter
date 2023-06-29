import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UniversitiesPage extends StatefulWidget {
  @override
  _UniversitiesPageState createState() => _UniversitiesPageState();
}

class _UniversitiesPageState extends State<UniversitiesPage> {
  List<dynamic> universities = [];

  Future<void> fetchUniversities() async {
    final response = await http.get(Uri.parse('http://universities.hipolabs.com/search?country=Dominican+Republic'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        universities = data;
      });
    } else {
      throw Exception('Failed to fetch universities');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchUniversities();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Universities'),
      ),
      body: ListView.builder(
        itemCount: universities.length,
        itemBuilder: (context, index) {
          final university = universities[index];
          return ListTile(
            title: Text(university['name']),
            subtitle: Text('Domain: ${university['domains'][0]}'),
            onTap: () {
              // Navigate to university website
              String websiteUrl = university['web_pages'][0];
              // Implement the navigation to the website
            },
          );
        },
      ),
    );
  }
}