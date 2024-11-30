import 'dart:math';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:training_project/core/app_colors.dart';
import 'package:training_project/views/track_order/track_order.dart';

class Orders2 extends StatefulWidget {
  const Orders2({super.key});

  @override
  State<Orders2> createState() => _Orders2State();
}

class _Orders2State extends State<Orders2> {
  static const int pageSize = 5;

  final Random _random = Random();
  List<int> ordersNumber = List.generate(30, (index) => index);
  final PagingController<int, Map<String, dynamic>> _pagingController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener(
      (pageKey) => _loadMoreItems(pageKey),
    );
  }

  void _loadMoreItems(int pageKey) {
    if (pageKey >= ordersNumber.length) return;

    final endIndex = (pageKey + pageSize).clamp(0, ordersNumber.length);
    final newItems = ordersNumber
        .sublist(pageKey, endIndex)
        .map((e) => {'id': _random.nextInt(1000) + 1})
        .toList();

    if (endIndex == ordersNumber.length) {
      _pagingController.appendLastPage(newItems);
    } else {
      _pagingController.appendPage(newItems, endIndex);
    }
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Orders',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          bottom: TabBar(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.sizeOf(context).height * 0.010),
            indicatorWeight: 5,
            labelPadding: EdgeInsets.all(5),
            automaticIndicatorColorAdjustment: false,
            splashBorderRadius: BorderRadius.circular(20),
            dividerHeight: 0,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.purple,
            ),
            indicatorSize: TabBarIndicatorSize.tab,
            labelStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.white),
            tabs: [
              Text("Processing"),
              Text("Shipped"),
              Text("Delivered"),
              Text("Returned"),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: PagedListView<int, Map<String, dynamic>>(
            pagingController: _pagingController,
            builderDelegate: PagedChildBuilderDelegate<Map<String, dynamic>>(
              itemBuilder: (context, item, index) {
                return Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(bottom: 10),
                  height: MediaQuery.sizeOf(context).height * 0.12,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColors.grey,
                  ),
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TrackOrder(
                                order_number: item["id"].toString())),
                      );
                    },
                    leading: Container(
                      width: MediaQuery.sizeOf(context).height * 0.050,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/orders_icon.png")),
                      ),
                    ),
                    trailing: Icon(
                      Icons.navigate_next_rounded,
                      size: 40,
                      color: AppColors.black,
                    ),
                    title: Text(
                        'Order #${item["id"]}'), // Display the random order number
                    titleTextStyle: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: AppColors.black,
                        fontSize: 20),
                    subtitle: Text('4 items'),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
