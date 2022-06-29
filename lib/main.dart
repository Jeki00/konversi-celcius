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
        primarySwatch: Colors.teal,
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
  bool _state = false;
  double _input = 0;
  double _output = 0;

  @override
  Widget build(BuildContext context) {
    TextField inputField = TextField(
      decoration: InputDecoration(labelText: "Masukkan nilai dalam satuan ${_state == false ? "Celcius" : "Fahrenheit"}"),
      keyboardType: TextInputType.number,
      onChanged: (str) {
        try {
          _input = double.parse(str);
        } catch (e) {
          _input = 0.0;
        }
      },
      );

    AppBar appBar = AppBar(
      title: Text("Temperature Calculator"),
    );
    
    Container tempSwitch = Container(
      padding: EdgeInsets.all(15.0),
      child: Row(
        children:<Widget>[
          Text("Pilih satuan yang ingin dicari :   "),
          Text("°F"),
          Radio(value: false, groupValue: _state, onChanged: (v) {
                setState(() {
                  _state= false;
                });
              }),
          Text("°C"),
          Radio(value: true, groupValue: _state, onChanged: (v) {
                setState(() {
                  _state= true;
                });
              }),
        ]
      ),
    );

    Container convertBtn = Container(
      padding: EdgeInsets.all(15.0),
      child: OutlinedButton(
        child:Text("convert"), 
        onPressed: (){
          setState(() {
           _state == false ? _output = (_input * 1.8) + 32 : _output = (_input - 32) * 5/9;      
          });
          AlertDialog dialog = AlertDialog(
            content: _state == false? Text(" ${_output.toStringAsFixed(2)} °F" ):Text("${_output.toStringAsFixed(2)} °C" ) ,
          );
          showDialog(
            context: context, 
            builder: (context){
              return dialog;
            },
          );
        },
        style: OutlinedButton.styleFrom(
          primary: Colors.white,
          backgroundColor: Colors.teal,
        ),
        ),
    );

    return Scaffold(
      appBar: appBar,
      body: Container(
        padding:EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            tempSwitch,
            inputField,
            convertBtn,
          ],
        ),
      ),
    );
  }
}
