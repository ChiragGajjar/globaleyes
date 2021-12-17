import 'package:globaleyes/common_imports.dart';

class CustomDialog extends StatelessWidget {
  final String title, description, buttonText;
  final ImageProvider image;

  CustomDialog({
    required this.title,
    required this.description,
    required this.buttonText,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(
            top: 50.0,
            // bottom: 16.0,
            left: 16.0,
            right: 16.0,
          ),
          margin: const EdgeInsets.only(top: 30.0),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: Offset(0.0, 10.0),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // To make the card compact
            children: <Widget>[
              Text(
                title,
                style: const TextStyle(
                    fontSize: 16,
                    color: AppColors.black,
                    fontFamily: FontsFamily.GilroyRegular,
                    fontWeight: FontWeight.normal),
              ),
              SizedBox(height: 6.h),
              Text(
                description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 16,
                    color: AppColors.black,
                    fontFamily: FontsFamily.GilroyRegular,
                    fontWeight: FontWeight.normal),
              ),
              SizedBox(height: 6.h),
              Align(
                alignment: Alignment.center,
                child: FlatButton(
                  minWidth: double.infinity,
                  color: AppColors.appThemeColor,
                  onPressed: () {
                    Navigator.of(context).pop(); // To close the dialog
                  },
                  child: Text(
                    buttonText,
                    style: const TextStyle(
                        fontSize: 16,
                        color: AppColors.white,
                        fontFamily: FontsFamily.GilroyRegular,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: 16.0,
          right: 16.0,
          child: CircleAvatar(
            radius: 30,
            backgroundColor: AppColors.yellowButton,
            child: CircleAvatar(
              backgroundColor: AppColors.white,
              radius: 28.0,
              child: Image(image: image),
              // child: Image(image: AppImages.ic_app_logo_circle,),
              // backgroundImage: Image(image: AppImages.ic_back_grey),
            ),
          ),
        ),
      ],
    );
  }
}
