import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xizmat_uz/ui/constants.dart';

class PaymentSelected extends StatelessWidget {
  ValueChanged valueChanged;
   PaymentSelected({Key? key,required this.valueChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PayemtController>(
        init: PayemtController(),
        builder: (type) {
          valueChanged(getType(type.paymentType));
          return Container(
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: GestureDetector(
                      onTap: (){
                        type.change(PymentType.CLICK);
                      },
                      child: Container(
                        height: 50,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: (type.paymentType==PymentType.CLICK)?Border.all(color: appColor):null,
                        ),
                        child: Image.asset("assets/images/click.png"),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: GestureDetector(
                      onTap: (){
                        type.change(PymentType.PAYME);
                      },
                      child: Container(
                        height: 50,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: (type.paymentType==PymentType.PAYME)?Border.all(color: appColor):null,
                            image: DecorationImage(
                                image: AssetImage(
                                  "assets/images/payme.png",
                                ),
                                fit: BoxFit.contain)),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: GestureDetector(
                      onTap: (){
                        type.change(PymentType.OSON);
                      },
                      child: Container(
                        height: 50,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: (type.paymentType==PymentType.OSON)?Border.all(color: appColor):null,
                            image: DecorationImage(
                                image: AssetImage(
                                  "assets/images/oson.png",
                                ),
                                fit: BoxFit.contain)),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: GestureDetector(
                      onTap: (){
                        type.change(PymentType.UPAY);
                      },
                      child: Container(
                        height: 50,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: (type.paymentType==PymentType.UPAY)?Border.all(color: appColor):null,
                            image: DecorationImage(
                                image: AssetImage(
                                  "assets/images/upay.png",
                                ),
                                fit: BoxFit.contain)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  int getType(PymentType type) {
    PymentType type = PymentType.CLICK;
    switch (type) {
      case PymentType.CLICK:
        return 0;
      case PymentType.PAYME:
        return 1;
      case PymentType.UPAY:
        return 2;
      case PymentType.OSON:
        return 3;
    }
  }
}

enum PymentType { CLICK, PAYME, OSON, UPAY }

class PayemtController extends GetxController {
  PymentType paymentType = PymentType.CLICK;

  change(type) {
    paymentType = type;
    update();
  }
}
