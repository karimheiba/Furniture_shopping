import 'package:flutter/material.dart';

import '../../core/constans/colors.dart';


class CategoryList extends StatefulWidget {
  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  // CategoryList({required this.label,required this.icon})
  Map<String, IconData> _icons = {
    "Papular": Icons.star,
    "Chair": Icons.chair_alt,
    "Table": Icons.table_restaurant_outlined,
    "Armchair": Icons.chair_rounded,
    "Bed": Icons.bed_outlined,
    "Lamp": Icons.light_sharp
  };

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;
    double all = height + width;

    return SizedBox(
      height: all / 13.18,
      child: ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: all / 59.35),
          separatorBuilder: ((context, index) {
            return SizedBox(width: all / 47.48);
          }),
          scrollDirection: Axis.horizontal,
          itemCount: _icons.length,
          itemBuilder: ((context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  currentIndex = index;
                });
              },
              child: Column(
                children: [
                  Container(
                    height: all / 26.98,
                    width: all / 26.98,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(all / 79.13),
                        color: currentIndex == index ? primary : disabledField),
                    child: Icon(
                      _icons.values.elementAt(index),
                      color:
                          currentIndex == index ? Colors.white : disabledButton,
                      size: all / 59.35,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: all / 118.7),
                    child: Text(
                      _icons.keys.elementAt(index),
                      style: TextStyle(
                          fontSize: all / 79.1,
                          fontWeight: FontWeight.w600,
                          fontFamily: "NunitoSans",
                          color: textSecondary),
                    ),
                  ),
                ],
              ),
            );
          })),
    );
  }
}
