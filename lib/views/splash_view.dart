import 'package:flutter/material.dart';
import 'package:task6/views/home_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(const Duration(seconds: 2), () {
      // Code to be executed after the delay
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomeView()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: Color.fromARGB(255, 223, 203, 144),
              backgroundImage: AssetImage('assets/images/quiz.png'),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Lets Test Your Knowledge',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Molengo',
                fontSize: 25,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CircularProgressIndicator(),
          ],
        ),
      ),
    ));
  }
}
