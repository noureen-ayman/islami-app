import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Hadeth.dart';
import 'HadethDetailsScreen.dart';
import 'HadethView.dart';

class HadethScreen extends StatefulWidget {
  const HadethScreen({super.key});

  @override
  State<HadethScreen> createState() => _HadethScreenState();
}

class _HadethScreenState extends State<HadethScreen> {
  List<Hadeth> allHadeth = [];

  @override
  Widget build(BuildContext context) {
    if (allHadeth.isEmpty) {
      loadHadeth();
    }

    return Container(
      child: allHadeth.isEmpty
          ? Center(child: CircularProgressIndicator())
          : PageView.builder(
              controller: PageController(viewportFraction: 0.85),
              itemCount: allHadeth.length,
              itemBuilder: (context, index) {
                return AnimatedBuilder(
                  animation: PageController(viewportFraction: 0.85),
                  builder: (context, child) {
                    return Transform.scale(
                      scale: 0.95,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            HadethDetails.route,
                            arguments: {
                              'hadeth': allHadeth[index],
                              'index': index,
                            },
                          );
                        },
                        child: HadethView(hadeth: allHadeth[index]),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }

  void loadHadeth() async {
    String hadethContent = await rootBundle.loadString(
      "assets/ahadeth_file/ahadeth.txt",
    );
    List<String> hadethContentList = hadethContent.trim().split("#");
    for (int i = 0; i < hadethContentList.length; i++) {
      String singleHadethContent = hadethContentList[i].trim();
      int indexOfFirstLine = singleHadethContent.indexOf("\n");
      String title = singleHadethContent.substring(0, indexOfFirstLine);
      String content = singleHadethContent.substring(indexOfFirstLine + 1);
      Hadeth hadeth = Hadeth(tittle: title, content: content);
      allHadeth.add(hadeth);
    }
    setState(() {});
  }
}
