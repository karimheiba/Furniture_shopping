
import 'package:flutter/material.dart';
import '../../core/constans/colors.dart';


class ColorPicker extends StatefulWidget {
   ColorPicker({Key? key}) : super(key: key);

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  List <Color>pickColor=[
    Color(0xffFFFFFF),
    Color(0xffB4916C),
    Color(0xffE4CBAD),
  
    Colors.amber,
   Colors.redAccent,
    Colors.teal,
      Colors.black38,

  ];

  int currentIndex=0;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(

      padding: EdgeInsets.symmetric(vertical: 15,horizontal: 15),
      separatorBuilder: ((context, index) {
        return SizedBox(height: 30,);
      }),
      itemCount: pickColor.length,
      
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: (){
            setState(() {
              currentIndex=index;
             
            });
          },
          child: Container(
          
            
            width: 34,
            height: 34,
             
            
            decoration: BoxDecoration(
            color: pickColor[index],
             border: Border.all(
              color: currentIndex ==index? textSecondary: secondaryButtonBG,
              width: 5,
              style: BorderStyle.solid
             ),
             shape: BoxShape.circle
            ),
            ),
        );
          
                   
      
    });
    
  }
}