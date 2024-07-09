import 'package:flutter/material.dart';
import 'package:realm/realm.dart';  // import realm package

part 'danhmuc_chitieu.realm.dart'; // declare a part file.

@RealmModel()
class $DanhMucChitieu {
  @PrimaryKey()
  late ObjectId id;
  late String Ten;
  late String icon;
  late String iconColor;


}