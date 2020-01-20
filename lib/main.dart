import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String name = 'mohamed';
  int phoneNumber = 0114590;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Form Widget'),
        ),
        body: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Enter Name'),
                onSaved: (String value) {
                  name = value;
                  print('data saved sucessifully');
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Enter Phone'),
                onSaved: (String value) {
                  phoneNumber = int.parse(value);
                  print('data saved sucessifully');
                },
              ),
              RaisedButton(
                child: Text('Save Data'),
                onPressed: () {
                  setState(() {
                    formKey.currentState.save();
                    print('//////////done');
                  });
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(name),
              Text(phoneNumber.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
