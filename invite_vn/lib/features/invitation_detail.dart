import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:invite_vn/widgets/bar/bottom_bar.dart';

class InvitationDetail extends StatefulWidget {
  InvitationDetail({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _StateGuestInvitationDetail();
}

class _StateGuestInvitationDetail extends State<InvitationDetail> {
  String imageMockUp =
      "https://media.guestofaguest.com/t_article_content/gofg-media/2018/01/1/50241/5-0be5e280cc0ce5eec69daeda2021ca77_(2).jpg";

  GoogleMapController mapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Column(
      children: <Widget>[
        buildContent(),
        BottomBar(),
      ],
    );
  }

  Widget buildContent() {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            buildImage(),
            Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      CircleAvatar(),
                      Column(
                        children: <Widget>[
                          RichText(
                            text: TextSpan(
                              text: "Josh ",
                              children: <TextSpan>[
                                TextSpan(text: "muốn"),
                              ],
                            ),
                          ),
                          Text("Lorem ipsum"),
                        ],
                      ),
                    ],
                  ),
                  Text("Cần người"),
                  Divider(
                    height: 1.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("3/4 nguời"),
                    ],
                  ),
                  buildTitleDesc("Thời gian", "Lorem ipsum"),
                  buildTitleDesc("Địa điểm", "Lorem ipsum"),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 250.0,
                    child: GoogleMap(
                      initialCameraPosition:
                          CameraPosition(target: LatLng(10.0, 15.0)),
                      onMapCreated: _onMapCreated,
                      gestureRecognizers:
                          <Factory<OneSequenceGestureRecognizer>>[
                        Factory<OneSequenceGestureRecognizer>(
                          () => EagerGestureRecognizer(),
                        ),
                      ].toSet(),
                    ),
                  ),
                ],
              ),
            )
//            RaisedButton(
//              child: const Text('Go to London'),
//              onPressed: mapController == null ? null : () {
//                mapController.animateCamera(CameraUpdate.newCameraPosition(
//                  const CameraPosition(
//                    bearing: 270.0,
//                    target: LatLng(51.5160895, -0.1294527),
//                    tilt: 30.0,
//                    zoom: 17.0,
//                  ),
//                ));
//              },
//            ),
          ],
        ),
      ),
    );
  }

  Widget buildImage() {
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 75 / 56,
          child: CachedNetworkImage(
            imageUrl: imageMockUp,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }

  Widget buildTitleDesc(String title, String desc) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(title),
        Text(desc),
      ],
    );
  }

  Widget buildGuestContent() {}

  Widget buildHostContent() {
    return Column(
      children: <Widget>[

      ],
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }
}
