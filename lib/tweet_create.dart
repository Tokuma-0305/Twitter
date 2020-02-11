import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TweetCreatePage extends StatelessWidget {
  String text = "ツイーツつる";
  void _createData() {
    Firestore.instance
        .collection("tweets")
        .add({"content": myController.text,"name": "uniuihi"});
  }

  ///sample
  void printText(String text){
    print(text);
  }

  final myController = TextEditingController();

  ///textEditingController
  ///FlatButtonのonPressedにFunctionを足す

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(children: <Widget>[
        const SizedBox(
          height: 50,
        ),
        Row(
          children: <Widget>[
            Container(
              height: 30,
              width: 100,
              child: FlatButton(
                child:  Text("キャンセル", style: TextStyle(color: Colors.blue)),
                onPressed: (){
                  Navigator.pop(context);
                },
              )

            ),
            const Spacer(),
            Container(
              height: 30,
              width: 60,
              child: Text("下書き", style: TextStyle(color: Colors.blue)),
            ),
            FlatButton(
              child: Text(text),
              onPressed: (){
                text = "tui-tosita!";
              },
            )
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
          Container(
            height: 55,
            width: 55,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://www.twoscotsabroad.com/wp-content/uploads/2017/10/Blue-water-and-boat-in-Thailand.jpg"),
                    fit: BoxFit.cover),
                shape: BoxShape.circle),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
              width: MediaQuery.of(context).size.width * 0.8,
              child: TextField(
                controller: myController,
                enabled: true,
                autofocus: true,
                maxLines: 10,
                maxLength: 140,
                maxLengthEnforced: true,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  focusedBorder: InputBorder.none,
                    hintText: "いま何してる",
                ),
              ))
        ])
      ]),
    );
  }
}
