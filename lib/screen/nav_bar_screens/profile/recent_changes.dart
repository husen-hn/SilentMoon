import 'package:SilentMoon/data/model/recent_changes_model.dart';
import 'package:SilentMoon/generated/l10n.dart';
import 'package:flutter/material.dart';

class RecentChanges extends StatefulWidget {
  @override
  _RecentChangesState createState() => _RecentChangesState();
}

class _RecentChangesState extends State<RecentChanges> {
  List<RecentChangesModel> changesList = [
    RecentChangesModel(version: '0.0.1 alpha', changes: ['UI completed']),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).recentchanges,
          style: TextStyle(color: const Color(0xff3F414E)),
        ),
        iconTheme: IconThemeData(color: const Color(0xff3F414E)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.grey[50],
      ),
      body: Directionality(
        textDirection: TextDirection.ltr,
        child: ListView.builder(
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
                              color: const Color(0xff3F414E)),
                        ),
                        // vertical line
                        Container(
                          height: changesList[index].changes.length * 30.0,
                          width: 2.0,
                          color: const Color(0xff3F414E),
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
                              itemBuilder:
                                  (BuildContext context, int subIndex) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 5.0),
                                  child: Text(
                                      changesList[index].changes[subIndex]),
                                );
                              }),
                        )
                      ],
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}
