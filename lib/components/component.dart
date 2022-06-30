import 'package:flutter/material.dart';

import '../models/on_boarding_model.dart';

Widget buildBoardingItem (BordingModel model)=>  Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children:  [
      Expanded(child: Image(image: AssetImage('${model.image}'),)),
      const SizedBox(height: 20,),
      Text('${model.title}',
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 24,

        ),
      ),
      const SizedBox(height: 15,),
      Text('${model.body}',
      textAlign: TextAlign.center,
        maxLines: 10,
        style: const TextStyle(
            fontSize: 15,

        ),
      ),
      const SizedBox(height: 30,)
    ]
);

class GeneralButton extends StatelessWidget {
  const GeneralButton({Key? key, this.text, this.onTap})
      : super(key: key);
  final String? text;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            text!,
            style: TextStyle(
              fontSize: 14,
              color: const Color(0xffffffff),
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.left,
          ),
        ),
      ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? inputType;
  final Widget? prefexIcon;
  final Widget? suffexIcon;
  final ValueSetter? onSaved;
  final ValueSetter? onChanged;
  final int? maxLines;
     bool isPassword = false;
    CustomTextFormField({
    Key? key,

    required this.inputType,
    this.prefexIcon,
      this.suffexIcon,
     this.onSaved,
    this.onChanged,
    this.maxLines,
   required this.isPassword, this.controller,

  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (data) {
        if (data!.isEmpty) {
          return 'field is required';
        }
      },

      controller: controller,
      obscureText: isPassword,
      keyboardType: inputType,
      onChanged: onChanged,
      onSaved: onSaved,
      // maxLines: maxLines,
      decoration: InputDecoration(
        prefixIcon:prefexIcon,
        suffixIcon: suffexIcon,
        filled: true,
        fillColor: Colors.transparent,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: Color(0xFFCCCCCC),
            )),

      ),

    );
  }
}

class CustomButtonWithIcon extends StatelessWidget {
   CustomButtonWithIcon(
      {Key? key, required this.text, this.onTap, this.iconData, this.color})
      : super(key: key);
  final String text;
  final String? iconData;
  final VoidCallback? onTap;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Color(0xFF707070),
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage(iconData!)),
            SizedBox(width: 10,),
            Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.w600,

                fontSize: 15,
                color: Colors.blue,
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }
}

void navigateTo(BuildContext context, Widget widget)=> Navigator.push(context,
  MaterialPageRoute(builder: (context)=>widget),
);