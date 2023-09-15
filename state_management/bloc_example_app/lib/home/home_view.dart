import 'package:bloc_example_app/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomeView extends StatelessWidget {
  const MyHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          //cubit çağırmak için providera benzer
          var cubit = context.read<HomeCubit>();
          if (state.status == HomeStatus.loading) {
            return CircularProgressIndicator();
          }
          if (state.status == HomeStatus.error) {
            return Text("error");
          }

          return Scaffold(
              appBar: AppBar(
                title: Text("BloC Example"),
              ),
              body: SafeArea(
                  child: Center(
                child: Text("${state.counter}"),
              )),
              floatingActionButton: FloatingActionButton(
                onPressed: cubit.incrementCounter,
                child: const Icon(Icons.add),
              ));
        },
      ),
    );
  }
}
