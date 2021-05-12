import 'package:flutter/material.dart';
import 'package:foxfund_alpha/core/model/item.dart';
import 'package:foxfund_alpha/core/storage/local_storage.dart';
import 'package:foxfund_alpha/ui/styles/spacing.dart';
import 'package:foxfund_alpha/ui/styles/styles.dart';
import 'package:foxfund_alpha/ui/widgets/custom_text_widget.dart';
import 'package:foxfund_alpha/ui/widgets/size_calculator.dart';
import 'package:foxfund_alpha/ui/widgets/snackbar.dart';

import '../../main.dart';

class BagScreen extends StatefulWidget {
  const BagScreen({Key key, this.fromCart = false}) : super(key: key);
  final bool fromCart;

  @override
  _BagScreenState createState() => _BagScreenState();
}

class _BagScreenState extends State<BagScreen> {
  List<ItemModel> allCartItems = <ItemModel>[];
  List<int> counts = <int>[];

  int totalAmount = 0;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<dynamic>>(
        valueListenable: allCartItemsListener,
        builder: (_, List<dynamic> value, __) {
          allCartItems.clear();
          counts.clear();
          totalAmount = 0;
          for (final dynamic val in value) {
            final ItemModel model = ItemModel.fromJson(val['product']);
            final int eachCount = val['count'] as int;
            allCartItems.add(model);
            counts.add(eachCount);
            totalAmount = totalAmount + (int.parse(model.price) * eachCount);
          }

          return Scaffold(
              appBar: widget.fromCart
                  ? AppBar(
                      iconTheme: IconThemeData(color: Styles.colorWhite),
                      elevation: 0,
                      centerTitle: true,
                      backgroundColor: Styles.colorPurple,
                      title: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(
                            Icons.shopping_bag_outlined,
                            color: Styles.colorWhite,
                            size: screenAwareSize(24, context),
                          ),
                          CustomText(
                            'Bag',
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Styles.colorWhite,
                            leftMargin: 8,
                          )
                        ],
                      ),
                      actions: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                width: screenAwareSize(40, context),
                                height: screenAwareSize(40, context),
                                decoration: BoxDecoration(
                                    color: Styles.colorWhite,
                                    borderRadius: BorderRadius.circular(30)),
                                child: Center(
                                    child: CustomText(
                                  value.length.toString(),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ))),
                          ],
                        ),
                        horizontalSpaceSmall
                      ],
                    )
                  : null,
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
                                borderRadius: BorderRadius.circular(
                                    screenAwareSize(20, context))),
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
                        child: allCartItems.isEmpty
                            ? Center(
                                child: CustomText(
                                  'Bag is Empty!',
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Styles.colorWhite,
                                ),
                              )
                            : ListView.builder(
                                itemCount: allCartItems.length,
                                shrinkWrap: true,
                                padding: EdgeInsets.zero,
                                physics: const ClampingScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  return bagItem(index);
                                }),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          CustomText('Total',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Styles.colorWhite),
                          CustomText('₦$totalAmount',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Styles.colorWhite),
                        ],
                      ),
                      SizedBox(height: screenAwareSize(20, context)),
                      InkWell(
                        onTap: () {
                          showSnackBar(context, 'Alert', 'Proceed to Checkout');
                        },
                        child: Center(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: screenAwareSize(12, context),
                                horizontal: screenAwareSize(100, context)),
                            decoration: BoxDecoration(
                                color: Styles.colorWhite,
                                borderRadius: BorderRadius.circular(
                                    screenAwareSize(20, context))),
                            child: CustomText(
                              'Checkout',
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Styles.colorBlack,
                            ),
                          ),
                        ),
                      ),
                      verticalSpaceMedium
                    ],
                  ),
                ),
              ));
        });
  }

  int selectedIndex;

  Widget bagItem(int index) {
    return InkWell(
      onTap: () {
        if (selectedIndex == index) {
          selectedIndex = null;
        } else {
          selectedIndex = index;
        }
        setState(() {});
      },
      child: Padding(
          padding: EdgeInsets.only(top: screenAwareSize(12, context)),
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
                      allCartItems[index].image,
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      CustomText(
                        allCartItems[index].name,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Styles.colorWhite,
                      ),
                      CustomText(
                        allCartItems[index].body,
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        totalAmount = totalAmount -
                            (int.parse(allCartItems[index].price) *
                                counts[index]);
                        allCartItemsListener.value.remove(index);

                        AppCache.removeOne(allCartItems[index].id);
                        allCartItems.removeAt(index);
                        counts.removeAt(index);
                        selectedIndex = null;
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
                            if (counts[index] < 10 && counts[index] > 1) {
                              counts[index]--;
                              totalAmount = totalAmount -
                                  int.parse(allCartItems[index].price);
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
                            if (counts[index] < 9 && counts[index] > 0) {
                              counts[index]++;
                              totalAmount = totalAmount +
                                  int.parse(allCartItems[index].price);
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
  }
}
