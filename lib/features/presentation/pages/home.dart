import 'package:flutter/material.dart';
import 'package:interntask/features/presentation/pages/settings.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFEAECF0),
      appBar: AppBar(
        backgroundColor: Color(0xFF2044FF),
        title: const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Hi Vigneshwaran K',
            style: TextStyle(
              color: Colors.white,
              fontSize: 23.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'Euclid'
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  SettingsPage()),
              );
            },
          ),
        ],
      ),
      body: Center()
    );
  }
}
