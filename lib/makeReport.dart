import 'package:flutter/material.dart';

class MakeReport extends StatefulWidget {
  const MakeReport({Key? key}) : super(key: key);

  @override
  State<MakeReport> createState() => _MakeReportState();
}

class _MakeReportState extends State<MakeReport> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _tipo = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Generar Reporte")),
      body: Container(
        margin: EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DropdownButtonFormField(
                value: _tipo,
                items: const [
                  DropdownMenuItem<String>(
                    child: Text('Tipo de insidente:'),
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
                    _tipo = value!;
                  });
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Descripcion"),
                maxLines: null,
                keyboardType: TextInputType.multiline,
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return 'Falta la descripcion';
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Lugar"),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Falta el lugar';
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
      ),
    );
  }
}
