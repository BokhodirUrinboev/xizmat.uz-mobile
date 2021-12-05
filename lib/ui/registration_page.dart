import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xizmat_uz/generated/l10n.dart';
import 'package:xizmat_uz/ui/steps/basic_content.dart';
import 'package:xizmat_uz/ui/steps/family_content.dart';

class RegistrattionPageWidget extends StatefulWidget {
  @override
  _RegistrattionPageState createState() => _RegistrattionPageState();
}

class _RegistrattionPageState extends State<RegistrattionPageWidget> {
  int _currentStep = 0;
  StepperType stepperType =
      !GetPlatform.isWeb ? StepperType.vertical : StepperType.horizontal;
  GlobalKey<BasicContentState> basicKey = GlobalKey();
  GlobalKey<FamilyContentState> familyContentStatusKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.online_reg),
        elevation: 0,
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.all(10),
          constraints: BoxConstraints(
            maxWidth: GetPlatform.isWeb
                ? MediaQuery.of(context).size.width * 0.7
                : double.infinity,
          ),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          child: Card(
              child: Stepper(
            controlsBuilder: (context,
                {VoidCallback? onStepContinue, VoidCallback? onStepCancel}) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  TextButton(
                    onPressed: () {
                      // print(basicKey.currentState!.getpersonaldata().toJson());
                      onStepContinue!();
                    },
                    child:  Text((_currentStep==1)?'NEXT':"Send"),
                  ),
                  (_currentStep != 0)
                      ? TextButton(
                          onPressed: onStepCancel,
                          child: const Text('EXIT'),
                        )
                      : Container(),
                ],
              );
            },
            type: stepperType,
            physics: ScrollPhysics(),
            currentStep: _currentStep,
            onStepTapped: (step) => tapped(step),
            onStepContinue: continued,
            onStepCancel: cancel,
            steps: <Step>[
              Step(
                title: Text(S.current.basic_data),
                content: BasicContent(
                  key: basicKey,
                ),
                isActive: _currentStep >= 0,
                state:
                    _currentStep >= 0 ? StepState.complete : StepState.disabled,
              ),
              Step(
                title: Text(S.current.family),
                content: FamilyContent(
                  key: familyContentStatusKey,
                ),
                isActive: _currentStep >= 0,
                state:
                    _currentStep >= 1 ? StepState.complete : StepState.disabled,
              ),
              // Step(
              //   title: Text(S.current.tariff),
              //   content: Column(
              //     children: <Widget>[
              //       TextFormField(
              //         decoration: InputDecoration(labelText: 'Mobile Number'),
              //       ),
              //     ],
              //   ),
              //   isActive: _currentStep >= 0,
              //   state:
              //       _currentStep >= 2 ? StepState.complete : StepState.disabled,
              // ),
            ],
          )),
        ),
      ),
    );
  }

  switchStepsType() {
    setState(() => stepperType == StepperType.vertical
        ? stepperType = StepperType.horizontal
        : stepperType = StepperType.vertical);
  }

  tapped(int step) {
    setState(() => _currentStep = step);
  }

  continued() {
    _currentStep < 1 ? setState(() => _currentStep += 1) : null;
  }

  cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }
}
