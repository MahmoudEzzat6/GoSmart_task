import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_smart_task/core/utils/colors.dart';
import 'package:go_smart_task/cubits/home_cubit/home_cubit.dart';
import 'package:go_smart_task/cubits/home_cubit/home_states.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
       create:(context) =>  HomeCubit(),
      child: BlocConsumer<HomeCubit,HomeStates>(
        listener: (context, state) {

        },
        builder: (context, state) {
          var homeCubit=HomeCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.grey.shade100,
            body: HomeCubit.get(context).navBar[homeCubit.currentIndex],
            bottomNavigationBar: MoltenBottomNavigationBar(
              domeCircleColor: AppColors.blue,
              barColor: Colors.white,

              tabs: [
                MoltenTab(
                    icon: Icon(Icons.home),
                    title: Text('Home')
                ),
                MoltenTab(
                    icon: Icon(Icons.calendar_today),
                    title: Text('Calender')

                ),

                MoltenTab(
                    icon: Icon(Icons.map_sharp,

                    ),
                    title: Text('Maps')


                ),
                MoltenTab(
                    icon: Icon(Icons.radar,
                    ),
                    title: Text('Livery')

                ),
                MoltenTab(
                    icon: Icon(Icons.shopping_cart_outlined,
                    ),
                    title: Text('Cart')

                ),
              ],
              selectedIndex: homeCubit.currentIndex,
              onTabChange: (int index) {
                homeCubit.onChangePage(index);
                print(index);
              },
            ),
          );
        },
      ),
    );
  }
}
