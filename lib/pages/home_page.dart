import 'package:flutter/material.dart';

class ScoreHome extends StatefulWidget {
  const ScoreHome({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ScoreHomeState createState() => _ScoreHomeState();
}

class _ScoreHomeState extends State<ScoreHome> {
  int num = 0;
  void increaseNum() {
    setState(() {
      //setstate for live result update on screen
      num++;
    });
  }

  void decreaseNum() {
    setState(() {
      num--;
    });
  }

  void ResetNum() {
    setState(() {
      num = 0;
    });
  }

  // var randomNumber = 0;
  // Future<void> randomColorSet() async {
  //   randomNumber = Random().nextInt(0xFFFFFFFF);
  //   print(randomNumber.toString());
  //   setState(() {});
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   Timer.periodic(Duration(seconds: 1), (timer) {
  //     randomColorSet();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.red,
      appBar: AppBar(
        title: Text("Score Changer"),
        centerTitle: true,
      ),
      drawer: Drawer(backgroundColor: Colors.red),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.favorite),
        onPressed: ResetNum,
      ),
      body: Column(
        children: [
          SizedBox(height: 25),
          Center(
            child: Text("Scoreee is",
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 27,
                    fontWeight: FontWeight.bold)),
          ),
          Center(
            child: Text(num.toString(),
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 55,
                    fontWeight: FontWeight.bold)),
          ),
          SizedBox(height: 25),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            RaisedButton(
              color: Colors.blue,
              child: Text(
                "Increase",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: increaseNum,
            ),
            SizedBox(width: 10),
            RaisedButton(
              color: Colors.red,
              // ignore: sort_child_properties_last
              child: Text(
                "Decrease",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: decreaseNum,
            ),
          ]),
          Center(
            child: Text((num * 2).toString(),
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 55,
                    fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
