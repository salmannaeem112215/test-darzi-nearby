import 'package:darzi_nearby/commons/commons.dart';

class Btn extends StatelessWidget {
  Btn({
    super.key,
    this.height,
    this.width,
    this.onTap,
    this.titleText = 'Add',
    this.title,
    this.padding,
  });

  Btn.floating({
    super.key,
    this.onTap,
    EdgeInsets? padding,
    this.titleText = 'Add',
    this.title,
  })  : height = 60,
        padding = padding ?? const EdgeInsets.symmetric(horizontal: 16),
        width = null;
  final double? height;
  final double? width;
  final EdgeInsets? padding;
  final FutureOr<void> Function()? onTap;
  final String titleText;
  final Widget Function(Color)? title;

  final RxBool isLoading = false.obs;

  FutureOr<void> Function()? get _onTap => onTap == null
      ? null
      : () async {
          try {
            isLoading.value = true;
            await onTap!();
          } catch (e) {
            Utility.showError(e);
          }
          isLoading.value = false;
        };

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final canTap = !isLoading.value;
      return Container(
        padding: padding,
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: Colors.white70, borderRadius: BorderRadius.circular(14)),
        child: InkWell(
          onTap: canTap ? _onTap : null,
          borderRadius: BorderRadius.circular(14),
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  offset: const Offset(-5, -5),
                  blurRadius: 10,
                  spreadRadius: 2,
                )
              ],
              gradient: LinearGradient(
                begin: Alignment.bottomLeft, // Adjusted for bottom-left
                end: Alignment.topLeft, // Adjusted for top-right
                colors: [
                  Colors.orange.withOpacity(canTap ? 0.2 : 0.08),
                  Colors.blue.withOpacity(canTap ? 0.2 : 0.08),
                ],
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.white,
                    blurRadius: 12,
                  )
                ],
              ),
              child: Center(
                child: canTap
                    ? title != null
                        ? title!(Colors.red)
                        : Text(
                            titleText,
                            style: const TextStyle(
                              color: Colors.red,
                              fontSize: 16,
                            ),
                          )
                    : Container(
                        height: 24,
                        padding: const EdgeInsets.all(2),
                        width: 24,
                        child: const CircularProgressIndicator(
                          color: Colors.red,
                          strokeWidth: 2,
                          strokeCap: StrokeCap.butt,
                        ),
                      ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
