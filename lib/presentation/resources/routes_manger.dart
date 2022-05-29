
import 'package:flutter/material.dart';
import 'package:gradpro/presentation/Bottom_Nav_Bar/view.dart';
import 'package:gradpro/presentation/active_projects/view.dart';
import 'package:gradpro/presentation/choose_sign/view.dart';
import 'package:gradpro/presentation/doctor_requests/view.dart';
import 'package:gradpro/presentation/follow_your_projects/view.dart';
import 'package:gradpro/presentation/login/view.dart';
import 'package:gradpro/presentation/main/project_detils.dart';
import 'package:gradpro/presentation/main/view.dart';
import 'package:gradpro/presentation/my_profile/view.dart';
import 'package:gradpro/presentation/my_project_prograss/view.dart';
import 'package:gradpro/presentation/project_feedback/view.dart';
import 'package:gradpro/presentation/register/view.dart';
import 'package:gradpro/presentation/resources/strings_manager.dart';
import 'package:gradpro/presentation/send_project_request/view.dart';
import 'package:gradpro/presentation/update_profile/update_profile.dart';

import '../main/widgets/filter.dart';
import '../signup_view/add_your_photo.dart';
import '../signup_view/multi_select_intersts.dart';

class Routes {
  static const String chooseSignRoute = "/chooseSign";
  static const String loginRoute = "/login";
  static const String addPhotoScreen = "/addPhoto";
  static const String multiSelectScreen = "/multiSelect";
  static const String registerRoute = "/register";
  static const String mainRoute = "/main";
  static const String bottomNavBarRoute = "/bottomNavBar";
  static const String projectDetailsRoute = "/projectDetails";
  static const String sendProjectRequestRoute = "/sendProjectRequest";
  static const String activeProjectsRoute = "/activeProjects";
  static const String updateProfileRoute = "/updateProfile";
  static const String myProjectPrograssRoute = "/myProjectPrograss";
  static const String myProfileRoute = "/myProfile";
  static const String filterRoute = "/filter";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.chooseSignRoute:
        return MaterialPageRoute(builder: (_) => ChooseSignScreen());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) =>  LoginScreen());
      case Routes.addPhotoScreen:
        return MaterialPageRoute(builder: (_) => const AddPhotoScreen());
      case Routes.multiSelectScreen:
        return MaterialPageRoute(builder: (_) => const MultiSelect());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) =>  MainScreen());
      case Routes.bottomNavBarRoute:
        return MaterialPageRoute(builder: (_) =>  BottomNavBarScreen());
      case Routes.projectDetailsRoute:
        return MaterialPageRoute(builder: (_) =>  ProjectDetails());
      case Routes.sendProjectRequestRoute:
        return MaterialPageRoute(builder: (_) =>  SendRequestScreen());
      case Routes.filterRoute:
        return MaterialPageRoute(builder: (_) =>  const FilterScreen());

      case Routes.activeProjectsRoute:
        return MaterialPageRoute(builder: (_) =>  ActiveProjectsScreen());
      case Routes.updateProfileRoute:
        return MaterialPageRoute(builder: (_) => UpdateProfileScreen());
      case Routes.myProjectPrograssRoute:
        return MaterialPageRoute(builder: (_) => MyProjectPrograssScreen());
        case Routes.myProfileRoute:
        return MaterialPageRoute(builder: (_) => MyProfileScreen());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(AppStrings.noRouteFound),
              ),
              body: const Center(child: Text(AppStrings.noRouteFound)),
            ));
  }
}
