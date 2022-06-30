

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

import 'package:task1/components/component.dart';
import 'package:task1/register_screen.dart';

class LoginScreen extends  StatefulWidget {


  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formKey = GlobalKey<FormState>();
  var phoneController = TextEditingController();

  String? country;
  @override
  Widget build(BuildContext context) {
    return Scaffold(



      body: SafeArea(
        child: Form(
          key: formKey ,
          child: SizedBox(
            // height: 400,
            child: ListView(

              children: [
                Container(
                    height: 200,
                    width: double.infinity,
                    child: Image.asset('assets/images/free-apps-design_24911-43751.jpg',
                      width: 400,
                      fit: BoxFit.fitWidth,

                    )),

                SizedBox(height: 20,),

                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text('Welcom to Fashin Daily',
                    style: TextStyle(color: Colors.grey,fontSize: 15),),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      Text('Sign in',
                        style: TextStyle(
                          fontSize: 40,
                        ),
                      ),
                      Spacer(),
                      Text('help',style: TextStyle(color: Colors.green,fontSize: 18),),
                      SizedBox(width: 5,),
                      CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.green,
                        child: Text('?',style: TextStyle(color: Colors.white),),
                      ),
                      SizedBox(width: 15,)
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text('Phone Number'),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20),
                  child: CustomTextFormField(
                       controller: phoneController,
                    isPassword: false,
                    inputType:TextInputType.phone ,
                    prefexIcon:  CountryCodePicker(
                      onChanged: (countryCode){
                        setState((){
                          country = countryCode.code;
                        });


                      },
                      initialSelection: 'IT',
                      favorite: ['+39','FR'],
                      showCountryOnly: false,
                      showOnlyCountryWhenClosed: false,
                      alignLeft: false,
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20),
                  child: GeneralButton(text: 'Sign in',
                    onTap: (){
                      if (formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
                        );
                      }
                    },
                  ),
                ),
                SizedBox(height: 8,),
                Center(child: Text('or',style: TextStyle(color: Colors.grey,fontSize: 16),),),
                SizedBox(height: 8,),
                Flexible(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: CustomButtonWithIcon(
                      // color: Color(0xFFdb3236),
                      iconData: 'assets/images/290010608_607009637388762_8423247418125751216_n.png',
                      text: 'Log in with ',
                    ),
                  ),
                ),

                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20),
                  child: Row(
                    children: [
                      Text('Don\'t have an account?',style: TextStyle(
                          fontSize: 20
                      ),),

                      TextButton(onPressed: (){
                        navigateTo(context, RegisterScreen());
                      }, child: Text('Register here'))

                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20),
                  child: Text('using the application according the policy rules.Any winds of violatons will be subject to sanctions',
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.grey,


                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )
      );

  }
}






