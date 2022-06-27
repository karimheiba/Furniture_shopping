import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shopping_app/core/constans/colors.dart';
import 'package:furniture_shopping_app/core/constans/size.dart';
import 'package:furniture_shopping_app/ui/screen/home_screen.dart';

import '../../../business_logic/blocs/auth/auth_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: primary,
            size: MySize.customSize.gitSize(context, 20),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            splashRadius: 17,
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          titleTextStyle: TextStyle(
              fontSize: MySize.customSize.gitSize(context, 15),
              fontWeight: FontWeight.w700,
              color: primary),
          title: Text("Profile"),
          centerTitle: true,
          actions: [
            IconButton(
                splashRadius: 17,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                },
                icon: Icon(Icons.follow_the_signs_rounded))
          ],
        ),
        body: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is AuthGetUserData) {
              return Padding(
                padding: EdgeInsets.all(MySize.customSize.gitSize(context, 20)),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                              radius: MySize.customSize.gitSize(context, 43),
                              backgroundImage:
                                  //AssetImage("assets/images/profile.png"),
                                  NetworkImage(state.userData.imageUrl)),
                          SizedBox(
                            width: MySize.customSize.gitSize(context, 20),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Bruno Pham",
                                style: TextStyle(
                                    fontSize:
                                        MySize.customSize.gitSize(context, 20),
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "NunitoSans-Bold"),
                              ),
                              SizedBox(
                                height: MySize.customSize.gitSize(context, 8),
                              ),
                              Text("bruno203@gmail.com",
                                  style: TextStyle(
                                      fontSize: MySize.customSize
                                          .gitSize(context, 14),
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "NunitoSans",
                                      color: disabledButton))
                            ],
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: MySize.customSize.gitSize(context, 20)),
                        child: sectionCards(
                            context: context,
                            title: "My Order",
                            note: "Alerady have 10 order",
                            onPressed: () {
                              Navigator.pushNamed(context, "order");
                            }),
                      ),
                      sectionCards(
                          context: context,
                          title: "Shipping Addresses",
                          note: "03 Addresses",
                          onPressed: () {}),
                      sectionCards(
                          context: context,
                          title: "Payment Method",
                          note: "You have 2 cards",
                          onPressed: () {}),
                      sectionCards(
                          context: context,
                          title: "My reviews",
                          note: "Reviews for 5 items",
                          onPressed: () {}),
                      sectionCards(
                          context: context,
                          title: "Setting",
                          note: "Notification, Password, FAQ, Contact",
                          onPressed: () {})
                    ],
                  ),
                ),
              );
            } else {
              return Container(
                child: Center(
                  child: Text('please login'),
                ),
              );
            }
          },
        ));
  }

  sectionCards(
      {required String title,
      required String note,
      required VoidCallback onPressed,
      context}) {
    return Container(
      padding: EdgeInsets.only(
          right: MySize.customSize.gitSize(context, 10),
          left: MySize.customSize.gitSize(context, 20),
          top: MySize.customSize.gitSize(context, 18),
          bottom: MySize.customSize.gitSize(context, 17)),
      margin: EdgeInsets.only(top: MySize.customSize.gitSize(context, 15)),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 1,
          spreadRadius: 1,
        )
      ]),
      width: double.infinity,
      height: MySize.customSize.gitSize(context, 80),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: TextStyle(
                      fontSize: MySize.customSize.gitSize(context, 18),
                      fontWeight: FontWeight.w700,
                      fontFamily: "NunitoSans-Bold")),
              SizedBox(
                height: MySize.customSize.gitSize(context, 5),
              ),
              Text("Alerady have 10 order",
                  style: TextStyle(
                      fontSize: MySize.customSize.gitSize(context, 13),
                      fontWeight: FontWeight.w400,
                      fontFamily: "NunitoSans",
                      color: disabledButton))
            ],
          ),
          IconButton(
            onPressed: onPressed,
            icon: Icon(Icons.arrow_forward_ios),
            iconSize: MySize.customSize.gitSize(context, 24),
          )
        ],
      ),
    );
  }
}
