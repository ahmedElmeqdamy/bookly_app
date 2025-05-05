import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utliti/font_style.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> animation;

  @override
  void initState() {
    super.initState();

    initSlideAnimation();
    navigateToHomeView();
  }

  @override
  void dispose() {
    super.dispose();

    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset('assets/images/logo.png', height: 50, width: 200),
        SizedBox(height: 6),
        AnimatedBuilder(
          builder:
              (context, _) => SlideTransition(
                position: animation,
                child: Text(
                  'read free books',
                  textAlign: TextAlign.center,
                  style: Styles.textStyle16,
                ),
              ),
          animation: animation,
        ),
      ],
    );
  }

  void navigateToHomeView() {
    Future.delayed(
      Duration(seconds: 3),
      () {
        GoRouter.of(context).push('/HomeView');
      },
      // () => Get.to(
      //   () => HomeView(),
      //   transition: Transition.circularReveal,
      //   duration: Duration(seconds: 1),
      // ),
    );
  }

  void initSlideAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    animation = Tween<Offset>(
      begin: Offset(0, 3),
      end: Offset.zero,
    ).animate(animationController);

    animationController.forward();
  }
}
