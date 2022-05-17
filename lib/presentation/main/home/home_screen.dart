import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_reddit/core/resources/colors.dart';
import 'package:simple_reddit/core/utils/time_utils.dart';
import 'package:simple_reddit/domain/entities/post.dart';
import 'package:simple_reddit/injector.dart';
import 'package:simple_reddit/presentation/main/home/cubit/home_cubit.dart';
import 'package:simple_reddit/presentation/view/post_card.dart';
import 'package:simple_reddit/presentation/view/text.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => injector.get<HomeCubit>()
        ..getPosts(), //TODO Why we need to use underscore in params and ..
      child: Builder(
        builder: (context) {
          return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
            if (state.topPosts.isNotEmpty) {
              return ListView.builder(
                  itemCount: state.topPosts.length + 1,
                  itemBuilder: (context, index) {
                    if (index == state.topPosts.length) {
                      return ElevatedButton(
                          onPressed: () => context.read<HomeCubit>().getPosts(),
                          child: TextRegular('Load more', 20, RColors.Black));
                          
                    }
                    return PostCard(state.topPosts[index]);
                  });
            } else
              return Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                      // height: 300,
                      // child: DecoratedBox(
                      //   decoration: BoxDecoration(
                      //       border: Border.all(color: Colors.black)),
                      // ),
                      ),
                ),
              );
          });
        },
      ),
    );
  }
}
