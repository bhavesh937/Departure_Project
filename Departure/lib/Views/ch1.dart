import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../Model/all_chapter_moddel.dart';
import '../Model/chapter_model.dart';
import '../Model/shlokchangemodel.dart';
import '../Provider/theamprovider.dart';

class CH1 extends StatefulWidget {
  const CH1({super.key});

  @override
  State<CH1> createState() => _CH1State();
}

class _CH1State extends State<CH1> {
  int? i;
  @override
  Widget build(BuildContext context) {
    AllChapterModel data1 =
        ModalRoute.of(context)!.settings.arguments as AllChapterModel;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff564c55),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.white,
          ),
        ),
        title: Text(
          "${data1.nameHindi}",
          style: TextStyle(color: Colors.white),
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
                    "lib/Utils/Assets/Image/lord-shree-krishna-ji.gif"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          FutureBuilder(
            future: rootBundle.loadString("ch_1.json"),
            builder: (ctx, snapshot) {
              if (snapshot.hasError) {
                return Text("${snapshot.error}");
              } else if (snapshot.hasData) {
                List DecodeData = jsonDecode(snapshot.data!);
                List<ChapterModel> allData =
                    DecodeData.map((e) => ChapterModel.fromMap(data: e))
                        .toList();
                return ListView.builder(
                  itemCount: allData.length,
                  itemBuilder: (ctx, i) => GestureDetector(
                    onTap: () {
                      ChapterModel c = ChapterModel(
                        verse: allData[i].verse,
                        sanskrit: allData[i].sanskrit,
                        english: allData[i].english,
                        gujarati: allData[i].gujarati,
                        hindi: allData[i].hindi,
                      );
                      shlokIndex = i;
                      Navigator.pushNamed(
                        context,
                        'vd',
                        arguments: c,
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.only(
                        left: 22,
                        right: 22,
                        top: 10,
                        bottom: 10,
                      ),
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        image: DecorationImage(
                          image: AssetImage("lib/Utils/Assets/Image/giphy.gif"),
                          fit: BoxFit.cover,
                        ),
                        color: Colors.white70,
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "${allData[i].verse}",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Center(
                            child: SingleChildScrollView(
                              child: Text(
                                "${allData[i].sanskrit}",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
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
