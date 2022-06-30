import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:task1/components/component.dart';
import 'package:task1/login_screen.dart';

class RegisterScreen extends  StatefulWidget {


  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var formKey = GlobalKey<FormState>();
  String? country;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            flexibleSpace: Container(

              decoration: BoxDecoration(
                  image :DecorationImage( image :AssetImage('assets/images/free-apps-design_24911-43751.jpg',),
                      fit: BoxFit.fitWidth)
              ),
            )
        ),

        body: Padding(
          padding:  EdgeInsets.all(20.0),
          child: Form(
            key: formKey ,
            child: SizedBox(
              // height: 400,
              child: ListView(

                children: [

                  SizedBox(height: 20,),
                  Text('Welcom to Fashin Daily',
                    style: TextStyle(color: Colors.grey,fontSize: 15),),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Text('Register',
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
                  SizedBox(height: 20,),
                  Text('Emal'),
                  SizedBox(height: 10,),
                  CustomTextFormField(
                    isPassword: false,
                    inputType:TextInputType.emailAddress ,

                  ),
                  SizedBox(height: 20,),
                  Text('Phone Number'),
                  SizedBox(height: 10,),
                  CustomTextFormField(
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
                  SizedBox(height: 20,),
                  Text('Password'),
                  SizedBox(height: 10,),
                  CustomTextFormField(
                    isPassword: true,
                    suffexIcon:Icon(Icons.visibility) ,
                    inputType:TextInputType.visiblePassword ,
                  ),
                  GeneralButton(text: 'Register',
                    onTap: (){
                      if (formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
                        );
                      }
                    },
                  ),
                  SizedBox(height: 8,),
                  Center(child: Text('or',style: TextStyle(color: Colors.grey,fontSize: 16),),),
                  SizedBox(height: 8,),
                  Flexible(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: CustomButtonWithIcon(

                        iconData: 'assets/images/290010608_607009637388762_8423247418125751216_n.png',
                        text: 'Log in with ',
                      ),
                    ),
                  ),

                  SizedBox(height: 20,),

                  Row(
                    children: [
                      Text('has any account account?',style: TextStyle(
                          fontSize: 20,
                        color: Colors.grey
                      ),),

                      TextButton(onPressed: (){navigateTo(context, LoginScreen());}, child: Text('sign in here'))

                    ],
                  ),

                  SizedBox(height: 20,),
                      Center(
                        child: Text.rich(
                          TextSpan(text: "By registering your account you are agree to our",
                              style: TextStyle(fontSize: 15,color: Colors.grey),
                              children: [
                                TextSpan(text: "terms and conditions",

                                  style: TextStyle(
                                      fontSize: 15,

                                      color: Colors.blue
                                  ),
                                ),
                              ]
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