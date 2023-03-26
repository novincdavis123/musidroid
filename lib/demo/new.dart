import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class New extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('hello'.tr().toString().toUpperCase()),
            Text('text1'.tr().toString()),
            GestureDetector(onTap: ()async{
              context.locale=Locale('en','US');
            },
              child: Container(color: Colors.blue,
                  height: 40, width: 190, child: Text('Switch to en-US')),
            ),
            GestureDetector(onTap: ()async{
              context.locale=Locale('en','GB');
            },
              child: Container(color: Colors.red,
                  height: 40, width: 190, child: Text('Switch to en-GB')),
            ),
          ],
        ),
      ),
    );
  }
}
