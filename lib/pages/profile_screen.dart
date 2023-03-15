import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _fruitsCtrl = TextEditingController();

  List fruitsList = [];

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Screen"),
      ),
      body: Container(
        height: _height,
        width: _width,
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                print(fruitsList);
              },
              child: Text("Show List"),
            ),
            TextFormField(
              controller: _fruitsCtrl,
              decoration: InputDecoration(
                labelText: "Fruit's Name",
                hintText: "e.g. Apple",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  fruitsList.add(_fruitsCtrl.text);
                });
                print(fruitsList);
                _fruitsCtrl.clear();
              },
              child: Text("Add Fruits"),
            ),
            SizedBox(
              height: 20,
            ),
            GridView.builder(
                shrinkWrap: true,
                itemCount: fruitsList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (buildContext, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                        elevation: 15,
                        color: Colors.amber,
                        child: Center(
                            child: Text(
                          "${fruitsList[index]}",
                          style: TextStyle(
                            fontSize: 30,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                          ),
                        ))),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
