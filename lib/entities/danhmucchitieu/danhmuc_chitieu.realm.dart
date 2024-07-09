// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'danhmuc_chitieu.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class DanhMucChitieu extends $DanhMucChitieu
    with RealmEntity, RealmObjectBase, RealmObject {
  DanhMucChitieu(
    ObjectId id,
    String Ten,
    String icon,
    String iconColor,
  ) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'Ten', Ten);
    RealmObjectBase.set(this, 'icon', icon);
    RealmObjectBase.set(this, 'iconColor', iconColor);
  }

  DanhMucChitieu._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get Ten => RealmObjectBase.get<String>(this, 'Ten') as String;
  @override
  set Ten(String value) => RealmObjectBase.set(this, 'Ten', value);

  @override
  String get icon => RealmObjectBase.get<String>(this, 'icon') as String;
  @override
  set icon(String value) => RealmObjectBase.set(this, 'icon', value);

  @override
  String get iconColor =>
      RealmObjectBase.get<String>(this, 'iconColor') as String;
  @override
  set iconColor(String value) => RealmObjectBase.set(this, 'iconColor', value);

  @override
  Stream<RealmObjectChanges<DanhMucChitieu>> get changes =>
      RealmObjectBase.getChanges<DanhMucChitieu>(this);

  @override
  Stream<RealmObjectChanges<DanhMucChitieu>> changesFor(
          [List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<DanhMucChitieu>(this, keyPaths);

  @override
  DanhMucChitieu freeze() => RealmObjectBase.freezeObject<DanhMucChitieu>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'id': id.toEJson(),
      'Ten': Ten.toEJson(),
      'icon': icon.toEJson(),
      'iconColor': iconColor.toEJson(),
    };
  }

  static EJsonValue _toEJson(DanhMucChitieu value) => value.toEJson();
  static DanhMucChitieu _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        'id': EJsonValue id,
        'Ten': EJsonValue Ten,
        'icon': EJsonValue icon,
        'iconColor': EJsonValue iconColor,
      } =>
        DanhMucChitieu(
          fromEJson(id),
          fromEJson(Ten),
          fromEJson(icon),
          fromEJson(iconColor),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(DanhMucChitieu._);
    register(_toEJson, _fromEJson);
    return SchemaObject(
        ObjectType.realmObject, DanhMucChitieu, 'DanhMucChitieu', [
      SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
      SchemaProperty('Ten', RealmPropertyType.string),
      SchemaProperty('icon', RealmPropertyType.string),
      SchemaProperty('iconColor', RealmPropertyType.string),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
