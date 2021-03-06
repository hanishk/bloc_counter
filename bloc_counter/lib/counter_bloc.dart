import 'dart:async';

// create action enum for events
enum CounterAction { Increment, Decrement, Reload }

class CounterBloc {
  int counter;
  // first StreamController or pipe for counter
  // ignore: close_sinks
  final _streamController = StreamController<int>();

//input the data through sink
  StreamSink<int> get _counterSink => _streamController.sink;

  //show output through stream
  Stream<int> get counterStream => _streamController.stream;

//create another streamcontroller for event whenever button clicks

  // ignore: close_sinks
  final _eventStreamController = StreamController<CounterAction>();
  StreamSink<CounterAction> get eventSink => _eventStreamController.sink;
  Stream<CounterAction> get _eventStream => _eventStreamController.stream;

  //constructor which is always listening event action

  CounterBloc() {
    counter = 0;
    _eventStream.listen((event) {
      if (event == CounterAction.Increment) {
        counter++;
      } else if (event == CounterAction.Decrement) {
        counter--;
      } else if (event == CounterAction.Reload) {
        counter = 0;
      }
      // counter is the input to countersink
      _counterSink.add(counter);
    });
  }

  void dispose() {
    _streamController.close();
    _eventStreamController.close();
  }
}
