import 'package:app/core/design/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../core/design/app_failed.dart';
import '../core/design/app_loading.dart';
import '../features/get_profile/bloc.dart';
import '../features/get_profile_images/bloc.dart';

class DataView extends StatefulWidget {
  const DataView({super.key});

  @override
  State<DataView> createState() => _DataViewState();
}

class _DataViewState extends State<DataView> {
  final bloc = GetIt.instance<GetProfileBloc>();
  final profileImagesBloc = GetIt.instance<GetProfileImagesBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder(
        bloc: bloc,
        builder: (context, state) {
          if (state is GetProfileFailedState) {
            return AppFailed(
              msg: state.msg,
              onPress: () {},
            );
          } else if (state is GetProfileSuccessState) {
            return Column(
              children: [
                AppImage(
                  state.model.image,
                  height: 300,
                ),
                Text(
                  state.model.name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                Text(
                  state.model.age.toString(),
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                BlocBuilder(
                  bloc: profileImagesBloc,
                  builder: (context, state) {
                    if (state is GetProfileImagesFailedState) {
                      return AppFailed(
                        msg: state.msg,
                        onPress: () {},
                      );
                    } else if (state is GetProfileImagesSuccessState) {
                      return Wrap(
                        children: List.generate(
                          state.list.length,
                          (index) => AppImage(
                            state.list[index],
                            height: 100,
                            width: 100,
                          ),
                        ),
                      );
                    } else {
                      return const AppLoading();
                    }
                  },
                )
              ],
            );
          } else {
            return const AppLoading();
          }
        },
      ),
    );
  }
}
