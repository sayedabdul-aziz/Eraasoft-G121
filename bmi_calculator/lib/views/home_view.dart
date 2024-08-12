import 'package:bmi_calculator/colors.dart';
import 'package:bmi_calculator/views/result_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}
// if(x>y){
//
//   return x
// }else{
//   return y;
// }

//  int res =(x>y)?x:y
class _HomeViewState extends State<HomeView> {
  int weight = 70;
  int age = 24;
  int height = 170;
  bool isMale = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      appBar: AppBar(
        backgroundColor: AppColors.scaffoldBg,
        centerTitle: true,
        title: const Text(
          'BMI CALCULATOR',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w500, fontSize: 18),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // male and female
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isMale = true;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: (isMale)
                                ? AppColors.primary
                                : AppColors.secondry),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.male,
                                size: 80,
                                color: AppColors.white,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                'Male',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isMale = false;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: (!isMale)
                                ? AppColors.primary
                                : AppColors.secondry),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.female,
                                size: 80,
                                color: AppColors.white,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                'Female',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // height

            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.secondry),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Height',
                        style: TextStyle(color: Colors.white),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            height.toString(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 35,
                                fontWeight: FontWeight.w900),
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          const Text(
                            'CM',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Slider(
                        value: height.toDouble(),
                        min: 80,
                        max: 220,
                        activeColor: AppColors.primary,
                        inactiveColor: AppColors.accent,
                        onChanged: (value) {
                          setState(() {
                            height = value.toInt();
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // age and weight
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.secondry),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Weight',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              weight.toString(),
                              style: const TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                    color: AppColors.white,
                                    style: IconButton.styleFrom(
                                        backgroundColor: AppColors.accent),
                                    onPressed: () {
                                      if (weight > 30) {
                                        setState(() {
                                          weight--;
                                        });
                                      }
                                    },
                                    icon: const Icon(Icons.remove)),
                                const SizedBox(
                                  width: 5,
                                ),
                                IconButton(
                                    color: AppColors.white,
                                    style: IconButton.styleFrom(
                                        backgroundColor: AppColors.accent),
                                    onPressed: () {
                                      setState(() {
                                        weight++;
                                      });
                                    },
                                    icon: const Icon(Icons.add))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.secondry),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Age',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              age.toString(),
                              style: const TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                    color: AppColors.white,
                                    style: IconButton.styleFrom(
                                        backgroundColor: AppColors.accent),
                                    onPressed: () {
                                      if (age > 0) {
                                        setState(() {
                                          age--;
                                        });
                                      }
                                    },
                                    icon: const Icon(Icons.remove)),
                                const SizedBox(
                                  width: 5,
                                ),
                                IconButton(
                                    color: AppColors.white,
                                    style: IconButton.styleFrom(
                                        backgroundColor: AppColors.accent),
                                    onPressed: () {
                                      setState(() {
                                        age++;
                                      });
                                    },
                                    icon: const Icon(Icons.add))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // calc button
            const SizedBox(
              height: 10,
            ),
            SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        backgroundColor: AppColors.primary,
                        foregroundColor: AppColors.white),
                    onPressed: () {
                      // calculate BMI
                      // BMI = 	weight (kg) /height*height (m)
                      double res = (weight) / (height * height * .0001);
                      // navigate to result view
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ResultView(
                                result: res,
                              )));
                    },
                    child: const Text('Calculate')))
          ],
        ),
      ),
    );
  }
}
