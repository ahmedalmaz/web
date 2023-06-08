import 'package:ashtar/components/custom_items_cubit/loading_cubit/loading_cubit.dart';
import 'package:ashtar/components/loader_custom/loader_custom.dart';
import 'package:flutter/material.dart';



class Screen extends StatefulWidget {
  final Loading loadingCubit;
  final Widget child;
  final Widget? loaderUI;
  const Screen({
    required this.loadingCubit,
    required this.child,
    this.loaderUI,
  });

  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Stack(
        children: [
          widget.child,
          Loader(
            loading: widget.loadingCubit,
            loader: widget.loaderUI,
          )
        ],
      ),
    );
  }
}
