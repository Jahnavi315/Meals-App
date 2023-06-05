import 'package:flutter/material.dart';
//import 'package:meals_app/screens/tabs.dart';
//import 'package:meals_app/widgets/main_drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/filters_provider.dart';

class FiltersScreen extends ConsumerWidget{//changing this to stateless from stateful//avoid managing local state
  const FiltersScreen({super.key});
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar( 
        title: const Text('Filters'),
      ),
      body: 
        Column( 
          children: [ 
            //if wished to have this widget in separate file, we can make this Screen a Stateless and each 
            //filter item as stateful to indicate when switch is changed OR just pass required values, functions and manage state in this file only
            SwitchListTile(
              value: activeFilters[Filter.glutenFree]!, 
              onChanged: (isChecked){
                ref.read(filtersProvider.notifier).setFilter(Filter.glutenFree, isChecked);
              },
              title: Text(
                'Gluten-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith( 
                  color: Theme.of(context).colorScheme.onBackground
                ),
              ),
              subtitle: Text(
                'Only include gluten-free meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith( 
                  color: Theme.of(context).colorScheme.onBackground
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 35,right: 22),
            ),
            SwitchListTile(
              value: activeFilters[Filter.lactoseFree]!, 
              onChanged: (isChecked){
                /*setState(() {
                  _lactoseFreeFilterSet=isChecked;
                });*/
                ref.read(filtersProvider.notifier).setFilter(Filter.lactoseFree, isChecked);
              },
              title: Text(
                'Lactose-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith( 
                  color: Theme.of(context).colorScheme.onBackground
                ),
              ),
              subtitle: Text(
                'Only include lactose-free meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith( 
                  color: Theme.of(context).colorScheme.onBackground
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 35,right: 22),
            ),
            SwitchListTile(
              value: activeFilters[Filter.vegan]!, 
              onChanged: (isChecked){
                ref.read(filtersProvider.notifier).setFilter(Filter.vegan, isChecked);
              },
              title: Text(
                'Vegan',
                style: Theme.of(context).textTheme.titleLarge!.copyWith( 
                  color: Theme.of(context).colorScheme.onBackground
                ),
              ),
              subtitle: Text(
                'Only include vegan meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith( 
                  color: Theme.of(context).colorScheme.onBackground
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 35,right: 22),
            ),
            SwitchListTile(
              value: activeFilters[Filter.vegetarian]!, 
              onChanged: (isChecked){
                ref.read(filtersProvider.notifier).setFilter(Filter.vegetarian, isChecked);
              },
              title: Text(
                'Vegetarian',
                style: Theme.of(context).textTheme.titleLarge!.copyWith( 
                  color: Theme.of(context).colorScheme.onBackground
                ),
              ),
              subtitle: Text(
                'Only include Vegetarian meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith( 
                  color: Theme.of(context).colorScheme.onBackground
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 35,right: 22),
            )
          ],
        ),
    );
  }
}
/*@override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _FilersScreenState();
  }
}

class _FilersScreenState extends ConsumerState<FiltersScreen>{
  
  var _glutenFreeFilterSet = false;//cant access widget directly because both are instance variables,instead we can
  //access them in a method => use initState
  var _lactoseFreeFilterSet = false;
  var _veganFilterSet = false;
  var _vegetarianFilterSet = false;
  @override
  void initState() {
    final currentFilters = ref.read(filtersProvider);
    _glutenFreeFilterSet = currentFilters[Filter.glutenFree]!;//access them in a method => use initState
    _lactoseFreeFilterSet = currentFilters[Filter.lactoseFree]!;
    _veganFilterSet = currentFilters[Filter.vegan]!;
    _vegetarianFilterSet = currentFilters[Filter.vegetarian]!;
    super.initState();
  }*/
  /*drawer: MainDrawer(//but we dont need to display drawer on filters screen
        onSelectScreen: (String screen){
          Navigator.of(context).pop();
          if(screen=='Meals'){
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (cxt){
            return const TabsScreen();
          }));  
          }
          
        }
      ),*/
/*
WillPopScope(
        onWillPop: () async{
          ref.read(filtersProvider.notifier)
          .setFilters({
           Filter.glutenFree:_glutenFreeFilterSet,
           Filter.lactoseFree:_lactoseFreeFilterSet,
           Filter.vegan:_veganFilterSet,
           Filter.vegetarian:_vegetarianFilterSet 
          });
          //Navigator.of(context).pop();
          return true;
        },*/