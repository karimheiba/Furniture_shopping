import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:furniture_shopping_app/constans/colors.dart';

class PrudactList extends StatelessWidget {
  const PrudactList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        
        shrinkWrap: true,
    
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
      
       
        gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
        mainAxisExtent: 253,
       
        // childAspectRatio:.75,
        crossAxisSpacing: 20,
        mainAxisSpacing: 15,
        
        ) ,

        itemCount: 10,
      itemBuilder: (context,index){
        return   SizedBox(
          height: 253,
        width: 157,
          child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                                  
                                 
                                       
                                       
                          alignment: Alignment.bottomRight,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(image: AssetImage("assets/images/maskGroup.png",),fit: BoxFit.fill)
                                    
                          ),
                         
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10.0,right: 10),
                            child:MaterialButton( 
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                              height: 30,
                              minWidth: 30,
                           padding: EdgeInsets.all(0),
                         
                              
                              color: Color.fromRGBO(188, 188, 188, 100).withOpacity(.8),
                              onPressed: (){},child:  Icon(Icons.shopping_bag,size: 20,color: Colors.white,)
                            )
                          
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text("Black simple lamp",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: textSecondary,fontFamily: "NunitoSans"),),
                      SizedBox(height: 6,),
                      Text("\$ 12",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w700,color: primary,fontFamily: "NunitoSans"))
                    ],
                  ),
        );
    
      },
       
       
      ),
    );
    
  }
}