import 'dart:async';

import 'package:rxdart/subjects.dart';

class CounterBloc {

  int counter = 0;

  final BehaviorSubject<int> _counter =
      BehaviorSubject<int>(seedValue: 0);

  final StreamController<int> _incrementController =
      StreamController<int>();    


  Sink<int> get increment => _incrementController.sink;
  Stream<int> get count => _counter.stream;

  CounterBloc() {
    _incrementController.stream.listen((increment) {
      print('In bloc: received increment');
      counter += increment;
      _counter.add(counter);
    });
  }

}