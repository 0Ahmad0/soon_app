import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:roofa/department_manager/details_report_ticket/controller/details_report_ticket_controller.dart';

import '../../../const/const_color.dart';
import '../../../const/text_app.dart';
import '../../../widgets/custom_dialog.dart';
import '../../../widgets/material_text.dart';
import '../../home_page/view/home_page.dart';
import 'package:intl/intl.dart' as intl;

class DetailsReportTicketDMScreen extends StatelessWidget {
   Color color;
   bool isShow;
   int? index;
   DetailsReportTicketDMScreen({this.index ,this.color = Colors.green,this.isShow = false});
   final controller = Get.put(DetailsReportTicketDMController());
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text("تفاصيل التذكرة"),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: (){
              Get.back();
            },
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Get.off(()=>HomeScreenDM());
                },
                icon: Icon(
                  Icons.home,
                  size: 30.r,
                ))
          ],
        ),
        body: Column(
          children: [
            Obx(
                    ()=>Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 5,
                      child: Container(
                        padding: EdgeInsets.all(5.r),
                        margin: EdgeInsets.symmetric(
                            horizontal: 20.w
                        ),
                        width: 235.w,
                        height: 35.h,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50.r),
                            boxShadow: [
                              BoxShadow(
                                  color: colorShadowSearch.withOpacity(.23),
                                  blurRadius: 10,
                                  offset: Offset(0, 4))
                            ]),
                        child:  Row(
                          children: [
                            Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    controller.onClickButton(0);
                                    controller.controllerPageView!
                                        .animateToPage(
                                        0,
                                        duration: Duration(milliseconds: 800),
                                        curve: Curves.decelerate
                                    );
                                  },
                                  child: AnimatedContainer(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: controller.index.value == 0
                                            ? mainColor
                                            : Colors.white,
                                        borderRadius: BorderRadius.circular(50.r)),
                                    child: Text(
                                      'بيانات التذكرة',
                                      style: TextStyle(
                                        color: controller.index.value == 0
                                            ? controller.textButtonActive
                                            : mainColor,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 800),
                                  ),
                                )),
                            Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    controller.onClickButton(1);
                                    controller.controllerPageView!
                                        .animateToPage(
                                        1,
                                        duration: Duration(milliseconds: 800),
                                        curve: Curves.decelerate
                                    );

                                  },
                                  child: AnimatedContainer(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: controller.index.value == 1
                                            ? mainColor
                                            : Colors.white,
                                        borderRadius: BorderRadius.circular(50.r)),
                                    child: Text(
                                      'التركيبات والتبديلات',
                                      style: TextStyle(
                                        color: controller.index.value == 1
                                            ? controller.textButtonActive
                                            : mainColor,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 800),
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ),


                  ],
                )
            ),
            Expanded(
              child: PageView(
                controller: controller.controllerPageView,
                onPageChanged: (val){
                  controller.index.value = val;
                },
                children: [
                  DetailsTicketPageDM(
                    controller: controller,
                    color: color,
                    isShow: isShow,
                    index: index,
                  ),  CompositionAndChangesDM(
                    controller: controller,
                    color: color,
                    isShow: isShow,
                    index: index,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailsTicketPageDM extends StatelessWidget {
    DetailsTicketPageDM({
    Key? key,
    required this.controller,
    required this.color, this.isShow = false, this.index,
  }) : super(key: key);

  final DetailsReportTicketDMController controller;
   final Color? color;
  final bool isShow;
  final int? index;

   List c = ticketInformationDM['reporter_helper'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 4,
          child: Container(
            margin:
            EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.r),
                boxShadow: [
                  BoxShadow(
                    color: colorShadowSearch.withOpacity(.23),
                    blurRadius: 10,
                    offset: Offset(0, 9),
                  )
                ]),
            child: LayoutBuilder(
              builder: (context, constrains) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              color: color,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(15.r),
                                bottomRight: Radius.circular(15.r),
                              )),
                        )),
                    Expanded(
                        flex: 18,
                        child: Container(
                          padding: EdgeInsets.all(10.r),
                          decoration: BoxDecoration(),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    flex: 6,
                                    child: Text(
                                      'بيانات التذكرة',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: mainColor,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Expanded(
                                    child: Row(
                                      children: [
                                        GestureDetector(
                                          onTap: (){},
                                          child: SvgPicture.asset('images/print.svg'),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Divider(
                                color: Colors.grey,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      child: Wrap(
                                        children: [
                                          Text(
                                            'رقم  التذكرة: ',
                                            style: TextStyle(
                                                color: mainColor,
                                                fontWeight: FontWeight
                                                    .bold,
                                                fontSize: 15.sp),
                                          ),
                                          Text(
                                            '${ticketInformationDM['ticket_id']}',
                                            style: TextStyle(
                                                color: mainColor,
                                                height: 1.5),
                                          ),
                                        ],
                                      )),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      flex: 2,
                                      child: Wrap(
                                        children: [
                                          Text(
                                            'تاريخ التذكرة: ',
                                            style: TextStyle(
                                                color: mainColor,
                                                fontWeight:
                                                FontWeight.bold,
                                                fontSize: 15.sp),
                                          ),
                                          Text(
                                            '${intl.DateFormat.yMEd()
                                                .add_jms()
                                                .format(
                                                ticketInformationDM['ticket_date'])}',
                                            style: TextStyle(
                                                color: mainColor,
                                                height: 1.5),
                                          ),
                                        ],
                                      )),
                                ],
                              ),
                              Row(
                                children: [
                                  Wrap(
                                    children: [
                                      Text(
                                        'الجهة/القسم : ',
                                        style: TextStyle(
                                            color: mainColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15.sp),
                                      ),
                                      Text(
                                        '${ticketInformation['ticket_target']}',
                                        style: TextStyle(
                                            color: mainColor,
                                            height: 1.5),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Wrap(
                                    children: [
                                      Text(
                                        'المقر: ',
                                        style: TextStyle(
                                            color: mainColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15.sp),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            '${ticketInformationDM['ticket_position']}',
                                            style: TextStyle(
                                              color: mainColor,
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Wrap(
                                    children: [
                                      Text(
                                        'رقم القاعة : ',
                                        style: TextStyle(
                                            color: mainColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15.sp),
                                      ),
                                      Text(
                                        '${ticketInformationDM['ticket_room_number']}',
                                        style: TextStyle(
                                            color: mainColor,
                                            height: 1.5),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    width: Get.width * 0.35,
                                    height: Get.width * 0.07,
                                    decoration: BoxDecoration(
                                      color: color!.withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(50.r),
                                      border: Border.all(
                                        color: color!,
                                      )
                                    ),
                                    child: Text(index==0?'تم إنجازها':
                                    'لم يتم إنجازها',style: TextStyle(
                                      color: mainColor,
                                    ),),
                                  )

                                ],
                              ),
                              Row(
                                children: [
                                  Wrap(
                                    children: [
                                      Text(
                                        'المبنى : ',
                                        style: TextStyle(
                                            color: mainColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15.sp),
                                      ),
                                      Text(
                                        '${ticketInformationDM['ticket_building']}',
                                        style: TextStyle(
                                            color: mainColor,
                                            height: 1.5),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Wrap(
                                    children: [
                                      Text(
                                        'الدور : ',
                                        style: TextStyle(
                                            color: mainColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15.sp),
                                      ),
                                      Text(
                                        '${ticketInformationDM['ticket_floor']}',
                                        style: TextStyle(
                                            color: mainColor,
                                            height: 1.5),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'الحالة : ',
                                    style: TextStyle(
                                        color: mainColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.sp),
                                  ),
                                  CircleAvatar(
                                    radius: 5.r,
                                    backgroundColor: color,
                                  ),
                                  SizedBox(width: 10.w,),
                                  Text(
                                    '${ticketInformationDM['ticket_status']}',
                                    style: TextStyle(
                                        color: color,
                                        height: 1.5),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Wrap(
                                    children: [
                                      Text(
                                        'رقم الجوال : ',
                                        style: TextStyle(
                                            color: mainColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15.sp),
                                      ),
                                      Text(
                                        '${ticketInformationDM['ticket_phone_number']}',
                                        style: TextStyle(
                                            color: mainColor,
                                            height: 1.5),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    'وصف المشكلة : ',
                                    style: TextStyle(
                                        color: mainColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.sp),
                                  ),
                                  Container(
                                    alignment:
                                    AlignmentDirectional.center,
                                    padding: EdgeInsets.all(12.r),
                                    decoration: BoxDecoration(
                                        color: Color(0xffF3F3F3),
                                        borderRadius:
                                        BorderRadius.circular(15.r)),
                                    child: Text(
                                      '${ticketInformationDM['ticket_problem_description']}',
                                      style: TextStyle(
                                          color: mainColor, height: 1.5),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10.h,),
                              Row(
                                children: [
                                  Text(
                                    'الفني المسؤول : ',
                                    style: TextStyle(
                                        color: mainColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.sp),
                                  ),
                                  Text(
                                    '${
                                    ticketInformationDM['reporter_name']
                                    }',
                                    style: TextStyle(
                                        color: mainColor,
                                        ),
                                  ),

                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'الفنيين المساعدين : ',
                                    style: TextStyle(
                                        color: mainColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.sp),
                                  ),
                                 Row(
                                   children: c.map((e) => Text('$e,',style: TextStyle(
                                     color: mainColor
                                   ),)).toList(),
                                 )

                                ],
                              ),
                              Row(
                                children: [
                                  Text('التاريخ والوقت المتوقع لإنجاز المهمة',style: TextStyle(
                                    color: mainColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.sp
                                  ),),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                '${intl.DateFormat.yMd().format(
                ticketInformationDM['ticket_date_finish_from'])}',
                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.sp
                                  ),),
                                  Text('  إلى  ',style: TextStyle(
                                    color: mainColor,
                                    fontWeight: FontWeight.bold
                                  ),),
                                  Text(
                                    '${intl.DateFormat.yMd().add_j().format(
                                        ticketInformationDM['ticket_date_finish_to'])}',
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.sp
                                    ),),
                                ],
                              ),
                            ],
                          ),
                        )),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class CompositionAndChangesDM extends StatelessWidget {
  CompositionAndChangesDM({
    Key? key,
    required this.controller,
    required this.color, this.isShow = false, this.index,
  }) : super(key: key);

  final DetailsReportTicketDMController controller;
   final Color? color;
  final bool isShow;
  final int? index;

   List c = ticketCompositionAndChangesInformationDM['reporter_helper'];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          width: 10,
          height: Get.height-100.h,
          margin:
          EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.r),
              boxShadow: [
                BoxShadow(
                  color: colorShadowSearch.withOpacity(.23),
                  blurRadius: 10,
                  offset: Offset(0, 9),
                )
              ]),
          child: LayoutBuilder(
            builder: (context, constrains) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: color,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15.r),
                              bottomRight: Radius.circular(15.r),
                            )),
                      )),
                  Expanded(
                      flex: 18,
                      child: Container(
                        padding: EdgeInsets.all(10.r),
                        decoration: BoxDecoration(),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 6,
                                  child: Text(
                                    'بيانات البلاغ',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: mainColor,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                        onTap: (){},
                                        child: SvgPicture.asset('images/print.svg'),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Divider(
                              color: Colors.grey,
                            ),
                            Row(
                              children: [
                                Expanded(
                                    child: Wrap(
                                      children: [
                                        Text(
                                          'رقم  التذكرة: ',
                                          style: TextStyle(
                                              color: mainColor,
                                              fontWeight: FontWeight
                                                  .bold,
                                              fontSize: 15.sp),
                                        ),
                                        Text(
                                          '${ticketCompositionAndChangesInformationDM['ticket_id']}',
                                          style: TextStyle(
                                              color: mainColor,
                                              height: 1.5),
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: Wrap(
                                      children: [
                                        Text(
                                          'تاريخ التذكرة: ',
                                          style: TextStyle(
                                              color: mainColor,
                                              fontWeight:
                                              FontWeight.bold,
                                              fontSize: 15.sp),
                                        ),
                                        Text(
                                          '${intl.DateFormat.yMEd()
                                              .add_jms()
                                              .format(
                                              ticketCompositionAndChangesInformationDM['ticket_date'])}',
                                          style: TextStyle(
                                              color: mainColor,
                                              height: 1.5),
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                            Row(
                              children: [
                                Wrap(
                                  children: [
                                    Text(
                                      'الجهة/القسم : ',
                                      style: TextStyle(
                                          color: mainColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15.sp),
                                    ),
                                    Text(
                                      '${ticketInformation['ticket_target']}',
                                      style: TextStyle(
                                          color: mainColor,
                                          height: 1.5),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Wrap(
                                  children: [
                                    Text(
                                      'المقر: ',
                                      style: TextStyle(
                                          color: mainColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15.sp),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          '${ticketCompositionAndChangesInformationDM['ticket_position']}',
                                          style: TextStyle(
                                            color: mainColor,
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Wrap(
                                  children: [
                                    Text(
                                      'رقم القاعة : ',
                                      style: TextStyle(
                                          color: mainColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15.sp),
                                    ),
                                    Text(
                                      '${ticketCompositionAndChangesInformationDM['ticket_room_number']}',
                                      style: TextStyle(
                                          color: mainColor,
                                          height: 1.5),
                                    ),
                                  ],
                                ),

                              ],
                            ),
                            Row(
                              children: [
                                Wrap(
                                  children: [
                                    Text(
                                      'المبنى : ',
                                      style: TextStyle(
                                          color: mainColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15.sp),
                                    ),
                                    Text(
                                      '${ticketCompositionAndChangesInformationDM['ticket_building']}',
                                      style: TextStyle(
                                          color: mainColor,
                                          height: 1.5),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Wrap(
                                  children: [
                                    Text(
                                      'الدور : ',
                                      style: TextStyle(
                                          color: mainColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15.sp),
                                    ),
                                    Text(
                                      '${ticketCompositionAndChangesInformationDM['ticket_floor']}',
                                      style: TextStyle(
                                          color: mainColor,
                                          height: 1.5),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'الحالة : ',
                                  style: TextStyle(
                                      color: mainColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.sp),
                                ),
                                CircleAvatar(
                                  radius: 5.r,
                                  backgroundColor: color,
                                ),
                                SizedBox(width: 10.w,),
                                Text(
                                  '${ticketCompositionAndChangesInformationDM['ticket_status']}',
                                  style: TextStyle(
                                      color: color,
                                      height: 1.5),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Wrap(
                                  children: [
                                    Text(
                                      'رقم الجوال : ',
                                      style: TextStyle(
                                          color: mainColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15.sp),
                                    ),
                                    Text(
                                      '${ticketCompositionAndChangesInformationDM['ticket_phone_number']}',
                                      style: TextStyle(
                                          color: mainColor,
                                          height: 1.5),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Wrap(
                                  children: [
                                    Text(
                                      'اسم الجهاز : ',
                                      style: TextStyle(
                                          color: mainColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15.sp),
                                    ),
                                    Text(
                                      '${ticketCompositionAndChangesInformationDM['device_name']}',
                                      style: TextStyle(
                                          color: mainColor,
                                          height: 1.5),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Wrap(
                                  children: [
                                    Text(
                                      'نوع الجهاز : ',
                                      style: TextStyle(
                                          color: mainColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15.sp),
                                    ),
                                    Text(
                                      '${ticketCompositionAndChangesInformationDM['device_type']}',
                                      style: TextStyle(
                                          color: mainColor,
                                          height: 1.5),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Wrap(
                                  children: [
                                    Text(
                                      'الرقم التسلسلي للجهاز : ',
                                      style: TextStyle(
                                          color: mainColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15.sp),
                                    ),
                                    Text(
                                      '${ticketCompositionAndChangesInformationDM['device_serial_number']}',
                                      style: TextStyle(
                                          color: mainColor,
                                          height: 1.5),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  'وصف المشكلة : ',
                                  style: TextStyle(
                                      color: mainColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.sp),
                                ),
                                Container(
                                  alignment:
                                  AlignmentDirectional.center,
                                  padding: EdgeInsets.all(12.r),
                                  decoration: BoxDecoration(
                                      color: Color(0xffF3F3F3),
                                      borderRadius:
                                      BorderRadius.circular(15.r)),
                                  child: Text(
                                    '${ticketCompositionAndChangesInformationDM['ticket_problem_description']}',
                                    style: TextStyle(
                                        color: mainColor, height: 1.5),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.h,),
                            Row(
                              children: [
                                Text(
                                  'الفني المسؤول : ',
                                  style: TextStyle(
                                      color: mainColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.sp),
                                ),
                                Text(
                                  '${
                                  ticketCompositionAndChangesInformationDM['reporter_name']
                                  }',
                                  style: TextStyle(
                                      color: mainColor,
                                      ),
                                ),

                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'الفنيين المساعدين : ',
                                  style: TextStyle(
                                      color: mainColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.sp),
                                ),
                               Row(
                                 children: c.map((e) => Text('$e,',style: TextStyle(
                                   color: mainColor
                                 ),)).toList(),
                               )

                              ],
                            ),
                            Row(
                              children: [
                                Text('التاريخ والوقت المتوقع لإنجاز المهمة',style: TextStyle(
                                  color: mainColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.sp
                                ),),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
              '${intl.DateFormat.yMd().format(
              ticketCompositionAndChangesInformationDM['ticket_date_finish_from'])}',
              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.sp
                                ),),
                                Text('  إلى  ',style: TextStyle(
                                  color: mainColor,
                                  fontWeight: FontWeight.bold
                                ),),
                                Text(
                                  '${intl.DateFormat.yMd().add_j().format(
                                      ticketCompositionAndChangesInformationDM['ticket_date_finish_to'])}',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.sp
                                  ),),
                              ],
                            ),
                          ],
                        ),
                      )),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
