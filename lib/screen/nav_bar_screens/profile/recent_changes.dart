import 'package:SilentMoon/data/model/recent_changes_model.dart';
import 'package:flutter/material.dart';

class RecentChanges extends StatefulWidget {
  @override
  _RecentChangesState createState() => _RecentChangesState();
}

class _RecentChangesState extends State<RecentChanges> {
  List<RecentChangesModel> changesList = [
    RecentChangesModel(version: '1.0.0', changes: ['1', '2', '3', '4']),
    RecentChangesModel(version: '1.3.0', changes: ['1', '2']),
    RecentChangesModel(
        version: '1.8.0', changes: ['1', '2', '3', '4', '3', '4']),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Recent Changes',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.grey[50],
      ),
      body: ListView.builder(
          itemCount: changesList.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.only(left: 20.0, right: 20.0),
              child: Row(
                children: [
                  Column(
                    children: [
                      // circule
                      Container(
                        height: 10.0,
                        width: 10.0,
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(100)),
                            color: Color(0xff3F414E)),
                      ),
                      // vertical line
                      Container(
                        height: changesList[index].changes.length * 30.0,
                        width: 2.0,
                        color: Color(0xff3F414E),
                      ),
                    ],
                  ),
                  // version & changes
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text(
                          'version ${changesList[index].version}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        height: changesList[index].changes.length * 30.0,
                        width: MediaQuery.of(context).size.width * .8,
                        padding: EdgeInsets.only(left: 20.0, top: 10.0),
                        child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: changesList[index].changes.length,
                            itemBuilder: (BuildContext context, int subIndex) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 5.0),
                                child:
                                    Text(changesList[index].changes[subIndex]),
                              );
                            }),
                      )
                    ],
                  )
                ],
              ),
            );
          }),
    );
  }
}
