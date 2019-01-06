import 'package:flutter/widgets.dart';
import './counter_bloc.dart';

class CounterProvider extends InheritedWidget {
  final CounterBloc counterBloc;

  CounterProvider({
    Key key,
    CounterBloc cartBloc,
    Widget child,
  })  : counterBloc = cartBloc ?? CounterBloc(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static CounterBloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(CounterProvider) as CounterProvider)
          .counterBloc;
}