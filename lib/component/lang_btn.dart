import 'package:flutter/material.dart';

class LangBtn extends StatefulWidget {
  final String btnTitle;
  final Color btnColor;
  final Color btnTxtColor;
  final ImageProvider imgAsset;
  final Function onTap;
  final bool isActive;

  LangBtn(
      {@required this.btnTitle,
      this.btnColor = const Color(0xffB6B8BF),
      this.btnTxtColor = const Color(0xff3F414E),
      @required this.imgAsset,
      this.isActive = false,
      this.onTap});

  @override
  _LangBtnState createState() => _LangBtnState();
}

class _LangBtnState extends State<LangBtn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20.0, left: 20.0, top: 10.0),
      child: TextButton(
        child: Row(
          children: [
            Text(
              widget.btnTitle,
              style: TextStyle(
                  color: widget.isActive
                      ? const Color(0xffFFCF86)
                      : widget.btnTxtColor),
            ),
            Expanded(child: Container()),
            Image(
              image: widget.imgAsset,
              width: 30,
            )
          ],
        ),
        style: TextButton.styleFrom(
          backgroundColor:
              widget.isActive ? const Color(0xff3F414E) : widget.btnColor,
          primary:
              widget.isActive ? const Color(0xffFFCF86) : widget.btnTxtColor,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
        ),
        onPressed: () {
          widget.onTap(widget.btnTitle);
        },
      ),
    );
  }
}
