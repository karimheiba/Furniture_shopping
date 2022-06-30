import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:furniture_shopping_app/core/constans/colors.dart';
import 'package:furniture_shopping_app/core/constans/size.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

bool _salseSwitch=false;
bool _newArrivalSwitch=false;
bool _deleveryStatusSwitch=false;


class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding:  EdgeInsets.all(MySize.customSize.gitSize(context, 20)),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Personal info",style: TextStyle(
                  letterSpacing: 1,
                  fontSize: MySize.customSize.gitSize(context, 16),
                  fontWeight: FontWeight.w600,
                  color: textSecondary,
                  fontFamily: "NunitoSans-Bold",
                ),),
                    IconButton(
                      splashRadius: 15,
                      onPressed: () {}, icon: Icon(Icons.edit,color: textSecondary,))
                  ],
                ),
                customInfoCard(
                  context: context,
                  initialValue: "Bruno Pham",
                  label: "Name",
                ),
                SizedBox(
                  height: MySize.customSize.gitSize(context, 15),
                ),
                customInfoCard(
                  context: context,

                    initialValue: "bruno203@gmail.com", label: "Email"),
               Padding(
                 padding:  EdgeInsets.only(top: MySize.customSize.gitSize(context, 20),bottom: MySize.customSize.gitSize(context, 10)),
                 child: Column(
                  children: [
                     Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Password",style: TextStyle(
                  letterSpacing: 1,
                  fontSize: MySize.customSize.gitSize(context, 16),
                  fontWeight: FontWeight.w600,
                  color: textSecondary,
                  fontFamily: "NunitoSans-Bold",
                ),),
                      IconButton(
                        onPressed: () {}, icon: Icon(Icons.edit,color: textSecondary,))
                    ],
                  ),
                  customInfoCard(
                    context: context,
                    initialValue: "Bruno Pham",
                    label: "Password",
                    obscureText: true,
          
                  ),
                  ],
                 ),
               ),
          
          SizedBox(height: MySize.customSize.gitSize(context, 15),),
           Text("Notification",style: TextStyle(
                  letterSpacing: 1,
                  fontSize: MySize.customSize.gitSize(context, 16),
                  fontWeight: FontWeight.w600,
                  color: textSecondary,
                  fontFamily: "NunitoSans-Bold",
                ),),
          
                notificationCardStyle(
                  context: context,
                  text: "Sales",
                  value: _salseSwitch,
                  onChanged: (value){
                    setState(() {
                      _salseSwitch=value;
                    });
                  }
               ),
          
               notificationCardStyle(
                context: context,
                text: "New arrivals", value: _newArrivalSwitch, onChanged: (value){
               setState(() {
                  _newArrivalSwitch=value;
               });
               }),
          
               notificationCardStyle(
                context: context,
                text: "Delivery status changes", value: _deleveryStatusSwitch, onChanged: (value){
                setState(() {
                  _deleveryStatusSwitch=value;
                });
               }),
          
                helpCenter(context),
          
              ],
            ),
          ),
        ),
      ),
    );
  }

// this section for the help center 

  Padding helpCenter(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

           Text("Help center",style: TextStyle(
                    letterSpacing: 1,
                    fontSize: MySize.customSize.gitSize(context, 16),
                    fontWeight: FontWeight.w600,
                    color: textSecondary,
                    fontFamily: "NunitoSans-Bold",
                  ),),
          Container(
          margin: EdgeInsets.symmetric(vertical: MySize.customSize.gitSize(context, 10)),
          padding: EdgeInsets.symmetric(
            horizontal: MySize.customSize.gitSize(context, 20),
            vertical: MySize.customSize.gitSize(context, 15),
          ),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.black12,
                  spreadRadius: .2,
                  blurRadius: .2,
                  offset: Offset(.1, .1)),
            ],
            color: Colors.white,
            // borderRadius: radius,
          ),
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              
              Text("FAQ",style:  TextStyle(
                    letterSpacing: 1,
                    fontSize: MySize.customSize.gitSize(context, 16),
                    fontWeight: FontWeight.w600,
                    color: primary,
                    fontFamily: "NunitoSans-Bold",
                  ),),

                  IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios))
              
            ],
          ),
          ),
        ],
      ),
    );
  }

// the section contain the decoration of the notifcation section with the swetcher decoration 



  Container notificationCardStyle({required String text,required bool value,required void Function(bool) onChanged,required BuildContext context}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: MySize.customSize.gitSize(context, 8)),
      padding: EdgeInsets.symmetric(
        horizontal: MySize.customSize.gitSize(context, 20),
        vertical: MySize.customSize.gitSize(context, 15),
      ),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.black12,
              spreadRadius: .2,
              blurRadius: .2,
              offset: Offset(.1, .1)),
        ],
        color: Colors.white,
        // borderRadius: radius,
      ),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          
          Text(text,style:  TextStyle(
                letterSpacing: 1,
                fontSize: MySize.customSize.gitSize(context, 16),
                fontWeight: FontWeight.w600,
                color: primary,
                fontFamily: "NunitoSans-Bold",
              ),),
          Switch(
            activeColor: success,
            

            value: value, onChanged: onChanged

          )
        ],
      ),
      );
  }

  // this section contain the decoration of the 3 text form feild  

  Container customInfoCard(
      {required String initialValue,
      required String label,
      bool readOnly = true,
      bool obscureText = false,
      required BuildContext context
      }) {
    return Container(
        padding: EdgeInsets.symmetric(
          horizontal: MySize.customSize.gitSize(context, 20),
          vertical: MySize.customSize.gitSize(context, 5),
        ),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                spreadRadius: .2,
                blurRadius: .2,
                offset: Offset(.1, .1)),
          ],
          color: Colors.white,
          // borderRadius: radius,
        ),
        width: double.infinity,
        child: TextFormField(
          obscureText: obscureText,
          readOnly: readOnly,
          initialValue: initialValue,
          decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.always,
              floatingLabelStyle:  TextStyle(
                letterSpacing: 1,
                fontSize: MySize.customSize.gitSize(context, 19),
                fontWeight: FontWeight.w600,
                color: primary,
                fontFamily: "NunitoSans-Bold",
              ),
              labelStyle:  TextStyle(
                letterSpacing: 1,
                fontSize: MySize.customSize.gitSize(context, 19),
                fontWeight: FontWeight.w600,
                color: textSecondary,
                fontFamily: "NunitoSans-Bold",
              ),
              contentPadding:  EdgeInsets.symmetric(vertical: MySize.customSize.gitSize(context, 15)),
              border: InputBorder.none,
              labelText: label),
        ));
  }
}
