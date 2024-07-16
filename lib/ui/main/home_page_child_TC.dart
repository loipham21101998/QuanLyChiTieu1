import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:quanlychitieu/controllers/chitieu_controller.dart';


import '../../entities/DanhMucThongKe.dart';
class HomePageChildTc extends StatefulWidget {
  const HomePageChildTc({super.key});

  @override
  State<HomePageChildTc> createState() => _HomePageChildTcState();
}

class _HomePageChildTcState extends State<HomePageChildTc> {
  final numf = NumberFormat("#,##0", "vi_VN");

  List<Danhmucthongke>? list ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    load();
  }

  Future<void> load() async{
    var result = await ChitieuController().loadDanhMucThongKe();
    setState(() {
      list = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    return Expanded(
        child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 11).copyWith(top:8),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              color: Colors.white,),
            child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 1.45794392523,
              controller: ScrollController(keepScrollOffset: false),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.only(top:20,right: 20,left: 20),
              crossAxisSpacing: 18,
              mainAxisSpacing: 7,
              children: list?.map<Widget>((e) => _buildItemGrid(e.name, e.tolal,e.percent)).toList()?? [],
            )
        ));
  }

  Widget _buildItemGrid(String name, double total,int percent){
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color:const Color(0xff14D210),width: 2)
      ),
      child:  Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             Row(
              children: [
                const CircleAvatar(),
                const Spacer(),
                Text(name,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
              ],
            ),
            const Spacer(),
            Row(
              children: [
                Text('$percent%',style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                const Spacer(),
                Column(
                  children: [
                    Container(height: 6,),
                    Text('- ${numf.format(total)} VND',style: const TextStyle(fontSize: 11),)
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
