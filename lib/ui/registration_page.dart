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

  @override
  Widget build(BuildContext context) {
    return Align(
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
                  onPressed: onStepContinue,
                  child: const Text('NEXT'),
                ),
                TextButton(
                  onPressed: onStepCancel,
                  child: const Text('EXIT'),
                ),
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
              content: BasicContent(),
              isActive: _currentStep >= 0,
              state:
                  _currentStep >= 0 ? StepState.complete : StepState.disabled,
            ),
            Step(
              title: Text(S.current.family),
              content: FamilyContent(),
              isActive: _currentStep >= 0,
              state:
                  _currentStep >= 1 ? StepState.complete : StepState.disabled,
            ),
            Step(
              title: Text(S.current.tariff),
              content: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Mobile Number'),
                  ),
                ],
              ),
              isActive: _currentStep >= 0,
              state:
                  _currentStep >= 2 ? StepState.complete : StepState.disabled,
            ),
          ],
        )),
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
    _currentStep < 2 ? setState(() => _currentStep += 1) : null;
  }

  cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }
}
