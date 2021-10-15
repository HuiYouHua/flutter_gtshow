/// Created by 华惠友
/// on 2021/10/13 5:26 PM
/// description:

class Address {
  static const String host = "memeyule.com";
  static const String BASE_URL_RELEASE = "test_api";


  ///精选 get
  static jingxuangList({GTServer server = GTServer.release, GTServerModule module = GTServerModule.cryolite, GTServerVersion version = GTServerVersion.v0}) {
    String serStr = convertServerToString(server);
    String moduleStr = convertServerModuleToString(module);
    String versionStr = convertGTServerVersionToString(version);
    return "https://$serStr$moduleStr.$host/api/$versionStr/jingxuan-rooms";
  }



  ///环境枚举转为字符
  static String convertServerToString(GTServer server) {
    switch (server) {
      case GTServer.develop:
        return "dev-";
      case GTServer.test:
        return "test-";
      case GTServer.gray:
        return "grey-";
      case GTServer.release:
        return "";
    }
  }

  ///环境枚举转为描述
  static String convertServerToDes(GTServer server) {
    switch (server) {
      case GTServer.develop:
        return "开发服务器";
      case GTServer.test:
        return "正式服务器";
      case GTServer.gray:
        return "灰度服务器";
      case GTServer.release:
        return "测试服务器";
    }
  }

  static String convertServerModuleToString(GTServerModule server) {
    switch (server) {
      case GTServerModule.api:
        return "api-";
      case GTServerModule.flint:
        return "flint";
      case GTServerModule.amber:
        return "amber";
      case GTServerModule.pebble:
        return "pebble";
      case GTServerModule.lava:
        return "lava";
      case GTServerModule.pay:
        return "pay";
      case GTServerModule.cryolite:
        return "cryolite";
      case GTServerModule.spark:
        return "spark";
    }
  }

  static String convertGTServerVersionToString(GTServerVersion server) {
    switch (server) {
      case GTServerVersion.v0:
        return "v0";
      case GTServerVersion.v1:
        return "v1";
      case GTServerVersion.v2:
        return "v2";
      case GTServerVersion.v3:
        return "v3";
      case GTServerVersion.v4:
        return "v4";
      case GTServerVersion.v5:
        return "v5";
      case GTServerVersion.v6:
        return "v6";
      case GTServerVersion.v7:
        return "v7";
    }
  }
}

enum GTServer { develop, test, gray, release }

enum GTServerModule {
  api,
  flint,
  amber,
  pebble,
  lava,
  pay,
  cryolite,
  spark
}

enum GTServerVersion { v0, v1, v2, v3, v4, v5, v6, v7 }
