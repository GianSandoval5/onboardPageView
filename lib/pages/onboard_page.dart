import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:onboard_page_view/data/contents_onboard.dart';

import 'home_page.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Colors.indigo,
          Colors.blue,
        ])),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: contents.length,
                onPageChanged: (int index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (_, i) {
                  return SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(40),
                      child: Column(
                        children: [
                          Image.asset(contents[i].image),
                          SizedBox(height: 20),
                          Text(
                            contents[i].text,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            contents[i].descripcion,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      contents.length, (index) => buildPage(index, context))),
            ),
            Container(
              height: 60,
              width: double.infinity,
              margin: EdgeInsets.all(40),
              child: MaterialButton(
                onPressed: () async {
                  if (currentIndex == contents.length - 1) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => HomePage()),
                    );
                  }
                  _controller.nextPage(
                    duration: Duration(seconds: 1),
                    curve: Curves.easeInOut,
                  );
                },
                color: Colors.indigo,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1, color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  currentIndex == contents.length - 1
                      ? "Continuar"
                      : "Siguiente",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container buildPage(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 20 : 10,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color:
            currentIndex == index ? Colors.red : Colors.green.withOpacity(0.4),
      ),
    );
  }
}
