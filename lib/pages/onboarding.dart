import 'package:flutter/material.dart';
import 'package:random_word/components/colors.dart';
import 'package:random_word/models/onboarding_model.dart';
import 'package:random_word/pages/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int isViewed = 0;
  int currentIndex = 0;
  PageController pageControl;
  SharedPreferences preferences;

  List<OnBoardModel> screens = <OnBoardModel>[
    OnBoardModel(
        img: 'assets/ranord_first_illustrations.png',
        text: 'Selamat Datang',
        desc:
            'Ranord adalah sistem aplikasi berbasis Flutter untuk pengacakan kata bahasa inggris',
        background: ranordWhite,
        button: ranordGrey),
    OnBoardModel(
        img: 'assets/ranord_second_illustrations.png',
        text: 'Teman Waktu Luang',
        desc:
            'Alur dari aplikasi ini tidak terlalu rumit, sehingga aplikasi ini cocok untuk menemani anda di waktu luang',
        background: ranordWhite,
        button: ranordGrey),
    OnBoardModel(
        img: 'assets/ranord_third_illustrations.png',
        text: 'Hasil Belajar',
        desc:
            'Omong-omong, aplikasi ini saya kembangkan dari hasil belajar kursus gratis di Sekolah Koding. Anda juga bisa mencobanya!',
        background: ranordWhite,
        button: ranordGrey),
    OnBoardModel(
        img: 'assets/ranord_fourth_illustrations.png',
        text: 'Tahap Awal',
        desc:
            'Tak cukup disini saja, bila saya memiliki waktu luang dan ide yang cemerlang tentu saya akan kembangkan apps ini jauh lebih baik lagi.',
        background: ranordWhite,
        button: ranordGrey),
  ];

  @override
  void initState() {
    pageControl = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    pageControl.dispose();
    super.dispose();
  }

  storeOnBoardInfo() async {
    debugPrint("Shared Preferences called!");

    isViewed = 0;
    preferences = await SharedPreferences.getInstance();
    await preferences.setInt('onBoard', isViewed);

    debugPrint(preferences.getInt('onBoard').toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ranordWhite,
      appBar: AppBar(
        backgroundColor: ranordWhite,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {
              storeOnBoardInfo;
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const Home()));
            },
            child: Text(
              "Skip".toUpperCase(),
              style: const TextStyle(color: ranordGrey),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: PageView.builder(
          itemCount: screens.length,
          controller: pageControl,
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: (int index) {
            setState(() {
              currentIndex = index;
            });
          },
          itemBuilder: (_, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(screens[index].img),
                SizedBox(
                  height: 8,
                  child: ListView.builder(
                    itemCount: screens.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            width: currentIndex == index ? 24 : 8,
                            height: 8,
                            decoration: BoxDecoration(
                                color: currentIndex == index
                                    ? ranordGrey
                                    : ranordBlue,
                                borderRadius: BorderRadius.circular(8)),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  screens[index].text,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: ranordBlack),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  screens[index].desc,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 12, color: ranordGrey),
                ),
                const SizedBox(
                  height: 40,
                ),
                GestureDetector(
                  onTap: () async {
                    debugPrint(index.toString());
                    if (index == screens.length - 1) {
                      await storeOnBoardInfo();
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Home()));
                    }
                    pageControl.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.bounceIn);
                  },
                  child: Container(
                    height: 48,
                    width: 116,
                    decoration: BoxDecoration(
                        color: ranordWhite,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: const [
                          BoxShadow(
                              color: ranordGrey,
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: Offset(3, 3))
                        ]),
                    child: Center(
                      child: Text(
                        "Next".toUpperCase(),
                        style: const TextStyle(
                            color: ranordGrey, fontWeight: FontWeight.bold, letterSpacing: 0.5, fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
