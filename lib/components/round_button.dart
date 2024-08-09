
import 'package:exec_array/components/color.dart';
import 'package:flutter/material.dart';


class RoundButton extends StatelessWidget {


  final String title;

  final bool loading;

  final VoidCallback onPress;

  const RoundButton({super.key, required this.title,  this.loading = false, required this.onPress });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      splashColor: Colors.grey.withOpacity(0.9), // Splash color effect
      highlightColor: Colors.grey.withOpacity(0.9), // Highlight color effect
      borderRadius: BorderRadius.circular(10), // Same as container's borderRadius
      child: Container(
        height: 50,
        width: 500,
        
        decoration: BoxDecoration(
          color: AppColors.buttonColor,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Center(child: loading ? CircularProgressIndicator(color: Colors.white,) : Text(title, style: TextStyle(color: AppColors.whiteColor,    fontFamily: 'Segoe UI') ,)),
      ),
    );
  }
}
