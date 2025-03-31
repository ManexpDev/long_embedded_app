import 'package:flutter/material.dart';
import 'package:web/web.dart' as web;

class ResizerWidget extends StatelessWidget {
  ResizerWidget({super.key, required this.child});
  final Widget child;

  final GlobalKey _appKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            key: _appKey,
            child: child),

        Positioned(
            top: 0,
            right: 0,
            child: ElevatedButton(onPressed: (){
              _changeAppSize();
            }, child: const Text("RESIZE")))
      ],
    );
  }

  void _changeAppSize(){
    final renderBox =_appKey.currentContext?.findRenderObject() as RenderBox?;
    final Size? size = renderBox?.size;
    final double h = size?.height ?? 0.0;
    final web.HTMLElement app = web.document.getElementById("flutter_app") as web.HTMLElement;
    if (app.style.height != "${h}px") {
      app.style.setProperty("transition", "height 0.5s ease-in-out");
      app.style.setProperty("height", "${h}px");

    }
  }

}
