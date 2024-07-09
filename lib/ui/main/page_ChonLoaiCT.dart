import 'package:flutter/material.dart';
import 'package:quanlychitieu/entities/danhmucchitieu/danhmuc_chitieu.dart';
import 'package:quanlychitieu/ui/main/page_TaoCT.dart';
import 'package:realm/realm.dart';

import '../../ultils/enums/color_extension.dart';
import '../../ultils/enums/main_page.dart';
import 'main_home_page.dart';

class PageChonLoaiCt extends StatefulWidget {
  const PageChonLoaiCt({super.key});



  @override
  State<PageChonLoaiCt> createState() => _PageChonLoaiCtState();
}

class _PageChonLoaiCtState extends State<PageChonLoaiCt> {

  late RealmResults<DanhMucChitieu> categories;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var config = Configuration.local([DanhMucChitieu.schema]);
    var realm = Realm(config);

    categories = realm.all<DanhMucChitieu>();
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
  }

  Widget _buildBody(BuildContext context) {
    MainPage _mainPage = MainPage.ChonLoai;
    return Scaffold(
      backgroundColor: const Color(0xff14D210),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(_mainPage.TitleAppBar()),
        backgroundColor: const Color(0xff14D210),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 11).copyWith(top: 8),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Expanded(
              child: GridView.count(
                primary: false,
                padding: const EdgeInsets.all(19),
                crossAxisSpacing: 19,
                childAspectRatio: 0.7538461538461538,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                children: categories.map((e) => _column(context,e.id.toString(),e.Ten,IconData(int.parse(e.icon), fontFamily: 'MaterialIcons') , HexColor(e.iconColor))).toList()
                ,
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context,
                    MaterialPageRoute(builder: (context) => const MainHomePage()));
              },
              child: Container(
                width: 333,
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 19).copyWith(bottom: 20),
                padding: const EdgeInsets.symmetric(vertical: 19),
                decoration: BoxDecoration(
                  border: Border.all(color:const Color(0xff14D210),width: 2),
                  borderRadius: const BorderRadius.all(Radius.circular(20))
                ),
                child: const Text('Thoát', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _column(BuildContext context, String id ,String name,IconData icon,Color iconColor) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => PageTaoCt(loaiCT: name,dmID: id,)));
      },
      child: Column(children: [
          CircleAvatar(
            backgroundColor: Colors.purpleAccent,
          radius: 49,
          child: Icon(icon , color: iconColor,size: 35,),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: Text(
            name,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
      ]),
    );
  }
}
