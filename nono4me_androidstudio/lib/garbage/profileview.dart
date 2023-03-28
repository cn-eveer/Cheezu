import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:nono4me_androidstudio/garbage/utils.dart';

class Scene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 393;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: Container(
        // profileviewBse (82:5866)
        padding: EdgeInsets.fromLTRB(1 * fem, 0 * fem, 0 * fem, 0 * fem),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xfff5f5f5),
          boxShadow: [
            BoxShadow(
              color: Color(0x4c000000),
              offset: Offset(0 * fem, -2 * fem),
              blurRadius: 2 * fem,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // statusbar8wJ (82:5868)
              margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 10 * fem),
              padding:
                  EdgeInsets.fromLTRB(27 * fem, 0 * fem, 26.6 * fem, 0 * fem),
              width: double.infinity,
              height: 47 * fem,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // leftsidet3J (I82:5868;839:7139)
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 14 * fem, 37 * fem, 10 * fem),
                    width: 54 * fem,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24 * fem),
                    ),
                    child: Container(
                      // statusbartimek5W (I82:5868;839:7140)
                      padding: EdgeInsets.fromLTRB(
                          12 * fem, 1 * fem, 12 * fem, 0 * fem),
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24 * fem),
                      ),
                      child: Text(
                        '9:41',
                        textAlign: TextAlign.center,
                        style: SafeGoogleFont(
                          'SF Pro Text',
                          fontSize: 17 * ffem,
                          fontWeight: FontWeight.w600,
                          height: 1.2941176471 * ffem / fem,
                          letterSpacing: -0.4079999924 * fem,
                          color: Color(0xff000000),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    // notchv8Q (I82:5868;839:7137)
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 14 * fem, 16 * fem),
                    width: 156 * fem,
                    height: 33 * fem,
                    child: Image.asset(
                      'assets/templates-user-without-breaking-news-chat-with-nono/images/notch-JuW.png',
                      width: 156 * fem,
                      height: 33 * fem,
                    ),
                  ),
                  Container(
                    // rightsideYfa (I82:5868;839:7141)
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 19 * fem, 0 * fem, 15 * fem),
                    height: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          // iconmobilesignal1p4 (I82:5868;839:7150)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 8 * fem, 0 * fem),
                          width: 18 * fem,
                          height: 12 * fem,
                          child: Image.asset(
                            'assets/templates-user-without-breaking-news-chat-with-nono/images/icon-mobile-signal-NXa.png',
                            width: 18 * fem,
                            height: 12 * fem,
                          ),
                        ),
                        Container(
                          // wifiUSk (I82:5868;839:7146)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 7 * fem, 0.17 * fem),
                          width: 17 * fem,
                          height: 11.83 * fem,
                          child: Image.asset(
                            'assets/templates-user-without-breaking-news-chat-with-nono/images/wifi-sn8.png',
                            width: 17 * fem,
                            height: 11.83 * fem,
                          ),
                        ),
                        Container(
                          // statusbarbatteryWPS (I82:5868;1015:6223)
                          width: 27.4 * fem,
                          height: 13 * fem,
                          child: Image.asset(
                            'assets/templates-user-without-breaking-news-chat-with-nono/images/statusbar-battery-B7N.png',
                            width: 27.4 * fem,
                            height: 13 * fem,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // rightaccessoryPi8 (82:5880)
              margin:
                  EdgeInsets.fromLTRB(258 * fem, 0 * fem, 0 * fem, 7.5 * fem),
              padding: EdgeInsets.fromLTRB(78 * fem, 0 * fem, 0 * fem, 0 * fem),
              width: 108 * fem,
              height: 24.5 * fem,
              child: Container(
                // autogroup63apTT6 (Xqzdk8vreur4wYL5TB63Ap)
                width: double.infinity,
                height: double.infinity,
                child: Text(
                  'Edit',
                  textAlign: TextAlign.right,
                  style: SafeGoogleFont(
                    'SF Pro Text',
                    fontSize: 17 * ffem,
                    fontWeight: FontWeight.w400,
                    height: 1.2941176471 * ffem / fem,
                    letterSpacing: -0.4079999924 * fem,
                    color: Color(0xff007aff),
                  ),
                ),
              ),
            ),
            Container(
              // largetitle4St (82:5876)
              margin:
                  EdgeInsets.fromLTRB(0 * fem, 0 * fem, 230 * fem, 20 * fem),
              child: Text(
                'Profile',
                style: SafeGoogleFont(
                  'SF Pro Display',
                  fontSize: 34 * ffem,
                  fontWeight: FontWeight.w700,
                  height: 1.2058823529 * ffem / fem,
                  letterSpacing: 0.3740000129 * fem,
                  color: Color(0xff000000),
                ),
              ),
            ),
            Container(
              // autogroupphdaJc8 (XqzcNG4HWqrQwcoh8NPHda)
              margin:
                  EdgeInsets.fromLTRB(56 * fem, 0 * fem, 43 * fem, 20 * fem),
              padding:
                  EdgeInsets.fromLTRB(78 * fem, 0 * fem, 80 * fem, 0 * fem),
              width: double.infinity,
              child: Center(
                // ellipse31yCU (82:5895)
                child: SizedBox(
                  width: double.infinity,
                  height: 135 * fem,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(67.5 * fem),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          'assets/templates-user-without-breaking-news-chat-with-nono/images/ellipse-31-bg-v16.png',
                        ),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x3f000000),
                          offset: Offset(0 * fem, 3 * fem),
                          blurRadius: 3 * fem,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              // tableviewXNQ (82:5892)
              margin:
                  EdgeInsets.fromLTRB(15 * fem, 0 * fem, 19 * fem, 34 * fem),
              width: double.infinity,
              height: 176 * fem,
              child: Container(
                // autogroupj5tcpsJ (XqzdzYgWkJHAaxs2AJj5tC)
                width: double.infinity,
                height: double.infinity,
                child: Container(
                  // tableviewcellsY2c (I82:5892;151:5292)
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14 * fem),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        // tableviewcellQqW (I82:5892;1147:11413)
                        left: 0 * fem,
                        top: 0 * fem,
                        child: Container(
                          padding: EdgeInsets.fromLTRB(
                              16 * fem, 0 * fem, 0 * fem, 0 * fem),
                          width: 404 * fem,
                          height: 132 * fem,
                          decoration: BoxDecoration(
                            color: Color(0xfff5f5f5),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                // iconMuA (I82:5892;1147:11413;1147:10433)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 7 * fem, 16 * fem, 0 * fem),
                                width: 30 * fem,
                                height: 30 * fem,
                                decoration: BoxDecoration(
                                  color: Color(0xffff9500),
                                  borderRadius: BorderRadius.circular(7 * fem),
                                ),
                                child: Center(
                                  child: Text(
                                    '􀑓',
                                    textAlign: TextAlign.center,
                                    style: SafeGoogleFont(
                                      'SF Pro Text',
                                      fontSize: 17 * ffem,
                                      fontWeight: FontWeight.w400,
                                      height: 1.2941176471 * ffem / fem,
                                      letterSpacing: -0.4079999924 * fem,
                                      color: Color(0xffffffff),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                // contentFNG (I82:5892;1147:11413;1147:10431)
                                padding: EdgeInsets.fromLTRB(
                                    0 * fem, 6.5 * fem, 0 * fem, 6.5 * fem),
                                width: 342 * fem,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Color(0x5b3c3c43)),
                                ),
                                child: Container(
                                  // innercontentLPi (I82:5892;1147:11413;1147:10432)
                                  width: 280 * fem,
                                  height: 31 * fem,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        // labelzz4 (I82:5892;1147:11413;1147:10437)
                                        margin: EdgeInsets.fromLTRB(0 * fem,
                                            0 * fem, 135 * fem, 0 * fem),
                                        child: Text(
                                          'Color Scheme',
                                          style: SafeGoogleFont(
                                            'SF Pro Text',
                                            fontSize: 17 * ffem,
                                            fontWeight: FontWeight.w400,
                                            height: 1.2941176471 * ffem / fem,
                                            letterSpacing: -0.4079999924 * fem,
                                            color: Color(0xff000000),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        // rightcontent3xL (I82:5892;1147:11413;1147:10438)
                                        width: 51 * fem,
                                        height: 31 * fem,
                                        child: Image.asset(
                                          'assets/templates-user-without-breaking-news-chat-with-nono/images/right-content-htL.png',
                                          width: 51 * fem,
                                          height: 31 * fem,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        // tableviewcellvFS (I82:5892;1147:11414)
                        left: 0 * fem,
                        top: 44 * fem,
                        child: Container(
                          padding: EdgeInsets.fromLTRB(
                              16 * fem, 0 * fem, 0 * fem, 0 * fem),
                          width: 404 * fem,
                          height: 132 * fem,
                          decoration: BoxDecoration(
                            color: Color(0xfff5f5f5),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                // iconXm2 (I82:5892;1147:11414;1147:10473)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 7 * fem, 16 * fem, 0 * fem),
                                width: 30 * fem,
                                height: 30 * fem,
                                decoration: BoxDecoration(
                                  color: Color(0xff007aff),
                                  borderRadius: BorderRadius.circular(7 * fem),
                                ),
                                child: Center(
                                  child: Text(
                                    '􀙇',
                                    textAlign: TextAlign.center,
                                    style: SafeGoogleFont(
                                      'SF Pro Text',
                                      fontSize: 17 * ffem,
                                      fontWeight: FontWeight.w400,
                                      height: 1.2941176471 * ffem / fem,
                                      letterSpacing: -0.4079999924 * fem,
                                      color: Color(0xffffffff),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                // contentsTW (I82:5892;1147:11414;1147:10471)
                                padding: EdgeInsets.fromLTRB(
                                    0 * fem, 11 * fem, 0 * fem, 11 * fem),
                                width: 342 * fem,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Color(0x5b3c3c43)),
                                ),
                                child: Container(
                                  // innercontentMNg (I82:5892;1147:11414;1147:10472)
                                  width: 280 * fem,
                                  height: 22 * fem,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        // labelcpQ (I82:5892;1147:11414;1147:10477)
                                        margin: EdgeInsets.fromLTRB(0 * fem,
                                            0 * fem, 103.84 * fem, 0 * fem),
                                        child: Text(
                                          'Emergency Contact',
                                          style: SafeGoogleFont(
                                            'SF Pro Text',
                                            fontSize: 17 * ffem,
                                            fontWeight: FontWeight.w400,
                                            height: 1.2941176471 * ffem / fem,
                                            letterSpacing: -0.4079999924 * fem,
                                            color: Color(0xff000000),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        // rightcontentfGt (I82:5892;1147:11414;1147:10478)
                                        height: double.infinity,
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              // labelBW8 (I82:5892;1147:11414;1147:10482)
                                              margin: EdgeInsets.fromLTRB(
                                                  0 * fem,
                                                  0 * fem,
                                                  17 * fem,
                                                  0 * fem),
                                              child: Text(
                                                'Off',
                                                style: SafeGoogleFont(
                                                  'SF Pro Text',
                                                  fontSize: 17 * ffem,
                                                  fontWeight: FontWeight.w400,
                                                  height:
                                                      1.2941176471 * ffem / fem,
                                                  letterSpacing:
                                                      -0.4079999924 * fem,
                                                  color: Color(0x993c3c43),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              // sfsymbolchevronrightzyN (I82:5892;1147:11414;1310:20984)
                                              width: 7.16 * fem,
                                              height: 12.3 * fem,
                                              child: Image.asset(
                                                'assets/templates-user-without-breaking-news-chat-with-nono/images/sf-symbol-chevronright-hGU.png',
                                                width: 7.16 * fem,
                                                height: 12.3 * fem,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        // tableviewcellUtY (I82:5892;1147:11415)
                        left: 0 * fem,
                        top: 88 * fem,
                        child: Container(
                          padding: EdgeInsets.fromLTRB(
                              16 * fem, 0 * fem, 0 * fem, 0 * fem),
                          width: 404 * fem,
                          height: 132 * fem,
                          decoration: BoxDecoration(
                            color: Color(0xfff5f5f5),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                // iconWaL (I82:5892;1147:11415;1147:10473)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 7 * fem, 16 * fem, 0 * fem),
                                width: 30 * fem,
                                height: 30 * fem,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7 * fem),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                      'assets/templates-user-without-breaking-news-chat-with-nono/images/icon-bg-EWk.png',
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                // contentWTr (I82:5892;1147:11415;1147:10471)
                                padding: EdgeInsets.fromLTRB(
                                    0 * fem, 11 * fem, 0 * fem, 11 * fem),
                                width: 342 * fem,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Color(0x5b3c3c43)),
                                ),
                                child: Container(
                                  // innercontentnAU (I82:5892;1147:11415;1147:10472)
                                  width: 280 * fem,
                                  height: 22 * fem,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        // labelRz8 (I82:5892;1147:11415;1147:10477)
                                        margin: EdgeInsets.fromLTRB(0 * fem,
                                            0 * fem, 192.84 * fem, 0 * fem),
                                        child: Text(
                                          'Family',
                                          style: SafeGoogleFont(
                                            'SF Pro Text',
                                            fontSize: 17 * ffem,
                                            fontWeight: FontWeight.w400,
                                            height: 1.2941176471 * ffem / fem,
                                            letterSpacing: -0.4079999924 * fem,
                                            color: Color(0xff000000),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        // rightcontentGE4 (I82:5892;1147:11415;1147:10478)
                                        height: double.infinity,
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              // labelbGL (I82:5892;1147:11415;1147:10482)
                                              margin: EdgeInsets.fromLTRB(
                                                  0 * fem,
                                                  0 * fem,
                                                  15 * fem,
                                                  0 * fem),
                                              child: Text(
                                                'On',
                                                style: SafeGoogleFont(
                                                  'SF Pro Text',
                                                  fontSize: 17 * ffem,
                                                  fontWeight: FontWeight.w400,
                                                  height:
                                                      1.2941176471 * ffem / fem,
                                                  letterSpacing:
                                                      -0.4079999924 * fem,
                                                  color: Color(0x993c3c43),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              // sfsymbolchevronright4fi (I82:5892;1147:11415;1310:20984)
                                              width: 7.16 * fem,
                                              height: 12.3 * fem,
                                              child: Image.asset(
                                                'assets/templates-user-without-breaking-news-chat-with-nono/images/sf-symbol-chevronright-BBn.png',
                                                width: 7.16 * fem,
                                                height: 12.3 * fem,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        // tableviewcelllastk2k (I82:5892;1147:11418)
                        left: 0 * fem,
                        top: 132 * fem,
                        child: Container(
                          padding: EdgeInsets.fromLTRB(
                              16 * fem, 0 * fem, 0 * fem, 0 * fem),
                          width: 404 * fem,
                          height: 132 * fem,
                          decoration: BoxDecoration(
                            color: Color(0xfff5f5f5),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                // iconYjJ (I82:5892;1147:11418;1147:10473)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 7 * fem, 16 * fem, 0 * fem),
                                width: 30 * fem,
                                height: 30 * fem,
                                decoration: BoxDecoration(
                                  color: Color(0xff34c759),
                                  borderRadius: BorderRadius.circular(7 * fem),
                                ),
                                child: Center(
                                  child: Text(
                                    '􀖀',
                                    textAlign: TextAlign.center,
                                    style: SafeGoogleFont(
                                      'SF Pro Text',
                                      fontSize: 17 * ffem,
                                      fontWeight: FontWeight.w400,
                                      height: 1.2941176471 * ffem / fem,
                                      letterSpacing: -0.4079999924 * fem,
                                      color: Color(0xffffffff),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                // contentJ6C (I82:5892;1147:11418;1147:10471)
                                padding: EdgeInsets.fromLTRB(
                                    0 * fem, 11 * fem, 0 * fem, 11 * fem),
                                width: 342 * fem,
                                height: double.infinity,
                                child: Container(
                                  // innercontent1mJ (I82:5892;1147:11418;1147:10472)
                                  width: 280 * fem,
                                  height: 22 * fem,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        // labeli9v (I82:5892;1147:11418;1147:10477)
                                        margin: EdgeInsets.fromLTRB(0 * fem,
                                            0 * fem, 185.84 * fem, 0 * fem),
                                        child: Text(
                                          'Label-4',
                                          style: SafeGoogleFont(
                                            'SF Pro Text',
                                            fontSize: 17 * ffem,
                                            fontWeight: FontWeight.w400,
                                            height: 1.2941176471 * ffem / fem,
                                            letterSpacing: -0.4079999924 * fem,
                                            color: Color(0xff000000),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        // rightcontentaxp (I82:5892;1147:11418;1147:10478)
                                        height: double.infinity,
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              // labelUYQ (I82:5892;1147:11418;1147:10482)
                                              margin: EdgeInsets.fromLTRB(
                                                  0 * fem,
                                                  0 * fem,
                                                  17 * fem,
                                                  0 * fem),
                                              child: Text(
                                                'Off',
                                                style: SafeGoogleFont(
                                                  'SF Pro Text',
                                                  fontSize: 17 * ffem,
                                                  fontWeight: FontWeight.w400,
                                                  height:
                                                      1.2941176471 * ffem / fem,
                                                  letterSpacing:
                                                      -0.4079999924 * fem,
                                                  color: Color(0x993c3c43),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              // sfsymbolchevronright7rG (I82:5892;1147:11418;1310:20984)
                                              width: 7.16 * fem,
                                              height: 12.3 * fem,
                                              child: Image.asset(
                                                'assets/templates-user-without-breaking-news-chat-with-nono/images/sf-symbol-chevronright-rvU.png',
                                                width: 7.16 * fem,
                                                height: 12.3 * fem,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              // tableviewwqJ (82:5893)
              margin:
                  EdgeInsets.fromLTRB(15 * fem, 0 * fem, 19 * fem, 209 * fem),
              width: double.infinity,
              height: 44 * fem,
              child: Container(
                // autogrouphmwgpeC (XqzjNUZ6UpGfb5wNT1hmWg)
                width: double.infinity,
                height: double.infinity,
                child: Container(
                  // tableviewcellsxVW (I82:5893;151:5292)
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14 * fem),
                  ),
                  child: Container(
                    // tableviewcellHng (I82:5893;1147:11413)
                    padding: EdgeInsets.fromLTRB(
                        16 * fem, 0 * fem, 0 * fem, 0 * fem),
                    width: 404 * fem,
                    height: 132 * fem,
                    decoration: BoxDecoration(
                      color: Color(0xfff5f5f5),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // icona16 (I82:5893;1147:11413;1309:11155)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 7 * fem, 16 * fem, 0 * fem),
                          width: 30 * fem,
                          height: 30 * fem,
                          decoration: BoxDecoration(
                            color: Color(0xffff3b30),
                            borderRadius: BorderRadius.circular(7 * fem),
                          ),
                          child: Center(
                            child: Text(
                              '􀝗',
                              textAlign: TextAlign.center,
                              style: SafeGoogleFont(
                                'SF Pro Text',
                                fontSize: 17 * ffem,
                                fontWeight: FontWeight.w400,
                                height: 1.2941176471 * ffem / fem,
                                letterSpacing: -0.4079999924 * fem,
                                color: Color(0xfff5f5f5),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          // content6Nk (I82:5893;1147:11413;1309:11158)
                          padding: EdgeInsets.fromLTRB(
                              0 * fem, 11 * fem, 0 * fem, 11 * fem),
                          width: 342 * fem,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0x5b3c3c43)),
                          ),
                          child: Container(
                            // innercontentwPN (I82:5893;1147:11413;1309:11159)
                            width: 280 * fem,
                            height: 22 * fem,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // labelogU (I82:5893;1147:11413;1309:11161)
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 214.84 * fem, 0 * fem),
                                  child: Text(
                                    'Sign Out',
                                    style: SafeGoogleFont(
                                      'SF Pro Text',
                                      fontSize: 17 * ffem,
                                      fontWeight: FontWeight.w400,
                                      height: 1.2941176471 * ffem / fem,
                                      letterSpacing: -0.4079999924 * fem,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                ),
                                Container(
                                  // rightcontentfig (I82:5893;1147:11413;1309:11162)
                                  width: 7.16 * fem,
                                  height: 12.3 * fem,
                                  child: Image.asset(
                                    'assets/templates-user-without-breaking-news-chat-with-nono/images/right-content-3n8.png',
                                    width: 7.16 * fem,
                                    height: 12.3 * fem,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              // tabskk8 (82:5870)
              margin: EdgeInsets.fromLTRB(1 * fem, 0 * fem, 1 * fem, 0 * fem),
              padding:
                  EdgeInsets.fromLTRB(38 * fem, 3.5 * fem, 51 * fem, 0 * fem),
              width: double.infinity,
              height: 50 * fem,
              decoration: BoxDecoration(
                color: Color(0xccf5f5f5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // autogroupm1t6wJp (XqzcpVoZuPeSqfZxvmM1T6)
                    margin: EdgeInsets.fromLTRB(
                        11.69 * fem, 0 * fem, 0 * fem, 70 * fem),
                    height: 44.5 * fem,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // tabbartabcvk (82:5871)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 99.2 * fem, 0 * fem),
                          width: 28.61 * fem,
                          height: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // autogroupu7feH1J (XqzcyuhYyFAatKPLFFU7FE)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 0 * fem, 0.5 * fem),
                                padding: EdgeInsets.fromLTRB(
                                    0 * fem, 3.63 * fem, 0 * fem, 2.33 * fem),
                                width: double.infinity,
                                child: Center(
                                  // sfsymbolhousevKA (I82:5871;1149:8748)
                                  child: SizedBox(
                                    width: 28.61 * fem,
                                    height: 25.04 * fem,
                                    child: Image.asset(
                                      'assets/templates-user-without-breaking-news-chat-with-nono/images/sf-symbol-house-Kxk.png',
                                      width: 28.61 * fem,
                                      height: 25.04 * fem,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                // labelcBz (I82:5871;8:882)
                                margin: EdgeInsets.fromLTRB(
                                    0.01 * fem, 0 * fem, 0 * fem, 0 * fem),
                                child: Text(
                                  'Home',
                                  textAlign: TextAlign.center,
                                  style: SafeGoogleFont(
                                    'SF Pro Text',
                                    fontSize: 10 * ffem,
                                    fontWeight: FontWeight.w500,
                                    height: 1.2575 * ffem / fem,
                                    letterSpacing: -0.2399999946 * fem,
                                    color: Color(0xff9b9b9b),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // tabbartab55a (82:5872)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 100.5 * fem, 0 * fem),
                          width: 35 * fem,
                          height: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // autogroupa38ttHv (Xqzd6aB7fxPCMM1S6nA38t)
                                margin: EdgeInsets.fromLTRB(
                                    4.66 * fem, 0 * fem, 4.67 * fem, 0.5 * fem),
                                padding: EdgeInsets.fromLTRB(
                                    0 * fem, 5.48 * fem, 0 * fem, 3.72 * fem),
                                width: double.infinity,
                                child: Center(
                                  // sfsymbolleaffillAmE (I82:5872;1149:8632)
                                  child: SizedBox(
                                    width: 25.68 * fem,
                                    height: 21.8 * fem,
                                    child: Image.asset(
                                      'assets/templates-user-without-breaking-news-chat-with-nono/images/sf-symbol-leaffill-Jpg.png',
                                      width: 25.68 * fem,
                                      height: 21.8 * fem,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                // labelG3a (I82:5872;1149:8618)
                                'Location',
                                textAlign: TextAlign.center,
                                style: SafeGoogleFont(
                                  'SF Pro Text',
                                  fontSize: 10 * ffem,
                                  fontWeight: FontWeight.w500,
                                  height: 1.2575 * ffem / fem,
                                  letterSpacing: -0.2399999946 * fem,
                                  color: Color(0xff9b9b9b),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // tabbartabuMS (82:5873)
                          width: 26 * fem,
                          height: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // autogroupamagDsv (XqzdCzA6XHkm38o4BgAmag)
                                margin: EdgeInsets.fromLTRB(
                                    0.89 * fem, 0 * fem, 0.89 * fem, 0.5 * fem),
                                padding: EdgeInsets.fromLTRB(
                                    0 * fem, 3.93 * fem, 0 * fem, 2.86 * fem),
                                width: double.infinity,
                                child: Center(
                                  // sfsymbolpersoncropcirclefillsh (I82:5873;1149:8634)
                                  child: SizedBox(
                                    width: 24.21 * fem,
                                    height: 24.21 * fem,
                                    child: Image.asset(
                                      'assets/templates-user-without-breaking-news-chat-with-nono/images/sf-symbol-personcropcirclefill-qZi.png',
                                      width: 24.21 * fem,
                                      height: 24.21 * fem,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                // labelZKW (I82:5873;1149:8622)
                                'Profile',
                                textAlign: TextAlign.center,
                                style: SafeGoogleFont(
                                  'SF Pro Text',
                                  fontSize: 10 * ffem,
                                  fontWeight: FontWeight.w500,
                                  height: 1.2575 * ffem / fem,
                                  letterSpacing: -0.2399999946 * fem,
                                  color: Color(0xff2388c2),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // centeralert2Tz (82:5874)
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 51 * fem, 0 * fem),
                    padding: EdgeInsets.fromLTRB(
                        0 * fem, 16.5 * fem, 0 * fem, 45.5 * fem),
                    width: 250 * fem,
                    decoration: BoxDecoration(
                      color: Color(0xedfafafa),
                      borderRadius: BorderRadius.circular(8 * fem),
                    ),
                    child: ClipRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 40 * fem,
                          sigmaY: 40 * fem,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // iconE4G (I82:5874;839:6984)
                              margin: EdgeInsets.fromLTRB(
                                  73 * fem, 0 * fem, 72 * fem, 6.5 * fem),
                              padding: EdgeInsets.fromLTRB(
                                  0 * fem, 21.5 * fem, 0 * fem, 17.5 * fem),
                              width: double.infinity,
                              child: Center(
                                // sfsymbolheartTBv (I82:5874;839:6986)
                                child: SizedBox(
                                  width: 105 * fem,
                                  height: 97 * fem,
                                  child: Image.asset(
                                    'assets/templates-user-without-breaking-news-chat-with-nono/images/sf-symbol-heart-rsi.png',
                                    width: 105 * fem,
                                    height: 97 * fem,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              // contenti7r (I82:5874;839:6987)
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Center(
                                    // titleSZe (I82:5874;839:6988)
                                    child: Container(
                                      margin: EdgeInsets.fromLTRB(0 * fem,
                                          0 * fem, 0 * fem, 12.5 * fem),
                                      child: Text(
                                        'Title',
                                        textAlign: TextAlign.center,
                                        style: SafeGoogleFont(
                                          'SF Pro Display',
                                          fontSize: 22 * ffem,
                                          fontWeight: FontWeight.w700,
                                          height: 1.2727272727 * ffem / fem,
                                          letterSpacing: 0.349999994 * fem,
                                          color: Color(0x993c3c43),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Center(
                                    // descr7a (I82:5874;839:6989)
                                    child: Text(
                                      'We’ll recommend more like this in Listen Now.',
                                      textAlign: TextAlign.center,
                                      style: SafeGoogleFont(
                                        'SF Pro Text',
                                        fontSize: 16 * ffem,
                                        fontWeight: FontWeight.w400,
                                        height: 1.3125 * ffem / fem,
                                        letterSpacing: -0.3199999928 * fem,
                                        color: Color(0x993c3c43),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // homeindicatorh8C (82:5869)
              margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 2 * fem, 0 * fem),
              padding:
                  EdgeInsets.fromLTRB(128 * fem, 21 * fem, 128 * fem, 8 * fem),
              width: 390 * fem,
              decoration: BoxDecoration(
                color: Color(0xccf5f5f5),
              ),
              child: Center(
                // homeindicatoryLc (I82:5869;5:3093)
                child: SizedBox(
                  width: double.infinity,
                  height: 5 * fem,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100 * fem),
                      color: Color(0xff000000),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
