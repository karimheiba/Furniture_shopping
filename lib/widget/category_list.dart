import 'package:flutter/material.dart';

import '../constans/colors.dart';

class CategoryList extends StatefulWidget {
  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  // CategoryList({required this.label,required this.icon})
     Map<String , IconData> _icons={

   "papular": Icons.home,
    "star": Icons.star,
    "kayaking": Icons.kayaking,
   "chair":  Icons.chair,
   "label":  Icons.label_important_outline,
  };

  int currentIndex=0;

  @override
  Widget build(BuildContext context) {
    return  
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SizedBox(
              height: 100,
              child: ListView.separated(
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
                      child: Icon(_icons.values.toList()[index],color:  currentIndex== index ? Colors.white:textSecondary,size: 30,),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text( _icons.keys.toList()[index]),
                    ),
                  ],
                ),
              );
           })),
            )
          );
        
    
  }
}