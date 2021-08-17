import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroductionWhatWeDo extends StatefulWidget {
  @override
  _IntroductionWhatWeDoState createState() => _IntroductionWhatWeDoState();
}

class _IntroductionWhatWeDoState extends State<IntroductionWhatWeDo> {
  @override
  Widget build(BuildContext context) {
    var mediaQ = MediaQuery.of(context).size;
    return Column(
      children: [
        Stack(
          children: [
            // bg image
            Image(
              image: AssetImage("images/what_we_do_bg_one.png"),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .65,
              fit: BoxFit.fitWidth,
            ),
            // bg center line
            Positioned(
              top: MediaQuery.of(context).size.height * .55,
              child: Image(
                image: AssetImage("images/what_we_do_bg_two.png"),
                width: MediaQuery.of(context).size.width,
                // height: MediaQuery.of(context).size.height * .5,
                fit: BoxFit.fill,
              ),
            ),
            // app title
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
                            color: const Color(0xff3F414E),
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * .1,
                          height: MediaQuery.of(context).size.height * .1,
                          child: Image(
                            image: AssetImage("images/logo.png"),
                          ),
                        ),
                      ),
                      Text(
                        'Moon',
                        style: TextStyle(
                            fontSize: 18.0,
                            letterSpacing: 2.0,
                            color: const Color(0xff3F414E),
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // center image
            Positioned(
              top: 140.0,
              right: 20.0,
              left: 20.0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 332.22,
                  height: 242.69,
                  child: Image(
                    image: AssetImage("images/what_we_do.png"),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
          ],
        ),
        // center title
        Center(
          child: FittedBox(
            fit: BoxFit.contain,
            child: Container(
              height: mediaQ.height * .05,
              child: Text(
                'We are what we do',
                style: TextStyle(
                    color: const Color(0xff3F414E),
                    fontSize: 30.0,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ),
        // center description
        Center(
          child: FittedBox(
            fit: BoxFit.contain,
            child: Container(
              height: mediaQ.height * .1,
              child: Text(
                '\nThousand of people are usign silent moon\nfor smalls meditation',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: const Color(0xffA1A4B2),
                    fontSize: 16.0,
                    fontWeight: FontWeight.w300),
              ),
            ),
          ),
        ), // swipe right sign
        // swipe left anim
        SizedBox(height: mediaQ.height * .05),
        Lottie.asset('assets/swipe_right_platform.json', height: 60),
      ],
    );
  }
}
