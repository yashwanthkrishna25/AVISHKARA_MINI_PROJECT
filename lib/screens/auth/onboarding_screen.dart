import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/onboarding_data.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {

  final PageController controller = PageController();

  bool lastPage = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: SafeArea(

        child: Column(

          children: [

            Expanded(

              child: PageView.builder(

                controller: controller,

                itemCount: onboardingPages.length,

                onPageChanged: (index){

                  setState(() {

                    lastPage = index == onboardingPages.length - 1;

                  });

                },

                itemBuilder: (context,index){

                  final page = onboardingPages[index];

                  return Padding(

                    padding: const EdgeInsets.all(30),

                    child: Column(

                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [

                        Text(
                          page.icon,
                          style: const TextStyle(fontSize: 120),
                        ),

                        const SizedBox(height:40),

                        Text(

                          page.title,

                          textAlign: TextAlign.center,

                          style: const TextStyle(

                            fontSize:30,

                            fontWeight: FontWeight.bold,

                          ),

                        ),

                        const SizedBox(height:20),

                        Text(

                          page.description,

                          textAlign: TextAlign.center,

                          style: const TextStyle(

                            fontSize:18,

                            color: Colors.grey,

                          ),

                        ),

                      ],

                    ),

                  );

                },

              ),

            ),

            SmoothPageIndicator(

              controller: controller,

              count: onboardingPages.length,

              effect: ExpandingDotsEffect(

                activeDotColor: AppColors.primary,

                dotHeight:10,

                dotWidth:10,

              ),

            ),

            const SizedBox(height:30),

            Padding(

              padding: const EdgeInsets.symmetric(horizontal:25),

              child: SizedBox(

                width: double.infinity,

                height:55,

                child: ElevatedButton(

                  onPressed: (){

                    if(lastPage){

                      Navigator.pushReplacementNamed(context, "/login");

                    }else{

                      controller.nextPage(

                        duration: const Duration(milliseconds:400),

                        curve: Curves.easeIn,

                      );

                    }

                  },

                  child: Text(

                    lastPage

                        ? "Get Started"

                        : "Next",

                  ),

                ),

              ),

            ),

            const SizedBox(height:40),

          ],

        ),

      ),

    );

  }

}