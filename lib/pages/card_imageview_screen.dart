import 'package:flutter/material.dart';

class CardImageViewScreen extends StatelessWidget {
  final dynamic data;
  final String? heroTag;
  const CardImageViewScreen({
    Key? key,
    required this.data,
    this.heroTag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: Text(
          data["nationality"],
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        height: _height,
        width: _width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: "$heroTag",
              child: Container(
                width: _width,
                height: _height / 2,
                decoration: BoxDecoration(
                  color: Colors.black,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(data["image"]),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
