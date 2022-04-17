import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

//void main() => runApp(MyApp());

class MyAppExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  DateTime selectedDate = DateTime.now();
  String? formattedDate;
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        formattedDate = DateFormat('MMM y').format(selectedDate);
        //formattedDate = DateFormat('kk:mm:ss \n EEE d MMM YYYY').format(selectedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            //Text("${selectedDate.month}".split(' ')[0]),
            Text(formattedDate.toString()),
            SizedBox(height: 20.0,),
            RaisedButton(
              onPressed: () => _selectDate(context),
              child: Text('Select date'),
            ),
          ],
        ),
      ),
    );
  }
}



class TabBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('kk:mm:ss \n EEE d MMM').format(now);
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.access_alarm),text: "Alarm",),
                Tab(icon: Icon(Icons.access_time),text:"Clock" ,),
                Tab(icon: Icon(Icons.timer),text:"Timer"),
              ],
            ),
            title: Text('Tabs Demo'),backgroundColor: Colors.black,
          ),
          body: TabBarView(
            children: [
              Icon(Icons.access_alarm),
              Center(child: Text(formattedDate,textAlign: TextAlign.center,style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 25.0),)),
              Icon(Icons.timer),
            ],
          ),
        ),
      ),
    );
  }
}
