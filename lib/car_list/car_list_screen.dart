import 'package:daily_task/car_list/car_list_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CarListScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final _carList = watch(CarListProvider);
    context.read(CarListProvider.notifier).initializeData();
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
        body: ListView.builder(
            shrinkWrap: true,
            itemCount: _carList.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () => {
                  Navigator.pushNamed(context, '/cardetail',arguments: index)
                },
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(
                          left: 15, top: 15, right: 10, bottom: 10),
                      decoration: BoxDecoration(
                          // color: HexColor("#60B5F4"),
                          color: Color(_carList[index].color),
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(_carList[index].name,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                          Text(_carList[index].price,
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white)),
                          Container(
                            child: IconButton(
                              icon: new Icon(_carList[index].isFavorite == true
                                  ? Icons.star
                                  : Icons.star_border),
                              onPressed: () => context
                                  .read(CarListProvider.notifier)
                                  .favorited(index),
                              iconSize: 30,
                              color: _carList[index].isFavorite == true
                                  ? Colors.yellowAccent
                                  : Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                        right: 25,
                        bottom: -5,
                        child: Container(
                          height: 124,
                          width: 200,
                          child:
                              Image(image: AssetImage(_carList[index].image)),
                        )),
                  ],
                ),
              );
            }));
  }
}
