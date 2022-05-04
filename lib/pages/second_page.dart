// @dart=2.9
import 'package:flutter/material.dart';

import '../translation/app_translations.dart';
import '../translation/application.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  bool _selectedMy = false;
  bool _selectedEn = false;
  bool _selectedZh = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second"),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              AppTranslations.of(context).text("page2"),
            ),

            InkWell(
              child: Container(
                //alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(
                    left: 8.0, right: 8.0, top: 10.0, bottom: 10.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text("မြန်မာ"),
                    ),
                    Spacer(),
                  ],
                ),
              ),
              onTap: () async {
                application.onLocaleChanged(Locale('my'));
              },
            ),

            InkWell(
              child: Container(
                //alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(
                    left: 8.0, right: 8.0, top: 10.0, bottom: 10.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text("Eng"),
                    ),
                    Spacer(),
                  ],
                ),
              ),
              onTap: () async {
                application.onLocaleChanged(Locale('en'));
              },
            ),

            // Text(
            //   '$_counter',
            //   style: Theme.of(context).textTheme.headline4,
            // ),
          ],
        ),
      ),
    );
  }
}
