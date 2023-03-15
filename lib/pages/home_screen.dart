import 'package:flutter/material.dart';
import 'package:myapp/pages/profile_screen.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: _width,
          height: _height,
          color: Colors.deepPurple,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  // <==================================================== AppBar Section Start
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.menu,
                          size: 32,
                          color: Colors.white,
                        ),
                        InkWell(
                          onTap: () {
                            print("Navigate to Next Screen");
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProfileScreen()));
                          },
                          child: CircleAvatar(
                            radius: 26,
                            backgroundColor: Colors.white,
                            backgroundImage:
                                AssetImage("assets/avatar_image.jpg"),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // <==================================================== AppBar Section End

                  SizedBox(
                    height: 20,
                  ),

                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Hi, Cherry",
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "6 Tasks are pending",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  Card(
                    color: Colors.deepPurple[300],
                    elevation: 15,
                    child: Container(
                      width: _width,
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Mobile App Designer",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "Alley & Julia",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontStyle: FontStyle.italic),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 108,
                                  child: Stack(
                                    children: [
                                      CircleAvatar(
                                        radius: 26,
                                        backgroundColor: Colors.white,
                                        backgroundImage: AssetImage(
                                            "assets/avatar_image.jpg"),
                                      ),
                                      Positioned(
                                        left: 45,
                                        child: PhysicalShape(
                                          color: Colors.white,
                                          clipper: ShapeBorderClipper(
                                              shape: CircleBorder()),
                                          elevation: 18,
                                          child: CircleAvatar(
                                            radius: 26,
                                            backgroundColor: Colors.white,
                                            backgroundImage: AssetImage(
                                                "assets/avatar_image.jpg"),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_sharp,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Review System",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.teal,
                          child: Icon(
                            Icons.reviews,
                            color: Colors.white,
                            size: 20,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 20,
                      itemBuilder: (buildContext, index) {
                        return Card(
                          elevation: 15,
                          color: Colors.deepPurple[300],
                          child: Container(
                            width: _width / 3,
                            height: _width / 2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "22",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Count",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),

                  Container()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
