import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CarAppBar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return AppBar(
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
    );
  }

}