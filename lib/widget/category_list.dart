import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../constans/colors.dart';

class CategoryList extends StatefulWidget {
  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  // CategoryList({required this.label,required this.icon})
     Map<String , IconData> _icons={

   "Papular": Icons.star,
    "Chair": Icons.chair_alt,
    "Table": Icons.table_restaurant_outlined,
   "Armchair":  Icons.chair_rounded,
   "Bed":  Icons.bed_outlined,
   "Lamp": Icons.light_sharp
  };

  int currentIndex=0;

  @override
  Widget build(BuildContext context) {
    return  
          SizedBox(
            height: MediaQuery.of(context).size.height/10,
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 20),
             
              separatorBuilder:((context, index) {
                return  SizedBox(width: 25);
                
              }),
            
              scrollDirection: Axis.horizontal,
              itemCount: _icons.length,
              itemBuilder: ((context, index) {
              return GestureDetector(
              onTap: (){
setState(() {
  currentIndex=index;
});
              },
              child: Column(
                children: [
                  Container(
                    height: 44,
                    width: 44,
                    decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(15),
                      color: currentIndex== index ? primary: disabledField
                    ),
                    child: Icon(_icons.values.elementAt(index),color:  currentIndex== index ? Colors.white:disabledButton,size: 30,),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text( _icons.keys.elementAt(index),style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,fontFamily: "NunitoSans",color: textSecondary),),
                  ),
                ],
              ),
            );
           })),
          );
        
    
  }
}