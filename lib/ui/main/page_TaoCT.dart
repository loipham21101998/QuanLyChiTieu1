import 'package:flutter/material.dart';

import '../../ultils/enums/main_page.dart';
import 'main_home_page.dart';

class PageTaoCt extends StatelessWidget {
  final String loaiCT;

  const PageTaoCt({super.key, required this.loaiCT});

  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
  }

  Widget _buildBody(BuildContext context) {
    MainPage _mainPage = MainPage.TaoChiTieu;
    String daySelected = (DateTime.now().day.toString() +
        '/' +
        DateTime.now().month.toString() +
        '/' +
        DateTime.now().year.toString());
    final maxLines = 5;
    return Scaffold(
      backgroundColor: const Color(0xff14D210),
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(_mainPage.TitleAppBar()),
        backgroundColor: const Color(0xff14D210),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 11).copyWith(top: 8),
        padding: const EdgeInsets.all(19),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 40,
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(left: 10),
                          height: 80,
                          // decoration: BoxDecoration(
                          //   border: Border.all(color:const Color(0xff14D210),width: 2)
                          // ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Loại chi tiêu',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                loaiCT,
                                style: const TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Số tiền:',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          height: maxLines * 22.0,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 2),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20))),
                          child: TextField(
                            maxLines: maxLines,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Tên chi tiêu:',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          height: maxLines * 22.0,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 2),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20))),
                          child: TextField(
                            maxLines: maxLines,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Ngày:',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.all(0),
                            ),
                            onPressed: () {
                              showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2101),
                              ).then(
                                (selectedDate) {
                                  if (selectedDate != null) {
                                    // daySelected = selectedDate;
                                  }
                                },
                              );
                            },
                            child: Container(
                              alignment: Alignment.centerLeft,
                              padding: const EdgeInsets.all(19),
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.black, width: 2),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20))),
                              child: Text(
                                daySelected.toString(),
                                style: const TextStyle(
                                    fontSize: 15, color: Colors.black),
                              ),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MainHomePage()));
              },
              child: Container(
                width: 333,
                alignment: Alignment.center,
                // margin: EdgeInsets.symmetric(horizontal: 19).copyWith(bottom: 20),
                padding: const EdgeInsets.symmetric(vertical: 19),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xff14D210), width: 2),
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  color: const Color(0xff14D210),
                ),
                child: const Text(
                  'Lưu',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MainHomePage()));
              },
              child: Container(
                width: 333,
                alignment: Alignment.center,
                margin: const EdgeInsets.fromLTRB(0, 10, 0, 1),
                padding: const EdgeInsets.symmetric(vertical: 19),
                decoration: BoxDecoration(
                    border:
                        Border.all(color: const Color(0xff14D210), width: 2),
                    borderRadius: const BorderRadius.all(Radius.circular(20))),
                child: const Text(
                  'Thoát',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
