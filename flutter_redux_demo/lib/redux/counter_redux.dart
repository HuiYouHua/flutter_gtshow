import 'package:redux/redux.dart';

/// Created by 华惠友
/// on 2020/10/28 11:17 AM
/// description: 


final counterReducer = combineReducers<int>([
  TypedReducer<int, CounterAction>(_refreshCounterReducer)
]);



int _refreshCounterReducer(int counter, CounterAction action) {
  counter = action.counter;
  return counter;
}


class CounterAction {
  int counter = 0;

  CounterAction({this.counter});
}

