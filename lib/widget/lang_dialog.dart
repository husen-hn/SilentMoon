import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LangDialog extends StatelessWidget {
  final LottieBuilder dialogIcon;
  final String title;

  final Widget btn;
  LangDialog({this.dialogIcon, this.title, this.btn});
  _dialogContent(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(24), // dialog border radius
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            offset: const Offset(0.0, 10.0),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          // top image
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: dialogIcon,
          ),
          // title
          Padding(
            padding: const EdgeInsets.only(top: 22.0, left: 22.0, right: 22.0),
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 18.0,
                  color: const Color(0xff474747),
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          // warning
          Padding(
            padding: const EdgeInsets.only(top: 36.0, left: 22.0, right: 22.0),
            child: Text(
              'If you press on Done you will navigating to the Home page',
              style: TextStyle(
                  fontSize: 11.0,
                  color: const Color(0xffFA6E5A),
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          // divider
          Padding(
            padding: const EdgeInsets.only(top: 6.0),
            child: Divider(
              color: Colors.grey,
              height: 1,
            ),
          ),
          // buttom botton
          Row(
            children: [
              Expanded(child: Container()),
              // Cancel btn
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16.0,
                          fontWeight: FontWeight.normal))),

              Expanded(child: Container()),
              Container(
                width: 1.0,
                height: 60.0,
                color: Colors.grey,
              ),
              Expanded(child: Container()),
              btn,
              Expanded(child: Container()),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: _dialogContent(context),
    );
  }
}
