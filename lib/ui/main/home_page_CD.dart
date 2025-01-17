import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quanlychitieu/controllers/chitieu_controller.dart';

class HomePageCd extends StatelessWidget {
  const HomePageCd({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      children: [
        _row('Đơn vị tiền tệ',const Text('VND'), 0),
        _row('Quỹ chi tiêu',const Text('100.000.000 VND'), 10),
        _row('Đặt lại',const Text('Hàng tháng'), 10 ),
        _row('Màu nền',Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: const Color(0xff14D210),
          ),
        ), 10),
        _row('Xoá data',Container(), 10, tap: () {
          ChitieuController().ClearData();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Center(child: Text('Data cleared'))),
          );
        }),
      ],
    );
  }

  Widget _row(String leftItem,Widget rightItem, double top,{VoidCallback? tap}) {
    return GestureDetector(
      onTap: tap ?? () => print('null'),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 11).copyWith(top: top),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        padding: const EdgeInsets.all(19),
        child: Row(
          children: [
            Text(
              leftItem,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
            const Spacer(),
            rightItem
          ],
        ),
      ),
    );
  }
}
