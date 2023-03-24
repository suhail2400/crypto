import 'package:crypto_price_tracker/controllers/coin_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils.dart';


class HomeScreen extends StatelessWidget {
  final CoinController controller = Get.put(CoinController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff494F55),
      body: Padding(
        padding: const EdgeInsets.only(left: 20,right:20,top:50),
        child: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text(
              "Crypto Market",style: textStyle(25,Colors.white,FontWeight.bold),
            ),
            Obx(
              ()=> controller.isLoading.value ? const Center(child: CircularProgressIndicator(),) : ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: controller.coinsList.length,
                itemBuilder: (context,index){
                  return Padding(
                    padding: const EdgeInsets.only(bottom:20),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  color:Colors.grey[700],
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                      color:Colors.grey[700]!,
                                      offset: const Offset(4, 4),
                                      blurRadius: 5
                                    )
                                  ]
                                ),
                                child: Padding(padding: EdgeInsets.all(10),
                                child:Image.network(controller.coinsList[index].image)
                                ),
                              ),
                              const SizedBox(width: 20,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            SizedBox(height: 10,),
                            Text(controller.coinsList[index].name,style:textStyle(18,Colors.white,FontWeight.w600)),
                            Text(controller.coinsList[index].priceChangePercentage24H.toStringAsFixed(2),style:textStyle(18,Colors.grey,FontWeight.w600))
                          ],),
                            ],
                          ),
                          
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            SizedBox(height: 10,),
                            Text("\$ ${controller.coinsList[index].currentPrice}",style:textStyle(18,Colors.white,FontWeight.w600)),
                            Text(controller.coinsList[index].symbol,style:textStyle(18,Colors.grey,FontWeight.w600))
                          ],),
                        ],
                      ),
                    ),
                  );
                }),
            )
          ]),
        ),
      ),
    );
  }
}