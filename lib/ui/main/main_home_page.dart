import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quanlychitieu/ui/main/home_page_child_NKCT.dart';
import 'package:quanlychitieu/ui/main/home_page_child_TC.dart';

import '../../ultils/enums/main_page.dart';
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
      const HomePage(key : ValueKey(1),body:HomePageChildTc()),
      const HomePage(key: ValueKey(2),body: HomePageChildNkct()),
      Container(
       key:  const ValueKey(3),
        color: Colors.yellow,
      ),
      Container(
        key:   const ValueKey(4),
        color: Colors.blue,
      ),
      Container(
        key:  const ValueKey(5),
        color: Colors.purple,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff14D210),
      appBar: AppBar(
        centerTitle: true,
        title: Text(_mainPage.TitleAppBar()),
        backgroundColor: const Color(0xff14D210),
      ),
      body: AnimatedSwitcher(
          duration: const Duration(microseconds: 1000),
          transitionBuilder: (Widget child, Animation<double> animation) {
           return FadeTransition(opacity: animation,child: child,);
          },
          child: _pages.elementAt(_currentPage)
      ),
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
          onPressed: () {},
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
