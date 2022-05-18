import 'package:flutter/material.dart';
import 'package:terra_reports/makeReport.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _onItemTapped(int index) {
    if (index == 1) {
      print("sss");

      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return MakeReport();
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Reportes')),
      body: Container(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.cloud_upload),
            label: 'Sync',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_to_photos),
            label: 'Agregar',
          ),
        ],
        selectedItemColor: Colors.green[800],
        unselectedItemColor: Colors.green[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
