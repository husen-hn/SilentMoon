import 'package:flutter/material.dart';

class PlayList extends StatefulWidget {
  String title;
  String type;
  String description;

  PlayList(
      {this.title = "Title",
      this.description = "Descritpion",
      this.type = "COURSE"});
  @override
  _PlayListState createState() => _PlayListState();
}

class _PlayListState extends State<PlayList>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  List<Map> musics = [
    {"name": "Focus Attention", "time": "10 MIN"},
    {"name": "Body Scan", "time": "4 MIN"},
    {"name": "Making Happiness ", "time": "3 MIN"},
    {"name": "Focus Attention", "time": "6 MIN"},
    {"name": "Body Scan", "time": "2 MIN"},
    {"name": "Making Happiness ", "time": "7 MIN"},
    {"name": "", "time": ""},
    {"name": "", "time": ""},
  ];

  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: CustomScrollView(
            slivers: [
              //top images & actions
              Theme(
                data: Theme.of(context).copyWith(
                    accentColor: Color(0xff8E97FD), primaryColor: Colors.white),
                child: SliverAppBar(
                  expandedHeight: 490,
                  automaticallyImplyLeading: false,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        //top image
                        Container(
                          height: 250.0,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                              image: DecorationImage(
                                  image: AssetImage("images/daily_thought.png"),
                                  fit: BoxFit.fill)),
                          child: Stack(
                            children: [
                              // action buttons
                              Positioned(
                                top: 40,
                                right: 10,
                                left: 30,
                                child: Row(
                                  children: [
                                    //back
                                    Container(
                                        decoration: ShapeDecoration(
                                          color: const Color(0xffF2F2F2),
                                          shape: const CircleBorder(),
                                        ),
                                        child: IconButton(
                                          autofocus: true,
                                          icon: Image(
                                            image:
                                                AssetImage("images/back.png"),
                                            color: Color(0xff3F414E),
                                            width: 18.0,
                                          ),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        )),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          .4,
                                    ),
                                    //favorite
                                    Container(
                                      decoration: ShapeDecoration(
                                        color: const Color(0xff03174C)
                                            .withOpacity(0.5),
                                        shape: const CircleBorder(),
                                      ),
                                      child: IconButton(
                                        autofocus: true,
                                        icon: Image(
                                          image:
                                              AssetImage("images/favorite.png"),
                                          color: Color(0xffE6E7F2),
                                          width: 20.0,
                                        ),
                                        onPressed: () {},
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    //download
                                    Container(
                                        decoration: ShapeDecoration(
                                          color: const Color(0xff03174C)
                                              .withOpacity(0.5),
                                          shape: const CircleBorder(),
                                        ),
                                        child: IconButton(
                                          autofocus: true,
                                          icon: Image(
                                            image: AssetImage(
                                                "images/download.png"),
                                            color: Color(0xffE6E7F2),
                                            width: 20.0,
                                          ),
                                          onPressed: () {},
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
                              text: '${widget.title}\n',
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
                                    text: '${widget.description}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 13.0,
                                        color: Color(0xffA1A4B2))),
                                TextSpan(
                                    text: '\n\nPick a Narrator',
                                    style: TextStyle(
                                        // fontWeight: FontWeight.normal,
                                        fontSize: 20.0,
                                        color: Color(0xff3F414E))),
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
                    accentColor: Color(0xff8E97FD), primaryColor: Colors.white),
                child: SliverAppBar(
                  elevation: 0,
                  snap: false,
                  pinned: true,
                  floating: true,
                  bottom: TabBar(
                    controller: _tabController,
                    isScrollable: false,
                    labelColor: Color(0xff8E97FD),
                    unselectedLabelColor: Color(0xffA1A4B2),
                    indicator: UnderlineTabIndicator(
                        borderSide:
                            BorderSide(width: 2.0, color: Color(0xff8E97FD)),
                        insets: EdgeInsets.symmetric(horizontal: 70.0)),
                    tabs: [
                      Tab(
                        child: Text(
                          'VOICES',
                          style: TextStyle(letterSpacing: 1.0),
                        ),
                      ),
                      Tab(
                        child: Text(
                          "FAVORITE",
                          style: TextStyle(letterSpacing: 1.0),
                        ),
                      ),
                    ],
                  ),
                  expandedHeight: 30,
                ),
              ),
              //Voice List
              SliverFixedExtentList(
                itemExtent: 70.0,
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return TabBarView(
                      controller: _tabController,
                      children: [
                        // Voice Tab
                        Container(
                          padding:
                              EdgeInsets.only(bottom: 10, left: 10, top: 10),
                          color: Colors.white,
                          child: InkWell(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    // play btn
                                    Container(
                                      width: 40.0,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          border: Border.all(
                                              width: 1,
                                              color: Color(0xffA1A4B2))),
                                      child: IconButton(
                                        autofocus: true,
                                        icon: Image(
                                          image: AssetImage("images/play.png"),
                                          color: Color(0xffA1A4B2),
                                          width: 12.0,
                                        ),
                                        onPressed: () {},
                                      ),
                                    ),
                                    // voice title & time
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 10.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            musics[0]["name"],
                                            style: TextStyle(
                                                color: Color(0xff3F414E),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16.0),
                                          ),
                                          Text(
                                            musics[0]["time"],
                                            style: TextStyle(
                                                color: Color(0xffA1A4B2),
                                                fontSize: 11.0),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        // Favorite Tab
                        Container(
                          padding:
                              EdgeInsets.only(bottom: 10, left: 10, top: 10),
                          color: Colors.white,
                          child: InkWell(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    // play btn
                                    Container(
                                      width: 40.0,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          border: Border.all(
                                              width: 1,
                                              color: Color(0xffA1A4B2))),
                                      child: IconButton(
                                        autofocus: true,
                                        icon: Image(
                                          image: AssetImage("images/play.png"),
                                          color: Color(0xffA1A4B2),
                                          width: 12.0,
                                        ),
                                        onPressed: () {},
                                      ),
                                    ),
                                    // voice title & time
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 10.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            musics[0]["name"],
                                            style: TextStyle(
                                                color: Color(0xff3F414E),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16.0),
                                          ),
                                          Text(
                                            musics[0]["time"],
                                            style: TextStyle(
                                                color: Color(0xffA1A4B2),
                                                fontSize: 11.0),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
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
