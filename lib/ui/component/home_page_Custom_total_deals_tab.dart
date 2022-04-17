import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:shahid_mahamum_sir/provider/home_page_tab_state.dart';

class CustomTotalDealsTab extends StatelessWidget {
  const CustomTotalDealsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final totalDealsTabState = Provider.of<TotalDealsTabState>(context);
    if (totalDealsTabState.totalDealsTabValue == 1) {
      return buildWeeklyTab(context);
    } else if (totalDealsTabState.totalDealsTabValue == 2) {
      return buildMonthlyTab(context);
    } else {
      return buildYearlyTab(context);
    }
  }

  Widget buildWeeklyTab(BuildContext context){
    return Container(
      height: 300,
      width: double.infinity,
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 100,
              width: 200,
              child: Image.asset("image/pie.png",fit: BoxFit.fill,),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              padding: const EdgeInsets.all(15.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: [
                        CircularPercentIndicator(
                          radius: 45.0,
                          lineWidth: 4.0,
                          percent: 0.10,
                          center: const Text("10%"),
                          progressColor: Colors.red,
                        ),
                        const Text("Asia",style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),),
                        const Text("Description",style: TextStyle(
                          //fontWeight: FontWeight.bold,
                          fontSize: 8
                        ),),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                    ),
                    Column(
                      children: [
                        CircularPercentIndicator(
                          radius: 45.0,
                          lineWidth: 4.0,
                          percent: 0.30,
                          center: const Text("30%"),
                          progressColor: Colors.orange,
                        ),
                        const Text("Europe",style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),),
                        const Text("Description",style: TextStyle(
                          //fontWeight: FontWeight.bold,
                            fontSize: 8
                        ),),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                    ),
                    Column(
                      children: [
                        CircularPercentIndicator(
                          radius: 45.0,
                          lineWidth: 4.0,
                          percent: 0.60,
                          center: const Text("60%"),
                          progressColor: Colors.yellow,
                        ),
                        const Text("USA",style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),),
                        const Text("Description",style: TextStyle(
                          //fontWeight: FontWeight.bold,
                            fontSize: 8
                        ),),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                    ),
                    Column(
                      children: [
                        CircularPercentIndicator(
                          radius: 45.0,
                          lineWidth: 4.0,
                          percent: 0.90,
                          center: const Text("90%"),
                          progressColor: Colors.green,
                        ),
                        const Text("Bangladesh",style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),),
                        const Text("Description",style: TextStyle(
                          //fontWeight: FontWeight.bold,
                            fontSize: 8
                        ),),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildMonthlyTab(BuildContext context) {
    return Container(
      //height: 100,
      width: MediaQuery.of(context).size.width*.7,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: const [
                Text("Asia",style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),),
                Text("Description",style: TextStyle(
                  //fontWeight: FontWeight.bold,
                    fontSize: 8
                ),),
              ],
            ),
            Column(
              children: const [
                Text("Europe",style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),),
                Text("Description",style: TextStyle(
                  //fontWeight: FontWeight.bold,
                    fontSize: 8
                ),),
              ],
            ),
            Column(
              children: const [
                Text("USA",style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),),
                Text("Description",style: TextStyle(
                  //fontWeight: FontWeight.bold,
                    fontSize: 8
                ),),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildYearlyTab(BuildContext context) {
    return Container(
      //height: 100,
      width: MediaQuery.of(context).size.width*.7,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: const [
                Text("Asia",style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),),
                Text("Description",style: TextStyle(
                  //fontWeight: FontWeight.bold,
                    fontSize: 8
                ),),
              ],
            ),
            Column(
              children: const [
                Text("Europe",style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),),
                Text("Description",style: TextStyle(
                  //fontWeight: FontWeight.bold,
                    fontSize: 8
                ),
                ),
              ],
            ),
            Column(
              children: const [
                Text("USA",style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),),
                Text("Description",style: TextStyle(
                  //fontWeight: FontWeight.bold,
                    fontSize: 8
                ),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
