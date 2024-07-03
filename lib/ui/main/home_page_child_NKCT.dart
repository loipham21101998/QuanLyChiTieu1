import 'package:flutter/material.dart';

class HomePageChildNkct extends StatelessWidget {
  const HomePageChildNkct({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 11).copyWith(top:8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,),
            child: ListView.separated(
            //padding: const EdgeInsets.all(14),
              separatorBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 19),
                    height: 1,
                    decoration:const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                           color:  Color(0xffC0C0C0),
                               width: 1
                        )
                      )
                    ),
                  );

              },
              itemCount: 3,
            itemBuilder: (BuildContext context, int index){
                return  ListTile(
                  onTap: ()=>print('TapTap'),
                  leading: const CircleAvatar(),
                  title: const Text('Tên chi tiêu',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                  subtitle: const Text('Thứ 2 - 01/07/2024',style: TextStyle(fontSize: 15),),
                  trailing: const Column(
                    children: [
                      SizedBox(height: 29,),
                       Text('-1.000.000 VND',style: TextStyle(fontSize: 15),)
                    ],
                  ),
                );
            }

          ),
        )
    );
  }
  
  
}
