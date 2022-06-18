import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:furniture_shopping_app/constans/colors.dart';
import 'package:furniture_shopping_app/widget/color_pick.dart';

class ProductScreen extends StatefulWidget {
   ProductScreen({Key? key,}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
 List<bool> isSelected= List.generate(3, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:Column(
    crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Stack(
        
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  margin: EdgeInsets.only(left: 52),
                
                  height: 455,
                  width: double.infinity,
                   decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(70)),
                  image: DecorationImage(image: AssetImage("assets/images/item.png"),fit: BoxFit.cover)
                ),
                ),
              ),
             Positioned(
                top: 50,
                left: 32,
                child: Container(
             
              height: 40,
              width: 40,
              color: Colors.white,
              child: Icon(Icons.arrow_back_ios_new_rounded),
                ),
              ),
             
                
             Positioned(
              left: 20,
              top: 130,
              
             
              child: chooseColor())
            ],
          ),

          SizedBox(height: 25,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              
              children: [
                Text("Minimal Stand",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500),),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("\$ 50", style: TextStyle(fontSize: 30,fontWeight: FontWeight.w700,fontFamily: "NunitoSans-Bold",color: primary),),

              Row(
               
                children: [
                 MaterialButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                height: 30,
                minWidth: 30,
                color: Color(0xffE0E0E0),
                padding: EdgeInsets.all(0),
                onPressed: (){},
               child: Icon(Icons.add,size: 28,),),
               SizedBox(width: 10,),
               Text("0 1",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,fontFamily: "NunitoSans",color: primary),),
SizedBox(width: 10,),
                MaterialButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                height: 30,
                minWidth: 30,
                color: Color(0xffE0E0E0),
                padding: EdgeInsets.all(0),
                onPressed: (){},
               child: Icon(Icons.remove,size: 28,),)
              ],)
                  ],
                )
              ],
            ),
          )
        ],
      )
     

    );

    
  }

   chooseColor() {
    return Container(
  
                                       
                         height: 192,
                        width:64 ,
                        decoration: BoxDecoration(
                        color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(25)),
boxShadow: [
  BoxShadow(
    color: Colors.grey,
    offset: Offset(0.1,.1),
    spreadRadius: .03,
    blurRadius: .3,
    blurStyle: BlurStyle.outer
       
  )
]

                        ),
                        
                        child: ColorPicker(),);
                   
                 

  }
}


// Column(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                           CircleAvatar(
//                             radius: 24,
//                           ),
//                             CircleAvatar(
//                             radius: 24,
//                           ),
//                             CircleAvatar(
//                             radius: 24,
//                           ),
//                           ],
//                         ),