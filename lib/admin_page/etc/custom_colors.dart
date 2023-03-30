import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum ColorSet{
  buttonBackgroud,
  buttonTextColor,
  lineSeparator,
  cardColor,
  accentColor,
  borderColor,
  voiceControlUpcolor,
  titleColor,
  bnwColor,
  header4Color,
  walletBackGround,
  walletAppBar,
  walletTapBlue,
  walletTapGray,
  walletDateBack,
  walletDateTextColor,
  walletStatusTextColor,
  walletAddressTextColor,
  walletTermBoxBorder,
  walletTermBoxColor,
  videoPlaceholder,
  appBarThemeColor,
  backgroundColor,
  secondaryHeaderColor,
  bandWBackColor,
  signUpListBack,
  arrowIconColor,
  borderColor2,
  withdrawalTextColor,
  logoutTextColor,
  moreOptionBackColor,
  inappTextColor,
  profileTextColor,
  defaultTextColor,
  interestNotSelected,
  interestNotSelectedBorderColor,
  interestItemColor,
  interestItemBorderColor,
  dividerColor,
  finishButtonBackColor,
  contentTextColor,
  buttonBackColor,
  buttonFrontColor,
  buttonSideColor,
  appbarTitleColor,
  nextButtonDisableColor,
  nextButtonAbleColor,
  red,
  graydark,
  gray,
  graysilver,
  graypress,
  graywhite,
  graylight,
  gray2,
  white,
  pink,
  cyan,
  yellow,
  brown,
  green,
  bluelight,
  violet,
  orange,
  dark,
  shadowColor,
  postCategoryHelp,
  postCategoryStudy,
  postCategoryChat,
  postCategoryTravel,
  postCategoryEvent,
  postCategoryFood,
  postCategoryMusic,
  postCategoryDrama,
  postCategoryAnimal,
  postCategoryLife,
  grayBorder,
  textFieldBackground,
  hintTextColor,
  talkRoomHeader,
  keesPink,
  inactiveColor,
  backgroundgray,
  talkSearchHint,
  newText,
  linkColor,
  shopTextOrange,
  shopOrange,
  crPoint,
  blueGreen,
  deepOrange,
  deepBlue,
  deepRed,
  minusPoint,
  plusPoint,
  donationMoney
}



class CustomColors{

  late Color primaryColor;
  CustomColors();

