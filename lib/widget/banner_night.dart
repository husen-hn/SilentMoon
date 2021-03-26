import 'package:flutter/material.dart';

class BannerNight extends StatefulWidget {
  final ImageProvider<Object> bgImage;
  final String title;
  final Color titleColor;
  final String description;
  final Color descriptionColor;
  final String btnTitle;
  final Color btnColor;
  final Color btnTxtColor;
  final Function onTap;

  BannerNight(
      {@required this.bgImage,
      @required this.title,
      @required this.titleColor,
      @required this.description,
      @required this.descriptionColor,
      @required this.btnTitle,
      @required this.btnColor,
      @required this.btnTxtColor,
      this.onTap});

  @override
  _BannerNightState createState() => _BannerNightState();
}

class _BannerNightState extends State<BannerNight> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 373.6,
      height: 233,
      decoration: BoxDecoration(
          color: const Color(0xfff9dfce),
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          image: DecorationImage(
            image: widget.bgImage,
            fit: BoxFit.cover,
          )),
      child: Padding(
        padding: const EdgeInsets.only(top: 60.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: '${widget.title}\n',
                    style: TextStyle(
                        fontSize: 36.0,
                        fontWeight: FontWeight.bold,
                        color: widget.titleColor,
                        letterSpacing: 1.0),
                    children: [
                      TextSpan(
                          text: widget.description,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: widget.descriptionColor,
                            fontWeight: FontWeight.normal,
                          ))
                    ])),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: TextButton(
                child: Text(widget.btnTitle),
                style: TextButton.styleFrom(
                  backgroundColor: widget.btnColor,
                  primary: widget.btnTxtColor,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0))),
                ),
                onPressed: () {
                  widget.onTap(widget.title);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
