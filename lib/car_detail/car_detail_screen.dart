import 'package:daily_task/car_list/car_list_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CarDetailScreen extends ConsumerWidget {

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final _index = ModalRoute.of(context)!.settings.arguments as int;
    final Car _carData = watch(CarListProvider).elementAt(_index);

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => {Navigator.pop(context)},
          child: Icon(
            Icons.arrow_back_ios,
          ),
        ),
        title: Text(
          'Cars',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        shadowColor: Colors.transparent,
        actions: [
          Container(
            height: 39,
            width: 39,
            margin: EdgeInsets.only(right: 30),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xff2A3640),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/image/user.png",
                  height: 24,
                  width: 24,
                )
              ],
            ),
          )
        ],
      ),
      body: Column(children: [
        Expanded(
          flex: 2,
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 25),
            height: 288.33,
            width: 375,
            child: Image(image: AssetImage(_carData.image)),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(left: 30, top: 20, right: 30, bottom: 10),
            decoration: BoxDecoration(
                // color: HexColor("#60B5F4"),
                color: Color(_carData.color),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40))),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(_carData.name,
                      style: TextStyle(
                          fontSize: 39,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  Container(
                    child: IconButton(
                      icon: new Icon(
                          _carData.isFavorite == true ? Icons.star : Icons.star_border),
                      onPressed: () => context.read(CarListProvider.notifier).favorited(_index),
                      iconSize: 35,
                      color: _carData.isFavorite == true
                          ? Colors.yellowAccent
                          : Colors.white,
                    ),
                  )
                ],
              ),
              Text(_carData.price,
                  style: TextStyle(fontSize: 19, color: Colors.white)),
              SizedBox(
                height: 20,
              ),
              Text('Description',
                  style: TextStyle(
                      fontSize: 19,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                height: 8,
              ),
              Text('Wanna ride the coolest '+ _carData.name +' in the world?',
                  style: TextStyle(fontSize: 15, color: Colors.white)),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 64, vertical: 16),
                child: Row(
                  children: [
                    Expanded(
                        child: InkWell(
                            onTap: () => {print('booked')},
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.white,
                              ),
                              height: 50,
                              width: 305,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 8),
                              child: Text("Book Now",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black
                                  )),
                            ))),
                  ],
                ),
              )
            ]),
          ),
        ),
      ]),
    );
  }
}
