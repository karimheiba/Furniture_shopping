import 'package:flutter/material.dart';

import 'package:furniture_shopping_app/constans/colors.dart';
import 'package:furniture_shopping_app/widget/custom_text_formfield.dart';
import 'package:furniture_shopping_app/widget/sign_button.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            children: [
              Padding(
          padding: const EdgeInsets.symmetric(vertical: 25.0,horizontal: 30),
          child: logoScection(),
              ),
              Padding(
          padding: const EdgeInsets.only(bottom: 25,left: 30),
          child: welcomeSection(),
              ),
              
              fieldSection()
              
            ],
          ),
        ),
      ),
    );
    
  }

  Container fieldSection() {
    return Container(
      
      margin: EdgeInsets.only(right: 30),
      padding: EdgeInsets.only(left: 30,top: 38
      
      ),
      
      width: double.infinity,
     clipBehavior: Clip.antiAlias,
   
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.5),
            blurRadius: 9,
            spreadRadius:.3,
                    )
        ],
                color: Colors.white,
        shape: BoxShape.rectangle),

      child: Column(
        children: [

          CustomTextFormField(label: "Name",),

          CustomTextFormField(label: "Email",),

     
 CustomTextFormField(label: "Password",obscureText: true,showSuffix: true,),

CustomTextFormField(label: "Confirm Password",obscureText: true,showSuffix: true,),




  SizedBox(height: 40,),

  SignButton(
    buttonHight:50 ,
    buttonWidth:285 ,
    text: "Sign Up",onPressed: (){
  
  },
  ),

  SizedBox(height: 30,),

  Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text("Already have account?",style: TextStyle(fontSize:14,fontWeight: FontWeight.w600,color: textSecondary ,fontFamily: "NunitoSans"),),
      TextButton(
        onPressed: (){},
         child: Text("SIGN IN",style: TextStyle(fontSize:14,fontWeight: FontWeight.w700,color: primary,fontFamily: "NunitoSans" ),
         )
         ),
    ],
  ),
  SizedBox(height: 37,)

     
        ],
      ),
    );
  }

  Column welcomeSection() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
     
          Text("WELCOME ",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w700,letterSpacing: 2)),
        ],
      );
  }

  Row logoScection() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
Container(
width: 105,
height: 2,

color: strokeDivider,
),
Container(
width: 64,
decoration: BoxDecoration(shape: BoxShape.circle,
  border: Border.all(color: primary,width: 1),
 
),
child: Image(image: AssetImage("assets/images/logo.png")),
),

Container(
width: 105,
height: 2,

color: strokeDivider,
),


      ],);
  }
}