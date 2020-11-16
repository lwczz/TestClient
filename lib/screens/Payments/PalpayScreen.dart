import 'dart:core';

import 'package:client_car_service_system/WebServices/PalpayServices.dart';
import 'package:client_car_service_system/models/Payments/classTopUpData.dart';
import 'package:client_car_service_system/screens/Homes/TopUpSuccessfulScreen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// 导入webview包
import 'package:webview_flutter/webview_flutter.dart';
// 导入自定义的接口调用类



class PalpayScreen extends StatefulWidget {
  // 跳转到当前支付页面的传参，该参数为一个支付成功后关闭当前页面后的一个回调方法
  final Function onFinish;

  // 构造方法方便传参上面的onFinish方法参数
  PalpayScreen({this.onFinish});

  @override
  State<StatefulWidget> createState() {
    return PalpayScreenState();
  }
}

class PalpayScreenState extends State<PalpayScreen> {

   classTopUpData a;

  // 全局ScaffoldState的key，方便后面调用showSnackBar方法显示提示信息
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // 这个是paypal得到checkoutUrl，也就是用户授权支付页面的地址，
  // 会放到webview里面展示让用户去操作同意授权支付
  String checkoutUrl;

  // 创建订单成功后返回的执行真正的扣款的动态地址
  String executeUrl;

  // 这个paypal的outh2 口令accessToken(后端调用可以不用在这里使用)
  String accessToken;

  // 初始化调用(后端)接口的服务类
  PalpayServices services = new PalpayServices();

  // 定义一个默认的货币类型，你可以根据你的需要修改
  Map<dynamic, dynamic> defaultCurrency = {
    "symbol": "MYR ",
    "decimalDigits": 2,
    "symbolBeforeTheNumber": true,
    "currency": "MYR"
  };

  // 是否支持邮寄，为false就不传邮寄地址参数
  bool isEnableShipping = false;
  bool isEnableAddress = false;

  // 定义一个用户授权支付之后返回的地址，这里可以随便写，
  // paypal会在用户统一支付后携带PayerID跟随到该地址后面重定向到改地址，
  // 我们只用于在webview捕获该地址就能拿到PayerID
  String returnURL = 'return.paypal.lyscms.com';
  // 用户在授权页面(checkoutUrl地址页面)取消了授权支付后返回的地址
  String cancelURL = 'cancel.paypal.lyscms.com';

  @override
  void initState() {
    super.initState();

    // 进入该页面后初始化异步调用(后端)接口
    Future.delayed(Duration.zero, () async {
      try {
        // 1. 调用(后端)接口获取accessToken，其实就是调用paypal接口：/v1/oauth2/token?grant_type=client_credentials
        accessToken = await services.getAccessToken();
        if (accessToken != null) {
          // 2. 准备好创建paypal支付订单的接口的参数数据，调用(后端)接口创建paypal的支付订单，
          // 其实就是调用paypal接口：/v1/payments/payment
          final transactions = getOrderParams();
          final res = await services.createPaypalPayment(transactions, accessToken);
          // 3. 创建支付订单成功后会返回同意授权支付的页面地址approvalUrl
          // 	赋值给上面定义的checkoutUrl参数以及执行扣款的支付地址executeUrl
          if (res != null) {
            setState(() {
              checkoutUrl = res["approvalUrl"];
              executeUrl = res["executeUrl"];
            });
          }
        } else {
          // 提示获取AccessToken失败，并关闭当前支付页面返回上一步页面(进入当前页面的前一个页面)
          print('Get an access token fail: $accessToken');
          Fluttertoast.showToast(msg: 'Get an access token fail: $accessToken')
              .then((value) => Navigator.of(context).pop());
        }
      } catch (e) {
        // 在获取AccessToken或者创建订单的时候出现异常后提示信息
        print('exception: ' + e.toString());

        // 底部的SnackBar提示
        final snackBar = SnackBar(
          content: Text(e.toString()),
          duration: Duration(seconds: 5),
          action: SnackBarAction(
            label: 'Close',
            onPressed: () {
              // 点击确认失败提示信息后返回到上一步页面

            },
          ),
        );
        _scaffoldKey.currentState.showSnackBar(snackBar);
      }
    });
  }

  // 模拟的支付商品项item的名称、价格、数量(修改为你正式的商品参数)
  String itemName = 'Top Up';
  String itemPrice = "1.99";
  int quantity = 1;


