import 'package:flutter/material.dart';

import 'package:furniture_shopping_app/constans/colors.dart';
import 'package:furniture_shopping_app/constans/size.dart';
import 'package:furniture_shopping_app/screen/home_screen.dart';

class OrderScreen extends StatefulWidget {
   OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  int currentindex=0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
    
      animationDuration: Duration(milliseconds: 500),
    
      initialIndex: currentindex,
      length: 3,
      child: Scaffold(
        // appbar section
        appBar: AppBar(
          iconTheme: IconThemeData(color: primary,size: MySize.customSize.gitSize(context, 20)),
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(onPressed: (){

            Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen(currentIndex: 3,)));
          }, icon: Icon(Icons.arrow_back_ios)),
          title: Text("My order"),
          centerTitle: true,
          titleTextStyle: TextStyle(fontSize: MySize.customSize.gitSize(context, 16),fontWeight: FontWeight.w700,color: primary),

// here the tab under the appbar 

          bottom: TabBar(
            onTap: (value) {
              setState(() {
                currentindex=value;
              });
            },
            indicatorColor: primary,
            indicatorWeight: 2,
           indicatorSize: TabBarIndicatorSize.label,
           
        
            unselectedLabelColor: disabledButton,

            labelColor: primary,
            labelStyle: TextStyle(fontSize: 18,fontWeight: FontWeight.w700),

            tabs: [
            Tab(text: "Delivered",),
              Tab(text: "Processing",),
              Tab(text: "Canceled",)
          ]),
          
        ),

        // here we build  a screen for the tabs 
        body: TabBarView(
          children: <Widget>[
            ListView.builder(itemCount: 7,
              itemBuilder: ((context, index) => orderCard(index,currentindex,"Delivered",success))),
            Center(
              child:  ListView.builder(itemCount: 2,
              itemBuilder: ((context, index) => orderCard(index,currentindex,"Processing",Colors.yellow[700]))),
            ),
            Center(
              child:  ListView.builder(itemCount: 1,
              itemBuilder: ((context, index) => orderCard(index,currentindex,"Canceled",Colors.red[400]))),
            ),
          ],
        ),
      ),
    );
    
  }


  // order section to build the card that will be shoing in every tab 

   orderCard(int index,int currentindex,String status,Color? statusColor) {
    return 
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 20.0),
             child: Column(
              children: [
                Container(
                   decoration: BoxDecoration(
             color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 1,
                spreadRadius: 1,
               
                
              )
            ]
           ),
                  margin: EdgeInsets.only(top: 25),
                  
                  padding: EdgeInsets.symmetric(vertical: 20,horizontal:15 ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Order No238562312",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,fontFamily: "NunitoSans"),),
                      Text("20/03/2020",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,fontFamily: "NunitoSans",color: textSecondary),)
                    ],
                  ),
                ),
                Container(height: 2,
                color: secondaryButtonBG,),

                 Container(
                  decoration: BoxDecoration(
             color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 1,
                spreadRadius: 1,
               
                
              )
            ]
           ),
                  padding: EdgeInsets.symmetric(vertical: 20,),
                   child: Column(
                     children: [
                       Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 20.0),
                         child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(children:const [
                                Text("Quantity :",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,fontFamily: "NunitoSans",color: textSecondary),),
                             Text(" 03",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,fontFamily: "NunitoSans"),),
                       
                              ],),
                              Row(
                                children: [
                                  Text("Total Amount : ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,fontFamily: "NunitoSans",color: textSecondary),),
                                  Text("\$150",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,fontFamily: "NunitoSans"),),
                       
                                ],
                              )
                            ],
                          ),
                       ),
SizedBox(height: 25,),
                        Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                            MaterialButton(
                              textColor: Colors.white,
                              color: primary,
                              onPressed: (){}, child: Text("Detail",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,fontFamily: "NunitoSans")),),
                              Text( status,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,fontFamily: "NunitoSans",color: statusColor ))
                          ],),
                        )
                     ],
                   ),
                 ),
                ]
                ,
        
          
              ),
           );
  }
}