
import 'package:go_router/go_router.dart';
import 'package:go_smart_task/core/utils/routes.dart';
import 'package:go_smart_task/features/authentication/views/login/login_screen.dart';
import 'package:go_smart_task/features/main_screens/home/home_widgets/nav_bar.dart';

import '../../features/main_screens/profile/profile_screen/profile_screen.dart';




class GroupRoutes {
  final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        name: RoutesName.loginScreen,
        path: "/",
        builder: (context, state) => const LoginScreen(),
      ),

      GoRoute(
        name: RoutesName.mainScreen,
        path: "/mainScreen",
        builder: (context, state) => const MainScreen(),
      ),
      GoRoute(
        name: RoutesName.profileScreen,
        path: "/profile",
        builder: (context, state) => const ProfileScreen(),
      ),



    ],
  );
}
