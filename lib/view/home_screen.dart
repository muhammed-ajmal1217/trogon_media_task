import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trogonmedia_task/view/chart_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CarouselSliderController buttonCarouselController =
      CarouselSliderController();
  int _currentIndex = 0;
  List<int> items = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];

  List<Color> colorList = [
    const Color.fromARGB(255, 181, 2, 201),
    Colors.grey,
  ];
  String selectedText = "";
  String selectedTextMeaning = "";

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    Map<String, double> dataMap = {
      "complete": (_currentIndex + 1).toDouble(),
      "incomplete": 15 - (_currentIndex + 1).toDouble(),
    };
    Map<String, String> text = {
      "Abrogate": "To revoke",
      "Anachronism": "Something out of place for the time period",
      "Arrant": "Something out of place for the time period",
      "Artless": "Entirely and completely",
      "Asperity": "Without deception",
      "Belie": "Harsh in tone",
      "Byzantine": "To convey a misleading impression of; to distort",
      "Cajole": "Convoluted and complicated",
      "Conciliate": "Persuade through flattery or coaxing",
      "Connecticutian": "To reach an agreement with",
      "Consanguineous": "A native of Connecticut",
      "Copypasta": "Of the same ancestry or origin",
      "Demagogue": "Data (including text) copied and pasted from the internet",
      "Diatribe":
          "A political leader who employs rhetoric to appeal to regular individuals preconceptions and wants",
      "Dilatory": "A verbal assault against another person"
    };
    @override
    void initState() {
      super.initState();
      selectedText = text.keys.elementAt(_currentIndex);
      selectedTextMeaning = text[selectedText]!;
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: size.height * 0.25,
              width: double.infinity,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(180),
                      bottomRight: Radius.circular(180)),
                  color: Color.fromARGB(255, 181, 2, 201)),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Everyday Phrases",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 30,
                ),
                Container(
                  height: 100,
                  width: 100,
                  child: PieChart(
                    dataMap: dataMap,
                    animationDuration: const Duration(milliseconds: 800),
                    chartRadius: MediaQuery.of(context).size.width / 3.2,
                    colorList: colorList,
                    chartType: ChartType.ring,
                    centerText: "$_currentIndex / ${items.length - 1}",
                    ringStrokeWidth: 12,
                    legendOptions: const LegendOptions(showLegends: false),
                    chartValuesOptions:
                        const ChartValuesOptions(showChartValues: false),
                    initialAngleInDegree: 0,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            CarouselSlider(
              carouselController: buttonCarouselController,
              options: CarouselOptions(
                pageSnapping: true,
                padEnds: true,
                height: 300.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                    // selectedText = text.keys.elementAt(_currentIndex);
                    // selectedTextMeaning = text[selectedText]!;
                  });
                },
              ),
              items: text.entries.map((e) {
                String phrase = e.key;
                String meaning = e.value;
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color.fromARGB(255, 181, 2, 201)),
                        child: Center(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              phrase,
                              style: GoogleFonts.poppins(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            FloatingActionButton(
                              onPressed: () {},
                              child: Icon(Icons.arrow_right_alt_outlined),
                            )
                          ],
                        )));
                  },
                );
              }).toList(),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStatePropertyAll(ContinuousRectangleBorder(
                          side: const BorderSide(
                              color: Color.fromARGB(255, 81, 12, 55)),
                          borderRadius: BorderRadius.circular(10))),
                    ),
                    onPressed: () => buttonCarouselController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.linear),
                    child: const Text(
                      '< Previous',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStatePropertyAll(ContinuousRectangleBorder(
                          side: const BorderSide(
                              color: Color.fromARGB(255, 81, 12, 55)),
                          borderRadius: BorderRadius.circular(10))),
                    ),
                    onPressed: () => buttonCarouselController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.linear),
                    child: const Text('Next >',
                        style: TextStyle(fontWeight: FontWeight.w700)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ChartScreen()));
        },
        child: Icon(
          Icons.arrow_circle_right_outlined,
          color: Colors.white,
        ),
        shape: CircleBorder(),
        backgroundColor: Color.fromARGB(255, 81, 12, 55),
      ),
    );
  }

  countChange(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
