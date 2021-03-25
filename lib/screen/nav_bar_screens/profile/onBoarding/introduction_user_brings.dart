import 'package:SilentMoon/data/model/user_brings_model.dart';
import 'package:flutter/material.dart';

class IntroductionUserBrings extends StatefulWidget {
  @override
  _IntroductionUserBringsState createState() => _IntroductionUserBringsState();
}

class _IntroductionUserBringsState extends State<IntroductionUserBrings> {
  List<UserBringsModel> userBridngs = [
    UserBringsModel(
        title: 'Reduce Stress',
        titleColor: Colors.white,
        imgAsset: AssetImage('images/reduce_stress.png'),
        bgColor: Color(0xff9BA3FF)),
    UserBringsModel(
        title: 'Improve\nPerformance',
        titleColor: Colors.white,
        imgAsset: AssetImage('images/improve_performance.png'),
        bgColor: Color(0xffFA6E5A)),
    UserBringsModel(
        title: 'Increase\nHappiness',
        titleColor: Color(0xff3F414E),
        imgAsset: AssetImage('images/increase_happiness.png'),
        bgColor: Color(0xffFEB18F)),
    UserBringsModel(
        title: 'Reduce Anxiety',
        titleColor: Color(0xff3F414E),
        imgAsset: AssetImage('images/reduce_anxiety.png'),
        bgColor: Color(0xffFFCF86)),
    UserBringsModel(
        title: 'Personal\nGrowth',
        titleColor: Colors.white,
        imgAsset: AssetImage('images/personal_growth.png'),
        bgColor: Color(0xff6CB28E)),
    UserBringsModel(
        title: 'Better Sleep',
        titleColor: Colors.white,
        imgAsset: AssetImage('images/better_sleep.png'),
        bgColor: Color(0xff3F414E))
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // background
        Positioned(
          bottom: 0,
          child: Image(
            image: AssetImage("images/intro_bg.png"),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .8,
            fit: BoxFit.fill,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                // top texts
                RichText(
                  text: TextSpan(
                      text: 'What Brings you',
                      style: TextStyle(
                          color: Color(0xff3F414E),
                          fontSize: 28.0,
                          fontWeight: FontWeight.w700),
                      children: [
                        TextSpan(
                            text: '\nto Silent Moon?',
                            style: TextStyle(fontWeight: FontWeight.normal)),
                        TextSpan(
                            text: '\n\nour goals in SilentMoon :\n',
                            style: TextStyle(
                                color: Color(0xffA1A4B2),
                                fontSize: 20.0,
                                fontWeight: FontWeight.normal))
                      ]),
                ),
                // list of brings
                GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: userBridngs.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      childAspectRatio: 1,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          color: userBridngs[index].bgColor,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image(
                              image: userBridngs[index].imgAsset,
                              width: 176,
                              height: 114,
                            ),
                            Expanded(child: Container()),
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Text(
                                '${userBridngs[index].title}\n',
                                style: TextStyle(
                                    color: userBridngs[index].titleColor,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w700),
                              ),
                            )
                          ],
                        ),
                      );
                    }), // save and no thanks btn
                //start btn
                SizedBox(
                  height: 20.0,
                ),
                TextButton(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'GET STARTED',
                      style: TextStyle(fontSize: 14.0),
                    ),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: Color(0xff8E97FD),
                    primary: Colors.white,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0))),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  },
                ),
                SizedBox(
                  height: 50.0,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
