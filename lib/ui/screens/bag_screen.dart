import 'package:flutter/material.dart';
import 'package:foxfund_alpha/core/model/item.dart';
import 'package:foxfund_alpha/core/storage/local_storage.dart';
import 'package:foxfund_alpha/ui/styles/spacing.dart';
import 'package:foxfund_alpha/ui/styles/styles.dart';
import 'package:foxfund_alpha/ui/widgets/custom_text_widget.dart';
import 'package:foxfund_alpha/ui/widgets/size_calculator.dart';

class BagScreen extends StatefulWidget {
  const BagScreen({Key key}) : super(key: key);

  @override
  _BagScreenState createState() => _BagScreenState();
}

class _BagScreenState extends State<BagScreen> {
  List<ItemModel> allItems = <ItemModel>[];
  List<int> counts = <int>[];

  @override
  void initState() {
    getItems();
    super.initState();
  }

  void getItems() {
    for (final dynamic val in AppCache.getSavedData()) {
      allItems.add(ItemModel.fromJson(val['product']));
      counts.add(val['count'] as int);
    }
  }

  int totalAmount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Styles.colorPurple,
      padding: MediaQuery.of(context).viewInsets,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: <Widget>[
            SafeArea(
              child: Center(
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
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: allItems.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: const ClampingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        if (selectedIndex == index) {
                          selectedIndex = null;
                        } else {
                          selectedIndex = index;
                        }
                        setState(() {});
                      },
                      child: Padding(
                          padding: EdgeInsets.only(
                              top: screenAwareSize(12, context)),
                          child: Column(
                            children: <Widget>[
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                      screenAwareSize(33, context),
                                    ),
                                    child: Image.asset(
                                      allItems[index].image,
                                      height: screenAwareSize(50, context),
                                      width: screenAwareSize(50, context),
                                    ),
                                  ),
                                  SizedBox(width: screenAwareSize(10, context)),
                                  CustomText(
                                    '${counts[index]}X',
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Styles.colorWhite,
                                  ),
                                  SizedBox(width: screenAwareSize(10, context)),
                                  Expanded(
                                      child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      CustomText(
                                        allItems[index].name,
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: Styles.colorWhite,
                                      ),
                                      CustomText(
                                        allItems[index].body,
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: Styles.colorWhite,
                                      ),
                                    ],
                                  ))
                                ],
                              ),
                              if (selectedIndex == index)
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    InkWell(
                                      onTap: () {
                                        allItems.removeAt(index);
                                        counts.removeAt(index);
                                        setState(() {});
                                      },
                                      child: Icon(
                                        Icons.delete_outline,
                                        size: screenAwareSize(26, context),
                                        color: Styles.colorWhite,
                                      ),
                                    ),
                                    Row(
                                      children: <Widget>[
                                        InkWell(
                                          onTap: () {
                                            if (counts[index] < 10 &&
                                                counts[index] > 1) {
                                              counts[index]--;
                                            }
                                            setState(() {});
                                          },
                                          child: Icon(
                                            Icons.remove_circle,
                                            size: screenAwareSize(24, context),
                                            color: Styles.colorWhite,
                                          ),
                                        ),
                                        CustomText(
                                          counts[index].toString(),
                                          leftMargin: 10,
                                          rightMargin: 10,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Styles.colorWhite,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            if (counts[index] < 9 &&
                                                counts[index] > 0) {
                                              counts[index]++;
                                            }
                                            setState(() {});
                                          },
                                          child: Icon(
                                            Icons.add_circle,
                                            size: screenAwareSize(24, context),
                                            color: Styles.colorWhite,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                            ],
                          )),
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
    ));
  }

  int selectedIndex;
}
