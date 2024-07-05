import 'package:flutter/material.dart';

class HomePageChildTc extends StatelessWidget {
  const HomePageChildTc({super.key});

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
              children: List.generate(3,(int i) {
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
