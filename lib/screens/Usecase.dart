import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rdx_app/components/LicenseOptionSheet.dart';
import 'package:rdx_app/controller/UsecaseController.dart';
import 'package:rdx_app/helper/size_helper.dart';
import 'package:sizer/sizer.dart';
import 'package:rdx_app/helper/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class Usecase extends StatelessWidget {
  final UsecaseController _usecaseController = Get.put(UsecaseController());
  // const Usecase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10, left: 15),
                  height: 100,
                  child: Row(
                    children: [
                      Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                //NETWORK IMAGE WHEN API IS HANDLED
                                image: AssetImage('assets/6.jpg')),
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                            // borderRadius: BorderRadius.circular(6.0),
                            color: Color(0xFFF8F8F8),
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Fire Detection",
                                style: GoogleFonts.roboto(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Text(
                                "Fire, Detection, Safety, Alarm",
                                style: GoogleFonts.roboto(
                                  fontSize: 12,
                                  color: Color(0xFF26AAA6),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          MaterialButton(
                              color: kButtonColor,
                              splashColor: Colors.white,
                              height: 26,
                              minWidth: 70,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Text(
                                "Get",
                                style: GoogleFonts.roboto(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              onPressed: () {
                                _showMyBottomSheet();
                              })
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(top: 40, bottom: 30),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        color: kBackgroundColor2,
                        padding: const EdgeInsets.fromLTRB(10, 7, 10, 7),
                        child: Row(
                          children: <Widget>[
                            Column(
                              children: [
                                Text(
                                  "4215",
                                  style: GoogleFonts.roboto(
                                    fontSize: 14,
                                    color: Color(0xFF242414),
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  "Total Downloads",
                                  style: GoogleFonts.roboto(
                                    fontSize: 14,
                                    color: Color(0xFF242414),
                                    fontWeight: FontWeight.w300,
                                  ),
                                )
                              ],
                            ),
                            _divider(),
                            Column(
                              children: [
                                Text(
                                  "Dipesh Adekar",
                                  style: GoogleFonts.roboto(
                                    fontSize: 14,
                                    color: Color(0xFF26AAA6),
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  "Developer",
                                  style: GoogleFonts.roboto(
                                    fontSize: 14,
                                    color: Color(0xFF26AAA6),
                                    fontWeight: FontWeight.w300,
                                  ),
                                )
                              ],
                            ),
                            _divider(),
                            Column(
                              children: [
                                Text(
                                  "87 MB",
                                  style: GoogleFonts.roboto(
                                    fontSize: 14,
                                    color: Color(0xFFF13B2E),
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  "Size",
                                  style: GoogleFonts.roboto(
                                    fontSize: 14,
                                    color: Color(0xFFF13B2E),
                                    fontWeight: FontWeight.w300,
                                  ),
                                )
                              ],
                            ),
                            _divider(),
                            Column(
                              children: [
                                Image.asset('assets/star.png'),
                                SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  "Rating",
                                  style: GoogleFonts.roboto(
                                    fontSize: 14,
                                    color: kTextColor2,
                                    fontWeight: FontWeight.w300,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    )),
                // Container(
                //   height: 2,
                //   width: displayWidth(context),
                //   color: Colors.grey,
                //   margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
                // ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text(
                    "Preview",
                    style: GoogleFonts.roboto(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(top: 15, bottom: 35),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        // color: kBackgroundColor2,
                        padding: const EdgeInsets.fromLTRB(10, 7, 10, 7),
                        child: Row(
                          children: <Widget>[
                            for (var item in _usecaseController.slider)
                              Container(
                                margin: EdgeInsets.only(right: 10),
                                child: FadeInImage.assetNetwork(
                                  width: 150,
                                  height: 250,
                                  fit: BoxFit.cover,
                                  placeholder: 'assets/loading.gif',
                                  placeholderCacheHeight: 150,
                                  placeholderCacheWidth: 250,
                                  placeholderScale: 2.5,
                                  image: item,
                                ),
                              ),
                          ],
                        ),
                      ),
                    )),
                Container(
                  height: 2,
                  width: displayWidth(context),
                  color: Colors.grey,
                  margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text(
                    "About Use Case",
                    style: GoogleFonts.roboto(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: ExpandableText(
                    'Flutter is Google’s mobile UI framework for crafting high-quality native interfaces on iOS and Android in record time. Flutter works with existing code, is used by developers and organizations around the world, and is free and open source. Flutter is Google’s mobile UI framework for crafting high-quality native interfaces on iOS and Android in record time. Flutter works with existing code, is used by developers and organizations around the world, and is free and open source.',
                    trimLines: 4,
                  ),
                ),
                Container(
                  height: 2,
                  width: displayWidth(context),
                  color: Colors.grey,
                  margin:
                      EdgeInsets.only(left: 15, right: 15, bottom: 15, top: 20),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _divider() {
    return Container(
      height: 25,
      width: 2,
      color: Colors.grey,
      margin: EdgeInsets.only(left: 25, right: 25),
    );
  }

  void _showMyBottomSheet() {
    Get.bottomSheet(LicenseOptionSheet());
  }
}

class ExpandableText extends StatefulWidget {
  const ExpandableText(
    this.text, {
    Key? key,
    this.trimLines = 2,
  }) : super(key: key);

  final String text;
  final int trimLines;

  @override
  ExpandableTextState createState() => ExpandableTextState();
}

class ExpandableTextState extends State<ExpandableText> {
  bool _readMore = true;
  void _onTapLink() {
    setState(() => _readMore = !_readMore);
  }

  @override
  Widget build(BuildContext context) {
    final DefaultTextStyle defaultTextStyle = DefaultTextStyle.of(context);
    final colorClickableText = Colors.blue;
    final widgetColor = Colors.black;
    TextSpan link = TextSpan(
        text: _readMore ? "...more" : " less",
        style: GoogleFonts.roboto(
          fontSize: 14,
          color: kBackgroundColor3,
          fontWeight: FontWeight.w400,
        ),
        recognizer: TapGestureRecognizer()..onTap = _onTapLink);
    Widget result = LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        assert(constraints.hasBoundedWidth);
        final double maxWidth = constraints.maxWidth;
        // Create a TextSpan with data
        final text = TextSpan(
          text: widget.text,
        );
        // Layout and measure link
        TextPainter textPainter = TextPainter(
          text: link,
          textDirection: TextDirection
              .rtl, //better to pass this from master widget if ltr and rtl both supported
          maxLines: widget.trimLines,
          ellipsis: '...',
        );
        textPainter.layout(minWidth: constraints.minWidth, maxWidth: maxWidth);
        final linkSize = textPainter.size;
        // Layout and measure text
        textPainter.text = text;
        textPainter.layout(minWidth: constraints.minWidth, maxWidth: maxWidth);
        final textSize = textPainter.size;
        // Get the endIndex of data
        int endIndex;
        final pos = textPainter.getPositionForOffset(Offset(
          textSize.width - linkSize.width,
          textSize.height,
        ));
        endIndex = textPainter.getOffsetBefore(pos.offset)!;
        var textSpan;
        if (textPainter.didExceedMaxLines) {
          textSpan = TextSpan(
            text: _readMore ? widget.text.substring(0, endIndex) : widget.text,
            style: GoogleFonts.roboto(
              fontSize: 12,
              color: kButtonColor,
              fontWeight: FontWeight.w400,
            ),
            children: <TextSpan>[link],
          );
        } else {
          textSpan = TextSpan(
            text: widget.text,
          );
        }
        return RichText(
          softWrap: true,
          overflow: TextOverflow.clip,
          text: textSpan,
        );
      },
    );
    return result;
  }
}
