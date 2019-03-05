import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:invite_vn/data/message/models/message.dart';
import 'package:invite_vn/data/user/models/User.dart';
import 'package:invite_vn/statics/app_colors.dart';
import 'package:invite_vn/statics/assets.dart';
import 'package:invite_vn/widgets/bar/TopBar.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _StateChatScreen();
}

class _StateChatScreen extends State<ChatScreen> {
  Map<String, User> users;
  List<Message> messages;

  @override
  void initState() {
    super.initState();
    users = Map();
//    users["0"] = User("0", "Vũ", "Phạm",
//        "https://scontent-hkg3-1.xx.fbcdn.net/v/t1.0-9/13934713_756878874454752_6345109997930477391_n.jpg?_nc_cat=108&_nc_oc=AQlWDjbY_40BpgmbZMD1RTuzPvkm1YIc4SFnY279VGpvHmZ_pZgYZpH9BQus7sHg97o&_nc_ht=scontent-hkg3-1.xx&oh=42f0a1b7b98fa99979438cc084924c42&oe=5CDD07C6");
//    users["1"] = User("1", "Long", "Vũ",
//        "https://scontent-hkg3-1.xx.fbcdn.net/v/t1.0-9/13934713_756878874454752_6345109997930477391_n.jpg?_nc_cat=108&_nc_oc=AQlWDjbY_40BpgmbZMD1RTuzPvkm1YIc4SFnY279VGpvHmZ_pZgYZpH9BQus7sHg97o&_nc_ht=scontent-hkg3-1.xx&oh=42f0a1b7b98fa99979438cc084924c42&oe=5CDD07C6");
    messages = List();
    messages.add(Message(
        false,
        "0",
        "1",
        "Very long centent lorem ipsum dolor sit amet con sectetur adipiscing elit, sed do eiusmod tempor incididunt ut",
        "20:48"));

    messages
        .add(Message(true, "1", "0", "Lorem ipsum dolor sit amet", "20:48"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.WHITE,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            TopBar(),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ListView.builder(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  shrinkWrap: true,
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    Message message = messages[index];
                    return message.isMainUser
                        ? buildMainUserMessage(
                            text: message.text, time: message.time)
                        : buildOtherUserMessage(
                            user: users[message.userId],
                            text: message.text,
                            time: message.time,
                          );
                  },
                ),
              ),
            ),
            Container(
              height: 1.5,
              color: AppColors.SCREEN,
            ),
            Stack(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                      left: 12.0, top: 8.0, right: 48.0, bottom: 8.0),
                  child: Container(
                    width: double.maxFinite,
                    height: 40.0,
                    decoration: BoxDecoration(
                      color: AppColors.BACKGROUND,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 12.0,
                  bottom: 16.0,
                  child: Image.asset(
                    Assets.send,
                    color: AppColors.CONTENT,
                    width: 24.0,
                    height: 24.0,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildOtherUserMessage({User user, String text, String time}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(padding: EdgeInsets.only(left: 48.0), child: Text(user.firstName),),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: CachedNetworkImage(
                width: 40.0,
                height: 40.0,
                imageUrl: user.imageUrl,
                fit: BoxFit.contain,
              ),
            ),
            Flexible(
              child: Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: buildTextMessage(
                  isMainUser: false,
                  text: text,
                ),
              ),
            ),
          ],
        ),
        Padding(padding: EdgeInsets.only(left: 48.0), child: Text(time),),
      ],
    );
  }

  Widget buildMainUserMessage({String text, String time}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        buildTextMessage(
          isMainUser: true,
          text: text,
        ),
        Text(time),
      ],
    );
  }

  Widget buildTextMessage({bool isMainUser, String text}) {
    return Container(
      decoration: BoxDecoration(
        color: isMainUser ? AppColors.TORTOISE : AppColors.SCREEN,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(text),
      ),
    );
  }
}
