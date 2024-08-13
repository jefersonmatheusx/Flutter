import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/utils/app_routes.dart';

class MealItem extends StatelessWidget {
  final Meal meal;

  const MealItem({
    super.key,
    required this.meal,
  });

  selectMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(AppRoutes.MEAL_DETAIL, arguments: meal)
        .then((result) {
      if (result == null) {
        print('Sem resultados');
        return;
      } else {
        print('O nome da refeição é $result.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => selectMeal(context),
        borderRadius: BorderRadius.circular(15),
        splashColor: Theme.of(context).colorScheme.primary,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 4,
          margin: const EdgeInsets.all(10),
          child: Column(children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    meal.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    child: Text(
                      meal.title,
                      style: const TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
                      children: [
                        Icon(Icons.schedule),
                        const SizedBox(width: 6),
                        Text('${meal.duration} min'),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.work),
                        const SizedBox(width: 6),
                        Text(meal.complexityText),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.attach_money),
                        const SizedBox(width: 6),
                        Text(meal.affordabilityText),
                      ],
                    )
                  ],
                )),
          ]),
        ));
  }
}
