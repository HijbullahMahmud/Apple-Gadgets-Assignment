import 'package:apple_gadgets_assignment/model/trade.dart';
import 'package:apple_gadgets_assignment/services/network_service.dart';
import 'package:get/get.dart';

class TradeListController extends GetxController {
  bool isLoading = false;
  List<Trade> tradeList = [];
  double totalProfits = 0.0;

  Future<void> getTradeList() async {
    isLoading = true;
    totalProfits = 0.0;
    update();
    var list = await NetworkService().tradeList();
    tradeList = list;
    _calculateTotalProfit();
    isLoading = false;
    update();
  }

  void _calculateTotalProfit() {
    double profit = 0.0;
    for (Trade trade in tradeList) {
      profit += trade.profit ?? 0.0;
    }
    totalProfits = profit;
    update();
  }
}
