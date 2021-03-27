import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroductionWelcome extends StatefulWidget {
  @override
  _IntroductionWelcomeState createState() => _IntroductionWelcomeState();
}

class _IntroductionWelcomeState extends State<IntroductionWelcome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffA3ABFF),
      child: Stack(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              // app title
              Padding(
                padding: EdgeInsets.only(top: 70.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Silent',
                      style: TextStyle(
                          fontSize: 18.0,
                          letterSpacing: 2.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * .1,
                        height: MediaQuery.of(context).size.height * .1,
                        child: Image(
                          image: AssetImage("images/logo_two.png"),
                        ),
                      ),
                    ),
                    Text(
                      'Moon',
                      style: TextStyle(
                          fontSize: 18.0,
                          letterSpacing: 2.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              // center description
              Padding(
                padding: EdgeInsets.only(top: 30.0),
                child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: 'Hi, Welcome',
                        style: TextStyle(
                            color: Color(0xffFFECCC),
                            fontWeight: FontWeight.w400,
                            fontSize: 30.0),
                        children: [
                          TextSpan(
                              text: '\nto Silent Moon',
                              style: TextStyle(
                                fontWeight: FontWeight.w200,
                              )),
                          TextSpan(
                              text:
                                  '\n\nExplore the app, Find some peace of mind to\nprepare for meditation.',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w300,
                              ))
                        ])),
              ),
            ],
          ),
          // bottom sqr
          Positioned(
            bottom: 0,
            child: Image(
              image: AssetImage("images/intro_rect.png"),
              height: 180,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fill,
            ),
          ),
          // center meditation girl
          Positioned(
            bottom: 179,
            child: Image(
              image: AssetImage("images/intro_girl_medi.png"),
              height: 258,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          // bird
          Positioned(
            bottom: 400.0,
            left: 100,
            child: Image(
              image: AssetImage("images/intro_bird.png"),
              width: 30,
            ),
          ),
          // bird
          Positioned(
            bottom: 450.0,
            right: 80,
            child: Image(
              image: AssetImage("images/intro_bird.png"),
              width: 60,
            ),
          ), // swipe left anim
          // swipe left anim
          Positioned(
              bottom: 80,
              left: 20.0,
              right: 20.0,
              child: Lottie.asset(
                'assets/swipe_right_platform.json',
                height: 60,
              )),
        ],
      ),
    );
  }
}
