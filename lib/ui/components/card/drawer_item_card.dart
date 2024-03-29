import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:quan_ly_chi_tieu/configs/constants.dart';
import 'package:quan_ly_chi_tieu/ui/home_screen.dart';

class DrawerItem extends StatefulWidget {
  String email;
  DrawerItem({Key? key,required this.email}) : super(key: key);
  @override
  State<DrawerItem> createState() => _DrawerItemState();
}
class _DrawerItemState extends State<DrawerItem> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: const Text("Quản Lý Chi Tiêu"),
            accountEmail: Text(widget.email),
            currentAccountPicture: const CircleAvatar(
              backgroundColor: Colors.orange,
              child: Text(
                "T",
                style: TextStyle(fontSize: 40.0),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.account_balance_sharp),
            title: const Text("Trang chủ"),
            onTap: () {
              Navigator.pushNamed(context, Constants.homeScreen,arguments:HomeScreen.email);
            },
          ),
          ListTile(
            leading: const Icon(Icons.account_balance_wallet_sharp),
            title: const Text("Quản lý thu"),
            onTap: () {
              Navigator.pushNamed(context, Constants.collectScreen);
            },
          ),
          ListTile(
            leading: const Icon(Icons.account_balance_wallet_rounded),
            title: const Text("Quản lý chi"),
            onTap: () {
             Navigator.pushNamed(context, Constants.spendScreen);
            },
          ),
          ListTile(
            leading: const Icon(Icons.account_tree_sharp),
            title: const Text("Thống kê"),
            onTap: () {
              Navigator.pushNamed(context, Constants.statisticalScreen);
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_card),
            title: const Text("Đổi mật khẩu"),
            onTap: () {
             Navigator.pushNamed(context, Constants.changePasswordScreen);
            },
          ),
          // const Divider(height: 5,), //here is a divider
          // ListTile(
          //   leading: const Icon(Icons.settings),
          //   title: const Text("Cài đặt"),
          //   onTap: () {
          //     Navigator.pushNamed(context, Constants.settingScreen);
          //   },
          // ),
          ListTile(
            leading: const Icon(Icons.arrow_back),
            title: const Text("Đăng xuất"),
            onTap: () async {

              var result = await showOkCancelAlertDialog(
                  context: context,
                  title: "Thông báo ",
                  okLabel: "Đồng ý",
                  cancelLabel: "Hủy",
                  message:
                  'Bạn có muốn đăng xuất !');
              if (result == OkCancelResult.ok) {
                Navigator.pushNamed(context, Constants.loginScreen);

              }
            },
          ),
        ],
      ),
    );
  }
}
