
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:twitter_app/tweet_create.dart';

void main() => runApp(MyApp());

class Tweet{
  @required final String content;
  @required final String name;
  Tweet({this.content,this.name});
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String test = "uni";
  List<Tweet> tweets = [];
  List<String> items = [];

  void tessst(){
    final list = ["dog","cat","yamamoto"];
    ///一つずつ取り出して加工する
    final datas = list.map((item){
      final decoratedItem = item + "uni";
      return decoratedItem;
    });
    ///List型に加工する
    final listedDatas = datas.toList();
    final a = listedDatas[0];
  }


  void readData(){
    Firestore.instance.collection("tweets").getDocuments().then((snapshots){
      final tweetDatas = snapshots.documents.map((document){
        final data = document.data;
        final tweet = Tweet(content: data["content"],name: data["name"]);
        return tweet;
      }).toList();
      setState(() {
        tweets = tweetDatas;
      });
    });
  }




  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.refresh),onPressed: readData,)
        ],
      ),
      body: Center(

        child: ListView.builder(
          itemCount: tweets.length,
            itemBuilder: (context,index){
            return Container(
              height: 50,
              child: Text(tweets[index].content),
            );
        })

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return TweetCreatePage();
              },
            ),
          );
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
