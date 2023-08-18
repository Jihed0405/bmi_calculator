import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components/bottom_button.dart';
import '../components/round_icon_button.dart';


enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 180;
  int weight = 70;
  int age = 18;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('BMI CALCULATOR')),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch ,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      onPress:  (){setState(() {
                        selectedGender = Gender.male;
                      });},
                      colour: selectedGender == Gender.male
                          ? kActiveCardColour
                          : kInactiveCardColour,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.mars,
                        label: 'MALE',
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onPress: (){
                         setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      colour: selectedGender == Gender.female
                          ? kActiveCardColour
                          : kInactiveCardColour,
                      cardChild: IconContent(
                          icon: FontAwesomeIcons.venus, label: "FEMALE"),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(colour: kInactiveCardColour,
              cardChild: Column(
              
                 mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('HEIGHT', style:  kLabelTextStyle),
                  Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   crossAxisAlignment: CrossAxisAlignment.baseline,
                   textBaseline:TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(),style:kValuesTextStyle ,),
                      SizedBox(width: 5.0,),
                      Text('cm',style: kLabelTextStyle)
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(trackHeight: 2.0,
                    activeTrackColor: Colors.white,
                      inactiveTrackColor: kSliderInactiveColor,
                    thumbColor: kBottomContainerColour,
                    overlayColor: kOverlaySliderColor ,
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0)
                    ),
                    
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue) { 
                        setState(() {
                          height=newValue.round();
                        });
                       },
                    ),
                  )
                ],

              ),),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(child: ReusableCard(colour: kInactiveCardColour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("WEIGHT", style:  kLabelTextStyle),
                       Text(weight.toString(),style:kValuesTextStyle ,),
                       Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(icon:FontAwesomeIcons.minus,
                          onPressed: (){
                            setState(() {
                              weight--;
                            });
                          },
                          ),
                          SizedBox(width: 10.0,),
                           RoundIconButton(icon:FontAwesomeIcons.plus,
                           onPressed: (){
                            setState(() {
                              weight++;
                            });
                           },),
                        ],
                       )
                    ],
                  ),
                  ),
                  ),
                  Expanded(child: ReusableCard(colour: kInactiveCardColour,
                   cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("AGE", style:  kLabelTextStyle),
                       Text(age.toString(),style:kValuesTextStyle ,),
                       Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(icon:FontAwesomeIcons.minus,
                          onPressed: (){
                            setState(() {
                              age--;
                            });
                          },
                          ),
                          SizedBox(width: 10.0,),
                           RoundIconButton(icon:FontAwesomeIcons.plus,
                           onPressed: (){
                            setState(() {
                              age++;
                            });
                           },),
                        ],
                       )
                    ],
                  ),
                  ),
                  ),
                ],
              ),
            ),
            BottomButton(buttonTitle: 'CALCULATE',onTap:  (){
              CalculatorBrain calculatorBrain = CalculatorBrain(height: height, weight: weight) ;
      Navigator.push(context,
      MaterialPageRoute(builder: (context)=> ResultsPage(
        bmiResult:calculatorBrain.calculateBMI() ,
      resultText:calculatorBrain.getResult() ,
      interpretation: calculatorBrain.getInterpretation()
      ,),
      )
      );
    },)
          ],
        ));
  }
}



