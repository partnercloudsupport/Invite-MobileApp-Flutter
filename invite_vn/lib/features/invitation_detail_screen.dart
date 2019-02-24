import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:invite_vn/statics/app_colors.dart';
import 'package:invite_vn/statics/assets.dart';
import 'package:invite_vn/widgets/bar/TopBar.dart';
import 'package:invite_vn/widgets/bar/bottom_bar.dart';
import 'package:invite_vn/widgets/buttons/app_button.dart';

class InvitationDetailScreen extends StatefulWidget {
  InvitationDetailScreen({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _StateGuestInvitationDetailScreen();
}

class _StateGuestInvitationDetailScreen extends State<InvitationDetailScreen> {
  String imageMockUp =
      "https://media.guestofaguest.com/t_article_content/gofg-media/2018/01/1/50241/5-0be5e280cc0ce5eec69daeda2021ca77_(2).jpg";

  GoogleMapController mapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          buildBody(),
          Padding(
            padding: EdgeInsets.only(top: 40.0),
            child: TopBar(),
          ),
        ],
      ),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  buildHostInfo(),
                  buildHostContent(),
                  buildTitleDesc("Thời gian", "Lorem ipsum"),
                  buildTitleDesc("Địa điểm", "Lorem ipsum"),
                  buildMap(),
                ],
              ),
            )
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
        Positioned(
          bottom: 20.0,
          right: 20.0,
          child: Image.asset(
            Assets.restaurant,
            width: 40.0,
            height: 40.0,
          ),
        )
      ],
    );
  }

  Widget buildTitleDesc(String title, String desc) {
    return Padding(
      padding: EdgeInsets.only(top: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
              color: AppColors.HEADLINE_BODY,
            ),
          ),
          Text(
            desc,
            style: TextStyle(
              fontSize: 18.0,
              color: AppColors.SECONDARY,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildGuestContent() {
    return Container(
      padding: EdgeInsets.only(
        top: 16.0,
        left: 16.0,
        right: 16.0,
        bottom: 21.0,
      ),
      decoration: BoxDecoration(
        color: AppColors.SCREEN,
        borderRadius: BorderRadius.all(
          Radius.circular(8.0),
        ),
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Cần người thêm 1 người",
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15.0,
                color: AppColors.HEADLINE_BODY),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 12.0,
              bottom: 17.0,
            ),
            child: Divider(
              height: 1.0,
              color: AppColors.CONTENT,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "3/4 nguời",
                style: TextStyle(
                  fontSize: 15.0,
                  color: AppColors.SECONDARY,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildHostInfo() {
    return Padding(
      padding: EdgeInsets.only(top: 24.0, bottom: 24.0),
      child: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: SizedBox.fromSize(
              child: CircleAvatar(),
              size: Size(72.0, 72.0),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              RichText(
                text: TextSpan(
                  text: "Josh ",
                  style: TextStyle(
                      color: AppColors.HEADLINE_BODY,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500),
                  children: <TextSpan>[
                    TextSpan(
                      text: "muốn",
                      style: TextStyle(
                          color: AppColors.HEADLINE_BODY,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              Text(
                "Lorem ipsum",
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: AppColors.HEADLINE_BODY,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildHostContent() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(bottom: 16.0),
          child: AppButton(
            buttonType: ButtonType.GREY,
            onTap: () => _showModalBottom(isWaitingList: false),
            title: "Đã chấp nhận",
            child: Text(
              "0/4 người",
              style: TextStyle(color: AppColors.SECONDARY, fontSize: 15.0),
            ),
          ),
        ),
        AppButton(
          buttonType: ButtonType.GREY,
          onTap: () => _showModalBottom(isWaitingList: true),
          title: "Danh sách chờ",
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 12.0),
                child: Text(
                  "12 người",
                  style: TextStyle(color: AppColors.SECONDARY, fontSize: 15.0),
                ),
              ),
              Image.asset(
                Assets.rightArrow,
                width: 9.0,
                height: 16.0,
              )
            ],
          ),
        )
      ],
    );
  }

  Widget buildMap() {
    return Padding(
      padding: EdgeInsets.only(top: 16.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 250.0,
        child: GoogleMap(
          initialCameraPosition: CameraPosition(target: LatLng(10.0, 15.0)),
          onMapCreated: _onMapCreated,
          gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>[
            Factory<OneSequenceGestureRecognizer>(
              () => EagerGestureRecognizer(),
            ),
          ].toSet(),
        ),
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }

  void _showModalBottom({bool isWaitingList}) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return SizedBox.fromSize(
          size: Size(double.maxFinite, 375.0),
          child: Padding(
            padding: EdgeInsets.only(left: 20.0, right: 20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox.fromSize(
                  size: Size(double.maxFinite, 72.0),
                  child: Row(
                    children: <Widget>[
                      Text(isWaitingList ? "Danh sách chờ" : "Đã chấp nhận")
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 12,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                            top: index == 0 ? 16.0 : 0.0, bottom: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                SizedBox.fromSize(
                                  size: Size(48.0, 48.0),
                                  child: CircleAvatar(),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 16.0),
                                  child: Text("Hoàng"),
                                ),
                              ],
                            ),
                            isWaitingList
                                ? AppButton(
                                    onTap: () {},
                                    title: "ĐỒNG Ý",
                                    buttonType: ButtonType.TORTOISE,
                                    size: Size(80.0, 32.0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(32.0 / 2),
                                    ),
                                  )
                                : AppButton(
                                    onTap: () {},
                                    title: "MỜI RA",
                                    buttonType: ButtonType.RED,
                                    size: Size(80.0, 32.0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(32.0 / 2),
                                    ),
                                  ),
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
