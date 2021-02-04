import 'package:bloc_counter/counter_bloc.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      title: 'Flutter demo',
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final counterBloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StreamBuilder(
              initialData: 0,
              stream: counterBloc.counterStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    '${snapshot.data}',
                    style: TextStyle(fontSize: 24),
                  );
                }
                
              }),
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                onPressed: () {
                  counterBloc.eventSink.add(CounterAction.Increment);
                },
                child: Icon(Icons.add),
              ),
              FloatingActionButton(
                onPressed: () {
                  counterBloc.eventSink.add(CounterAction.Decrement);
                },
                child: Icon(Icons.drive_file_move),
              ),
              FloatingActionButton(
                onPressed: () {
                  counterBloc.eventSink.add(CounterAction.Reload);
                },
                child: Icon(Icons.airline_seat_recline_normal_rounded),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
