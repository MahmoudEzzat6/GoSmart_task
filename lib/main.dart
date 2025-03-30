import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_smart_task/cubits/home_cubit/home_cubit.dart';

import 'core/utils/app_router.dart';
import 'core/utils/theme.dart';
import 'cubits/auth_cubit/signin/signin_cubit.dart';
import 'cubits/ bloc_observer.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
        builder: (_ , child){
      return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (BuildContext context) =>HomeCubit()..fetchData()),
          BlocProvider(
              create: (BuildContext context) =>LoginCubit()),
          ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme:customTheme(),
          routerConfig: GroupRoutes().router,
        ),
      );
    }
    );
  }
}

