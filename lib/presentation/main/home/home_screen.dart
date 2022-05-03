import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_reddit/injector.dart';
import 'package:simple_reddit/presentation/main/home/cubit/home_cubit.dart';

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
            return Container();
          });
        },
      ),
    );
  }
}
