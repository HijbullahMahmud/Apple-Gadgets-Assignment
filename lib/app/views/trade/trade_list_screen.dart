import 'package:apple_gadgets_assignment/app/controllers/trade_list_controller.dart';
import 'package:apple_gadgets_assignment/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../model/trade.dart';

class TradeListScreen extends StatelessWidget {
  const TradeListScreen({super.key});

  TradeListController get controller => Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.tradeList),
      ),
      body: RefreshIndicator(
          child: GetBuilder<TradeListController>(
            initState: (_) => controller.getTradeList(),
            builder: (controller2) {
              return controller2.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: controller2.tradeList.length,
                      itemBuilder: (BuildContext context, int index) {
                        Trade trade = controller2.tradeList[index];
                        return ListTile(
                          title: Text(
                              "Current Proce: ${trade.currentPrice.toString()}"),
                          titleTextStyle:
                              Theme.of(context).textTheme.bodyMedium,
                          subtitle: Text("Profit: ${trade.profit.toString()}"),
                          dense: true,
                        );
                      },
                    );
            },
          ),
          onRefresh: () => controller.getTradeList()),
      bottomNavigationBar: GetBuilder<TradeListController>(builder: (context) {
        return Container(
          height: 50,
          decoration: const BoxDecoration(color: Colors.grey),
          child: Center(
              child: Text(
                  "Total Profilt: ${controller.totalProfits.toStringAsFixed(2)}")),
        );
      }),
    );
  }
}
