import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hospital/presentation/screens/layout/view/profile.dart';

import 'main_cubit/main_cubit.dart';
import 'main_cubit/main_states.dart';

class Home_Layout_Screen extends StatelessWidget {
  const Home_Layout_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => MainCubit(),
        child: BlocConsumer<MainCubit, MainStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var mainview = MainCubit.get(context);
            return SafeArea(
              child: Scaffold(
                bottomNavigationBar: BottomNavigationBar(
                  backgroundColor: Colors.white,
                  type: BottomNavigationBarType.shifting,
                  items: mainview.items,
                  selectedLabelStyle: TextStyle(fontSize: 10),
                  selectedItemColor: Colors.blue,
                  unselectedItemColor: Colors.black,
                  unselectedLabelStyle: TextStyle(fontSize: 10),
                  showUnselectedLabels: true,
                  currentIndex: mainview.currentIndex,
                  onTap: (index) {
                    mainview.ChangeNavBarIndex(index);
                  },
                ),
// appBar: AppBar(
//   backgroundColor: Colors.transparent,
//   elevation: 0,
//
// ),
              body: mainview.tabs[mainview.currentIndex],
              ),
            );
          },
        ));
  }
}
