import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:furniture_shopping_app/constans/colors.dart';

class PrudactList extends StatelessWidget {
  const PrudactList({Key? key}) : super(key: key);

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
        itemCount: 10,
        itemBuilder: (context, index) {

          return SizedBox(
            height: all / 4.69,
            width: all / 7.56,
            child: GestureDetector(
              onTap: (){
                 Navigator.pushNamed(context, "productitem");
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
                                "assets/images/item.png",
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
                    "Black simple lamp",
                    style: TextStyle(
                        fontSize: all / 84.78,
                        fontWeight: FontWeight.w400,
                        color: textSecondary,
                        fontFamily: "NunitoSans"),
                  ),
                  SizedBox(
                    height: all / 197.83,
                  ),
                  Text("\$ 12",
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
