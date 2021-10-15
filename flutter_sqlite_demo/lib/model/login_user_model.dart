
LoginUserModel globalLoginUser = LoginUserModel();

class LoginUserModel {
  String refreshToken;
  int myPrivilegeCount;
  String passWord;
  bool logOff;
  User user;
  List<String> recommendPhrase;
  String phoneNumber;
  String userName;
  String token;
  int rechargeCount;

  static setCurrentLoginUser(LoginUserModel loginUserModel) {
    globalLoginUser = loginUserModel;
  }

  LoginUserModel(
      {this.refreshToken,
        this.myPrivilegeCount,
        this.passWord,
        this.logOff,
        this.user,
        this.recommendPhrase,
        this.phoneNumber,
        this.userName,
        this.token,
        this.rechargeCount});

  LoginUserModel.fromJson(Map<String, dynamic> json) {
    refreshToken = json['refreshToken'];
    myPrivilegeCount = json['myPrivilegeCount'];
    passWord = json['passWord'];
    logOff = json['log_off'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    if (json['recommendPhrase'] != null) {
      recommendPhrase = new List<String>();
      json['recommendPhrase'].forEach((v) {
        recommendPhrase.add(v);
      });
    }
    phoneNumber = json['phoneNumber'];
    userName = json['userName'];
    token = json['token'];
    rechargeCount = json['recharge_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['refreshToken'] = this.refreshToken;
    data['myPrivilegeCount'] = this.myPrivilegeCount;
    data['passWord'] = this.passWord;
    data['log_off'] = this.logOff;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    if (this.recommendPhrase != null) {
      data['recommendPhrase'] =
          this.recommendPhrase.map((v) => v.toString()).toList();
    }
    data['phoneNumber'] = this.phoneNumber;
    data['userName'] = this.userName;
    data['token'] = this.token;
    data['recharge_count'] = this.rechargeCount;
    return data;
  }
}

class User {
  int bankInfoVerify;
  int timestamp;
  Finance finance;
  String nickName;
  String accessToken;
  String userName;
  int vipExpires;
  bool mobileBind;
  bool firstLogin;
  bool realAuthed;
  int years;
  String pic;
  bool canCreatChatPage;
  int spend;
  int mmNo;
  DetailInfo detailInfo;
  String location;
  int vipHiding;
  bool status;
  String via;
  int id;
  int followers;
  int constellation;
  int iId;
  Rongcloud rongcloud;
  int vip;
  int priv;
  String nickname;
  bool isTemp;
  int master;
  int beanRank;
  int sex;
  bool enabledAppPush;

  User(
      {this.bankInfoVerify,
        this.timestamp,
        this.finance,
        this.nickName,
        this.accessToken,
        this.userName,
        this.vipExpires,
        this.mobileBind,
        this.firstLogin,
        this.realAuthed,
        this.years,
        this.pic,
        this.canCreatChatPage,
        this.spend,
        this.mmNo,
        this.detailInfo,
        this.location,
        this.vipHiding,
        this.status,
        this.via,
        this.id,
        this.followers,
        this.constellation,
        this.iId,
        this.rongcloud,
        this.vip,
        this.priv,
        this.nickname,
        this.isTemp,
        this.master,
        this.beanRank,
        this.sex,
        this.enabledAppPush});

  User.fromJson(Map<String, dynamic> json) {
    bankInfoVerify = json['bank_info_verify'];
    timestamp = json['timestamp'];
    finance =
    json['finance'] != null ? new Finance.fromJson(json['finance']) : null;
    nickName = json['nick_name'];
    accessToken = json['access_token'];
    userName = json['user_name'];
    vipExpires = json['vip_expires'];
    mobileBind = json['mobile_bind'];
    firstLogin = json['first_login'];
    realAuthed = json['real_authed'];
    years = json['years'];
    pic = json['pic'];
    canCreatChatPage = json['canCreatChatPage'];
    spend = json['spend'];
    mmNo = json['mm_no'];
    detailInfo = json['detail_info'] != null
        ? new DetailInfo.fromJson(json['detail_info'])
        : null;
    location = json['location'];
    vipHiding = json['vip_hiding'];
    status = json['status'];
    via = json['via'];
    id = json['id'];
    followers = json['followers'];
    constellation = json['constellation'];
    iId = json['_id'];
    rongcloud = json['rongcloud'] != null
        ? new Rongcloud.fromJson(json['rongcloud'])
        : null;
    vip = json['vip'];
    priv = json['priv'];
    nickname = json['nickname'];
    isTemp = json['isTemp'];
    master = json['master'];
    beanRank = json['bean_rank'];
    sex = json['sex'];
    enabledAppPush = json['enabled_app_push'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bank_info_verify'] = this.bankInfoVerify;
    data['timestamp'] = this.timestamp;
    if (this.finance != null) {
      data['finance'] = this.finance.toJson();
    }
    data['nick_name'] = this.nickName;
    data['access_token'] = this.accessToken;
    data['user_name'] = this.userName;
    data['vip_expires'] = this.vipExpires;
    data['mobile_bind'] = this.mobileBind;
    data['first_login'] = this.firstLogin;
    data['real_authed'] = this.realAuthed;
    data['years'] = this.years;
    data['pic'] = this.pic;
    data['canCreatChatPage'] = this.canCreatChatPage;
    data['spend'] = this.spend;
    data['mm_no'] = this.mmNo;
    if (this.detailInfo != null) {
      data['detail_info'] = this.detailInfo.toJson();
    }
    data['location'] = this.location;
    data['vip_hiding'] = this.vipHiding;
    data['status'] = this.status;
    data['via'] = this.via;
    data['id'] = this.id;
    data['followers'] = this.followers;
    data['constellation'] = this.constellation;
    data['_id'] = this.iId;
    if (this.rongcloud != null) {
      data['rongcloud'] = this.rongcloud.toJson();
    }
    data['vip'] = this.vip;
    data['priv'] = this.priv;
    data['nickname'] = this.nickname;
    data['isTemp'] = this.isTemp;
    data['master'] = this.master;
    data['bean_rank'] = this.beanRank;
    data['sex'] = this.sex;
    data['enabled_app_push'] = this.enabledAppPush;
    return data;
  }
}

class Finance {
  int beanCount;
  int coinSpendTotal;
  int beanCountTotal;
  int coinCount;

  int aaa() {
    return  coinSpendTotal;
  }

  Finance(
      {this.beanCount,
        this.coinSpendTotal,
        this.beanCountTotal,
        this.coinCount});

  Finance.fromJson(Map<String, dynamic> json) {
    beanCount = json['bean_count'];
    coinSpendTotal = json['coin_spend_total'];
    beanCountTotal = json['bean_count_total'];
    coinCount = json['coin_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bean_count'] = this.beanCount;
    data['coin_spend_total'] = this.coinSpendTotal;
    data['bean_count_total'] = this.beanCountTotal;
    data['coin_count'] = this.coinCount;
    return data;
  }
}

class DetailInfo {
  bool mobileBind;
  String mobile;

  DetailInfo({this.mobileBind, this.mobile});

  DetailInfo.fromJson(Map<String, dynamic> json) {
    mobileBind = json['mobile_bind'];
    mobile = json['mobile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mobile_bind'] = this.mobileBind;
    data['mobile'] = this.mobile;
    return data;
  }
}

class Rongcloud {
  int timestamp;
  String token;

  Rongcloud({this.timestamp, this.token});

  Rongcloud.fromJson(Map<String, dynamic> json) {
    timestamp = json['timestamp'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['timestamp'] = this.timestamp;
    data['token'] = this.token;
    return data;
  }
}