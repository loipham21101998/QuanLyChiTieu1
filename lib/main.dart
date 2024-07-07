import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:quanlychitieu/entities/settings.dart';
import 'package:quanlychitieu/entities/static_variable.dart';
import 'package:quanlychitieu/ui/main/main_home_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quanlychitieu/ultils/enums/color_extension.dart';
import 'package:realm/realm.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'entities/danhmuc_chitieu.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  readLocalSetting();
  if(await _isFirstStart()){
    createDefaultCategory();
  }


  runApp(EasyLocalization(
      supportedLocales: const [Locale("vi"), Locale("en")],
      path: 'assets/translate',
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QuanLyChiTieu',
      routes: {
        '/home': (context) => const MainHomePage()
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: GoogleFonts.roboto().fontFamily
      ),
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      home: const MainHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}


Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();
  return directory.path;
}

Future<File> get _localFile async {
  final path = await _localPath;
  return File('$path/settings.json');
}

Future<bool> checkFileExists() async {
  final file = await _localFile;
  return file.exists();
}

Future<void> readLocalSetting() async {
  bool check = await checkFileExists();
  if(check){
    final file = await _localFile;
    String content = file.readAsStringSync();
    dynamic json = jsonDecode(content);
    var s = Settings.fromJson(json);
    public_Enum.colorMainBackground = s.MauSac;
    public_Enum.donvi = s.DonViTienTe;
    public_Enum.language = s.NgonNgu;
  }else{
    final file = await _localFile;
    String json = jsonEncode(Settings.origin());
    file.writeAsStringSync(json);
  }

}

Future<bool> _isFirstStart() async {
  try {
    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final result = prefs.getBool('firstRun');
    return result ?? false;
  } catch (e) {
    return false;
  }
}

Future<void> createDefaultCategory() async{
var config = Configuration.local([DanhMucChitieu.schema]);
var realm = Realm(config);

var categories = {
    DanhMucChitieu(ObjectId(),'Ăn uống',Icons.food_bank_outlined.codePoint.toString(),Colors.white.toHex()),
    DanhMucChitieu(ObjectId(),'Tiền điện',Icons.electric_bolt_outlined.codePoint.toString(),Colors.white.toHex()),
    DanhMucChitieu(ObjectId(),'Du lịch',Icons.travel_explore.codePoint.toString(),Colors.white.toHex()),
};

await realm.writeAsync(() => realm.addAll(categories));
SharedPreferences.getInstance().then((o)=>o.setBool('firstRun', false));

//print('=========================== Thu muc Realm : ${Configuration.defaultRealmPath} ===================================');

}