  // 定义上面第2步调用的创建订单的准备参数
  Map<String, dynamic> getOrderParams() {

    // 商品列表项，这里就模拟一个，正式的时候自行修改为多个动态传参数(可以是你的购物车列表数据)
    List items = [
      {"name": itemName, "quantity": quantity, "price": itemPrice, "currency": defaultCurrency["currency"]}
    ];
    print("${a.topUpValue}");

    // 模拟定义创建订单传参的详细信息数据，
    // paypal官网有更多详细信息
    //总价
    String totalAmount = "1.99";
    //小计
    String subTotalAmount = "1.99";
    //邮费
    String shippingCost = '0';
    //邮费抵扣金额
    int shippingDiscountCost = 0;
    //用户姓名
    String userFirstName = 'Gulshan';
    String userLastName = 'Yadav';

    // 模拟邮寄地址信息准备数据
    String addressCity = 'Delhi';
    String addressStreet = 'Mathura Road';
    String addressZipCode = '110014';
    String addressCountry = 'India';
    String addressState = 'Delhi';
    String addressPhoneNumber = '+919990119091';

    // 模拟定义创建订单map参数对象数据，可自行根据接口参数描述修改
    Map<String, dynamic> temp = {
      "intent": "sale",
      "payer": {"payment_method": "paypal"},
      "transactions": [
        {
          "amount": {
            "total": totalAmount,
            "currency": defaultCurrency["currency"],
            "details": {
              "subtotal": subTotalAmount,
              "shipping": shippingCost,
              "shipping_discount": ((-1.0) * shippingDiscountCost).toString()
            }
          },
          "description": "The payment transaction description.",
          "payment_options": {"allowed_payment_method": "INSTANT_FUNDING_SOURCE"},
          "item_list": {
            "items": items,
            if (isEnableShipping && isEnableAddress)
              "shipping_address": {
                "recipient_name": userFirstName + " " + userLastName,
                "line1": addressStreet,
                "line2": "",
                "city": addressCity,
                "country_code": addressCountry,
                "postal_code": addressZipCode,
                "phone": addressPhoneNumber,
                "state": addressState
              },
          }
        }
      ],
      "note_to_payer": "Contact us for any questions on your order.",
      "redirect_urls": {"return_url": returnURL, "cancel_url": cancelURL}
    };
    return temp;
  }

  @override
  Widget build(BuildContext context) {
    print(checkoutUrl);
    // 判断第2步异步创建订单成功后返回授权页面地址是否为空，不为空代表创建成功，
    // 4. 则使用webview打开此checkoutUrl授权页面展示给用户进行同意支付操作
    if (checkoutUrl != null) {
      return Scaffold(

        // 设置顶部appbar参数
        appBar: AppBar(
          backgroundColor: Theme.of(context).backgroundColor,
          leading: GestureDetector(
            child: Icon(Icons.arrow_back_ios),
            onTap: () => Navigator.pop(context),
          ),
        ),
        // 内容部分直接是一个webview Widget小组件
        body: WebView(
          // 前面初始化方法里面异步获取到的授权支付页面地址
          initialUrl: checkoutUrl,
          // 设置JavascriptMode为不受限制
          javascriptMode: JavascriptMode.unrestricted,
          // 路由跳转委派(代理拦截)，其实就是在webview当前有地址重定向跳转时会进入到该方法
          navigationDelegate: (NavigationRequest request) {

            // 这里判断跳转的地址如果是我们前面创建订单时定义好的
            // 同意授权支付的返回地址说明用户已经同意授权了
            if (request.url.contains(returnURL)) {
              final uri = Uri.parse(request.url);
              final payerID = uri.queryParameters['PayerID'];
              if (payerID != null) {
                // 我们可以获取到跳回的返回地址的请求参数的PayerID，
                // 并且拿到之前创建订单成功后获取到执行扣款executeUrl
                // 5. 调用(后端)接口地址执行扣款
                services.executePayment(executeUrl, payerID, accessToken)
                    .then((id) {
                  // 回调本页面的构造方法传参支付id，返回上一个页面进行后续的处理，
                  // 如：调用后端接口修改我们的订单状态为已支付并显示支付成功
                  widget.onFinish(id);
                  Navigator.push(context,MaterialPageRoute(builder: (context) => TopUpSuccessfulScreen(context)),);
                });
              } else {
                // 支付失败返回上一个页面
                Navigator.push(context,MaterialPageRoute(builder: (context) => TopUpSuccessfulScreen(context)),);
              }
              // 支付失败返回上一个页面
              Navigator.push(context,MaterialPageRoute(builder: (context) => TopUpSuccessfulScreen(context)),);
            }
            // 跳转地址是我们之前创建订单定义的取消地址则直接返回上一个页面并显示支付失败
            if (request.url.contains(cancelURL)) {
              Navigator.of(context).pop();
            }
            return NavigationDecision.navigate;
          },
        ),
      );
    } else {
      // 初始化方法为加载完成之前(checkoutUrl为空)返回正在加载中loading
      return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              }),
          backgroundColor: Colors.black12,
          elevation: 0.0,
        ),
        body: Center(child: Container(child: CircularProgressIndicator())),
      );
    }
  }
}