  Color get(ColorSet selected){
    late Color result;
    switch(selected){

      case ColorSet.buttonBackgroud:
        result = Get.isDarkMode?Colors.red : Colors.green;
        break;
      case ColorSet.buttonTextColor:
        result = Get.isDarkMode?Colors.purple : Colors.yellow;
        break;
      case ColorSet.lineSeparator:
        result = Get.isDarkMode?Colors.white : const Color.fromRGBO(0, 0, 0, 0.08);
        break; 
      case ColorSet.cardColor:
        result = Get.isDarkMode?const Color(0XFF444444) : const Color(0XFFFFFFFF);
        break; 
      case ColorSet.accentColor:
        result = Get.isDarkMode?Colors.orange : const Color(0xffeeeeee);
        break;    
      case ColorSet.borderColor:
        result = Get.isDarkMode?const Color(0XFFFAFAF7): const Color(0XFF121212) ; 
        break;   
      case ColorSet.voiceControlUpcolor:
        result = Get.isDarkMode?Color(0xFF444444) : Color(0xFFeeeeee);
        break;    
      case ColorSet.titleColor:
        result = Get.isDarkMode?Colors.white:const Color(0xFF333333);
        break;  
      case ColorSet.bnwColor:
        result = Get.isDarkMode?Colors.white :Colors.black;
        break;      
      case ColorSet.header4Color:
        result = Get.isDarkMode?Color(0XFF979797):const Color(0XFF888888);
        break;
      case ColorSet.walletBackGround:
        result = Get.isDarkMode?Color(0XFF333333):Color(0xFFEEEEEE);
        break;   
      case ColorSet.walletAppBar:
        result = Get.isDarkMode?Color(0xffcccccc):Colors.black;
        break; 
      case ColorSet.walletTapBlue:
        result = Color(0xFF229AF7);
        break;                            
      case ColorSet.walletTapGray:
        result = Color(0xFF666666);
        break; 
      case ColorSet.walletDateBack:
        result = Get.isDarkMode?Color(0XFF333333):Color(0xFFEEEEEE);
        break;    
      case ColorSet.walletDateTextColor:
        result = Color(0xFF999999);
        break;               
      case ColorSet.walletStatusTextColor:
        result = Get.isDarkMode?Color(0XFFCCCCCC):Color(0xFF333333); 
        break;          
      case ColorSet.walletAddressTextColor:
        result = Get.isDarkMode?Color(0XFF999999):Color(0xFF666666); 
        break;     
      case ColorSet.walletTermBoxBorder:
        result = Get.isDarkMode?Color(0XFF555555)
                        :Color(0xffdddddd);
        break;  
      case ColorSet.walletTermBoxColor:
        result = Get.isDarkMode?Color(0XFF333333)
                        :Color(0xfff5f5f5);   
        break;                  
      case ColorSet.videoPlaceholder:
        result = Get.isDarkMode? const Color.fromRGBO(10, 10, 10, 1)
                              : const Color.fromRGBO(240, 240, 240, 1);
        break;
      case ColorSet.appBarThemeColor:
        result = Get.isDarkMode? const Color(0XFFFFFFFFF)
                              : Color(0XFFFFFFFFF);
        break;
      case ColorSet.backgroundColor:
        result = Get.isDarkMode? Color(0XFF333333)
                              : Color(0XFFFFFFFF);
        break;
      case ColorSet.secondaryHeaderColor:
        result = Get.isDarkMode? Color(0xFFFF509A)
                              : Color(0xFFFF509A);
        break;
      case ColorSet.bandWBackColor:
        result = Get.isDarkMode? const Color(0XFF121212)
                      : const Color(0XFFFAFAF7);
        break;
      case ColorSet.signUpListBack:
        result = Get.isDarkMode ? const Color(0XFF1a1a1a)
                      : const Color.fromRGBO(255, 255, 255, 1);
        break;
      case ColorSet.arrowIconColor:
        result = Get.isDarkMode ? const Color(0XFFFFFFFF)
                      : const Color(0XFF121212);
        break;
      case ColorSet.borderColor2:
        result = Get.isDarkMode ? const Color.fromRGBO(255, 255, 255, .1)
                      : const Color(0XFFcacacf);
        break;
      case ColorSet.withdrawalTextColor:
        result = Get.isDarkMode ? const Color.fromRGBO(144, 144, 144, 1)
                      : const Color.fromRGBO(105, 105, 105, 1);
        break;
      case ColorSet.logoutTextColor:
        result = Get.isDarkMode  ? const Color.fromRGBO(255, 255, 255, .6)
                      : const Color.fromRGBO(0, 0, 0, .6);
        break;
      case ColorSet.moreOptionBackColor:
        result = Get.isDarkMode  ? const Color.fromRGBO(255, 255, 255, 0.08)
                  : const Color.fromRGBO(0, 0, 0, 0.08);
        break;
      case ColorSet.inappTextColor:
        result = Get.isDarkMode ? const Color.fromRGBO(255, 255, 255, 1)
                              : const Color.fromRGBO(0, 0, 0, 1);
        break;
      case ColorSet.profileTextColor:
        result = Get.isDarkMode ? Color(0xffcccccc)
                   : Color(0xff999999);
        break;
      case ColorSet.defaultTextColor:
        result = Get.isDarkMode ? Color(0xffcccccc)
        : Color(0xff666666);
        break;
      case ColorSet.interestNotSelected:
        result = Get.isDarkMode ? Color(0XFF242424)
        : Color(0xffffffff);
        break;
      case ColorSet.interestNotSelectedBorderColor:
        result = Get.isDarkMode ? Color(0XFF666666)
            : Color(0xffc5c5c5);
        break;
      case ColorSet.interestItemColor:
        result = const Color(0xff49caaa);
        break;
      case ColorSet.interestItemBorderColor:
        result = Get.isDarkMode ? Color(0XFF666666)
        : Color(0xffc5c5c5);
        break;
      case ColorSet.dividerColor:
        result = Get.isDarkMode? Color(0XFF333333)
        : Color(0xffeeeeee);
        break;
      case ColorSet.finishButtonBackColor:
        result = Get.isDarkMode? Color(0XFF242424)
        : Colors.white;
        break;
      case ColorSet.contentTextColor:
        result = Get.isDarkMode? Color(0xffcccccc)
        : Color(0xff999999);
        break;
      case ColorSet.buttonBackColor:
        result = Get.isDarkMode? Color(0xff333333)
        : Color(0xFFEEEEEE);
        break;
      case ColorSet.buttonFrontColor:
        result = Get.isDarkMode? Color(0xffcccccc)
        : Color(0xFF666666);
        break;
      case ColorSet.buttonSideColor:
        result = Get.isDarkMode? Color(0xff555555)
        : Color(0xFFDDDDDD);
        break;
      case ColorSet.appbarTitleColor:
        result = Get.isDarkMode? Color(0xffcccccc)
        : Colors.black;
        break;
      case ColorSet.nextButtonDisableColor:
        result = Get.isDarkMode? Color(0XFF666666)
        : Colors.grey;
        break;
      case ColorSet.nextButtonAbleColor:
        result = Get.isDarkMode? Color(0XFFffffff)
        : Colors.black;
        break;
      case ColorSet.dark:
        result = const Color(0xff000000);
        break;  
      case ColorSet.graydark:
        result = const Color(0xff333333);
        break;
      case ColorSet.gray:
        result = const Color(0xff666666);
        break;
      case ColorSet.graysilver:
        result = const Color(0xff999999);
        break;
      case ColorSet.graypress:
        result = const Color(0xffeeeeee);
        break;
      case ColorSet.graywhite:
        result = const Color(0xfff5f5f5);
        break;
      case ColorSet.graylight:
        result = const Color(0xffDDDDDD);
        break;
      case ColorSet.gray2:
        result = const Color(0xffCCCCCC);
        break;
      case ColorSet.white:
        result = const Color(0xffffffff);
        break;
      case ColorSet.pink:
        result = const Color(0xfff7598f);
        break;
      case ColorSet.cyan:
        result = const Color(0xff49caaa);
        break;
      case ColorSet.yellow:
        result = const Color(0xfffac34c);
        break;
      case ColorSet.brown:
        result = const Color(0xffa68980);
        break;
      case ColorSet.green:
        result = const Color(0xff7fd90b);
        break;
      case ColorSet.bluelight:
        result = const Color(0xff46c6ef);
        break;
      case ColorSet.violet:
        result = const Color(0xffc187ef);
        break;
      case ColorSet.orange:
        result = const Color(0xfff79420);
        break;
      case ColorSet.shadowColor:
        result = const Color.fromRGBO(0, 0, 0, 0.15);
        break;
      case ColorSet.postCategoryHelp:
        result = const Color(0xff71DE1B);
        break;
      case ColorSet.postCategoryStudy:
        result = const Color(0xff6BA0F0);
        break;
      case ColorSet.postCategoryChat:
        result = const Color(0xff38CAEA);
        break;
      case ColorSet.postCategoryTravel:
        result = const Color(0xff10CF74);
        break;
      case ColorSet.postCategoryEvent:
        result = const Color(0xff46CDBD);
        break;
      case ColorSet.postCategoryFood:
        result = const Color(0xff799E78);
        break;
      case ColorSet.postCategoryMusic:
        result = const Color(0xff76C2D2);
        break;
      case ColorSet.postCategoryDrama:
        result = const Color(0xff93BB7A);
        break;
      case ColorSet.postCategoryAnimal:
        result = const Color(0xff4AA15D);
        break;
      case ColorSet.postCategoryLife:
        result = const Color(0xff7994C9);
        break;
      case ColorSet.grayBorder:
        result = const Color(0xffDDDDDD);
        break;
      case ColorSet.textFieldBackground:
        result = const Color(0xffF9F9F9);
        break;
      case ColorSet.hintTextColor:
        result = const Color(0xffCCCCCC);
        break;
      case ColorSet.red:
          result = Colors.red;
        break;
      case ColorSet.talkRoomHeader:
        result = const Color(0xff333333);
        break;
      case ColorSet.keesPink:
        result = const Color(0xffFF4081);
        break;
      case ColorSet.talkSearchHint:
        result = const Color(0xffBBBBBB);
        break;
      case ColorSet.inactiveColor:
          result = const Color(0xffbbbbbb);  
        break;
      case ColorSet.backgroundgray:
        result = const Color(0xffe5e5e5);  
        break;
      case ColorSet.newText:
        result = const Color(0xff6EC500);
        break;
      case ColorSet.blueGreen:
        result = const Color(0xff46ADB2);
        break;
      case ColorSet.orange:
        result = const Color(0xffFF900D);
        break;
      case ColorSet.deepOrange:
        result = const Color(0xffD07810);
        break;
      case ColorSet.deepRed:
        result = const Color(0xffEE3939);
        break;
      case ColorSet.deepBlue:
        result = const Color(0xff235CCB);
        break;
      case ColorSet.linkColor:
        result = const Color(0xff002A96);
        break;
      case ColorSet.shopTextOrange:
        result = const Color(0xff890E0E);
        break;
      case ColorSet.shopOrange:
        result = const Color(0xffff900d);
        break;
      case ColorSet.crPoint:
        result = const Color(0xffD07810);
        break;
      case ColorSet.minusPoint:
        result = const Color(0xffEE3939);
        break;
      case ColorSet.plusPoint:
        result = const Color(0xff0D99FF);
        break;
      case ColorSet.donationMoney:
        result = const Color(0xffCA7B06);
        break;
    }
    return result;
  }
}

var customColors = CustomColors();