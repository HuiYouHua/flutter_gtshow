import 'dart:ui';
import 'package:redux/redux.dart';

/// Created by 华惠友
/// on 2020/10/27 5:09 PM
/// description: 语言相关Redux

///分析:
///Redux主要由三部分组成: Store\ Action\ Reducer
/// Store: 用于存储和管理 State [ State一般指你发生变化所影响的对象, 比如这里用的是系统的多语言对象Locale, 同时也可以是自定义的某个对象, 比如 user_redux 中自定义的 User 对象]
/// Action: 用于定义一个数据变化的请求行为 [ 一般指一个类, 该类的作用是用来发起 State 的改变, 比如你改变某个State时, 需要发出信息, 此时就只需要构建这个 Action 发出去就可以了, 例如: store.dispatch(RefreshLocaleAction(store.state.platformLocale)) ]
/// Reducer: 用于根据Action产生新状态, 一般是一个方法 [ 顾名思义, reducer是我们的状态生成器, 它接收一个我们原来的状态, 然后再接收一个 action, 再匹配(这里指的是对action的匹配)这个action来生成一个新的状态 ]
///
/// 流程一般是:
/// 1.创建State
/// 2.创建action
/// 3.创建reducer
/// 4.创建store, 一般在应用顶层main函数中创建,然后向下传递
/// 5.在需要的地方获取store, 使用store中的state来渲染 widget
/// 6.发出action

/// 这里的combineReducers 指的是: 将action和函数进行绑定, 看内部源码及范例
/// 因为action中会对应一个State对象, 而在不同情形下对State对象可能会产生不同的效果, 比如对User对象, 可能有添加\更新\删除等操作, 那么在Reducer中会对应有不同的处理方式
/// 如果在不同的业务情形下, 发出相同的action, 那么我们在对应的Reducer中就需要进行 多个 if else 代码对不同的Action.state进行匹配, 这样的话可能会造成业务混乱
/// 因此我们可以选择将一个Action中对某个State对象不同的操作更新 拆分为 多个 Action, 每个Action中只处理一种情况, 这样我们就不需要在 Reducer 中进行大量的 if else 判断
/// 然后我们使用 combineReducers 将对应的action和函数进行绑定
/// 组织成一个绑定多个Action 的组合 Reducer 进行使用
/// 即: combineReducers的作用就是将原始 reducer 中的多个if else 进行拆分为 相应的 Action 进行处理, 减少业务复杂度
///  combineReducers的返回值是一个带两个参数的方法
///  typedef Reducer<State> = State Function(State state, dynamic action);
final localeReducer = combineReducers<Locale>([
  ///combineReducers 需要指定一个 State 泛型, 所有要绑定的action 必须只能对这一个 State 进行处理
  ///TypedReducer接收两个泛型, State 和 Action, 初始化时接收一个 Reducer方法
  ///TypedReducer是Redux提供的默认Reducer响应, 一般采用这种方式
  TypedReducer<Locale, RefreshLocaleAction>(_refresh),
]);

/// 创建Reducer, 是一个方法
/// 根据传递进来的action来获取发生变化的内容 [action.locale]
/// 再进行action匹配, 构造变化后的State对象, 返回出去 [locale = action.locale]
Locale _refresh(Locale locale, RefreshLocaleAction action) {
  locale = action.locale;
  return locale;
}

/// 这里定义了一个action, 持有一个State: 系统的多语言 Locale
/// 此外, 你也可以自定义State, 用于Action持有
class RefreshLocaleAction {
  final Locale locale;

  RefreshLocaleAction(this.locale);
}
