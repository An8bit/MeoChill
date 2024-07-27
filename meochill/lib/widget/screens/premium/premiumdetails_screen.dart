import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meochill/common/enum/load_status.dart';
import 'package:meochill/repostsitories/api.dart';
import 'package:meochill/widget/navigator/navigartor.dart';
import 'package:meochill/widget/screens/premium/cubit/premium_cubit.dart';
import 'package:meochill/widget/screens/premium/cubit/premium_state.dart';

class SubscriptionPage extends StatefulWidget {
  @override
  _SubscriptionPageState createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<SubscriptionPage> {
  double _sliderValue = 0.0; // Slider value to select the date

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PremiumCubit(context.read<Api>()),
      child: BuyDetail(),
    );
  }
}

class BuyDetail extends StatelessWidget {
  const BuyDetail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PremiumCubit, PremiumState>(
      listener: (context, state) {
        if (state.loadStatus == LoadStatus.Done && state.isPremium) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Đăng ký thành công"),
              backgroundColor: Colors.green,
            ),
          );
           Future.microtask(() {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ),
        );
      });}
       else if(state.isPremium){
         ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Tài khoản đã được đăng ký"),
              backgroundColor: Colors.yellow,
            ),
          );
       }
        
        else{
           ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Lỗi"),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Mua YouTube Premium'),
            backgroundColor: Colors.black,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                ListTile(
                  title: const Text('MellChill Premium',
                      style: TextStyle(color: Colors.white)),
                  subtitle: const Text('MellChill',
                      style: TextStyle(color: Colors.grey)),
                  leading: Image.asset("assets/images.png"),
                ),
                Container(
                  padding: EdgeInsets.all(16),
                  child: const Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              'Ngày bắt đầu hôm nay',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                              overflow: TextOverflow
                                  .ellipsis, // Prevents text from overflowing
                            ),
                          ),
                          SizedBox(width: 8), // Space between elements
                          Flexible(
                            child: Text(
                              '2 tháng dùng thử miễn phí',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow
                                  .ellipsis, // Prevents text from overflowing
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10), // Space between the rows
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              'Ngày bắt đầu 26 thg 9, 2024',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                              ),
                              overflow: TextOverflow
                                  .ellipsis, // Use ellipsis for text overflow
                            ),
                          ),
                          SizedBox(width: 8), // Space between elements
                          Flexible(
                            child: Text(
                              '79.000 đ/tháng + thuế',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                              ),
                              overflow: TextOverflow
                                  .ellipsis, // Use ellipsis for text overflow
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Thêm thuế',
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                      Text(
                          '• Hủy bất kỳ lúc nào trong phần Đăng ký trên Google Play',
                          style: TextStyle(color: Colors.grey)),
                      Text(
                          '• Bạn sẽ không bị tính phí nếu hủy trước 26 thg 9, 2024',
                          style: TextStyle(color: Colors.grey)),
                      Text(
                          '• Chúng tôi sẽ gửi thông báo để nhắc bạn 7 ngày trước khi thời gian dùng thử của bạn kết thúc',
                          style: TextStyle(color: Colors.grey)),
                      SizedBox(height: 20),
                      ListTile(
                        leading: Icon(Icons.account_balance_wallet,
                            color: Colors.blue),
                        title: Text('MoMo e-wallet: ....30843',
                            style: TextStyle(color: Colors.white)),
                        trailing:
                            Icon(Icons.arrow_forward_ios, color: Colors.white),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Việc bạn nhấn vào 'Đăng ký' có nghĩa là bạn đồng ý rằng gói thuê bao của bạn sẽ tự động gia hạn cho đến khi bị hủy. Chúng tôi sẽ thông báo cho bạn khi giá thay đổi, theo mô tả trong Điều khoản dịch vụ của Google Play. Tìm hiểu cách hủy. Tùy chọn khác",
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  onPressed: () {

                  
                     context.read<PremiumCubit>().buyPremium();
               
                    
                    
                  },
                  child: const Text('Đăng ký',
                      style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
          backgroundColor: Colors.black,
        );
      },
    );
  }
}
