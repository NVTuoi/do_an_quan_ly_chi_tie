import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:quan_ly_chi_tieu/bloc/category_collect_bloc/category_collect_bloc.dart';
import 'package:quan_ly_chi_tieu/bloc/category_spend_bloc/category_spend_bloc.dart';
import 'package:quan_ly_chi_tieu/bloc/cost_collect_bloc/cost_collect_bloc.dart';
import 'package:quan_ly_chi_tieu/bloc/cost_spend_bloc/cost_spend_bloc.dart';
import 'package:quan_ly_chi_tieu/bloc/forgot_bloc/forgot_bloc.dart';
import 'package:quan_ly_chi_tieu/bloc/login_bloc/login_bloc.dart';
import 'package:quan_ly_chi_tieu/bloc/statistical_bloc/statistical_bloc.dart';
import 'package:quan_ly_chi_tieu/bloc/user_bloc/user_bloc.dart';
import 'package:quan_ly_chi_tieu/configs/colors.dart';
import 'package:quan_ly_chi_tieu/repositories/category_collect_repository.dart';
import 'package:quan_ly_chi_tieu/repositories/category_spend_repository.dart';
import 'package:quan_ly_chi_tieu/repositories/cost_collect_repository.dart';
import 'package:quan_ly_chi_tieu/repositories/cost_spend_repository.dart';
import 'package:quan_ly_chi_tieu/repositories/forgot_repository.dart';
import 'package:quan_ly_chi_tieu/repositories/login_repository.dart';
import 'package:quan_ly_chi_tieu/repositories/statistical_option_repository.dart';
import 'package:quan_ly_chi_tieu/repositories/statistical_repository.dart';
import 'package:quan_ly_chi_tieu/repositories/user_repository.dart';
import 'package:quan_ly_chi_tieu/router.dart';
import 'package:quan_ly_chi_tieu/ui/login/login_screen.dart';

import 'bloc/statistical_option_bloc/statistical_option_bloc.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc(
            loginRepository: LoginRepository(),
          ),
        ),
        BlocProvider(
          create: (context) => ForgotBloc(
            forgotRepository: ForgotRepository(),
          ),
        ),
        BlocProvider(
          create: (context) => UserBloc(
            userRepository: UserRepository(),
          ),
        ),
        BlocProvider(
          create: (context) => CategorySpendBloc(
              categorySpendRepository: CategorySpendRepository()),
        ),
        BlocProvider(
          create: (context) =>
              CostSpendBloc(costSpendRepository: CostSpendRepository()),
        ),
        BlocProvider(
          create: (context) => CategoryCollectBloc(
              categoryCollectRepository: CategoryCollectRepository()),
        ),
        BlocProvider(
          create: (context) =>
              CostCollectBloc(costCollectRepository: CostCollectRepository()),
        ),
        BlocProvider(
          create: (context) =>
              StatisticalBloc(statisticalRepository: StatisticalRepository()),
        ),
        BlocProvider(
          create: (context) => StatisticalOptionBloc(
              statisticalRepository: StatisticalOptionRepository()),
        ),
      ],
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: GlobalLoaderOverlay(
          overlayOpacity: 0.1,
          child: MaterialApp(
            theme: ThemeData(primaryColor: AppColors.appColor),
            debugShowCheckedModeBanner: false,
            home: AnimatedSplashScreen(
              duration: 2000,
              splash: const Text(
                'Chào Mừng Quay Trở Lại',
                style: TextStyle(fontSize: 35, color: AppColors.appColor),
              ),
              nextScreen: const LoginScreen(),
              splashTransition: SplashTransition.slideTransition,
            ),
            onGenerateRoute: onGenerateRoute,
          ),
        ),
      ),
    );
  }
}
