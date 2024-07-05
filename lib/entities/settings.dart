import 'dart:ui';

import 'package:quanlychitieu/entities/static_variable.dart';
import 'package:quanlychitieu/ultils/enums/color_extension.dart';

class Settings {
  late String NgonNgu;
  late String DonViTienTe;
  late Color MauSac;

  Settings.origin(){
    NgonNgu = public_Enum.language;
    DonViTienTe = public_Enum.donvi;
    MauSac = public_Enum.colorMainBackground;
  }


  Settings.fromJson(Map<String,dynamic> json){
    NgonNgu = json['NgonNgu'];
    DonViTienTe = json['DonViTienTe'];
    MauSac = HexColor(json['MauSac']);
  }

  Map<String,dynamic> toJson(){
    Map<String,dynamic> json = {
      "NgonNgu": NgonNgu,
      "DonViTienTe" : DonViTienTe,
      "MauSac" : MauSac.toHex()
    };

    return json;
  }

}