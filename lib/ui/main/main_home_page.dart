import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quanlychitieu/ui/main/home_page_child_NKCT.dart';
import 'package:quanlychitieu/ui/main/home_page_child_TC.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:quanlychitieu/ui/main/page_ChonLoaiCT.dart';
import '../../ultils/enums/main_page.dart';
import 'home_page_CD.dart';
import 'home_page_TK.dart';
import 'home_page_top.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({super.key});

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  MainPage _mainPage = MainPage.TrangChu;
  int _currentPage = 0;
  List<Widget> _pages = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pages = [
      const HomePage(key: ValueKey(1), body: HomePageChildTc()),
      const HomePage(key: ValueKey(2), body: HomePageChildNkct()),
      //const PageChonLoaiCt(key: ValueKey(3)),
      const HomePageTk(key: ValueKey(4)),
      const HomePageCd(key: ValueKey(5))
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff14D210),
      appBar: AppBar(
        centerTitle: true,
        title: Text(_mainPage.TitleAppBar()),
        actions: [DropdownLang(contextMain: context,)],
        backgroundColor: const Color(0xff14D210),
      ),
      body: AnimatedSwitcher(
          duration: const Duration(microseconds: 1000),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          child: _pages.elementAt(_currentPage)),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xffFFFFFF),
        unselectedItemColor: const Color(0xffC0C0C0),
        selectedItemColor: const Color(0xff14D210),
        currentIndex: _currentPage,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            if (index != 2) {
              _currentPage = index;
              _mainPage = MainPage.values[index];
            }
          });
        },
        items: [
          const BottomNavigationBarItem(
              icon: Icon(Icons.add), label: 'Trang chủ'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.abc), label: 'Nhật ký CT'),
          BottomNavigationBarItem(
              icon: Container(
                margin: const EdgeInsets.only(bottom: 24),
              ),
              label: 'Tạo chi tiêu',
              backgroundColor: Colors.transparent),
          const BottomNavigationBarItem(
              icon: Icon(Icons.abc), label: 'Thống kê'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.abc), label: 'Cài đặt'),
        ],
      ),
      floatingActionButton: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
            color: const Color(0xff0C7209),
            borderRadius: BorderRadius.circular(70 / 2)),
        child: IconButton(
          onPressed: () {
            // setState(() {
            //   _currentPage = 2;
            //   _mainPage = MainPage.values[_currentPage];
            // });
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context)=> const PageChonLoaiCt())
            );
          },
          icon: const Icon(
            Icons.add,
            size: 50,
          ),
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

final List<String> langs = ['vi', 'en'];

class DropdownLang extends StatefulWidget {
  BuildContext contextMain;
  DropdownLang({super.key ,required this.contextMain});

  @override
  State<DropdownLang> createState() => _DropdownLangState();
}

class _DropdownLangState extends State<DropdownLang> {

  late String dropdownValue ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dropdownValue = langs.where((v) => v == widget.contextMain.locale.toString()).first;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 14.5),
      child: DropdownButton<String>(
        value: dropdownValue,
        iconSize: 0,
        icon:
            const Visibility(visible: false, child: Icon(Icons.arrow_downward)),
        onChanged: (String? value) {
          widget.contextMain.setLocale(Locale(value!));
          setState(() {
            dropdownValue = value;
          });
        },
        underline: Container(
          height: 2,
          color: Colors.transparent,
        ),
        items: langs.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            alignment: Alignment.center,
            value: value,
            child: _iconLang(value),
          );
        }).toList(),
      ),
    );
  }

  Widget _iconLang(String lang) {
    return Container(
      width: 30,
      height: 20,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: lang == 'vi' ? Colors.red : Colors.blue),
    );
  }
}
