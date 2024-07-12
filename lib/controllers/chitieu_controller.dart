import 'package:quanlychitieu/entities/taochitieu/chitieu.dart';
import 'package:realm/realm.dart';

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
}
