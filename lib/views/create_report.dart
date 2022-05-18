import 'dart:io';

import 'package:flutter/material.dart';

class CreateReport extends StatefulWidget {
  const CreateReport({Key? key}) : super(key: key);

  @override
  State<CreateReport> createState() => _CreateReportState();
}

class _CreateReportState extends State<CreateReport> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String type = '';
  String description = '';
  String location = '';

  File? selectedImage = null;
  bool _isLoading = false;

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
        actions: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(Icons.file_upload),
          )
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            GestureDetector(
                onTap: () {
                  // getImage();
                },
                child: selectedImage != null
                    ? Container(
                        margin: EdgeInsets.symmetric(horizontal: 16),
                        height: 170,
                        width: MediaQuery.of(context).size.width,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: Image.file(
                            selectedImage!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    : Container(
                        margin: EdgeInsets.symmetric(horizontal: 16),
                        height: 170,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6)),
                        width: MediaQuery.of(context).size.width,
                        child: Icon(
                          Icons.add_a_photo,
                          color: Colors.black45,
                        ),
                      )),
            SizedBox(
              height: 8,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DropdownButtonFormField(
                      value: type,
                      items: const [
                        DropdownMenuItem<String>(
                          child: Text('Tipo de incidente:'),
                          value: '',
                        ),
                        DropdownMenuItem<String>(
                          child: Text('Agua'),
                          value: 'agua',
                        ),
                        DropdownMenuItem<String>(
                          child: Text('Tierra'),
                          value: 'tierra',
                        ),
                        DropdownMenuItem<String>(
                          child: Text('Fuego'),
                          value: 'fuego',
                        ),
                        DropdownMenuItem<String>(
                          child: Text('Aire'),
                          value: 'aire',
                        ),
                      ],
                      onChanged: (String? value) {
                        setState(() {
                          type = value!;
                        });
                      },
                      validator: (value) {
                        if (value == null || value == "")
                          return 'Falta el tipo';
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration:
                          const InputDecoration(labelText: "Descripcion"),
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      onChanged: (String? value) {
                        setState(() {
                          description = value!;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty)
                          return 'Falta la descripcion';
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(labelText: "Lugar"),
                      onChanged: (String? value) {
                        setState(() {
                          location = value!;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty)
                          return 'Falta el lugar';
                        return null;
                      },
                    ),
                    SizedBox(height: 100),
                    ElevatedButton(
                        child: Text("Guardar"),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            print("to bien");
                          }
                        })
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
