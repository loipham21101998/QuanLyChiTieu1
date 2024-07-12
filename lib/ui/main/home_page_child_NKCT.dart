import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:quanlychitieu/controllers/chitieu_controller.dart';
import 'package:quanlychitieu/entities/taochitieu/chitieu.dart';
import 'package:realm/realm.dart';
import 'package:intl/intl.dart';

class HomePageChildNkct extends StatefulWidget {
  const  HomePageChildNkct({super.key});

  @override
  State<HomePageChildNkct> createState() => _HomePageChildNkctState();
}

class _HomePageChildNkctState extends State<HomePageChildNkct> {
   RealmResults<ChiTieu>? dataSource;
   double? total;
   final oCcy = NumberFormat("#,##0", "vi_VN");
   bool _isLoading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // ChitieuController().LoadAll().then((v,e) => setState(() {
    //       dataSource = v;
    //       total = e;
    //     }));
    loadData();
  }

  Future<void> loadData() async{
    var result = await ChitieuController().LoadAll();
    setState((){
      dataSource = result.$1;
      total = result.$2;
      _isLoading = false;
    });

  }

  @override
  Widget build(BuildContext context) {

      return
        !_isLoading ?
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 11).copyWith(top: 8),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              color: Colors.white,
            ),
            child: ListView.separated(
              //padding: const EdgeInsets.all(14),
                separatorBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 19),
                    height: 1,
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Color(0xffC0C0C0), width: 1))),
                  );
                },
                itemCount: dataSource?.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    onTap: () => print('TapTap'),
                    leading: const CircleAvatar(),
                    title: Text(
                      dataSource![index].TenCT,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    subtitle: Text(
                       '${DateFormat.EEEE(context.locale.toString()).format(dataSource![index].Ngay)}'
                           ' - ${DateFormat('dd-MM-yyyy').format(dataSource![index].Ngay)}',
                      style: const TextStyle(fontSize: 15),
                    ),
                    trailing: Column(
                      children: [
                        const SizedBox(
                          height: 29,
                        ),
                        Text(
                          oCcy.format(dataSource![index].Tien),
                          style: const TextStyle(fontSize: 15),
                        )
                      ],
                    ),
                  );
                }),
          )) :
        const Center(child: CircularProgressIndicator());


  }
}
