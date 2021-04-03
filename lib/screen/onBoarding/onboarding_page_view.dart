import 'package:SilentMoon/screen/onBoarding/introduction_user_brings.dart';
import 'package:SilentMoon/screen/onBoarding/introduction_welcome.dart';
import 'package:SilentMoon/screen/onBoarding/introduction_what_we_do.dart';
import 'package:flutter/material.dart';

class OnBoardingPageView extends StatefulWidget {
  @override
  _OnBoardingPageViewState createState() => _OnBoardingPageViewState();
}

class _OnBoardingPageViewState extends State<OnBoardingPageView> {
  PageController _controller;
  int _pageIndex;

  @override
  void initState() {
    _pageIndex = 0;
    _controller = PageController(initialPage: _pageIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.horizontal,
        controller: _controller,
        children: [
          IntroductionWhatWeDo(),
          IntroductionWelcome(),
          IntroductionUserBrings()
        ],
        onPageChanged: (int index) {
          setState(() {
            _pageIndex = index;
          });
        },
      ),
    );
  }
}
