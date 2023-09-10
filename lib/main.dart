import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz_app/background/color.dart';
import 'package:quiz_app/background/image.dart';
import 'package:quiz_app/background/style.dart';
import 'package:quiz_app/quesscreen.dart';

main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: light));
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const QuizApp(),
      theme: ThemeData(
        fontFamily: "quick",
      ),
      title: "Demo",
    );
  }
}

class QuizApp extends StatelessWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [light, purple])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(color: black, width: 2),
                ),
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      CupertinoIcons.xmark,
                      color: black,
                      size: 25,
                    )),
              ),
              const SizedBox(height: 20),
              Image.asset(image1),
              const SizedBox(height: 25),
              normalText(color: black, size: 25, text: "Welcome!"),
              const SizedBox(height: 15),
              headingText(color: black, size: 32, text: "QUIZZ"),
              const SizedBox(height: 10),
              headingText(color: black, size: 32, text: "Test Your Knowledge"),
              const SizedBox(height: 15),
              normalText(
                  color: black,
                  size: 22,
                  text: "Are you prepared enough to face our questions?!"),
              const Spacer(),
              Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const QuesScreen()));
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    alignment: Alignment.center,
                    width: size.width - 100,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child:
                        headingText(color: black, size: 18, text: "Continue"),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
