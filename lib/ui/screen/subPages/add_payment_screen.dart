import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:furniture_shopping_app/core/constans/colors.dart';
import 'package:furniture_shopping_app/ui/widget/sign_button.dart';


class AddPaymentScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AddPaymentScreenState();
  }
}

class AddPaymentScreenState extends State<AddPaymentScreen> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  // bool useGlassMorphism = true;
  bool useBackgroundImage = false;
  OutlineInputBorder? border;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // @override
  // void initState() {
  //   border = OutlineInputBorder(
  //     borderSide:BorderSide()
      
  //     //  BorderSide(
  //     //   color: Colors.grey.withOpacity(0.7),
  //     //   width: 2.0,
  //     // ),
  //   );
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return 
 
       Scaffold(
        appBar: AppBar(title: Text("Payment Method"),
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios_new)),),
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 10,
              ),

              CreditCardWidget(
                backgroundImage: 'assets/images/visa.png',
            
          height: 180,
                cardNumber: cardNumber,
                expiryDate: expiryDate,
                cardHolderName: cardHolderName,
                labelCardHolder: "Card Holder Name",
                textStyle: TextStyle(fontSize:13,fontWeight: FontWeight.w600,color: Colors.white ),
                cvvCode: cvvCode,
                showBackView: isCvvFocused,
                obscureCardNumber: true,
                obscureCardCvv: true,
                isHolderNameVisible: true,
                cardBgColor: Colors.white,
       
                onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},
             
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    
                    children: <Widget>[
                      CreditCardForm(

                        formKey: formKey,
                        obscureCvv: true,
                        obscureNumber: true,
                        cardNumber: cardNumber,
                        cvvCode: cvvCode,
                        isHolderNameVisible: true,
                        isCardNumberVisible: true,
                        isExpiryDateVisible: true,
                        cardHolderName: cardHolderName,
                        expiryDate: expiryDate,
                        themeColor: Colors.green,
                        textColor: primary,


                           cardHolderDecoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,

                          hintStyle: const TextStyle(color: textSecondary),
                          labelStyle: const TextStyle(color: primary),
                          focusedBorder: border,
                          enabledBorder: border,
                          labelText: 'Card Holder Name',
                          hintText: " Holder Name"
                        ),

                        cardNumberDecoration: InputDecoration(
floatingLabelBehavior: FloatingLabelBehavior.always,

                          labelText: 'Card Number',

                          hintText: 'XXXX XXXX XXXX XXXX',
                          hintStyle: const TextStyle(color: textSecondary),
                          labelStyle: const TextStyle(color: primary,),
                          focusedBorder: border,
                          enabledBorder: border,
                        ),

                        expiryDateDecoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,

                          hintStyle: const TextStyle(color: textSecondary),
                          labelStyle: const TextStyle(color: primary),
                          focusedBorder: border,
                          enabledBorder: border,
                          labelText: 'Expired Date',
                          hintText: 'XX/XX',
                        ),
                        cvvCodeDecoration: InputDecoration(

                          floatingLabelBehavior: FloatingLabelBehavior.always,

                    

                          hintStyle: const TextStyle(color: textSecondary),
                          labelStyle: const TextStyle(color: primary),
                          focusedBorder: border,
                          enabledBorder: border,
                          labelText: 'CVV',
                          hintText: 'XXX',
                        ),
                     
                        onCreditCardModelChange: onCreditCardModelChange,
                      ),
                      const SizedBox(height: 35,),
                  
                   Padding(
                     padding: const EdgeInsets.symmetric(vertical:40.0),
                     child: SignButton(text: "ADD NEW CARD", onPressed: (){
                         if (formKey.currentState!.validate()) {
                              print('valid!');
                            } else {
                              print('invalid!');
                            }
                     
                     }, buttonHight: 60, buttonWidth: 335),
                   )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
     
    );
  }

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    setState(() {
      cardNumber = creditCardModel!.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}