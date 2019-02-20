import 'package:flutter/material.dart';
import 'package:invite_vn/statics/routes.dart';
import 'package:invite_vn/data/activity/activity.dart';

class ItemCommunicate extends Scaffold {
  Widget bacgroundShadow() {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [Color.fromRGBO(20, 20, 20, 0.5), Colors.transparent]),
          borderRadius: BorderRadius.circular(8.0)),
      margin: EdgeInsets.only(left: 0.0, top: 40.0, right: 0.0, bottom: 0.0),
    );
  }

  Widget iconType() {
    return Positioned(
      child: Container(
        margin: EdgeInsets.all(20.0),
        width: 32,
        height: 32,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0), color: Colors.red),
      ),
      top: 0,
    );
  }

  Widget textCountPeople() {
    return Positioned(
      child: Container(
        child: Center(
          child: Text(
            "2/4 người",
            style:
                TextStyle(color: Colors.white, fontWeight: FontWeight.normal),
          ),
        ),
        margin: EdgeInsets.all(20.0),
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Color.fromRGBO(20, 20, 20, 0.5)),
      ),
      top: 0,
      right: 0,
    );
  }

  Text textName() {
    return Text(
      "Name",
      style: TextStyle(
          color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.w600),
    );
  }

  Text textActivity() {
    return Text(
      "Activity",
      style: TextStyle(
          color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
    );
  }

  Text textAddress() {
    return Text(
      "Địa chỉ",
      style: TextStyle(
          color: Colors.white, fontSize: 13.0, fontWeight: FontWeight.w500),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => Navigator.of(context).pushNamed(Routes.JOIN_INVITATION),
        child: Container(
          child: Stack(
            children: <Widget>[
              // gradient
              bacgroundShadow(),
              //* top icon
              iconType(),
              //* right text
              textCountPeople(),
              // * box bottom
              Positioned(
                child: Container(
                  margin: EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            height: 48.0,
                            width: 48.0,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              image: DecorationImage(
                                image: ExactAssetImage('img_tes/t.png'),
                                fit: BoxFit.cover,
                              ),
                              border:
                                  Border.all(color: Colors.white, width: 2.0),
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                left: 12.0, top: 0.0, right: 0.0, bottom: 0.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                textName(),
                                textActivity(),
                              ],
                            ),
                          )
                        ],
                      ),
                      textAddress(),
                    ],
                  ),
                ),
                bottom: 0,
              ),
            ],
          ),
          height: 200,
          margin:
              EdgeInsets.only(left: 20, top: 20.0, right: 20.0, bottom: 4.0),
          decoration: BoxDecoration(
              color: const Color(0xff7c94b6),
              image: DecorationImage(
                image: NetworkImage(
                    "https://firebasestorage.googleapis.com/v0/b/loststep-25849.appspot.com/o/Adidas%2Fadidas_courtset.jpeg?alt=media&token=b242aedc-f9a7-441b-b7ae-96fe712f18d6"),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(8.0)),
        ),
      ),
    );
  }

  ActivityModel activityModel;

  ItemCommunicate(this.activityModel);
}
