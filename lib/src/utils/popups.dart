import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppPopups {
  AppPopups._();
  static Future showLoadingDialog(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          content: Row(
            children: <Widget>[
              CircularProgressIndicator(),
              SizedBox(width: 20),
              Text('Loading...'),
            ],
          ),
        );
      },
    );
  }

  static Future<void> showPopup(
    BuildContext context, {
    Function? callback,
  }) async {
    //showCupertinoModalPopup(context: context, builder: builder)
    return showDialog(
      context: context,
      builder: (context) {
        return PopScope(
          canPop: true,
          onPopInvokedWithResult: (didPop, result) {
            if (didPop) {
              callback?.call();
            }
          },
          child: Dialog(
            child: Container(
              height: MediaQuery.of(context).size.width * 0.5,
              width: MediaQuery.of(context).size.width * 0.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 250,
                    width: 250,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.asset(
                          'assets/images/quiz_complete.png',
                          height: 200,
                          width: 200,
                          fit: BoxFit.fitHeight,
                        ),
                        Positioned(
                          left: 75,
                          top: 125,
                          child: Text('Game complete'),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      callback?.call();
                      context.pop();
                    },
                    child: Text('Next Quiz'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
