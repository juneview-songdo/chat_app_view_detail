import 'package:flutter/material.dart';

import '../../../../../../../../main.dart';
import '../message_item/view.dart';
import '_/state_child.dart';
import '_/state_mother.dart';

class NewView extends StatefulWidget {
  NewView({
    super.key,
    this.name = "John Doe",
    this.lastMessage = "Hello",
    this.userImage =
    "https://i.insider.com/5dcecef7e94e86049649291a?width=1136&format=jpeg",
    this.time = "10:00",
    this.noOfMessage = "3",
  });

  final String name;
  final String lastMessage;
  final String userImage;
  final String time;
  final String noOfMessage;

  @override
  State<NewView> createState() => StateChild();
}

class NewViewState extends State<NewView> with StateMother {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        elevation: 0,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.only(right: 16),
            child: Row(
              children: <Widget>[
                IconButton(
                  onPressed: () {
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_outlined,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 2,
                ),
                CircleAvatar(
                  backgroundImage: NetworkImage(widget.userImage),
                  maxRadius: 20,
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        widget.name,
                        style: TextStyle(fontWeight: FontWeight.w900,color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: [
          Container(
            padding: EdgeInsets.only(right: 20),
            child: Icon(
              Icons.video_call,
              color: Colors.grey[200],
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 20),
            child: Icon(
              Icons.call,
              color: Colors.grey[200],
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 20),
            child: Icon(
              Icons.more_vert,
              color: Colors.grey[200],
            ),
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(top: 10, bottom: 10),
            // physics: NeverScrollableScrollPhysics(),
            children: [
              MessageItemView(message: "Hi", receiver: true),
              MessageItemView(message: "This is Louji", receiver: true),
              MessageItemView(message: "from tenkasi", receiver: true),
              MessageItemView(message: "Hey Louji.", receiver: false),
              MessageItemView(message: "What's up", receiver: false),
              MessageItemView(message: "I want to learn Mobile Development. ",
                  receiver: true),
              MessageItemView(
                  message: "Which is best framework", receiver: true),
              MessageItemView(
                  message: "Upto me. Flutter will be good", receiver: false),
            ],
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.only(left: 16, bottom: 10),
              height: 60,
              width: double.infinity,
              color: Colors.grey[800],
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 21,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Type message...",
                          hintStyle: TextStyle(color: Colors.grey.shade500),
                          border: InputBorder.none),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 15),
                    width:70,
                    height: 50,
                    child: Center(
                      child: FloatingActionButton(
                        onPressed: () {},
                        backgroundColor: Colors.blue,
                        elevation: 0,
                        child: Icon(
                          Icons.send,
                          color: Colors.white,
                          size: 17,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

main() async {
  return buildApp(appHome: NewView());
}
