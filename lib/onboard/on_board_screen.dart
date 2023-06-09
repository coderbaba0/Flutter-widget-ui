import 'package:flutter/material.dart';
import 'package:flutter_ui_source/onboard/board_model.dart';
import 'package:flutter_ui_source/onboard/dot_indicator_2.dart';
import 'package:flutter_ui_source/onboard/on_board_item.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  late PageController _pageController;
  int pageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'SKIP',
              style: TextStyle(
                color: Colors.teal,
                fontWeight: FontWeight.w900,
                fontSize: 18,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, bottom: 35),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (index) {
                  setState(() {
                    pageIndex = index;
                  });
                },
                itemCount: dummyData.length,
                controller: _pageController,
                itemBuilder: (context, index) {
                  return OnBoardItem(
                    image: dummyData[index].image,
                    title: dummyData[index].title,
                    description: dummyData[index].description,
                  );
                },
              ),
            ),
            //pageIndex != dummyData.length - 1 ?
            Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...List.generate(
                  dummyData.length,
                  (index) => DotIndicator2(
                    isActive: index == pageIndex,
                    index: index,
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.slowMiddle,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      backgroundColor: Colors.teal,
                      padding: const EdgeInsets.all(10)),
                  child: const Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                ),
              ],
            )
            // : ElevatedButton(
            //     onPressed: () {},
            //     style: ElevatedButton.styleFrom(
            //         backgroundColor: Colors.teal,
            //         padding: const EdgeInsets.symmetric(horizontal: 30)),
            //     child: const Text(
            //       'Start',
            //       style: TextStyle(
            //         color: Colors.white,
            //         fontWeight: FontWeight.bold,
            //       ),
            //     ),
            //   ),
          ],
        ),
      ),
    );
  }
}
