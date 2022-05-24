import 'package:flutter/material.dart';
import 'package:random_word/components/colors.dart';
import 'package:random_word/pages/home.dart';

// ignore: must_be_immutable
class Favourite extends StatelessWidget {
  var savedFirstWords = [];
  var savedSecondWords = [];
  var savedThirdWords = [];
  var savedFourthWords = [];

  Favourite(
      {Key key,
      this.savedFirstWords,
      this.savedSecondWords,
      this.savedThirdWords,
      this.savedFourthWords})
      : super(key: key);

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
                        "Coba Lagi!",
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
                        "Jika anda merasa semakin penasaran proses pengacakan kata, anda bisa melakukan kapanpun saja.",
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
                              side:
                                  const BorderSide(width: 1, color: ranordGrey),
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16)))),
                          child: Text(
                            "Paham".toUpperCase(),
                            style: const TextStyle(color: ranordGrey),
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
          leading: IconButton(
              color: ranordGrey,
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Home()));
              }),
          actions: [
            IconButton(
              onPressed: () {
                showInformation(context);
              },
              color: ranordGrey,
              icon: const Icon(Icons.settings),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 40),
                    child: ListTile(
                      title: Text(
                        "Favourite",
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w800,
                            color: ranordBlack),
                      ),
                      subtitle: Text(
                        "lihat hasilnya, lalu lakukan seperti semula!",
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
                children: [
                  TextFormField(
                    readOnly: true,
                    initialValue: savedFirstWords.join(", "),
                    style: const TextStyle(
                        color: ranordGrey, fontWeight: FontWeight.w500),
                    decoration: InputDecoration(
                        isDense: true,
                        labelText: 'First Saved Word',
                        labelStyle: const TextStyle(
                            color: ranordGrey, fontWeight: FontWeight.w500),
                        prefixIcon: const Icon(Icons.book, color: ranordGrey),
                        prefixIconColor: ranordGrey,
                        hintText: 'Data',
                        hintStyle: const TextStyle(color: ranordGrey),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide:
                                const BorderSide(color: ranordGrey, width: 1)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide:
                                const BorderSide(color: ranordGrey, width: 1)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide:
                                const BorderSide(width: 1, color: ranordGrey))),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  TextFormField(
                    readOnly: true,
                    initialValue: savedSecondWords.join(", "),
                    style: const TextStyle(
                        color: ranordGrey, fontWeight: FontWeight.w500),
                    decoration: InputDecoration(
                        isDense: true,
                        labelText: 'Second Saved Words',
                        labelStyle: const TextStyle(
                            color: ranordGrey, fontWeight: FontWeight.w500),
                        prefixIcon: const Icon(Icons.book, color: ranordGrey),
                        prefixIconColor: ranordGrey,
                        hintText: 'Data',
                        hintStyle: const TextStyle(color: ranordGrey),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide:
                                const BorderSide(color: ranordGrey, width: 1)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide:
                                const BorderSide(color: ranordGrey, width: 1)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide:
                                const BorderSide(width: 1, color: ranordGrey))),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  TextFormField(
                    readOnly: true,
                    initialValue: savedThirdWords.join(", "),
                    style: const TextStyle(
                        color: ranordGrey, fontWeight: FontWeight.w500),
                    decoration: InputDecoration(
                        isDense: true,
                        labelText: 'Third Saved Words',
                        labelStyle: const TextStyle(
                            color: ranordGrey, fontWeight: FontWeight.w500),
                        prefixIcon: const Icon(Icons.book, color: ranordGrey),
                        prefixIconColor: ranordGrey,
                        hintText: 'Data',
                        hintStyle: const TextStyle(color: ranordGrey),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide:
                                const BorderSide(color: ranordGrey, width: 1)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide:
                                const BorderSide(color: ranordGrey, width: 1)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide:
                                const BorderSide(width: 1, color: ranordGrey))),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  TextFormField(
                    readOnly: true,
                    initialValue: savedFourthWords.join(", "),
                    style: const TextStyle(
                        color: ranordGrey, fontWeight: FontWeight.w500),
                    decoration: InputDecoration(
                        isDense: true,
                        labelText: 'Fourth Saved Words',
                        labelStyle: const TextStyle(
                            color: ranordGrey, fontWeight: FontWeight.w500),
                        prefixIcon: const Icon(Icons.book, color: ranordGrey),
                        prefixIconColor: ranordGrey,
                        hintText: 'Data',
                        hintStyle: const TextStyle(color: ranordGrey),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide:
                                const BorderSide(color: ranordGrey, width: 1)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide:
                                const BorderSide(color: ranordGrey, width: 2)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide:
                                const BorderSide(width: 1, color: ranordGrey))),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
