import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Model/all_chapter_moddel.dart';
import '../Provider/theamprovider.dart';

class Dhome extends StatefulWidget {
  const Dhome({super.key});

  @override
  State<Dhome> createState() => _DhomeState();
}

class _DhomeState extends State<Dhome> {
  @override
  Widget build(BuildContext context) {
    AllChapterModel data =
        ModalRoute.of(context)!.settings.arguments as AllChapterModel;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    "lib/Utils/Assets/Image/Hubble_ultra_deep_field.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 10,
                      child: Center(
                        child: Text(
                          "${data.nameHindi}",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: GestureDetector(
                        onTap: () {},
                        child: Switch(
                          value:
                              Provider.of<TheamProvider>(context, listen: true)
                                  .theamChange
                                  .isDark,
                          onChanged: (val) {
                            Provider.of<TheamProvider>(context, listen: false)
                                .ChangeTheam();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 14,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 18.0,
                    right: 18,
                    top: 10,
                    bottom: 10,
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("${data.imageName}"),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        height: 70,
                        width: 350,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white70,
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Name Meaning",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "${data.nameMeaning}",
                                overflow: TextOverflow.fade,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        height: 300,
                        width: 350,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white70,
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Summary",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "${data.chapterSummaryEnglish}",
                                overflow: TextOverflow.fade,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          AllChapterModel b = AllChapterModel(
                              chapterNo: data.chapterNo,
                              chapterSummaryEnglish: data.chapterSummaryEnglish,
                              chapterSummaryHindi: data.chapterSummaryHindi,
                              id: data.id,
                              imageName: data.imageName,
                              jsonPath: data.jsonPath,
                              nameHindi: data.nameHindi,
                              nameMeaning: data.nameMeaning,
                              nameTranslationEnglish:
                                  data.nameTranslationEnglish,
                              versesCount: data.versesCount);
                          Navigator.pushNamed(context, 'c1', arguments: b);
                        },
                        child: Container(
                          height: 40,
                          width: 90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.white70,
                          ),
                          child: Center(
                            child: Text(
                              "All Verses",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
