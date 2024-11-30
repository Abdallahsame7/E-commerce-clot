import 'package:flutter/material.dart';
import 'package:training_project/core/app_colors.dart';

class TrackOrder extends StatefulWidget {
  const TrackOrder({super.key, required this.order_number});
  final String order_number;
  @override
  State<TrackOrder> createState() => _TrackOrderState();
}

class _TrackOrderState extends State<TrackOrder> {
  List<String> orders_info = [
    "Delivered",
    "Shipped",
    "Order Confirmed",
    "Order Placed"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Order #${widget.order_number}",
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height * 0.35,
              // color: Colors.grey,
              child: ListView.builder(
                itemCount: orders_info.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    minVerticalPadding:
                        MediaQuery.sizeOf(context).height * 0.025,
                    trailing: Text(
                      "28 May",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                    leading: Icon(
                      Icons.check_circle_sharp,
                      size: 35,
                      color: AppColors.purple,
                    ),
                    title: Text(
                      orders_info[index],
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                    ),
                  );
                },
              ),
            ),
            Text(
              "Order Items",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.020,
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(bottom: 10),
              height: MediaQuery.sizeOf(context).height * 0.12,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColors.grey),
              child: ListTile(
                leading: Container(
                  width: MediaQuery.sizeOf(context).height * 0.050,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/orders_icon.png"))),
                ),
                trailing: TextButton(
                    onPressed: () {},
                    child: Text(
                      "View All",
                      style: TextStyle(
                          color: AppColors.purple,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    )),
                //////////change the number
                title: Text("4 items"),
                titleTextStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: AppColors.black,
                    fontSize: 20),
              ),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.020,
            ),
            Text(
              "Shipping details",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.020,
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(bottom: 10),
              height: MediaQuery.sizeOf(context).height * 0.12,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColors.grey),
              child: ListTile(
                title: Text("Egypt, Cairo, department 250"),
                titleTextStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                    fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }
}
