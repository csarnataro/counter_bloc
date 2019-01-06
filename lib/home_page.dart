import 'package:flutter/material.dart';
import 'counter_provider.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final counterBloc = CounterProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: StreamBuilder(
        initialData: 0,
        stream: counterBloc.count,
        builder: (context, snapshot) =>
          Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '${snapshot.data}',
                style: Theme.of(context).textTheme.display1,
              ),
            ],
          ),
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () { 
          print('Button pressed'); 
          counterBloc.increment.add(1);
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
