import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:myapp/alert_dialog.dart';
import 'package:myapp/pages/card_imageview_screen.dart';
import 'package:myapp/services/alert_dialogue.dart';
import 'package:myapp/services/exit_pop_services.dart';
import 'package:myapp/services/lurl_services.dart';
import 'package:myapp/services/page_navigate_service.dart';
import 'package:myapp/widgets/news_card_widget.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  List bannerImage = [
    {
      "name": "Rahim",
      "age": 23,
      "nationality": "Bangladeshi",
      "image":
          "https://thumbs.dreamstime.com/b/autumn-fall-nature-scene-autumnal-park-beautiful-77869343.jpg",
    },
    {
      "name": "Ramesh",
      "age": 22,
      "nationality": "Indian",
      "image":
          "https://image.shutterstock.com/image-photo/3d-wallpaper-design-waterfall-sea-260nw-1380925703.jpg",
    },
    {
      "name": "Alex",
      "age": 24,
      "nationality": "USA",
      "image": "https://cdn.wallpapersafari.com/1/17/ZMBC10.jpg",
    },
    {
      "name": "Alex",
      "age": 27,
      "nationality": "USA",
      "image":
          "https://cdn.pixabay.com/photo/2021/08/25/20/42/field-6574455__480.jpg",
    },
  ];

  int _current = 0;

  CarouselController buttonCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text("AppBar"),
        leading: IconButton(
          onPressed: () {
            DialogShowService().showExitPop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        actions: [
          IconButton(
              onPressed: () {
                launchURL("tel://214324234");
              },
              icon: Icon(Icons.link))
        ],
      ),
      body: SafeArea(
        child: Container(
          height: _height,
          width: _width,
          child: Column(
            children: [
              Container(
                child: CarouselSlider(
                  carouselController: buttonCarouselController,
                  options: CarouselOptions(
                      height: 220.0,
                      autoPlay: false,
                      onPageChanged: (index, reason) {
                        print("Page Changed $index");

                        print("Current number = $_current");
                        setState(() {
                          _current = index;
                        });
                        print("Current number = $_current");
                      }),
                  items: bannerImage.map((banner) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                            width: _width,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            // decoration: BoxDecoration(color: Colors.amber),
                            child: Card(
                              elevation: 15,
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                      "${banner["image"]}",
                                    ),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "${banner["name"]}",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Icon(
                                            Icons.note_add,
                                            color: Colors.white,
                                            size: 32,
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${banner["nationality"]}",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "${banner["age"]}",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ));
                      },
                    );
                  }).toList(),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: bannerImage.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () =>
                        buttonCarouselController.animateToPage(entry.key),
                    child: Container(
                      width: 12.0,
                      height: 12.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: (Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.white
                                  : Colors.black)
                              .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(
                height: 40,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    "Recent News",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                    padding: EdgeInsets.all(10),
                    shrinkWrap: true,
                    itemCount: bannerImage.length,
                    itemBuilder: (buildContext, index) {
                      var bannerDetails = bannerImage[index];
                      return NewsCardWidget(
                        imageUrl: "${bannerDetails["image"]}",
                        title: "${bannerDetails["nationality"]}",
                        subTitle: "${bannerDetails["name"]}",
                        icon: Icons.arrow_forward_ios,
                        iconColor: bannerDetails["age"] > 23
                            ? Colors.red
                            : Colors.green,
                        heroTag: bannerImage.indexOf(bannerDetails).toString(),
                        imageOnTap: () {
                          print(bannerImage.indexOf(bannerDetails));
                          navigateToNextScreen(
                              context,
                              CardImageViewScreen(
                                heroTag: bannerImage
                                    .indexOf(bannerDetails)
                                    .toString(),
                                data: bannerDetails,
                              ));
                        },
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
