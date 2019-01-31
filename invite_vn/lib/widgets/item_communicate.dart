import 'package:flutter/material.dart';

class ItemCommunicate extends Scaffold {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            // gradient
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [Color.fromRGBO(20, 20, 20, 0.5), Colors.transparent]
                  ),
                  borderRadius: BorderRadius.circular(8.0)
              ),
              margin: EdgeInsets.only(left: 0.0, top: 40.0, right: 0.0, bottom: 0.0),
            ),
            //* top icon
            Positioned(
              child: Container(
                margin: EdgeInsets.all(20.0),
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.red),
              ),
              top: 0,
            ),
            //* right text
            Positioned(
              child: Container(
                child: Center(
                  child: Text(
                    "2/4 người",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.normal),
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
            ),
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
                                borderRadius: BorderRadius.circular(24.0))),
                        Container(
                          margin: EdgeInsets.only(
                              left: 12.0, top: 0.0, right: 0.0, bottom: 0.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Name",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "Activity",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    Text("Địa chỉ")
                  ],
                ),
              ),
              bottom: 0,
            ),
          ],
        ),
        height: 200,
        margin: EdgeInsets.only(left: 20, top: 20.0, right: 20.0, bottom: 4.0),
        decoration: BoxDecoration(
            color: const Color(0xff7c94b6),
            image: DecorationImage(
              image: ExactAssetImage('img_test.png'),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(8.0)),
      ),
    );
  }
}
