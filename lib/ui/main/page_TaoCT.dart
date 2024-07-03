import 'package:flutter/material.dart';

import '../../ultils/enums/main_page.dart';

class PageTaoCt extends StatefulWidget {
  const PageTaoCt({super.key});

  @override
  State<PageTaoCt> createState() => _PageTaoCtState();
}

class _PageTaoCtState extends State<PageTaoCt> {
  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody(){
    MainPage _mainPage = MainPage.TaoChiTieu;
    return Placeholder();
  }
}
