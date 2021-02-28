import 'package:flutter/material.dart';

class PlayList extends StatefulWidget {
  @override
  _PlayListState createState() => _PlayListState();
}

class _PlayListState extends State<PlayList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: CustomScrollView(
            slivers: [
              Theme(
                data: Theme.of(context).copyWith(
                    accentColor: Color(0xff8E97FD), primaryColor: Colors.white),
                child: SliverAppBar(
                  floating: false,
                  pinned: false,
                  expandedHeight: 430,
                  automaticallyImplyLeading: false,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        //top image
                        Container(
                          height: 288.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                              image: DecorationImage(
                                  image: AssetImage("images/nature.png"),
                                  fit: BoxFit.cover)),
                          child: Stack(
                            children: [
                              // action buttons
                              Positioned(
                                top: 30,
                                right: 10,
                                child: Row(
                                  children: [
                                    TextButton(
                                        child: Container(
                                      decoration: ShapeDecoration(
                                        color: const Color(0xffF2F2F2),
                                        shape: const CircleBorder(),
                                      ),
                                      child: IconButton(
                                        icon: const Icon(Icons.arrow_back,
                                            color: Color(0xff3F414E)),
                                        onPressed: () =>
                                            Navigator.of(context).pop(),
                                      ),
                                    )),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          .4,
                                    ),
                                    TextButton(
                                        child: Container(
                                      decoration: ShapeDecoration(
                                        color: const Color(0xff03174C)
                                            .withOpacity(0.5),
                                        shape: const CircleBorder(),
                                      ),
                                      child: IconButton(
                                        icon: const Icon(
                                            Icons.favorite_border_outlined,
                                            color: Color(0xffE6E7F2)),
                                        onPressed: () =>
                                            Navigator.of(context).pop(),
                                      ),
                                    )),
                                    TextButton(
                                        child: Container(
                                      decoration: ShapeDecoration(
                                        color: const Color(0xff03174C)
                                            .withOpacity(0.5),
                                        shape: const CircleBorder(),
                                      ),
                                      child: IconButton(
                                        icon: const Icon(
                                            Icons.cloud_download_outlined,
                                            color: Color(0xffE6E7F2)),
                                        onPressed: () =>
                                            Navigator.of(context).pop(),
                                      ),
                                    )),
                                  ],
                                ),
                              ),
                              //cloud
                              Positioned(
                                  top: 10.0,
                                  left: 20.0,
                                  child: Image(
                                    image: AssetImage('images/cloud.png'),
                                    width: 50,
                                    color: Color(0xff616077).withOpacity(.3),
                                  )),
                              //cloud
                              Positioned(
                                  top: 130.0,
                                  right: 20.0,
                                  child: Image(
                                    image: AssetImage('images/cloud.png'),
                                    width: 50,
                                    color: Color(0xff616077).withOpacity(.3),
                                  )),
                              //botton clouds
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 15.0),
                                  child: Image(
                                    image: AssetImage('images/cloud_top.png'),
                                    width: MediaQuery.of(context).size.width,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 0.0),
                                  child: Image(
                                    image:
                                        AssetImage('images/cloud_center.png'),
                                    width: MediaQuery.of(context).size.width,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10)),
                                    child: Image(
                                      image:
                                          AssetImage('images/cloud_bottom.png'),
                                      width: MediaQuery.of(context).size.width,
                                    ),
                                  ),
                                ),
                              ),
                              //fins
                              Positioned(
                                top: 140.0,
                                right: 90.0,
                                child: Transform.rotate(
                                  angle: 5.0,
                                  child: Image(
                                    image: AssetImage('images/fin.png'),
                                    width: 70,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 190.0,
                                right: 80.0,
                                child: Transform.rotate(
                                  angle: 5.5,
                                  child: Image(
                                    image: AssetImage('images/fin.png'),
                                    width: 70,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 210.0,
                                right: 20.0,
                                child: Transform.rotate(
                                  angle: 6.3,
                                  child: Image(
                                    image: AssetImage('images/fin.png'),
                                    width: 70,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        //title & description
                        Padding(
                          padding: const EdgeInsets.only(top: 25.0, left: 10.0),
                          child: RichText(
                            text: TextSpan(
                              text: 'Happy Morning\n',
                              style: TextStyle(
                                  color: Color(0xff3F414E),
                                  fontSize: 34,
                                  fontWeight: FontWeight.bold),
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'COURSE\n',
                                    style: TextStyle(
                                      height: 3.0,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.0,
                                      color: Color(0xffA1A4B2),
                                    )),
                                TextSpan(
                                    text:
                                        'Ease the mind into a restful night’s sleep  with these deep, amblent tones.',
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 13.0,
                                        color: Color(0xffA1A4B2))),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              //TabBar

              Theme(
                  data: Theme.of(context).copyWith(
                      accentColor: Color(0xff8E97FD),
                      primaryColor: Colors.white),
                  child: SliverPersistentHeader(
                    delegate: _SliverAppBarDelegate(
                      TabBar(
                        isScrollable: false,
                        labelColor: Color(0xff8E97FD),
                        unselectedLabelColor: Color(0xffA1A4B2),
                        indicator: UnderlineTabIndicator(
                            borderSide: BorderSide(
                                width: 2.0, color: Color(0xff8E97FD)),
                            insets: EdgeInsets.symmetric(horizontal: 70.0)),
                        tabs: [
                          Tab(
                            child: Text(
                              'MALE VOICE',
                              style: TextStyle(letterSpacing: 1.0),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "FEMALE VOICE",
                              style: TextStyle(letterSpacing: 1.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                    pinned: true,
                  )),
              //Music List
              SliverFixedExtentList(
                itemExtent: 50.0,
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    // return TabBarView(children: [
                    //   Icon(Icons.apps),
                    //   Icon(Icons.movie),
                    //   Icon(Icons.games),
                    // ]);
                    return Container(
                      alignment: Alignment.center,
                      color: Colors.lightBlue[100 * (index % 9)],
                      child: Text('List Item $index'),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
