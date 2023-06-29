import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage('https://media.licdn.com/dms/image/D4E03AQHxTerydQQxTQ/profile-displayphoto-shrink_800_800/0/1669209473629?e=1693440000&v=beta&t=QVhDoDdbbNR_kAkIKPbx40AUCVWzCOrOAKlVJNAbsIE'),
              radius: 90,
            ),
            SizedBox(height: 20),
            Text('Cristian A. Tejeda Rojas',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 10),
            Text('Correo electrónico: cristiantejeda14@gmail.com',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text('Teléfono: +1 849-456-2740',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}