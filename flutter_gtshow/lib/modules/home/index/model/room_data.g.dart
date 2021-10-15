// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoomData _$RoomDataFromJson(Map<String, dynamic> json) {
  return RoomData(
    json['id'] as int,
    json['xy_star_id'] as int,
    json['live'] as bool,
    json['voice_live'] as bool,
    json['ktv_live'] as bool,
    json['pic'] as String,
    json['nick_name'] as String,
    json['grey_mark'] as bool,
    json['allowed_recomm'] as int,
    json['real_sex'] as int,
    json['type'] as int,
    json['live_type'] as int,
    json['live_status'] as int,
    json['voice_type'] as int,
    json['obs_switch'] as int,
    json['pic_url'] as String,
    json['app_pic_url'] as String,
    json['title'] as String,
    json['song_price'] as int,
    json['position'] == null
        ? null
        : Position.fromJson(json['position'] as Map<String, dynamic>),
    json['live_end_time'] as int,
    json['total_live_sec'] as int,
    json['followers'] as int,
    json['audit_app_pic_url'] as String,
    json['audit_app_pic_status'] as int,
    json['labels'] as List,
    json['timestamp'] as int,
    json['bean'] as int,
    json['benefit_total'] as int,
    json['visiter_count'] as int,
    json['found_time'] as int,
    json['corner_v6'] == null
        ? null
        : Corner.fromJson(json['corner_v6'] as Map<String, dynamic>),
    json['label'] as String,
    json['live_id'] as String,
    json['credit'] as int,
    json['heat'] as int,
    json['heatb'] as int,
    json['room_retention_sort'] as int,
    json['extension_type'] as int,
    json['hot_card_effect'] as bool,
    json['heat_versions'] == null
        ? null
        : Heat_versions.fromJson(json['heat_versions'] as Map<String, dynamic>),
    json['vtype'] as int,
    json['v_type'] as int,
  );
}

Map<String, dynamic> _$RoomDataToJson(RoomData instance) => <String, dynamic>{
      'id': instance.id,
      'xy_star_id': instance.xyStarId,
      'live': instance.live,
      'voice_live': instance.voiceLive,
      'ktv_live': instance.ktvLive,
      'pic': instance.pic,
      'nick_name': instance.nickName,
      'grey_mark': instance.greyMark,
      'allowed_recomm': instance.allowedRecomm,
      'real_sex': instance.realSex,
      'type': instance.type,
      'live_type': instance.liveType,
      'live_status': instance.liveStatus,
      'voice_type': instance.voiceType,
      'obs_switch': instance.obsSwitch,
      'pic_url': instance.picUrl,
      'app_pic_url': instance.appPicUrl,
      'title': instance.title,
      'song_price': instance.songPrice,
      'position': instance.position,
      'live_end_time': instance.liveEndTime,
      'total_live_sec': instance.totalLiveSec,
      'followers': instance.followers,
      'audit_app_pic_url': instance.auditAppPicUrl,
      'audit_app_pic_status': instance.auditAppPicStatus,
      'labels': instance.labels,
      'timestamp': instance.timestamp,
      'bean': instance.bean,
      'benefit_total': instance.benefitTotal,
      'visiter_count': instance.visiterCount,
      'found_time': instance.foundTime,
      'corner_v6': instance.corner_v6,
      'label': instance.label,
      'live_id': instance.liveId,
      'credit': instance.credit,
      'heat': instance.heat,
      'heatb': instance.heatb,
      'room_retention_sort': instance.roomRetentionSort,
      'extension_type': instance.extensionType,
      'hot_card_effect': instance.hotCardEffect,
      'heat_versions': instance.heatVersions,
      'vtype': instance.vtype,
      'v_type': instance.vType,
    };

Position _$PositionFromJson(Map<String, dynamic> json) {
  return Position(
    json['province'] as String,
    json['city'] as String,
    json['region'] as String,
    json['coordinate_x'] as String,
    json['coordinate_y'] as String,
  );
}

Map<String, dynamic> _$PositionToJson(Position instance) => <String, dynamic>{
      'province': instance.province,
      'city': instance.city,
      'region': instance.region,
      'coordinate_x': instance.coordinateX,
      'coordinate_y': instance.coordinateY,
    };

Corner _$CornerFromJson(Map<String, dynamic> json) {
  return Corner(
    json['left_img'] as String,
    json['middle_img'] as String,
    json['right_img'] as String,
    json['text'] as String,
  );
}

Map<String, dynamic> _$CornerToJson(Corner instance) => <String, dynamic>{
      'left_img': instance.left_img,
      'middle_img': instance.middle_img,
      'right_img': instance.right_img,
      'text': instance.text,
    };

Heat_versions _$Heat_versionsFromJson(Map<String, dynamic> json) {
  return Heat_versions(
    json['new_user'] as int,
    json['old_user'] as int,
  );
}

Map<String, dynamic> _$Heat_versionsToJson(Heat_versions instance) =>
    <String, dynamic>{
      'new_user': instance.newUser,
      'old_user': instance.oldUser,
    };
