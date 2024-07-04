import 'package:flutter/material.dart';
import 'package:quanlychitieu/ui/main/page_TaoCT.dart';

import '../../ultils/enums/main_page.dart';
import 'main_home_page.dart';

class PageChonLoaiCt extends StatelessWidget {
  const PageChonLoaiCt({super.key});

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
                children: [
                  _column(context, 'Ăn uống'),
                  _column(context, 'Giải trí'),
                  _column(context, 'Du lịch'),
                  _column(context, 'Tiền điện'),
                ],
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

  Widget _column(BuildContext context, String name) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => PageTaoCt(loaiCT: name)));
      },
      child: Column(children: [
        const CircleAvatar(
          radius: 49,
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
