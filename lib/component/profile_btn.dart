import 'package:flutter/material.dart';

class ProfileBtn extends StatefulWidget {
  final String btnTitle;
  final Color btnColor;
  final Color btnTxtColor;
  final IconData icon;
  final Function onTap;

  ProfileBtn(
      {@required this.btnTitle,
      @required this.btnColor,
      @required this.btnTxtColor,
      @required this.icon,
      this.onTap});

  @override
  _ProfileBtnState createState() => _ProfileBtnState();
}

class _ProfileBtnState extends State<ProfileBtn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20.0, left: 20.0, top: 10.0),
      child: TextButton(
        child: Row(
          children: [
            Text(
              widget.btnTitle,
              style: TextStyle(color: widget.btnTxtColor),
            ),
            Expanded(child: Container()),
            Icon(
              widget.icon,
              color: widget.btnTxtColor,
            )
          ],
        ),
        style: TextButton.styleFrom(
          backgroundColor: widget.btnColor,
          primary: widget.btnTxtColor,
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
