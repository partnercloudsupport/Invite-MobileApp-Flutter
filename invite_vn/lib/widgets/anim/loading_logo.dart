import 'package:flutter/material.dart';
import 'package:invite_vn/statics/assets.dart';

class LoadingLogo extends StatelessWidget{
  final double _default = 40.0;

  double width;
  double height;

  LoadingLogo({this.width, this.height}){
    width = width == null ? _default : width;
    height = height == null ? _default : height;
  }

  Widget _load() {
    return Image.asset(
      Assets.loadingLogo,
      width: this.width,
      height: this.height,
      gaplessPlayback: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _load();
  }
}
