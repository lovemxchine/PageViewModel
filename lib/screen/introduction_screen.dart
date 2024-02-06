import 'dart:html';

import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:onboarding_screen/screen/home_screen.dart';

class IntroScreen extends StatelessWidget {
  IntroScreen({super.key});
  final List<PageViewModel> pages = [
    PageViewModel(
      title: "Recommended Music - 1",
      body: "What Was I Made For- Billie Eilish",
      footer: SizedBox(
        width: 45,
        height: 150,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                elevation: 8),
            onPressed: () {},
            child: const Text("Hello World")),
      ),
      image:
          Image.network('https://upload.wikimedia.org/wikipedia/en/5/54/Billie_Eilish_-_What_Was_I_Made_For%3F.png'),
    ),
    PageViewModel(
      title: "Recommended Music - 2",
      body: "Like You Do - Joji",
      footer: SizedBox(
        width: 45,
        height: 150,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                elevation: 8),
            onPressed: () {},
            child: const Text("Hello World")),
      ),
      image: Image.network('https://image.joox.com/JOOXcover/0/e4e5edca5394a502/300'),
    ),
    PageViewModel(
      title: "Recommended Music - 3",
      body: "Drive Safe - Rich brian",
      footer: SizedBox(
        width: 45,
        height: 150,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                elevation: 8),
            onPressed: () {},
            child: const Text("Hello World")),
      ),
      image: Image.network('https://upload.wikimedia.org/wikipedia/en/1/1a/TheSailorRichBrian.jpg'),
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('On Mood'),
        centerTitle: true,
      ),
      body: IntroductionScreen(
        pages: pages,
        showSkipButton: true,
        skip: const Text('Skip All Best Song Ever'),
        showDoneButton: true,
        done: const Text('I will recommend my song to you next time again :)'),
        showNextButton: true,
        next:const Icon(Icons.arrow_right),
        onDone: () => onDone,
        curve: Curves.bounceOut,
        dotsDecorator: const DotsDecorator(
          size: Size(10,10),
          color: Colors.lightBlue,
          activeColor: Colors.blue,
          activeSize: Size.square(15)
        ),
      ),
    );
  }

  void onDone(context) async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('ON_BOARDING', false);
    Navigator.pushReplacement(context, 
    MaterialPageRoute(builder: (context)=> const HomeScreen()));
  }
}
