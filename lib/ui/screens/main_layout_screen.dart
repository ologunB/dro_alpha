import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:foxfund_alpha/ui/screens/item_detail_screen.dart';
import 'package:foxfund_alpha/ui/styles/spacing.dart';
import 'package:foxfund_alpha/ui/styles/styles.dart';
import 'package:foxfund_alpha/ui/widgets/custom_solid_bottom_sheet.dart';
import 'package:foxfund_alpha/ui/widgets/custom_text_widget.dart';
import 'package:foxfund_alpha/ui/widgets/size_calculator.dart';
import 'package:foxfund_alpha/utils/router.dart';
import 'package:foxfund_alpha/utils/util.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';

import 'bag_screen.dart';

class MainLayoutScreen extends StatefulWidget {
  const MainLayoutScreen({Key key}) : super(key: key);

  @override
  _MainLayoutScreenState createState() => _MainLayoutScreenState();
}

class _MainLayoutScreenState extends State<MainLayoutScreen> {
  final SolidController solidController = SolidController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.colorWhite,
      body: GestureDetector(
        onTap: () {
          Util.offKeyboard(context);
          solidController.hide();
        },
        child: StreamBuilder<bool>(
            stream: solidController.isOpenStream,
            initialData: false,
            builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
              return Stack(
                children: <Widget>[
                  SafeArea(
                    child: Column(
                      children: <Widget>[
                        const CustomText(
                          '125 Item(s)',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(height: screenAwareSize(8, context)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                  color: Styles.colorGreyLight,
                                  borderRadius: BorderRadius.circular(30)),
                              padding:
                                  EdgeInsets.all(screenAwareSize(8, context)),
                              child: Icon(
                                Icons.subdirectory_arrow_right_sharp,
                                color: Styles.colorGrey,
                                size: screenAwareSize(20, context),
                              ),
                            ),
                            SizedBox(width: screenAwareSize(30, context)),
                            Container(
                              decoration: BoxDecoration(
                                  color: Styles.colorGreyLight,
                                  borderRadius: BorderRadius.circular(30)),
                              padding:
                                  EdgeInsets.all(screenAwareSize(8, context)),
                              child: Icon(
                                Icons.filter_alt_outlined,
                                color: Styles.colorGrey,
                                size: screenAwareSize(20, context),
                              ),
                            ),
                            SizedBox(width: screenAwareSize(30, context)),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  toSearch = !toSearch;
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: toSearch
                                        ? Styles.colorPurple
                                        : Styles.colorGreyLight,
                                    borderRadius: BorderRadius.circular(30)),
                                padding:
                                    EdgeInsets.all(screenAwareSize(8, context)),
                                child: Icon(
                                  toSearch
                                      ? Icons.close
                                      : Icons.search_outlined,
                                  color: toSearch
                                      ? Styles.colorWhite
                                      : Styles.colorGrey,
                                  size: screenAwareSize(20, context),
                                ),
                              ),
                            ),
                          ],
                        ),
                        if (toSearch) searchBar(context),
                        Expanded(
                          child: Padding(
                            padding:
                                EdgeInsets.all(screenAwareSize(12, context)),
                            child: StaggeredGridView.count(
                                shrinkWrap: true,
                                crossAxisCount: 4,
                                children: [1, 1, 1].map<Widget>((int item) {
                                  return GestureDetector(
                                    onTap: () {
                                      moveTo(context, const ItemDetailScreen());
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(
                                          screenAwareSize(8, context)),
                                      decoration: BoxDecoration(
                                          color: Styles.colorWhite,
                                          boxShadow: <BoxShadow>[
                                            BoxShadow(
                                                color: Styles.colorGreyLight,
                                                blurRadius: 4)
                                          ],
                                          borderRadius: BorderRadius.circular(
                                            screenAwareSize(8, context),
                                          )),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Center(
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      screenAwareSize(
                                                          8, context)),
                                              child: CachedNetworkImage(
                                                  imageUrl: 'dd',
                                                  fit: BoxFit.fitWidth,
                                                  placeholder: (BuildContext
                                                              context,
                                                          String url) =>
                                                      const CircularProgressIndicator(),
                                                  errorWidget:
                                                      (BuildContext context,
                                                              String url,
                                                              dynamic error) =>
                                                          Image.asset(
                                                            'images/placeholder.png',
                                                            fit:
                                                                BoxFit.fitWidth,
                                                          )),
                                            ),
                                          ),
                                          CustomText('Paracetamol',
                                              centerText: true,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: Styles.colorBlack),
                                          CustomText('Cefurotime Axetil',
                                              centerText: true,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w600,
                                              color: Styles.colorGrey),
                                          CustomText('Oral Suspension - 125mg',
                                              centerText: true,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w600,
                                              color: Styles.colorGrey),
                                          Align(
                                            alignment: Alignment.bottomRight,
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: screenAwareSize(
                                                      4, context),
                                                  horizontal: screenAwareSize(
                                                      12, context)),
                                              decoration: BoxDecoration(
                                                  color: Styles.colorGrey,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          screenAwareSize(
                                                              16, context))),
                                              child: CustomText('₦350',
                                                  centerText: true,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                  color: Styles.colorWhite),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }).toList(),
                                staggeredTiles: [1, 1, 1]
                                    .map<StaggeredTile>(
                                        (_) => const StaggeredTile.fit(2))
                                    .toList(),
                                mainAxisSpacing: screenAwareSize(12, context),
                                crossAxisSpacing: screenAwareSize(12, context)),
                          ),
                        )
                      ],
                    ),
                  ),
                  if (snapshot.data)
                    Container(
                      height: screenHeight(context),
                      width: screenWidth(context),
                      color: Colors.black45,
                    )
                ],
              );
            }),
      ),
      bottomSheet: CustomSolidBottomSheet(
          elevation: 2,
          draggableBody: true,
          maxHeight: screenHeight(context) / 1.1,
          controller: solidController,
          //  changeBar: solidController.isOpened,
          headerBar: Container(
            height: 50,
            width: screenWidth(context),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          ),
          body: const BagScreen()),
    );
  }

  TextEditingController searchController = TextEditingController();
  bool toSearch = false;

  Widget searchBar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(screenAwareSize(8, context)),
      child: TextFormField(
        controller: searchController,
        maxLines: 1,
        cursorColor: Colors.grey,
        style: GoogleFonts.nunito(
          color: Styles.colorBlack,
          fontWeight: FontWeight.w600,
          fontSize: screenAwareSize(14, context, width: true),
        ),
        onChanged: (String a) {},
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            color: Styles.colorGrey,
            size: screenAwareSize(22, context),
          ),
          suffixIcon: Icon(
            Icons.close,
            color: Styles.colorGrey,
            size: screenAwareSize(22, context),
          ),
          contentPadding: EdgeInsets.symmetric(
              horizontal: screenAwareSize(14, context),
              vertical: screenAwareSize(8, context)),
          hintStyle: GoogleFonts.nunito(
              color: Styles.colorGrey,
              fontWeight: FontWeight.w600,
              fontSize: 14),
          hintText: 'Search...',
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Styles.colorGrey, width: 1.5),
              borderRadius:
                  BorderRadius.circular(screenAwareSize(20, context))),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Styles.colorGrey, width: 1.5),
              borderRadius:
                  BorderRadius.circular(screenAwareSize(20, context))),
          border: const OutlineInputBorder(),
          counterText: '',
        ),
      ),
    );
  }
}
