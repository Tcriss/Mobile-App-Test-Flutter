import 'package:flutter/material.dart';

class ToolboxPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/Toolbox.png',
            width: 200,
            height: 200,
          ),
          SizedBox(height: 20),
          Text(
            'Toolbox App',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Esta es una caja de herramientas',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}