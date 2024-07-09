import 'package:quanlychitieu/entities/taochitieu/chitieu.dart';
import 'package:realm/realm.dart';

class ChitieuController{

  Future<void> TaoMoiChiTieu(ChiTieu ct) async {
    var config = Configuration.local([ChiTieu.schema]);
    var realm = Realm(config);

    await realm.writeAsync(() => realm.add(ct));
  }

}