import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../Model/all_chapter_moddel.dart';
import '../Provider/theamprovider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black38,
        title: Text(
          "श्रीमद् भगवद्गीता",
        ),
        centerTitle: true,
        actions: [
          Switch(
            value: Provider.of<TheamProvider>(context, listen: true)
                .theamChange
                .isDark,
            onChanged: (val) {
              Provider.of<TheamProvider>(context, listen: false).ChangeTheam();
            },
          ),
        ],
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
          FutureBuilder(
            future: rootBundle.loadString("gita_all_chapter.json"),
            builder: (ctx, snapshot) {
              if (snapshot.hasError) {
                return Text("${snapshot.error}");
              } else if (snapshot.hasData) {
                List DecodeData = jsonDecode(snapshot.data!);
                List<AllChapterModel> allData =
                    DecodeData.map((e) => AllChapterModel.fromMap(data: e))
                        .toList();
                return ListView.builder(
                  itemCount: allData.length,
                  itemBuilder: (ctx, i) => Card(
                    margin: EdgeInsets.only(
                      left: 15,
                      right: 15,
                      top: 15,
                    ),
                    color: Colors.white70,
                    child: ListTile(
                      title: Text(
                        "${allData[i].nameHindi}",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      subtitle: Text("Verses : ${allData[i].versesCount}"),
                      leading: Text(
                        "${allData[i].chapterNo}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      trailing: IconButton(
                          icon: Icon(Icons.arrow_forward_ios),
                          onPressed: () {
                            AllChapterModel a = AllChapterModel(
                                chapterNo: allData[i].chapterNo,
                                chapterSummaryEnglish:
                                    allData[i].chapterSummaryEnglish,
                                chapterSummaryHindi:
                                    allData[i].chapterSummaryHindi,
                                id: allData[i].id,
                                imageName: allData[i].imageName,
                                jsonPath: allData[i].jsonPath,
                                nameHindi: allData[i].nameHindi,
                                nameMeaning: allData[i].nameMeaning,
                                nameTranslationEnglish:
                                    allData[i].nameTranslationEnglish,
                                versesCount: allData[i].versesCount);
                            Navigator.pushNamed(context, 'dhome', arguments: a);
                          }),
                    ),
                  ),
                );
              }

              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ],
      ),
    );
  }
}
