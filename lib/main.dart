import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Konversi Celcius',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: const MyHomePage(title: 'Konversi Celcius'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _celcius = 0;
  double _kelvin = 0;
  double _fahrenheit = 0;
  double _reamur = 0;


  void _convert() {
    setState(() {
      _fahrenheit = _celcius * 1.8 + 32;
      _kelvin = _celcius + 273;
      _reamur = _celcius * 0.8;
    });
  }

  @override
  Widget build(BuildContext context) {
    TextField inputField = TextField(
      decoration: const InputDecoration(hintText: 'Masukkan nilai dalam satuan Celcius'),
      keyboardType: TextInputType.number,
      onChanged: (str) {
        try {
          _celcius = double.parse(str);
        } catch (e) {
          _celcius = 0.0;
        }
      },
      );

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      
    
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
              child: Column(children: <Widget>[
            Container(
              margin: EdgeInsets.all(30),
              child: inputField,
            ),
            Container(
                margin: EdgeInsets.all(30),
                child: OutlinedButton(
                  onPressed: _convert,
                  child: Text('Convert'),
                )),
            Container(
                margin: EdgeInsets.all(5),
                child: Column(
                  children: <Widget>[
                    Text('Suhu Fahrenheit:'),
                    Text('${double.parse((_fahrenheit).toStringAsFixed(2)) } °F',
                      style: TextStyle(
                          color: Colors.grey[800],
                          fontWeight: FontWeight.bold,
                          fontSize: 40
                          )
                      ),
                  ],
                ), 
                ),
            Container(
                margin: EdgeInsets.all(5),
                child: Column(
                  children: <Widget>[
                    Text('Suhu Kelvin:'),
                    Text('${double.parse((_kelvin).toStringAsFixed(2)) } °Ré',
                      style: TextStyle(
                          color: Colors.grey[800],
                          fontWeight: FontWeight.bold,
                          fontSize: 40
                          )
                    ),
                  ],
                ), 
              ),
              Container(
                margin: EdgeInsets.all(5),
                child: Column(
                  children: <Widget>[
                    Text('Suhu Reamur:'),
                    Text('${double.parse((_reamur).toStringAsFixed(2)) } °Ré',
                      style: TextStyle(
                          color: Colors.grey[800],
                          fontWeight: FontWeight.bold,
                          fontSize: 40
                          )
                    ),
                  ],
                ), 
              ),
          ])),
    );
  }
}
