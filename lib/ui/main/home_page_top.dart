import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:quanlychitieu/controllers/chitieu_controller.dart';
import 'package:intl/intl.dart';
import 'package:quanlychitieu/entities/static_variable.dart';
List<String> items = ['Hàng tháng', 'Theo quý', 'Năm nay'];

class HomePage extends StatefulWidget {
  final Widget body;

  const HomePage({super.key, required this.body});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double? total;
  final oCcy = NumberFormat("#,##0", "vi_VN");
  bool _isLoading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    LoadData();
  }

  Future<void> LoadData() async{
    var data = await ChitieuController().LoadAll();
    setState(() {
      total = data.$2;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return !_isLoading ?
      Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const DropdownTop(),
        Row(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 30),
              child: const Text(
                'Quỹ chi tiêu: ',
                style: TextStyle(
                    fontSize: 15,
                    color: Color(0xff0C7209),
                    fontWeight: FontWeight.bold),
              ),
            ),
            const Spacer(),
            Container(
              margin: const EdgeInsets.only(right: 28),
              child: Text(
                '${oCcy.format(public_Enum.hanmuc)} VND ',
                style: const TextStyle(
                    fontSize: 15,
                    color: Color(0xff0C7209),
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        _buildTop(),
        widget.body,
      ],
    ) :
        const Center(child: CircularProgressIndicator(),);
  }

  Widget _buildTop() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 11).copyWith(top: 10),
      // width: 380,
      // height: 88,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child:  Padding(
        padding: const EdgeInsets.only(top: 19, bottom: 19, left: 19, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                const Text(
                  'Đã chi tiêu:',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  '- ${oCcy.format(total)} VND',
                  style: const TextStyle(
                      color: Color(0xffFF1313),
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 6,
            ),
             Row(
              children: [
                const Text(
                  'Quỹ còn lại:',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  '${oCcy.format(public_Enum.hanmuc - total!)} VND',
                  style: const TextStyle(
                      color: Color(0xff14D210),
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DropdownTop extends StatefulWidget {
  const DropdownTop({super.key});

  @override
  State<DropdownTop> createState() => _DropdownTopState();
}

class _DropdownTopState extends State<DropdownTop> {
  String dropdownValue = items.first;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 30,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20)
      ),
      margin: const EdgeInsets.only(left: 11,bottom: 10),
      child: Padding(
        padding: const EdgeInsets.only(left: 19,right: 16),
        child: DropdownButton<String>(
          value: dropdownValue,
          isExpanded: true,
          iconSize: 30,
          onChanged: (String? value) {
            setState(() {
              dropdownValue = value!;
            });
          },
          underline: Container(
            height: 2,
            color: Colors.transparent,
          ),
          items: items.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
     
    );
  }
}
