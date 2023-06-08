
import 'package:ashtar/components/custom_items_cubit/loading_cubit/loading_cubit.dart';
import 'package:ashtar/components/loader_custom/loader_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class Loader extends StatelessWidget {
  final Loading loading;
  final Widget? loader;
    const Loader({Key? key, required this.loading, this.loader}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Loading, LoadingState>(
      bloc: loading,
      builder: (context, state) {
        if (state is LoadingChange) {
          return state.loading!
              ? WillPopScope(
                  child: loader == null ?const LoaderItem() : loader!,
                  onWillPop: () async {
                    loading.hide;
                    return true;
                  },
                )
              : Container();
        } else {
          return Container();
        }
      },
    );
  }
}
