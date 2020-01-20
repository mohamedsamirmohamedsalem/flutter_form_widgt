import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String name = '';
  int phoneNumber = 0114590;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GestureDetector(
        onTap: () {
          //this for auto close keyboard when taping in any white space in screen
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Scaffold(
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
                  autovalidate: false,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'name is required';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                    decoration: InputDecoration(labelText: 'Enter Phone'),
                    onSaved: (String value) {
                      phoneNumber = int.parse(value.isEmpty ? "0" : value);
                      print('data saved sucessifully');
                    },
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'phone is required';
                      }
                      if (!RegExp(r'^(?:[1-9]\d*|0)(?:\.\d+)?$')
                          .hasMatch(value)) {
                        return 'You must enter a number';
                      }
                      return null;
                    }),
                RaisedButton(
                  child: Text('Save Data'),
                  onPressed: () {
                    setState(() {
                      formKey.currentState.validate();
                      formKey.currentState.save();
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
      ),
    );
  }
}
