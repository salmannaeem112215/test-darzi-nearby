// ignore_for_file: unnecessary_import, unused_import, prefer_const_constructors

// ignore: depend_on_referenced_packages
import 'package:url_launcher/url_launcher.dart';

import 'package:darzi_nearby/commons/commons.dart';

import 'controller/controller.dart';

class DarziProfileScreen extends StatefulWidget {
  const DarziProfileScreen({super.key, required this.data});
  final DarziInfo data;
  @override
  State<DarziProfileScreen> createState() => _DarziProfileScreenState();
}

class _DarziProfileScreenState extends State<DarziProfileScreen> {
  final controller = Get.find<DarziProfileController>();
  @override
  void initState() {
    super.initState();
  }

  void openWhatsApp() async {
    String url = 'https://wa.me/${widget.data.phoneNo.toWhatsAppFormat}';
    launchUrl(Uri.parse(url));
  }

  void openMap() async {
    String url = widget.data.locationUrl.value;
    launchUrl(Uri.parse(url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Profile",
          style: MyTextStyles.r24LightBrown,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Flexible(
                  child: DarziProfilePic(url: widget.data.userImgUrl),
                ),
                const SizedBox(width: 20),
                Flexible(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                          child: FittedBox(
                        child: Text(
                          widget.data.fullname.value,
                          maxLines: 1,
                          style: MyTextStyles.r20SemiBold,
                        ),
                      )),
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              widget.data.phoneNo.toWhatsAppFormatWithSpaces,
                              style: MyTextStyles.r13SemiBold,
                            ),
                          ),
                          const SizedBox(width: 8),
                          GestureDetector(
                            onTap: openWhatsApp,
                            child: Image.asset(IconConfig.whatsapp),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                              child: Text(
                            widget.data.address.value,
                          )),
                          const SizedBox(width: 3),
                          GestureDetector(
                            onTap: openMap,
                            child: Icon(
                              Icons.location_on_rounded,
                              color: ColorConfig.blue,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 16),
          HeaderTile(title: 'Services'),
          const SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              itemCount: widget.data.services.length,
              itemBuilder: (context, index) =>
                  ServiceTile(widget.data.services[index]),
            ),
          )
        ],
      ),
    );
  }
}
