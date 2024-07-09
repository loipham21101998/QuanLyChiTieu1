// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chitieu.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class ChiTieu extends $ChiTieu with RealmEntity, RealmObjectBase, RealmObject {
  ChiTieu(
    ObjectId id,
    String TenCT,
    double Tien,
    DateTime Ngay,
    String DanhMucID,
  ) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'TenCT', TenCT);
    RealmObjectBase.set(this, 'Tien', Tien);
    RealmObjectBase.set(this, 'Ngay', Ngay);
    RealmObjectBase.set(this, 'DanhMucID', DanhMucID);
  }

  ChiTieu._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get TenCT => RealmObjectBase.get<String>(this, 'TenCT') as String;
  @override
  set TenCT(String value) => RealmObjectBase.set(this, 'TenCT', value);

  @override
  double get Tien => RealmObjectBase.get<double>(this, 'Tien') as double;
  @override
  set Tien(double value) => RealmObjectBase.set(this, 'Tien', value);

  @override
  DateTime get Ngay => RealmObjectBase.get<DateTime>(this, 'Ngay') as DateTime;
  @override
  set Ngay(DateTime value) => RealmObjectBase.set(this, 'Ngay', value);

  @override
  String get DanhMucID =>
      RealmObjectBase.get<String>(this, 'DanhMucID') as String;
  @override
  set DanhMucID(String value) => RealmObjectBase.set(this, 'DanhMucID', value);

  @override
  Stream<RealmObjectChanges<ChiTieu>> get changes =>
      RealmObjectBase.getChanges<ChiTieu>(this);

  @override
  Stream<RealmObjectChanges<ChiTieu>> changesFor([List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<ChiTieu>(this, keyPaths);

  @override
  ChiTieu freeze() => RealmObjectBase.freezeObject<ChiTieu>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'id': id.toEJson(),
      'TenCT': TenCT.toEJson(),
      'Tien': Tien.toEJson(),
      'Ngay': Ngay.toEJson(),
      'DanhMucID': DanhMucID.toEJson(),
    };
  }

  static EJsonValue _toEJson(ChiTieu value) => value.toEJson();
  static ChiTieu _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        'id': EJsonValue id,
        'TenCT': EJsonValue TenCT,
        'Tien': EJsonValue Tien,
        'Ngay': EJsonValue Ngay,
        'DanhMucID': EJsonValue DanhMucID,
      } =>
        ChiTieu(
          fromEJson(id),
          fromEJson(TenCT),
          fromEJson(Tien),
          fromEJson(Ngay),
          fromEJson(DanhMucID),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(ChiTieu._);
    register(_toEJson, _fromEJson);
    return SchemaObject(ObjectType.realmObject, ChiTieu, 'ChiTieu', [
      SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
      SchemaProperty('TenCT', RealmPropertyType.string),
      SchemaProperty('Tien', RealmPropertyType.double),
      SchemaProperty('Ngay', RealmPropertyType.timestamp),
      SchemaProperty('DanhMucID', RealmPropertyType.string),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
