import 'package:auth/presentation/ui/sign_in_screen.dart';
import 'package:auth/presentation/ui/sign_up_screen.dart';
import 'package:common/utils/navigation/navigation_helper.dart';
import 'package:dependencies/bloc/bloc.dart';
import 'package:dependencies/firebase/firebase.dart';
import 'package:dependencies/get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:dependencies/flutter_screenutil/flutter_screenutil.dart';
import 'package:home_page/presentation/bloc/home_bloc/home_cubit.dart';
import 'package:home_page/presentation/bloc/banner_bloc/banner_cubit.dart';
import 'package:home_page/presentation/bloc/product_bloc/product_cubit.dart';
import 'package:home_page/presentation/bloc/product_category_bloc/product_category_cubit.dart';
import 'package:home_page/presentation/ui/bottom_navigation.dart';
import 'package:home_page/presentation/ui/home_screen.dart';
import 'package:onboarding/presentation/bloc/onboarding_bloc/onboarding_cubit.dart';
import 'package:onboarding/presentation/bloc/splash_bloc/splash_cubit.dart';
import 'package:onboarding/presentation/ui/on_boarding_screen.dart';
import 'package:onboarding/presentation/ui/splash_screen.dart';
import 'package:common/utils/navigation/router/app_routes.dart';
import 'injections/injections.dart';
import 'package:auth/presentation/bloc/sign_in_bloc/sign_in_bloc.dart';
import 'package:auth/presentation/bloc/sign_up_bloc/sign_up_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  await Injections().initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (_, __) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Online Shop',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) => SplashCubit(
                getOnBoardingStatusUseCase: sl(),
                getTokenUseCase: sl(),
              )..initSplash(),
            ),
          ],
          child: SplashScreen(),
        ),
        navigatorKey: NavigationHelperImpl.navigatorKey,
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case AppRoutes.splash:
              return MaterialPageRoute(
                builder: (_) => SplashScreen(),
              );
            case AppRoutes.onboarding:
              return MaterialPageRoute(
                builder: (_) => BlocProvider(
                  create: (_) => OnBoardingCubit(
                    cacheOnBoardingUseCase: sl(),
                  ),
                  child: OnBoardingScreen(),
                ),
              );
            case AppRoutes.signIn:
              return MaterialPageRoute(
                builder: (_) => BlocProvider(
                  create: (_) => SignInBloc(
                    signInUseCase: sl(),
                    cachedTokenUseCase: sl(),
                  ),
                  child: SignInScreen(),
                ),
              );
            case AppRoutes.signUp:
              return MaterialPageRoute(
                builder: (_) => BlocProvider(
                    create: (_) => SignUpBloc(
                          signUpUseCase: sl(),
                          cacheTokenUseCase: sl(),
                        ),
                    child: SignUpScreen()),
              );
            case AppRoutes.home:
              return MaterialPageRoute(
                builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (_) => HomeCubit(),
                    ),
                    BlocProvider(
                      create: (_) => BannerCubit(
                        getBannerUseCase: sl(),
                      )..getBanner(),
                    ),
                    BlocProvider(
                      create: (_) => ProductCubit(
                        getProductUseCase: sl(),
                      )..getProduct(),
                    ),
                    BlocProvider(
                      create: (_) => ProductCategoryCubit(
                        getProductCategoryUseCase: sl(),
                      )..getProductCategory(),
                    )
                  ],
                  child: const BottomNavigation(),
                ),
              );
            default:
              return MaterialPageRoute(
                builder: (_) => SplashScreen(),
              );
          }
        },
      ),
    );
  }
}
