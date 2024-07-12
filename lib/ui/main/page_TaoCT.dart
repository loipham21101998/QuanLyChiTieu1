import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:quanlychitieu/controllers/chitieu_controller.dart';
import 'package:quanlychitieu/entities/taochitieu/chitieu.dart';
import 'package:realm/realm.dart';

import '../../ultils/enums/main_page.dart';
import 'main_home_page.dart';

class PageTaoCt extends StatefulWidget {
  final String loaiCT;
  final String dmID;

  const PageTaoCt({super.key, required this.loaiCT,required this.dmID});

  @override
  State<PageTaoCt> createState() => _PageTaoCtState();
}

class _PageTaoCtState extends State<PageTaoCt> {
  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
  }

  Widget _buildBody(BuildContext context) {
    MainPage _mainPage = MainPage.TaoChiTieu;
    final moneyCTL = TextEditingController();
    final tenCTCTL = TextEditingController();
    var selectDatetime = DateTime.now();
    String daySelected = (DateTime.now().day.toString() +
        '/' +
        DateTime.now().month.toString() +
        '/' +
        DateTime.now().year.toString());
    final ngayCTL = TextEditingController(text: daySelected);

    final maxLines = 5;

    return Scaffold(
      backgroundColor: const Color(0xff14D210),
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(_mainPage.TitleAppBar()),
        backgroundColor: const Color(0xff14D210),
      ),
      resizeToAvoidBottomInset: true,
      body: LayoutBuilder(
          builder: (context, constraints){
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight
                ),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 11).copyWith(top: 8),
                  padding: const EdgeInsets.all(19),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    color: Colors.white,
                  ),
                  child: IntrinsicHeight(
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
                                            widget.loaiCT,
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
                                        controller: moneyCTL,
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
                                        controller: tenCTCTL,
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
                                                selectDatetime = selectedDate;
                                               ngayCTL.text = DateFormat('dd-MM-yyyy').format(selectedDate);
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
                                            ngayCTL.text,
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
                          onTap: () async {
                            // Navigator.push(context,
                            //     MaterialPageRoute(builder: (context) => MainHomePage()));
                            print('==========================Tien =========================='+moneyCTL.value.text);
                            print('==========================TEN =========================='+tenCTCTL.text);
                            final ct = ChiTieu(
                                ObjectId(),tenCTCTL.text,double.parse(moneyCTL.value.text),
                                selectDatetime,widget.dmID
                            );
                            await ChitieuController().TaoMoiChiTieu(ct);
                            Navigator.popUntil(context,ModalRoute.withName('/') );
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
                             Navigator.popUntil(context,ModalRoute.withName('/') );

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
                ),
              ),
            );
          }

      ),
    );
  }


}
