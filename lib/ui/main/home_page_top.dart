import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatelessWidget {
  final Widget body;
  const HomePage({super.key ,required this.body});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
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
              child: const Text(
                '100.000.000 VND ',
                style: TextStyle(
                    fontSize: 15,
                    color: Color(0xff0C7209),
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        _buildTop(),
        body,
        _buildBody(context)
      ],
    );
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
      child: const Padding(
        padding: EdgeInsets.only(top:19,bottom: 19,left: 19,right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Text(
                  'Đã chi tiêu:',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Text(
                  '-50.000.000 VND',
                  style: TextStyle(
                      color: Color(0xffFF1313),
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 6,
            ),
            Row(
              children: [
                Text(
                  'Quỹ còn lại:',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Text(
                  '50.000.000 VND',
                  style: TextStyle(
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

  Widget _buildBody(BuildContext context) {
    return Expanded(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 11).copyWith(top:8),
         decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(20),
         color: Colors.white,),
          child: GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 1.45794392523,
            controller: ScrollController(keepScrollOffset: false),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.only(top:20,right: 20,left: 20),
            crossAxisSpacing: 18,
            children: List.generate(2,(int i) {
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
                      const Row(
                        children: [
                          CircleAvatar(),
                          Spacer(),
                          Text('Ăn uống',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
                        ],
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          const Text('50%',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                          const Spacer(),
                          Column(
                            children: [
                              Container(height: 6,),
                              const Text('-1.000.000 VND',style: TextStyle(fontSize: 10),)
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            }),
          )
    ));
  }

}
