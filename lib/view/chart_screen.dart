import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trogonmedia_task/view/chat_bubble.dart';

class ChartScreen extends StatefulWidget {
  const ChartScreen({super.key});

  @override
  State<ChartScreen> createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  List<String> chart = [
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took."
        "Lorem Ipsum is simply dummy ",
    "Lorem Ipsum is simply dummy ",
    "Lorem Ipsum is simply dummy ",
    "Lorem Ipsum is simply dummy ",
    "Lorem Ipsum is simply dummy ",
    "Lorem Ipsum is simply dummy ",
    "Lorem Ipsum is simply dummy ",
    "Lorem Ipsum is simply dummy ",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "John Doe",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "online",
              style: TextStyle(
                  color: Color.fromARGB(255, 138, 11, 138), fontSize: 15),
            )
          ],
        ),
        actions: [Icon(Icons.more_vert)],
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(radius: 30, child: Icon(Icons.person)),
        ),
      ),
      body: ListView.builder(
        itemCount: chart.length,
        itemBuilder: (context, index) {
          Alignment alignment =
              index % 2 == 0 ? Alignment.centerRight : Alignment.centerLeft;
          BorderRadius radius = index % 2 == 0
              ? BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                  topRight: Radius.circular(15))
              : BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                  topRight: Radius.circular(15));
          Color color = index % 2 == 0
              ? const Color.fromARGB(255, 11, 62, 103)
              : const Color.fromARGB(255, 226, 224, 224);
          Color textColor = index % 2 == 0 ? Colors.white : Colors.black;
          return Padding(
            padding:
                const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 40),
            child: Align(
              alignment: alignment,
              child: CustomPaint(
                painter: ChatBubble(color: color, alignment: alignment),
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: Stack(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(chart[index],
                            style: GoogleFonts.poppins(color: textColor)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // child: Container(
            //   width: 200,
            //   decoration: BoxDecoration(color: color, borderRadius: radius),
            //   child: Align(
            //       alignment: alignment,
            //       child: Padding(
            //         padding: const EdgeInsets.all(20.0),
            //         child: Text(softWrap: true, chart[index],style: GoogleFonts.poppins(color: textColor),),
            //       )),
            // ),
          );
        },
      ),
    );
  }
}
