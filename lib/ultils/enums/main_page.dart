import 'package:easy_localization/easy_localization.dart';


enum MainPage{
  TrangChu,NhatKy,TaoChiTieu,ThongKe,CaiDat,ChonLoai
}

extension MainPageExtension on MainPage{
  String TitleAppBar(){
    switch(this){
      case MainPage.TrangChu:
        return 'appbar_homepage'.tr();
      case MainPage.NhatKy:
        return 'appbar_details'.tr();
      case MainPage.ThongKe:
        return 'appbar_Statistical'.tr();
      case MainPage.CaiDat:
        return 'appbar_settings'.tr();
      case MainPage.ChonLoai:
        return 'appbar_select_type'.tr();
      case MainPage.TaoChiTieu:
        return 'appbar_create_spending'.tr();
    }
  }
}