import 'package:dependencies/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:dependencies/flutter_screenutil/flutter_screenutil.dart';
import 'package:home_page/presentation/bloc/home_bloc/home_cubit.dart';
import 'package:home_page/presentation/bloc/home_bloc/home_state.dart';
import 'package:home_page/presentation/ui/home_screen.dart';
import 'package:resources/assets.gen.dart';
import 'package:resources/colors.gen.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key? key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox(
          width: 1.sw,
          height: 1.sh,
          child: IndexedStack(
            index: context.read<HomeCubit>().state.homeState.data,
            // index: 0,
            children: [
              HomeScreen(),
              // Container(
              //   color: Colors.green,
              // ),
              Container(
                color: Colors.blue,
              ),
              Container(
                color: Colors.amber,
              )
            ],
          ),
        ),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black38,
                spreadRadius: 0,
                blurRadius: 10,
              )
            ],
          ),
          child: BottomNavigationBar(
            showUnselectedLabels: true,
            showSelectedLabels: true,
            onTap: (value) {
              context.read<HomeCubit>().changeTab(tabIndex: value);
            },
            currentIndex: context.read<HomeCubit>().state.homeState.data ?? 0,
            // currentIndex: 0,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.orange,
            unselectedItemColor: ColorName.iconGrey,
            selectedLabelStyle: TextStyle(
                fontWeight: FontWeight.w500,
                color: ColorName.orange,
                fontSize: 10.sp),
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Assets.images.icon.home.svg(
                  color: context.read<HomeCubit>().state.homeState.data == 0
                      ? ColorName.orange
                      : ColorName.iconGrey,
                  // color: ColorName.orange
                ),
                label: "Beranda",
              ),
              BottomNavigationBarItem(
                icon: Assets.images.icon.history.svg(
                  color: context.read<HomeCubit>().state.homeState.data == 1
                      ? ColorName.orange
                      : ColorName.iconGrey,
                  // color: ColorName.orange
                ),
                label: "Riwayat",
              ),
              BottomNavigationBarItem(
                icon: Assets.images.icon.account.svg(
                  color: context.read<HomeCubit>().state.homeState.data == 2
                      ? ColorName.orange
                      : ColorName.iconGrey,
                  // color: ColorName.orange
                ),
                label: "Akun",
              ),
            ],
          ),
        ),
      );
    });
  }
}
