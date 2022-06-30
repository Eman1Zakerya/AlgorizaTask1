import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:task1/login_screen.dart';
import 'package:task1/register_screen.dart';

import 'components/component.dart';
import 'models/on_boarding_model.dart';

class OnBoardingScreen extends StatefulWidget {

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardController = PageController();

  List<BordingModel> boarding =[
    BordingModel(
      image:'assets/images/onboarding1.png',
      title: 'Get food delivery from your favorite restaurant',
      body: 'We have young and professional delivery team that wil pring your food as soon as possible to your door step',
    ),
    BordingModel(
      image:'assets/images/onboarding2.png',
      title: 'Buy any food from your favorite restaurant',
      body: 'We are constantly adding your favorite restaurant throughout the territory and around your area carfully selected',
    ),
    BordingModel(
      image:'assets/images/onboarding3.png',
      title: 'Get food delivery from your favorite restaurant',
      body: 'We are constantly adding your favorite restaurant throughout the territory and around your area carfully selected',
    ),
  ];

  bool isLast = false;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          TextButton(onPressed:(){
            navigateTo(context, LoginScreen());
          },
              child: Text('SKIP',style: TextStyle(fontSize: 20),))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all( 30),
        child: Column(
          children: [
            Text.rich(
                TextSpan(text: "7",
                  style: TextStyle(fontSize: 40,color: Colors.orange),
                  children: [
                    TextSpan(text: "Krave",
                      style: TextStyle(
                          fontSize: 40,
                          fontFamily: 'Pacifico',
                          color: Colors.green
                      ),
                    ),
                  ]
                ),
            ),
            Expanded(
              child: PageView.builder(
                physics: BouncingScrollPhysics(),
                controller: boardController,
                onPageChanged: (int index){
                  if(index == boarding.length -1)
                  {
                    setState(() {
                      isLast = true;
                    });

                  }else{
                    setState(() {
                      isLast = false;
                    });

                  }
                },
                itemBuilder: ((context, index) =>buildBoardingItem(boarding[index]) ),
                itemCount: boarding.length,
              ),
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SmoothPageIndicator(controller: boardController,
                    effect: ExpandingDotsEffect(
                      dotColor: Colors.grey,
                      activeDotColor: Colors.green,
                      dotHeight: 10,
                      expansionFactor: 4,
                      dotWidth: 10,
                      spacing: 5,
                    ),
                    count: boarding.length),

              ],
            ),
            SizedBox(height: 10,),
            GeneralButton(

              text: 'Get started',
              onTap: ()
                 {

                  if(isLast)
                 {
                   navigateTo(context, LoginScreen());
                  }
                  else
                  {
                     boardController.nextPage(duration: Duration(milliseconds: 750),
                        curve: Curves.fastLinearToSlowEaseIn);
                  }


                },
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Don\'t have an acvount?',
                  style: TextStyle(fontSize: 20),
                ),
                TextButton(onPressed: (){navigateTo(context, RegisterScreen());}, child: Text('sign up'))
              ],
            )
          ],
        ),
      ),
    );
  }
}