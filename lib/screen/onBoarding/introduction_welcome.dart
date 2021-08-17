import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroductionWelcome extends StatefulWidget {
  @override
  _IntroductionWelcomeState createState() => _IntroductionWelcomeState();
}

class _IntroductionWelcomeState extends State<IntroductionWelcome> {
  @override
  Widget build(BuildContext context) {
    var mediaQ = MediaQuery.of(context).size;
    return Container(
      color: const Color(0xffA3ABFF),
      child: Stack(
        children: [
          // Column(
          //   children: [
          //     // app title
          //     Padding(
          //       padding: EdgeInsets.only(top: 0.0),
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: [
          //           Text(
          //             'Silent',
          //             style: TextStyle(
          //                 fontSize: 18.0,
          //                 letterSpacing: 2.0,
          //                 color: Colors.white,
          //                 fontWeight: FontWeight.bold),
          //           ),
          //           Padding(
          //             padding: const EdgeInsets.all(8.0),
          //             child: Container(
          //               width: MediaQuery.of(context).size.width * .1,
          //               height: MediaQuery.of(context).size.height * .1,
          //               child: Image(
          //                 image: AssetImage("images/logo_two.png"),
          //               ),
          //             ),
          //           ),
          //           Text(
          //             'Moon',
          //             style: TextStyle(
          //                 fontSize: 18.0,
          //                 letterSpacing: 2.0,
          //                 color: Colors.white,
          //                 fontWeight: FontWeight.bold),
          //           ),
          //         ],
          //       ),
          //     ),
          //     // center description
          //     Padding(
          //       padding: EdgeInsets.only(top: 30.0),
          //       child: RichText(
          //           textAlign: TextAlign.center,
          //           text: TextSpan(
          //               text: 'Hi, Welcome',
          //               style: TextStyle(
          //                   color: Color(0xffFFECCC),
          //                   fontWeight: FontWeight.w400,
          //                   fontSize: 30.0),
          //               children: [
          //                 TextSpan(
          //                     text: '\nto Silent Moon',
          //                     style: TextStyle(
          //                       fontWeight: FontWeight.w200,
          //                     )),
          //                 TextSpan(
          //                     text:
          //                         '\n\nExplore the app, Find some peace of mind to\nprepare for meditation.',
          //                     style: TextStyle(
          //                       fontSize: 16.0,
          //                       fontWeight: FontWeight.w300,
          //                     )),
          //               ])),
          //     ),
          //     // center meditation girl
          //     Image(
          //       image: AssetImage("images/intro_girl_medi.png"),
          //       height: 258,
          //       width: MediaQuery.of(context).size.width,
          //       fit: BoxFit.fitWidth,
          //     ),
          //     // bottom sqr
          //     Image(
          //       image: AssetImage("images/intro_rect.png"),
          //       height: 180,
          //       width: MediaQuery.of(context).size.width,
          //       fit: BoxFit.fitWidth,
          //     )
          //   ],
          // ),

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
          ),
          // app titles
          Positioned(
            top: mediaQ.height * .05,
            right: 1,
            left: 1,
            child: Container(
              height: mediaQ.height * .12,
              child: FittedBox(
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
            ),
          ),
          // center description
          Positioned(
            top: mediaQ.height * .2,
            left: 1,
            right: 1,
            child: Container(
              width: mediaQ.width * .5,
              height: mediaQ.height * .2,
              child: FittedBox(
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
                              )),
                        ])),
              ),
            ),
          ),
          // bottom sqr
          Positioned(
            bottom: 0,
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: Image(
                image: AssetImage("images/intro_rect.png"),
                height: mediaQ.height * .2,
                width: mediaQ.width,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          // center meditation girl
          Positioned(
            bottom: mediaQ.height * .199,
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: Image(
                image: AssetImage("images/intro_girl_medi.png"),
                width: mediaQ.width,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          // swipe left anim
          Positioned(
              bottom: mediaQ.height * .07,
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
