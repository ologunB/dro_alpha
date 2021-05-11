import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foxfund_alpha/ui/styles/spacing.dart';
import 'package:foxfund_alpha/ui/styles/styles.dart';
import 'package:foxfund_alpha/ui/widgets/custom_button.dart';
import 'package:foxfund_alpha/ui/widgets/custom_text_widget.dart';
import 'package:foxfund_alpha/ui/widgets/size_calculator.dart';

class ItemDetailScreen extends StatefulWidget {
  const ItemDetailScreen({Key key}) : super(key: key);

  @override
  _ItemDetailScreenState createState() => _ItemDetailScreenState();
}

class _ItemDetailScreenState extends State<ItemDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.colorWhite,
      appBar: AppBar(
        elevation: 0,
        actions: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  padding: EdgeInsets.symmetric(
                      vertical: screenAwareSize(5, context),
                      horizontal: screenAwareSize(8, context)),
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(screenAwareSize(8, context)),
                      color: Styles.colorPurpleLight),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.shopping_bag_outlined,
                        color: Styles.colorWhite,
                        size: screenAwareSize(22, context),
                      ),
                      CustomText(
                        '3',
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Styles.colorWhite,
                        leftMargin: 8,
                      )
                    ],
                  )),
            ],
          ),
          horizontalSpaceSmall
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(screenAwareSize(20, context)),
        child: ListView(
          children: <Widget>[
            CachedNetworkImage(
                imageUrl: 'dd',
                fit: BoxFit.fitWidth,
                placeholder: (BuildContext context, String url) =>
                    const CircularProgressIndicator(),
                errorWidget:
                    (BuildContext context, String url, dynamic error) =>
                        Image.asset(
                          'images/placeholder.png',
                          height: screenAwareSize(200, context),
                          //  fit: BoxFit.fitWidth,
                        )),
            SizedBox(height: screenAwareSize(15, context)),
            const CustomText(
              'Garlic Oil',
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            const CustomText(
              'Soft Gel - 650mg',
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: screenAwareSize(20, context)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(
                    screenAwareSize(33, context),
                  ),
                  child: Image.asset(
                    'images/placeholder.png',
                    height: screenAwareSize(40, context),
                    width: screenAwareSize(40, context),
                  ),
                ),
                SizedBox(width: screenAwareSize(10, context)),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const CustomText(
                      'SOLD BY',
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                    CustomText(
                      'Emzor Pharmaceuticals',
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Styles.colorPurple,
                    ),
                  ],
                ))
              ],
            ),
            SizedBox(height: screenAwareSize(20, context)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: screenAwareSize(4, context),
                          horizontal: screenAwareSize(12, context)),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              screenAwareSize(8, context)),
                          color: Styles.colorWhite,
                          border: Border.all(color: Styles.colorGreyLight)),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(
                            Icons.remove,
                            size: screenAwareSize(20, context),
                            color: Styles.colorBlack,
                          ),
                          CustomText(
                            '1',
                            leftMargin: 10,
                            rightMargin: 10,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Styles.colorBlack,
                          ),
                          Icon(
                            Icons.add,
                            size: screenAwareSize(20, context),
                            color: Styles.colorBlack,
                          ),
                        ],
                      ),
                    ),
                    CustomText(
                      'Pack(s)',
                      leftMargin: 8,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Styles.colorGrey,
                    ),
                  ],
                ),
                CustomText(
                  '₦350',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Styles.colorBlack,
                ),
              ],
            ),
            SizedBox(height: screenAwareSize(20, context)),
            CustomText(
              'PRODUCT DETAILS',
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: Styles.colorGrey,
            ),
            Row(
              children: <Widget>[
                detailsItem(context, Icons.ac_unit, 'PACK SIZE', '3x10'),
                detailsItem(context, Icons.pest_control_rodent_outlined,
                    'PRODUCT OF', 'PROBRYVPW1')
              ],
            ),
            SizedBox(height: screenAwareSize(10, context)),
            Row(
              children: <Widget>[
                detailsItem(context, Icons.construction_sharp, 'CONSTITUENTS',
                    'Garlic Oil'),
                detailsItem(
                    context, Icons.backpack_outlined, 'DISPENSED IN', 'Packs')
              ],
            ),
            Center(
              child: CustomText(
                '1 pack of Garlic oil contains 3 unit(s) of 10 Tablet(s)',
                fontSize: 12,
                topMargin: 30,
                bottomMargin: 30,
                fontWeight: FontWeight.w600,
                color: Styles.colorGreyLight,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(screenAwareSize(20, context)),
              child: CustomButton(
                title: 'Add to bag',
                hasIcon: true,
                height: screenAwareSize(45, context),
                buttonColor: Styles.colorPurpleLight,
                onPressed: () {
                  doneDialog(context);
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget detailsItem(
      BuildContext context, IconData icon, String title, String subtitle) {
    return Expanded(
      child: Row(
        children: <Widget>[
          Icon(
            icon,
            color: Styles.colorPurpleLight,
          ),
          horizontalSpaceSmall,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CustomText(
                title,
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: Styles.colorGrey,
              ),
              Center(
                child: CustomText(
                  subtitle,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: Styles.colorBlack,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  void doneDialog(BuildContext context) {
    showDialog<AlertDialog>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            CustomText('Successful',
                fontSize: 16,
                bottomMargin: 10,
                color: Styles.colorBlack,
                fontWeight: FontWeight.bold),
            CustomText('Garlic Oil has been added to your bag',
                fontSize: 16,
                centerText: true,
                color: Styles.colorBlack,
                bottomMargin: 10,
                fontWeight: FontWeight.w600),
            CustomButton(
                title: 'View Bag',
                onPressed: () {},
                height: 50,
                buttonColor: Colors.cyan),
            verticalSpaceMedium,
            CustomButton(
                title: 'Done',
                onPressed: () {},
                height: 50,
                buttonColor: Colors.cyan),
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
