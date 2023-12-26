import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Model/chapter_model.dart';
import '../Provider/theamprovider.dart';

class VDetail extends StatefulWidget {
  const VDetail({super.key});

  @override
  State<VDetail> createState() => _VDetailState();
}

class _VDetailState extends State<VDetail> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  int index = 0;
  @override
  Widget build(BuildContext context) {
    ChapterModel data =
        ModalRoute.of(context)!.settings.arguments as ChapterModel;
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
                image: AssetImage("lib/Utils/Assets/Image/8D8U.gif"),
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
                      child: Center(),
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 120,
                        width: 350,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white70,
                        ),
                        child: Center(
                          child: Text(
                            "${data.sanskrit}",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 70,
                        width: 350,
                        decoration: BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    index = 0;
                                  });
                                },
                                child: Expanded(
                                  child: Center(
                                    child: Text(
                                      "English",
                                      style: TextStyle(
                                        color: (index == 0)
                                            ? Colors.blue
                                            : Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    index = 1;
                                  });
                                },
                                child: Expanded(
                                  child: Center(
                                    child: Text(
                                      "Hindi",
                                      style: TextStyle(
                                        color: (index == 1)
                                            ? Colors.blue
                                            : Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    index = 2;
                                  });
                                },
                                child: Expanded(
                                  child: Center(
                                    child: Text(
                                      "Gujrati",
                                      style: TextStyle(
                                        color: (index == 2)
                                            ? Colors.blue
                                            : Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        height: 150,
                        width: 350,
                        decoration: BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: IndexedStack(
                          index: index,
                          children: [
                            Center(
                              child: Text("${data.english}",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ),
                            Center(
                              child: Text("${data.hindi}",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ),
                            Center(
                              child: Text(
                                "${data.gujarati}",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
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
