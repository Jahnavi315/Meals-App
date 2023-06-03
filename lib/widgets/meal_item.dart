import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:meals_app/widgets/meal_item_trait.dart';

class MealItem extends StatelessWidget{
  const MealItem({super.key,required this.meal,required this.onSelectMeal});
  final Meal meal;
  final void Function() onSelectMeal;
  String get complexityText{
    return meal.complexity.name[0].toUpperCase() + meal.complexity.name.substring(1);
  }
  String get affordabilityText{
    return meal.affordability.name[0].toUpperCase() + meal.affordability.name.substring(1);
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8))
      ),
      clipBehavior: Clip.hardEdge,//as stack by default ignores the shape that's set ,to enforce this any content that goes out of shape is cut off
      elevation: 1.5,
      child: InkWell(
        onTap: onSelectMeal,
        child: Stack(
          children: [
            //bottom to top of stack
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage), 
              image: NetworkImage(meal.imageUrl),
              fit: BoxFit.cover,//to show the image completely and zoom in if necessary
              height: 210,//to avoid improper jumps before its loading
              width: double.infinity,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container( 
                color: Colors.black54,
                padding: const EdgeInsets.symmetric(horizontal:45,vertical: 7 ),
                child: Column(
                  children: [
                      Text(
                        meal.title,
                        textAlign: TextAlign.center,
                        maxLines: 2,//max 2 lines only shown if its too long
                        overflow: TextOverflow.ellipsis,
                        //if occurs how it should be handled ellipsis gives 3 dots indicating overflow
                        softWrap: true,
                        style: const  TextStyle( 
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row( //no need to wrap because width of parent row is set because of positioned and left,right
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MealItemTrait(icon: Icons.schedule, label: '${meal.duration} min'),
                          const SizedBox(width: 12),
                          MealItemTrait(icon: Icons.work, label: complexityText),
                          const SizedBox(width: 12),
                          MealItemTrait(icon: Icons.attach_money, label: affordabilityText)
                        ],
                      )
                  ],
                ),
              )
            )
          ]
        ),
      ),
    );
  }
}