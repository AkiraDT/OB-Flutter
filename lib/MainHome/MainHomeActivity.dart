import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class MainHomeActivity extends StatelessWidget {
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
              height: 30,
            ),
            Container(
              height: 319,
              width: 427,
              margin: EdgeInsets.only(bottom: 32),
              child: Image(image: AssetImage('assets/image/carDrift.png')),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 16),
              child: Text('Find Your Vehicle',
                  style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold)),
            ),
            Container(
              width: 264,
              margin: EdgeInsets.only(bottom: 16),
              child: Text(
                'Find the perfect vehicle for every occassion!',
                style: TextStyle(fontSize: 16, fontFamily: 'Poppins'),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 64),
              child: Row(
                children: [
                  Expanded(
                      child: InkWell(
                          onTap: () =>
                              {Navigator.pushNamed(context, '/detail')},
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0XFFFA7F35),
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
                          ))),
                ],
              ),
            )
          ],
        ));
  }
}
