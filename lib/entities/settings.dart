import 'dart:ui';

import 'package:quanlychitieu/entities/static_variable.dart';
import 'package:quanlychitieu/ultils/enums/color_extension.dart';

class Settings {
  late String NgonNgu;
  late String DonViTienTe;
  late Color MauSac;
  late double HanMuc;
  Settings.origin(){
    NgonNgu = public_Enum.language;
    DonViTienTe = public_Enum.donvi;
    MauSac = public_Enum.colorMainBackground;
    HanMuc = public_Enum.hanmuc;
  }


  Settings.fromJson(Map<String,dynamic> json){
    NgonNgu = json['NgonNgu'];
    DonViTienTe = json['DonViTienTe'];
    MauSac = HexColor(json['MauSac']);
    HanMuc = json['HanMuc'];
  }

  Map<String,dynamic> toJson(){
    Map<String,dynamic> json = {
      "NgonNgu": NgonNgu,
      "DonViTienTe" : DonViTienTe,
      "MauSac" : MauSac.toHex(),
      "HanMuc" : HanMuc
    };

    return json;
  }

}