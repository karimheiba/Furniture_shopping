import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../core/constans/colors.dart';

class ShippingAddreesScreen extends StatefulWidget {
  ShippingAddreesScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ShippingAddreesScreen> createState() => _ShippingAddreesScreenState();
}

class _ShippingAddreesScreenState extends State<ShippingAddreesScreen> {
  _ShippingAddreesScreenState({this.ischeked = false});
  bool? ischeked;
  List address=["1","2"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:FloatingActionButton(
        backgroundColor: Colors.white,
      
        onPressed: () {
        
      },
      child: Icon(Icons.add,color: primary,),
      ),
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {}, icon: Icon(Icons.arrow_back_ios_new_outlined)),
          title: Text("Shipping address"),
        ),
        body: ListView.separated(
          
          itemBuilder: (context,index){
          return adreesCard(index);
        }, separatorBuilder: (context,index){
          return SizedBox(height: 5,);
        }, itemCount: address.length));
  }

  Padding adreesCard(int index) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Checkbox(
                  
                    activeColor: primary,
                    checkColor: Colors.white,
                    value: ischeked,
                    onChanged: (value) {
                      setState(() {
                        ischeked = value;
                      });
                    }),
                Text(
                  "Use as the shipping address",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      fontFamily: "NunitoSans-Bold",
                      color: ischeked == true ? primary : textSecondary),
                )
              ],
            ),
            cardStyle(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
              horizontal: 20,
              vertical: 5,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Bruno Fernandes",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                fontFamily: "NunitoSans",
                                color: primary),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.mode_edit_rounded,
                                size: 23,
                              )),
                        ]),
                        
                  ]),
                  
            ),
            Divider(height: 3,
                        color: textSecondary,),
                        cardStyle(
                          borderRadius:  BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
                          horizontal: 20,
                          vertical: 20,
                          child: Text("25 rue Robert Latouche, Nice, 06200, Côte D’azur, France", style: TextStyle(

                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: "NunitoSans-Bold",
                      color: textSecondary,
                      height: 1.75,

                      ),),

                      
                      )
          ],
        ),
      );
  }

  cardStyle({required Widget child,required double horizontal,required double vertical,BorderRadiusGeometry? borderRadius}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        boxShadow: [
          BoxShadow(
              color: Colors.black12,
              spreadRadius: .1,
              blurRadius: .1,
              offset: Offset(.1, .1)),
        ],
        color: Colors.white,
        // borderRadius: radius,
      ),
      width: double.infinity,
      child: child,
    );
  }
}
