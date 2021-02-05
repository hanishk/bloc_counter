import 'package:blocprovider_counter/business_logic/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title, this.color}) : super(key: key);

  final String title;
  final Color color;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) {
                if (state.wasIncremented == true) {
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text('Incremented'),
                    duration: Duration(milliseconds: 300),
                  ));
                } else if (state.wasIncremented == false) {
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text('Decremented'),
                    duration: Duration(milliseconds: 300),
                  ));
                }
              },
              builder: (context, state) {
                if (state.counterValue < 0) {
                  return Text(
                    "Negative" + state.counterValue.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  );
                } else if (state.counterValue % 2 == 0) {
                  return Text(
                    "hmm Even" + state.counterValue.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  );
                } else if (state.counterValue == 5) {
                  return Text(
                    "hmm 5" + state.counterValue.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  );
                } else {
                  return Text(
                    state.counterValue.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  );
                }
              },
            ),
            // Bloc Builder
            // BlocBuilder<CounterCubit, CounterState>(
            //   builder: (context, state) {
            //     if (state.counterValue < 0) {
            //       return Text(
            //         "Negative" + state.counterValue.toString(),
            //         style: Theme.of(context).textTheme.headline4,
            //       );
            //     } else if (state.counterValue % 2 == 0) {
            //       return Text(
            //         "hmm Even" + state.counterValue.toString(),
            //         style: Theme.of(context).textTheme.headline4,
            //       );
            //     } else if (state.counterValue == 5) {
            //       return Text(
            //         "hmm 5" + state.counterValue.toString(),
            //         style: Theme.of(context).textTheme.headline4,
            //       );
            //     } else {
            //       return Text(
            //         state.counterValue.toString(),
            //         style: Theme.of(context).textTheme.headline4,
            //       );
            //     }
            //   },
            // ),
            Row(
              children: [
                FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).decrement();
                    //or
                    // context.read()<CounterCubit>().decrement();
                  },
                  tooltip: '',
                  child: Icon(Icons.remove),
                ),
                FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).increment();
                  },
                  tooltip: 'Increment',
                  child: Icon(Icons.add),
                ),
              ],
            ),
            SizedBox(
              height: 24,
            ),
            MaterialButton(
              color: widget.color,
              onPressed: () => null,
              child: Text('Go to  Second Screen'),
            )
          ],
        ),
      ),
    );
  }
}
