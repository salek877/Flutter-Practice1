import 'package:flutter/material.dart';

class NewsCardWidget extends StatelessWidget {
  final String? imageUrl;
  final String? title;
  final String? subTitle;
  final IconData? icon;
  final Color? iconColor;
  final void Function()? imageOnTap;
  final Object heroTag;

  const NewsCardWidget({
    Key? key,
    this.imageUrl,
    this.title,
    this.subTitle,
    this.icon,
    this.iconColor,
    this.imageOnTap,
    required this.heroTag,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        child: ListTile(
          leading: Hero(
            tag: heroTag,
            child: Material(
              child: InkWell(
                onTap: imageOnTap,
                child: Card(
                  elevation: 10,
                  child: Container(
                    width: 80,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage("$imageUrl"),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          title: Text("${title ?? ""}"),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("${subTitle ?? ""}"),
              Icon(
                icon,
                color: iconColor == null ? Colors.black : iconColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
