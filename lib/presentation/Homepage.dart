import 'package:bloc_app/data/ProductRepository.dart';
import 'package:bloc_app/data/model/product_list_entity.dart';
import 'package:bloc_app/domain/ProductBloc.dart';
import 'package:bloc_app/domain/ProductEvent.dart';
import 'package:bloc_app/domain/ProductStates.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/*
Multi Bloc Provider
*/

class HomePage extends StatelessWidget {
  final ProductRepository productRepository;

  const HomePage({
    super.key,
    required this.productRepository,
  });

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [RepositoryProvider.value(value: productRepository)],
      child: MultiBlocProvider(
          providers: [
            BlocProvider<ProductBLoc>(
              create: (BuildContext context) => ProductBLoc(productRepository),
            )
          ],
          child: MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              home: Scaffold(
                appBar: AppBar(
                  title: const Text('Zara'),
                ),
                body: blocBody(),
              ))),
    );
  }

  Widget blocBody() {
    return BlocProvider(
      create: (context) => ProductBLoc(
        productRepository,
      )..add(LoadProductEvent()),
      child: BlocConsumer<ProductBLoc, ProductStates>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is ProductLoadingState) {
            return const Center(
                widthFactor: 20,
                heightFactor: 20,
                child: CircularProgressIndicator());
          }
          if (state is ProductLoadedStates) {
            print(state.products);
            return ListView.builder(
                itemCount: state.products.products?.length,
                itemBuilder: (_, index) {
                  return Padding(
                      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                      child: Card(
                        color: Theme.of(context).primaryColor,
                        child: ListTile(
                          title: Text(
                            state.products.products?[index].title ?? '',
                            style: TextStyle(color: Colors.white),
                          ),
                          subtitle: Text(
                            state.products.products?[index].description ?? '',
                            style: TextStyle(color: Colors.greenAccent),
                          ),
                          leading: CircleAvatar(
                              child: ClipOval(
                            child: CachedNetworkImage(
                              width: MediaQuery.of(context).size.width,
                              height: 130.0,
                              fit: BoxFit.cover,
                              imageUrl:
                                  state.products.products?[index].thumbnail ??
                                      '',
                              placeholder: (context, url) => Center(
                                  widthFactor: 14,
                                  heightFactor: 14,
                                  child: CircularProgressIndicator()),
                              errorWidget: (context, url, error) => const Icon(
                                Icons.flutter_dash_rounded,
                                size: 100,
                                color: Colors.grey,
                              ),
                            ),
                          )),
                        ),
                      ));
                });
          }
          if (state is ProductErrorStates) {
            return Text('Error');
          }
          return Container();
        },
      ),
    );
  }
}