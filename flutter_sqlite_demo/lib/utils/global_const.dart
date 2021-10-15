

/*全局常量 宏定义*/
class GlobalConst {
  // true: Release环境, false: Debug和Profile环境
  static bool isProduction = const bool.fromEnvironment("dart.vm.product");
}