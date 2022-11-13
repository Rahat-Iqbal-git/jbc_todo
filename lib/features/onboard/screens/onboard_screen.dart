import 'package:flutter/material.dart';
import 'package:flutter_onboard/flutter_onboard.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_jbc/common/get_screen_height_width.dart';
import 'package:todo_jbc/features/landing/screen/landing_screen.dart';
import 'package:todo_jbc/features/onboard/functions/save_onboard_getstorage.dart';
import 'package:todo_jbc/utils/app_colors.dart';

class OnboardScreen extends StatelessWidget {
  OnboardScreen({super.key});

  final List<OnBoardModel> onBoardData = [
    const OnBoardModel(
      title: "Never miss a task from now on",
      description:
          "List your todos so that you don't ever forget. Mark as done and focus on the undone",
      imgUrl: "assets/list_onboard.gif",
    ),
    const OnBoardModel(
      title: "Search for todos",
      description: "Search from your list of todos",
      imgUrl: 'assets/search_onboard.gif',
    ),
    const OnBoardModel(
      title: "Get started with JBC Todo",
      description: "",
      imgUrl: 'assets/check1.webp',
    ),
  ];

  final PageController _pageController = PageController();

  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnBoard(
        onBoardData: onBoardData,
        pageController: _pageController,
        imageHeight: getHeight(context) * 40,
        imageWidth: getWidth(context) * 85,
        pageIndicatorStyle: PageIndicatorStyle(
          activeColor: themeColor,
          activeSize: const Size(5, 5),
          inactiveSize: const Size(5, 5),
          inactiveColor: Colors.grey,
          width: getWidth(context) * 10,
        ),
        //
        nextButton: OnBoardConsumer(
          builder: (context, ref, child) {
            final state = ref.watch(onBoardStateProvider);
            return InkWell(
              onTap: () => _onNextTap(state),
              child: Container(
                width: 230,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: LinearGradient(
                    colors: [themeColor, themeColor.withOpacity(0.8)],
                  ),
                ),
                child: Text(
                  state.isLastPage ? "Let's Go" : "Next",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          },
        ),
        //
        skipButton: TextButton(
          onPressed: () {
            // for onboard feature
            saveOnboardGetstorage();
            Get.offAll(() => LandingScren());
          },
          child: const Text(
            "Skip",
            style: TextStyle(
              color: themeColor,
            ),
          ),
        ),
        onDone: () {
          debugPrint('done tapped');
          saveOnboardGetstorage();
        },
      ),
    );
  }

  void _onNextTap(OnBoardState onBoardState) {
    if (!onBoardState.isLastPage) {
      _pageController.animateToPage(
        onBoardState.page + 1,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOutSine,
      );
    } else {
      // for onboard feature

      saveOnboardGetstorage();
      Get.offAll(() => LandingScren());
      //print("nextButton pressed");
    }
  }
}
