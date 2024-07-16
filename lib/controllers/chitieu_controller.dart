import 'dart:math';

import 'package:quanlychitieu/entities/static_variable.dart';
import 'package:quanlychitieu/entities/taochitieu/chitieu.dart';
import 'package:realm/realm.dart';

import '../entities/DanhMucThongKe.dart';
import '../entities/danhmucchitieu/danhmuc_chitieu.dart';

class ChitieuController {
  Future<void> TaoMoiChiTieu(ChiTieu ct) async {
    var config = Configuration.local([ChiTieu.schema]);
    var realm = Realm(config);

    await realm.writeAsync(() => realm.add(ct));
  }

  Future<(RealmResults<ChiTieu>, double total)> LoadAll() async {
    var config = Configuration.local([ChiTieu.schema]);
    var realm = Realm(config);
    var a = realm.all<ChiTieu>();
    double total = 0;
    a.forEach((e) => total += e.Tien);
    return (a, total);
  }

  void ClearData() {
    try {
      var config = Configuration.local([ChiTieu.schema]);
      var realm = Realm(config);
      print('Delete Data');
      realm.write(() => realm.deleteAll<ChiTieu>());
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  Future<List<Danhmucthongke>> loadDanhMucThongKe() async {
    var config = Configuration.local([DanhMucChitieu.schema]);
    var realm = Realm(config);
    var listDM = realm.all<DanhMucChitieu>();
    return listDM.map<Danhmucthongke>((e) {
      config = Configuration.local([ChiTieu.schema]);
      var realm = Realm(config);
      var listCT = realm.all<ChiTieu>().query(r'DanhMucID == $0', [e.id.toString()]);
      double total = 0;
      if (listCT.length > 0) listCT.forEach((e) => total += e.Tien);
      int percent = ((total / public_Enum.hanmuc) * 100).round();
      return Danhmucthongke(e.Ten, percent, total);
    }).toList();
  }
}
