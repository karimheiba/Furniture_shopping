import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:furniture_shopping_app/core/constans/colors.dart';
import 'package:furniture_shopping_app/ui/widget/adrees_info_card.dart';
import 'package:furniture_shopping_app/ui/widget/sign_button.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios_new_outlined),
        ),
        title: Text("Check out"),
      
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // this section fonr shipping info 
                shippingInfo(),
                SizedBox(height: 15,),
          
               // this section for payment info 
          
                paymentInfo(),
          
                SizedBox(height: 15,),
          
                // thes section for delevery method info
                deliveryMethod(),
                              SizedBox(height: 15,),
                              totalOrder(),
                     SizedBox(height: 20,),
          
          
                              Row(
                                children: [
                                  Expanded(
                                    child: SignButton(
                                      visualDensity: VisualDensity.standard,
                                      text: "SUBMIT ORDER", onPressed: (){}, buttonHight: 60, buttonWidth: 335),
                                  ),
                                ],
                              )
          
                
              ],
            ),
          ),
        ),
    );

    
  }

  SizedBox totalOrder() => SizedBox(
    child: cardStyle(
      padding: EdgeInsets.all(20),
      child: Column(

      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text("Order:", style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,fontFamily: "NunitoSans",color: textSecondary)),
          Text("\$ 95.00", style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,fontFamily: "NunitoSans",color: primary)),
          ],

          
        ),
                SizedBox(height: 5,),

            Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text("Delivery: ", style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,fontFamily: "NunitoSans",color: textSecondary)),
          Text("\$ 5.00", style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,fontFamily: "NunitoSans",color: primary)),
          ],

          
        ),
        SizedBox(height: 5,),
            Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text("Total :", style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,fontFamily: "NunitoSans",color: textSecondary)),
          Text("\$ 100.00", style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,fontFamily: "NunitoSans",color: primary)),
          ],

          
        ),
      ],
    ), radius: BorderRadius.all(Radius.circular(10))),
    
  );

  Column deliveryMethod() => Column(

     crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text("Delivery method ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,fontFamily: "NunitoSans",color: textSecondary),),
                  IconButton(onPressed: (){}, icon: Icon(Icons.mode_edit_rounded,size: 23,))

                ],),
                SizedBox(height: 5,),

                 cardStyle(
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                child:  Row(
                    children: [
                      Container(
                     

                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              spreadRadius: .1,
                             blurRadius: .1,
                             offset: Offset(.1,.1)
                            )
                          ],
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
                        
                        child: Image(image: AssetImage("assets/images/dhl.png"),)),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text("Fast (2-3days)",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,fontFamily: "NunitoSans",color: primary),),
                      ),
                    ],
                  ), radius: BorderRadius.all(Radius.circular(10)),
                 )

    ]
  );

  // payment section

  Column paymentInfo() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text("Payment ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,fontFamily: "NunitoSans",color: textSecondary),),
                  IconButton(onPressed: (){}, icon: Icon(Icons.mode_edit_rounded,size: 23,))

                ],),
                SizedBox(height: 5,),

               cardStyle(
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                child:  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),

                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              spreadRadius: .1,
                             blurRadius: .1,
                             offset: Offset(.1,.1)
                            )
                          ],
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
                        
                        child: Image(image: AssetImage("assets/images/mastercard.png"),)),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text("**** **** **** 9432",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,fontFamily: "NunitoSans",color: primary),),
                      ),
                    ],
                  ), radius: BorderRadius.all(Radius.circular(10)))
               
    ],
  );




  // shipping info section

  Column shippingInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text("Shipping Adrees",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,fontFamily: "NunitoSans",color: textSecondary),),
                  IconButton(onPressed: (){}, icon: Icon(Icons.mode_edit_rounded,size: 23,))

                ],),
                SizedBox(height: 5,),

            cardStyle(
              padding: EdgeInsets.all(15),
              child: Text("Bruno Fernandes",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700,fontFamily: "NunitoSans",color: primary),
            ),
             radius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10),),),
              
                  Divider(

                    height: 2,
                  ),
                  cardStyle(
                    padding: EdgeInsets.symmetric(horizontal: 15,vertical: 20),
                    child:
                  Text("25 rue Robert Latouche , Nice, 06200 , Côte D’azur , France",
                  
                  style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,fontFamily: "NunitoSans",color: textSecondary),
                  ), 
                   radius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10),),),
    
      ]            
   
    );
  }


  // this card have the decoration of the all caers sections 

  Container cardStyle({required Widget child ,required BorderRadiusGeometry radius,EdgeInsetsGeometry? padding} ) {
    return Container(
                padding: padding,
              decoration: BoxDecoration(

                boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              spreadRadius: .2,
                             blurRadius: .2,
                             offset: Offset(.1,.1)
                            ),
                ],
                  color: Colors.white,
                  borderRadius: radius,
              ),
                width: double.infinity,
                child: child,
    );
  }
}