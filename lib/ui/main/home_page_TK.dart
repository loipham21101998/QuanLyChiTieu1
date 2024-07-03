import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<String> items = ['Theo quý', 'Năm nay'];
class HomePageTk extends StatelessWidget {
  const HomePageTk({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const DropdownTop(),
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 11).copyWith(top:8),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              color: Colors.white,),
          ),
        ),
      ],
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
      margin: const EdgeInsets.only(left: 11),
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

