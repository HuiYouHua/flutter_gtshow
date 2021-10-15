/// Created by 华惠友
/// on 2020/10/28 3:33 PM
/// description: 
import 'package:json_annotation/json_annotation.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'data.g.dart';


/// 根据json 生成模型 https://caijinglong.github.io/json2dart/index.html
///json反序列化步骤
/// 1.创建模型文件, 文件名小写
/// 2.头部加上@JsonSerializable() 注解
/// 3.加上 part '文件名.g.dart', Person.g.dart 和 文件名 需要保持一致，否则执行以下命令无效
/// 4.加上fromJson()、toJson() 方法, fromJson()、toJson() 方法的写法是固定模式，按模板修改即可, 方法的实现在生成的文件中
/// 5.在根目录，执行 flutter packages pub run build_runner build 指令生成 文件名.g.dart 文件
/// JsonKey 表示 json字符串的 key是 mergeBaseCommit, 而转成的模型字段名叫 merge_base_commit

@JsonSerializable()
class Data extends Object {

  @JsonKey(name: 'by')
  String by;

  @JsonKey(name: 'descendants')
  int descendants;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'kids')
  List<int> kids;

  @JsonKey(name: 'score')
  int score;

  @JsonKey(name: 'time')
  int time;

  @JsonKey(name: 'title', nullable: false)
  String title;

  @JsonKey(name: 'type')
  String type;

  @JsonKey(name: 'url')
  String url;

  @JsonKey(name: 'mergeBaseCommit')
  String mergeBaseCommit;

  Data({this.by,this.descendants,this.id,this.kids,this.score,this.time,this.type,this.url,this.mergeBaseCommit,this.title});

  factory Data.fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);

}