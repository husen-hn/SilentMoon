import 'package:flutter/material.dart';

class BannerBox extends StatefulWidget {
  Color bgColor;
  String iconLocalPath;
  double iconWidth;
  String title;
  Color titleColor;
  String description;
  Color descriptionColor;
  String time;
  Color timeColor;
  String btnText;
  Color btnColor;
  Color btnTxtColor;
  BannerBox({
    this.bgColor,
    this.iconLocalPath,
    this.iconWidth,
    this.title,
    this.titleColor,
    this.description,
    this.descriptionColor,
    this.time,
    this.timeColor,
    this.btnText = 'START',
    this.btnColor,
    this.btnTxtColor,
  });
  @override
  _BannerBoxState createState() => _BannerBoxState();
}

class _BannerBoxState extends State<BannerBox> {
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        width: 177,
        height: 230,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: widget.bgColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // top Icon
            Row(
              children: [
                Expanded(
                  child: Container(),
                  flex: 1,
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.topRight,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image(
                        image: AssetImage(widget.iconLocalPath),
                        width: widget.iconWidth,
                      ),
                    ),
                  ),
                  flex: 2,
                )
              ],
            ),
            // Text Title
            Padding(
              padding: EdgeInsets.only(bottom: 10.0, left: 15.0, right: 15.0),
              child: Text(
                widget.title,
                style: TextStyle(
                    color: widget.titleColor,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            //Text Description
            Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Text(
                widget.description,
                style:
                    TextStyle(color: widget.descriptionColor, fontSize: 14.0),
              ),
            ),
            Expanded(child: Container()),
            Padding(
              padding: const EdgeInsets.only(
                left: 15.0,
                bottom: 10.0,
              ),
              child: Row(
                children: [
                  // Text Time
                  Text(
                    widget.time,
                    style: TextStyle(color: widget.timeColor, fontSize: 14.0),
                  ),
                  Expanded(child: Container()),
                  // START Button
                  Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: TextButton(
                      child: Text(widget.btnText),
                      style: TextButton.styleFrom(
                        backgroundColor: widget.btnColor,
                        primary: widget.btnTxtColor,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25.0))),
                      ),
                      onPressed: () {},
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}