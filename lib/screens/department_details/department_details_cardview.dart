
import '../../../../../common_imports.dart';

class DepartmentDetailsCardView extends StatefulWidget {
  const DepartmentDetailsCardView({Key? key}) : super(key: key);

  @override
  DepartmentDetailsCardViewState createState() => DepartmentDetailsCardViewState();
}

class DepartmentDetailsCardViewState extends State<DepartmentDetailsCardView> {

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        padding: const EdgeInsets.all(10),
        // height: 60.h,
        decoration: BoxDecoration(
          color: AppColors.darkBlue.withAlpha(30),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0.r),
            bottomLeft: Radius.circular(10.0.r),
            topRight: Radius.circular(10.0.r),
            bottomRight: Radius.circular(10.0.r),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(left: 10.w, right: 10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Shipping',
                    overflow: TextOverflow.visible,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 15.0,
                      fontFamily: FontsFamily.GilroyRegular,
                      fontWeight: FontWeight.bold,
                      color:AppColors.black,
                    ),
                  ),
                   SizedBox(height: 10.0),
                  Text(
                    '8/23/2020 9:38 PM',
                    overflow: TextOverflow.visible,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 15.0,
                      fontFamily: FontsFamily.GilroyRegular,
                      fontWeight: FontWeight.w400,
                      color:AppColors.black,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'David Pastry',
                    overflow: TextOverflow.visible,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 15.0,
                      fontFamily: FontsFamily.GilroyRegular,
                      fontWeight: FontWeight.w400,
                      color:AppColors.black,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Container(
              margin: const EdgeInsets.all(10),
              child: const Image(
                image:AppImages.arrowWhite,
                height: 20,
                width: 20,
                color: AppColors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

}