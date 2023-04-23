import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/presentation/resources/font_manager.dart';
import 'package:hospital/presentation/screens/layout/layout_cubit/main_cubit.dart';
import 'package:hospital/presentation/screens/layout/layout_cubit/main_states.dart';


class HomeLayoutScreen extends StatelessWidget {
  const HomeLayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = MainCubit.get(context);
        return SafeArea(
          child: Scaffold(
            appBar: cubit.appBars[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Colors.white,
              type: BottomNavigationBarType.shifting,
              items: cubit.items,
              selectedLabelStyle: TextStyle(fontSize: FontSize.s10),
              selectedItemColor: Colors.blue,
              unselectedItemColor: Colors.black,
              unselectedLabelStyle: TextStyle(fontSize: FontSize.s10),
              showUnselectedLabels: true,
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.ChangeNavBarIndex(index);
              },
            ),
            body: cubit.tabs[cubit.currentIndex],
          ),
        );
      },
    );
  }
}
