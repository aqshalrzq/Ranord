import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:random_word/components/colors.dart';
import 'favourite.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String oneRandomWord = WordPair.random().asString;
  String twoRandomWord = WordPair.random().asString;

  String threeRandomWord = WordPair.random().toString();
  String fourthRandomWord = WordPair.random().toString();

  var savedFirstWords   = [];
  var savedSecondWords  = [];
  var savedThirdWords   = [];
  var savedFourthWords  = [];

  bool toggle = false;
  bool isClick = false;

  void changeWord() {
    setState(() {
      oneRandomWord = WordPair.random().asString;
      twoRandomWord = WordPair.random().asString;

      threeRandomWord = WordPair.random().toString();
      fourthRandomWord = WordPair.random().toString();
    });
  }

  void saveRandomWords() {
    savedFirstWords.add(oneRandomWord);
    savedSecondWords.add(twoRandomWord);
    savedThirdWords.add(threeRandomWord);
    savedFourthWords.add(fourthRandomWord);

    debugPrint(
        "1. '$savedFirstWords', 2. '$savedSecondWords', 3. '$savedThirdWords', 4. '$savedFourthWords'");
  }

  void changePages() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Favourite(
                  savedFirstWords: savedFirstWords,
                  savedSecondWords: savedSecondWords,
                  savedThirdWords: savedThirdWords,
                  savedFourthWords: savedFourthWords,
                )));
  }

  showInformation(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24)),
              child: Container(
                height: 240,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Perhatikan!",
                        style: TextStyle(
                            color: ranordBlack,
                            fontSize: 24,
                            letterSpacing: 0.2,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Text(
                        "Untuk melihat hasil kata acak yang sudah dsimpan, anda bisa mengetuk icon bookmark pada pojok kanan atas",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontSize: 14,
                            color: ranordGrey,
                            fontWeight: FontWeight.normal),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: OutlinedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(width: 1, color: ranordGrey),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(16))
                            )
                          ),
                          child: Text(
                            "Paham".toUpperCase(),
                            style: const TextStyle(
                              color: ranordGrey
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(
                onPressed: changePages,
                color: ranordGrey,
                icon: const Icon(Icons.bookmark)),
            IconButton(
              onPressed: () {
                showInformation(context);
              },
              color: ranordGrey,
              icon: const Icon(Icons.settings),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: ranordGrey,
          onPressed: () {
            changeWord();
            setState(() {
              debugPrint("testing onPressed!");
              if (isClick) {
                toggle = !toggle;
                isClick = false;
              }
            });
          },
          child: const Icon(
            Icons.play_arrow,
            color: ranordWhite,
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 40),
                      child: ListTile(
                        title: Text(
                          "Home",
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w800,
                              color: ranordBlack),
                        ),
                        subtitle: Text(
                          "ubah kata dengan mudah, cobalah!",
                          style: TextStyle(
                              color: ranordGrey,
                              fontSize: 16,
                              letterSpacing: 0.1,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 48,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 1.32,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextFormField(
                                readOnly: true,
                                key: Key(oneRandomWord),
                                initialValue: oneRandomWord,
                                style: const TextStyle(
                                    color: ranordGrey,
                                    fontWeight: FontWeight.w500),
                                decoration: InputDecoration(
                                    isDense: true,
                                    labelText: 'First Word',
                                    labelStyle: const TextStyle(
                                        color: ranordGrey,
                                        fontWeight: FontWeight.w700),
                                    prefixIcon: const Icon(Icons.book,
                                        color: ranordGrey),
                                    prefixIconColor: ranordGrey,
                                    hintText: 'Data',
                                    hintStyle:
                                        const TextStyle(color: ranordGrey),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: const BorderSide(
                                            color: ranordGrey, width: 1)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: const BorderSide(
                                            color: ranordGrey, width: 1)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: const BorderSide(
                                            width: 1, color: ranordGrey))),
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                              TextFormField(
                                readOnly: true,
                                key: Key(twoRandomWord),
                                initialValue: twoRandomWord,
                                style: const TextStyle(
                                    color: ranordGrey,
                                    fontWeight: FontWeight.w500),
                                decoration: InputDecoration(
                                    isDense: true,
                                    labelText: 'Second Word',
                                    labelStyle: const TextStyle(
                                        color: ranordGrey,
                                        fontWeight: FontWeight.w700),
                                    prefixIcon: const Icon(Icons.book,
                                        color: ranordGrey),
                                    prefixIconColor: ranordGrey,
                                    hintText: 'Data',
                                    hintStyle:
                                        const TextStyle(color: ranordGrey),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: const BorderSide(
                                            color: ranordGrey, width: 1)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: const BorderSide(
                                            color: ranordGrey, width: 1)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: const BorderSide(
                                            width: 1, color: ranordGrey))),
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                              TextFormField(
                                key: Key(threeRandomWord),
                                initialValue: threeRandomWord,
                                style: const TextStyle(
                                    color: ranordGrey,
                                    fontWeight: FontWeight.w500),
                                decoration: InputDecoration(
                                    isDense: true,
                                    labelText: 'Third Word',
                                    labelStyle: const TextStyle(
                                        color: ranordGrey,
                                        fontWeight: FontWeight.w700),
                                    prefixIcon: const Icon(Icons.book,
                                        color: ranordGrey),
                                    prefixIconColor: ranordGrey,
                                    hintText: 'Data',
                                    hintStyle:
                                        const TextStyle(color: ranordGrey),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: const BorderSide(
                                            color: ranordGrey, width: 1)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: const BorderSide(
                                            color: ranordGrey, width: 1)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: const BorderSide(
                                            width: 1, color: ranordGrey))),
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                              TextFormField(
                                key: Key(fourthRandomWord),
                                initialValue: fourthRandomWord,
                                style: const TextStyle(
                                    color: ranordGrey,
                                    fontWeight: FontWeight.w500),
                                decoration: InputDecoration(
                                    isDense: true,
                                    labelText: 'Fourth Word',
                                    labelStyle: const TextStyle(
                                        color: ranordGrey,
                                        fontWeight: FontWeight.w700),
                                    prefixIcon: const Icon(Icons.book,
                                        color: ranordGrey),
                                    prefixIconColor: ranordGrey,
                                    hintText: 'Data',
                                    hintStyle:
                                        const TextStyle(color: ranordGrey),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: const BorderSide(
                                            color: ranordGrey, width: 1)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: const BorderSide(
                                            color: ranordGrey, width: 1)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: const BorderSide(
                                            width: 1, color: ranordGrey))),
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Center(
                          child: IconButton(
                            icon: toggle
                                ? const Icon(Icons.favorite)
                                : const Icon(Icons.favorite_outline),
                            onPressed: () {
                              setState(() {
                                toggle = !toggle;
                                isClick = true;
                                saveRandomWords();
                              });
                            },
                            color: ranordGrey,
                            iconSize: 32,
                            focusColor: ranordBlue,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            )));
  }
}
