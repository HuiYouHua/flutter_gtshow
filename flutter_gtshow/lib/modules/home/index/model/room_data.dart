import 'package:json_annotation/json_annotation.dart';

part 'room_data.g.dart';


List<RoomData> getRoomDataList(List<dynamic> list){
  List<RoomData> result = [];
  list.forEach((item){
    result.add(RoomData.fromJson(item));
  });
  return result;
}
@JsonSerializable()
class RoomData extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'xy_star_id')
  int xyStarId;

  @JsonKey(name: 'live')
  bool live;

  @JsonKey(name: 'voice_live')
  bool voiceLive;

  @JsonKey(name: 'ktv_live')
  bool ktvLive;

  @JsonKey(name: 'pic')
  String pic;

  @JsonKey(name: 'nick_name')
  String nickName;

  @JsonKey(name: 'grey_mark')
  bool greyMark;

  @JsonKey(name: 'allowed_recomm')
  int allowedRecomm;

  @JsonKey(name: 'real_sex')
  int realSex;

  @JsonKey(name: 'type')
  int type;

  @JsonKey(name: 'live_type')
  int liveType;

  @JsonKey(name: 'live_status')
  int liveStatus;

  @JsonKey(name: 'voice_type')
  int voiceType;

  @JsonKey(name: 'obs_switch')
  int obsSwitch;

  @JsonKey(name: 'pic_url')
  String picUrl;

  @JsonKey(name: 'app_pic_url')
  String appPicUrl;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'song_price')
  int songPrice;

  @JsonKey(name: 'position')
  Position position;

  @JsonKey(name: 'live_end_time')
  int liveEndTime;

  @JsonKey(name: 'total_live_sec')
  int totalLiveSec;

  @JsonKey(name: 'followers')
  int followers;

  @JsonKey(name: 'audit_app_pic_url')
  String auditAppPicUrl;

  @JsonKey(name: 'audit_app_pic_status')
  int auditAppPicStatus;

  @JsonKey(name: 'labels')
  List<dynamic> labels;

  @JsonKey(name: 'timestamp')
  int timestamp;

  @JsonKey(name: 'bean')
  int bean;

  @JsonKey(name: 'benefit_total')
  int benefitTotal;

  @JsonKey(name: 'visiter_count')
  int visiterCount;

  @JsonKey(name: 'found_time')
  int foundTime;

  @JsonKey(name: 'corner_v6')
  Corner corner_v6;

  @JsonKey(name: 'label')
  String label;

  @JsonKey(name: 'live_id')
  String liveId;

  @JsonKey(name: 'credit')
  int credit;

  @JsonKey(name: 'heat')
  int heat;

  @JsonKey(name: 'heatb')
  int heatb;

  @JsonKey(name: 'room_retention_sort')
  int roomRetentionSort;

  @JsonKey(name: 'extension_type')
  int extensionType;

  @JsonKey(name: 'hot_card_effect')
  bool hotCardEffect;

  @JsonKey(name: 'heat_versions')
  Heat_versions heatVersions;

  @JsonKey(name: 'vtype')
  int vtype;

  @JsonKey(name: 'v_type')
  int vType;

  RoomData(this.id,this.xyStarId,this.live,this.voiceLive,this.ktvLive,this.pic,this.nickName,this.greyMark,this.allowedRecomm,this.realSex,this.type,this.liveType,this.liveStatus,this.voiceType,this.obsSwitch,this.picUrl,this.appPicUrl,this.title,this.songPrice,this.position,this.liveEndTime,this.totalLiveSec,this.followers,this.auditAppPicUrl,this.auditAppPicStatus,this.labels,this.timestamp,this.bean,this.benefitTotal,this.visiterCount,this.foundTime,this.corner_v6,this.label,this.liveId,this.credit,this.heat,this.heatb,this.roomRetentionSort,this.extensionType,this.hotCardEffect,this.heatVersions,this.vtype,this.vType,);

  factory RoomData.fromJson(Map<String, dynamic> srcJson) => _$RoomDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$RoomDataToJson(this);

}


@JsonSerializable()
class Position extends Object {

  @JsonKey(name: 'province')
  String province;

  @JsonKey(name: 'city')
  String city;

  @JsonKey(name: 'region')
  String region;

  @JsonKey(name: 'coordinate_x')
  String coordinateX;

  @JsonKey(name: 'coordinate_y')
  String coordinateY;

  Position(this.province,this.city,this.region,this.coordinateX,this.coordinateY,);

  factory Position.fromJson(Map<String, dynamic> srcJson) => _$PositionFromJson(srcJson);

  Map<String, dynamic> toJson() => _$PositionToJson(this);

}


@JsonSerializable()
class Corner extends Object {

  @JsonKey(name: 'left_img')
  String left_img;

  @JsonKey(name: 'middle_img')
  String middle_img;

  @JsonKey(name: 'right_img')
  String right_img;

  @JsonKey(name: 'text')
  String text;

  Corner(this.left_img,this.middle_img,this.right_img,this.text,);

  factory Corner.fromJson(Map<String, dynamic> srcJson) => _$CornerFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CornerToJson(this);

}


@JsonSerializable()
class Heat_versions extends Object {

  @JsonKey(name: 'new_user')
  int newUser;

  @JsonKey(name: 'old_user')
  int oldUser;

  Heat_versions(this.newUser,this.oldUser,);

  factory Heat_versions.fromJson(Map<String, dynamic> srcJson) => _$Heat_versionsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$Heat_versionsToJson(this);

}


