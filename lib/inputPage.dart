import 'package:bmi_calculator/calculatorBrain.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';
import 'genderCard.dart';
import 'reusableCard.dart';
import 'resultPage.dart';

enum GenderType{Male,Female}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GenderType selectedGender;
  int initHeight = 180;
  int initWeight = 55;
  int initAge = 22;

  Color maleCardColor = kinactiveCardColor;
  Color femaleCardColor = kinactiveCardColor;
  // void updateCardColor(GenderType selectedGender){
  //   if(selectedGender == GenderType.Male){
  //     if(maleCardColor == inactiveCardColor){
  //       maleCardColor = activeCardColor;
  //       femaleCardColor = inactiveCardColor;
  //     }
  //     else{
  //       maleCardColor = activeCardColor;
  //     }
  //   }
  //   if(selectedGender == GenderType.Female){
  //     if(femaleCardColor == inactiveCardColor){
  //       femaleCardColor = activeCardColor;
  //       maleCardColor = inactiveCardColor;
  //     }
  //     else{
  //       femaleCardColor = activeCardColor;
  //     }
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      onPress: (){
                        setState(() {
                          selectedGender = GenderType.Male;
                        });
                      },
                      colors: selectedGender == GenderType.Male ? kactiveCardColor : kinactiveCardColor,
                      childCard: GenderCard(
                          genderIcon: FontAwesomeIcons.mars,
                          genderLabel: 'MALE'
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onPress: (){
                        setState(() {
                          selectedGender = GenderType.Female;
                        });
                      },
                      colors: selectedGender == GenderType.Female ? kactiveCardColor : kinactiveCardColor,
                      childCard: GenderCard(
                          genderIcon: FontAwesomeIcons.venus,
                          genderLabel: 'FEMALE'
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                  colors: kinactiveCardColor,
                  childCard: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('HEIGHT',
                        style: klabelTexStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        children: [
                          Text(initHeight.toString(),
                          style: TextStyle(
                              fontSize: 40,
                              color: Color(0xFFFFFFFF),
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Text('cm',
                           style: klabelTexStyle,
                          )
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.white,
                          inactiveTrackColor: Colors.blueGrey,
                          thumbShape: RoundSliderThumbShape(
                              enabledThumbRadius: 12.5,
                              elevation: 5,
                          ),
                          thumbColor: Color(0xFFFF0080),
                        ),
                        child: Slider(
                            value: initHeight.toDouble(),
                            min: 120.0,
                            max: 250.0,
                            onChanged: (double newValue){
                               print(newValue.round());
                               setState(() {
                                 initHeight = newValue.round();
                               });
                            },
                        ),
                      ),
                    ],
                  ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(colors: kactiveCardColor,
                      childCard: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('WEIGHT',
                          style: klabelTexStyle,
                          ),
                          Text(initWeight.toString(),
                          style: TextStyle(
                            fontSize: 40,
                            color: Color(0xFFFFFFFF),
                            fontWeight: FontWeight.w900,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              RoundIconButton(icon: FontAwesomeIcons.minus, onPressed: (){
                                setState(() {
                                  if(initWeight > 0)
                                      initWeight--;
                                });
                              }),
                              RoundIconButton(icon: FontAwesomeIcons.plus,  onPressed: (){
                                setState(() {
                                  initWeight++;
                                });
                              }),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(colors: kactiveCardColor,
                      childCard: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('AGE',
                            style: klabelTexStyle,
                          ),
                          Text(initAge.toString(),
                            style: TextStyle(
                              fontSize: 40,
                              color: Color(0xFFFFFFFF),
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              RoundIconButton(icon: FontAwesomeIcons.minus, onPressed: (){
                                setState(() {
                                  if(initAge > 0)
                                    initAge--;
                                });
                              }),
                              RoundIconButton(icon: FontAwesomeIcons.plus,  onPressed: (){
                                setState(() {
                                  initAge++;
                                });
                              }),
                            ],
                          )
                        ],
                      ),),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: (){
                CalculatorBrain calc = CalculatorBrain(height: initHeight, weight: initWeight);

                Navigator.push(context, MaterialPageRoute(builder: (context){
                      return ResultsPage(
                        bmiResult: calc.calculateBMI(),
                        resultText: calc.getResult(),
                        interpretation: calc.getInterpretation() ,
                      );
                    },
                  ),
                );
              },
              child: Container(
                child: Center(
                  child: Text('CALCULATE',
                    style: KlargeTextStyle,
                  ),
                ),
                width: double.infinity,
                margin: EdgeInsets.all(10),
                color: Color(0xFFFF0080),
                height: kbottomBarHeight,
              ),
            ),
          ],
        )
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.icon,this.onPressed});
  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      child: Icon(
        icon,
        color: Colors.white,
      ),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      elevation: 6.0,
    );
  }
}
