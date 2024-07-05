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


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  readLocalSetting();

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

Future<void> readLocalSetting() async{
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
