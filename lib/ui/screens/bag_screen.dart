import 'package:flutter/material.dart';
import 'package:foxfund_alpha/ui/styles/spacing.dart';
import 'package:foxfund_alpha/ui/styles/styles.dart';
import 'package:foxfund_alpha/ui/widgets/custom_text_widget.dart';
import 'package:foxfund_alpha/ui/widgets/size_calculator.dart';

class BagScreen extends StatelessWidget {
  const BagScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Styles.colorPurple,
      padding: MediaQuery.of(context).viewInsets,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          //   shrinkWrap: true,
          children: <Widget>[
            Center(
              child: Container(
                padding: EdgeInsets.symmetric(
                    vertical: screenAwareSize(6, context),
                    horizontal: screenAwareSize(15, context)),
                decoration: BoxDecoration(
                    color: Styles.colorWhite,
                    borderRadius:
                        BorderRadius.circular(screenAwareSize(20, context))),
                child: CustomText(
                  'Tap on an Item for add, remove, delete options',
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Styles.colorBlack,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 4,
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: const ClampingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding:   EdgeInsets.only(top: screenAwareSize(12, context)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(
                              screenAwareSize(33, context),
                            ),
                            child: Image.asset(
                              'images/placeholder.png',
                              height: screenAwareSize(50, context),
                              width: screenAwareSize(50, context),
                            ),
                          ),
                          SizedBox(width: screenAwareSize(10, context)),
                          CustomText(
                            '1X',
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Styles.colorWhite,
                          ),
                          SizedBox(width: screenAwareSize(10, context)),
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              CustomText(
                                'Vitamin E400',
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Styles.colorWhite,
                              ),
                              CustomText(
                                'Capsule',
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Styles.colorWhite,
                              ),
                            ],
                          ))
                        ],
                      ),
                    );
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CustomText('Total',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Styles.colorWhite),
                CustomText('₦350',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Styles.colorWhite),
              ],
            ),
            SizedBox(height: screenAwareSize(20, context)),

            Center(
              child: Container(
                padding: EdgeInsets.symmetric(
                    vertical: screenAwareSize(12, context),
                    horizontal: screenAwareSize(100, context)),
                decoration: BoxDecoration(
                    color: Styles.colorWhite,
                    borderRadius:
                        BorderRadius.circular(screenAwareSize(20, context))),
                child: CustomText(
                  'Checkout',
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Styles.colorBlack,
                ),
              ),
            ),
            verticalSpaceMedium
          ],
        ),
      ),
    );
  }
}
