import 'package:flutter/material.dart';
import 'package:terra_reports/views/create_report.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Terra",
              style: TextStyle(fontSize: 22, color: Colors.white),
            ),
            Text(
              "Reports",
              style: TextStyle(fontSize: 22, color: Colors.white),
            )
          ],
        ),
        backgroundColor: Colors.green[700],
        elevation: 0.0,
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => CreateReport()));
        },
        backgroundColor: Colors.green[700],
        child: const Icon(Icons.add_to_photos),
      ),
    );
  }
}
