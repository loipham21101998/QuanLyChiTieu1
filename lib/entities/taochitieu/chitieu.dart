import 'package:realm/realm.dart';  // import realm package

part 'chitieu.realm.dart'; // declare a part file.

@RealmModel()
class $ChiTieu{
  @PrimaryKey()
  late ObjectId id;
  late String TenCT;
  late double Tien;
  late DateTime Ngay;
  late String DanhMucID;
}