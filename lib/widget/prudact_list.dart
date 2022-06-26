import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:furniture_shopping_app/core/constans/colors.dart';
import 'package:furniture_shopping_app/model/product_model.dart';
import 'package:furniture_shopping_app/screen/product.dart';

class PrudactList extends StatelessWidget {
   PrudactList({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;
    double all = height + width;
    return Expanded(
      child: GridView.builder(
        
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(
            horizontal: all / 59.35, vertical: all / 79.13),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: all / 4.69,

          // childAspectRatio:.75,
          crossAxisSpacing: all / 59.35,
          mainAxisSpacing: all / 79.13,
        ),
        itemCount: ProductModel.product.length,
        itemBuilder: (context, index) {

          return SizedBox(
            height: all / 4.69,
            width: all / 7.56,
            child: GestureDetector(
              onTap: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductScreen(index: index)));
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.bottomRight,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: AssetImage(
                               ProductModel.product[index].imageUrl,
                              ),
                              fit: BoxFit.fill)),
                      child: Padding(
                          padding: EdgeInsets.only(
                              bottom: all / 118.7, right: all / 118.7),
                          child: MaterialButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              height: all / 39.66,
                              minWidth: all / 39.66,
                              padding: EdgeInsets.all(0),
                              color: Color.fromRGBO(188, 188, 188, 100)
                                  .withOpacity(.8),
                              onPressed: () {
                               
                              },
                              child: Icon(
                                Icons.shopping_bag,
                                size: all / 59.35,
                                color: Colors.white,
                              ))),
                    ),
                  ),
                  SizedBox(
                    height: all / 118.7,
                  ),
                  Text(
                    ProductModel.product[index].title,
                    style: TextStyle(
                        fontSize: all / 84.78,
                        fontWeight: FontWeight.w400,
                        color: textSecondary,
                        fontFamily: "NunitoSans"),
                  ),
                  SizedBox(
                    height: all / 197.83,
                  ),
                  Text("\$ ${ProductModel.product[index].price}",
                      style: TextStyle(
                          fontSize: all / 84.78,
                          fontWeight: FontWeight.w700,
                          color: primary,
                          fontFamily: "NunitoSans"))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
