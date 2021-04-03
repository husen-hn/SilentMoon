import 'package:flutter/material.dart';

class MusicBox extends StatefulWidget {
  bool darkMood;
  Color bgColor;
  String imgLocalPath;
  Color imgBg;
  String title;
  Color titleColor;
  String type;
  Color typeColor;
  Color dotColor;
  String time;
  Color timeColor;
  final Function onTap;

  MusicBox(
      {this.darkMood = false,
      this.bgColor,
      this.imgLocalPath,
      this.imgBg,
      this.title,
      this.titleColor,
      this.type,
      this.typeColor,
      this.dotColor,
      this.time,
      this.timeColor,
      this.onTap});

  @override
  _MusicBoxState createState() => _MusicBoxState();
}

class _MusicBoxState extends State<MusicBox> {
  @override
  Widget build(BuildContext context) {
    return FittedBox(
        child: InkWell(
      child: Container(
        width: 162,
        height: 181.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: widget.bgColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // top image
            Align(
              alignment: Alignment.topCenter,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Container(
                  color: widget.imgBg,
                  child: Image(
                    height: 115.0,
                    image: AssetImage(widget.imgLocalPath),
                  ),
                ),
              ),
            ),
            // Text Title
            Padding(
              padding: EdgeInsets.only(
                  bottom: 5.0, left: 5.0, right: 5.0, top: 10.0),
              child: Text(
                widget.title,
                style: TextStyle(
                    color: widget.titleColor,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold),
              ),
            ),

            Container(
                padding: EdgeInsets.only(left: 5.0, right: 5.0),
                child: Row(
                  children: [
                    // Box Type
                    Text(
                      widget.type,
                      style: TextStyle(
                        color: widget.typeColor,
                        fontSize: 11.0,
                      ),
                    ),
                    // Dot
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        padding: EdgeInsets.all(1.5),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10)), //here
                          color: widget.dotColor,
                        ),
                      ),
                    ),
                    // Box Time
                    Text(
                      widget.time,
                      style: TextStyle(
                        color: widget.timeColor,
                        fontSize: 11.0,
                      ),
                    )
                  ],
                )),
          ],
        ),
      ),
      onTap: () {
        widget.onTap(widget.title, widget.type);
      },
    ));
  }
}
