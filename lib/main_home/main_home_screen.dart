import 'package:daily_task/core/provider/theme_provider.dart';
import 'package:daily_task/main_home/main_home_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Beepy',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          shadowColor: Colors.transparent,
          centerTitle: true,
        ),
        body: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Expanded(
                flex: 3,
                child: Container(
                  height: 319,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(bottom: 8),
                  child: Image(image: AssetImage('assets/image/car_home.png')),
                )),
            Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 8),
                      child: Text('Find Your Vehicle',
                          style: TextStyle(
                              fontSize: 24,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      width: 264,
                      margin: EdgeInsets.only(bottom: 8),
                      child: Text(
                        'Find the perfect vehicle for every occassion!',
                        style: TextStyle(fontSize: 16, fontFamily: 'Poppins'),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Consumer(builder: (context, watch, child) {
                      final _switchVal = watch(mainHomeScreenProvider);
                      return Switch(
                          activeTrackColor: Color(0XFFEB5757),
                          activeColor: Colors.white,
                          value: _switchVal,
                          onChanged: (_isSwitched) => {
                                context
                                    .read(mainHomeScreenProvider.notifier)
                                    .handleSwitch(),
                                if (_switchVal)
                                  {
                                    context
                                        .read(themeProvider.notifier)
                                        .setLight()
                                  }
                                else
                                  {
                                    context
                                        .read(themeProvider.notifier)
                                        .setDark()
                                  }
                              });
                    }),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 64),
                      child: Row(
                        children: [
                          Expanded(
                              child:
                                  InkWell(
                                      onTap: () => {
                                            Navigator.pushNamed(
                                                context, '/carList')
                                          },
                                      child: Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Theme.of(context).buttonColor,
                                        ),
                                        height: 57,
                                        width: 305,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 12, vertical: 8),
                                        child: Text("Continue",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white)),
                                      ))
                              ),
                        ],
                      ),
                    )
                  ],
                ))
          ],
        ));
  }
}
