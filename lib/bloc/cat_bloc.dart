import 'package:eazy_shop/models/cat/cat_list.dart';
import 'package:eazy_shop/models/subCat/sub_cat_list.dart';
import 'package:eazy_shop/persistence/repository.dart';
import 'package:rxdart/rxdart.dart';

class CategoryBloc {
  Repository _repository = Repository();

  //Create a PublicSubject object responsible to add the data which is got from
  // the server in the form of WeatherResponse object and pass it to the UI screen as a stream.
  final _catFetcher = PublishSubject<Categories>();
  final _subCatFetcher = PublishSubject<SubCategories>();

  //This method is used to pass the weather response as stream to UI
  Stream<Categories> get categories => _catFetcher.stream;
  Stream<SubCategories> get subCategories => _subCatFetcher.stream;

  getCategories() async {
    Categories weatherResponse = await _repository.getCategories();
    _catFetcher.sink.add(weatherResponse);
  }

  getSubCategories() async {
    SubCategories subCatResponse = await _repository.getSubCategories();
    _subCatFetcher.sink.add(subCatResponse);
  }

  dispose() {
    //Close the weather fetcher
    _catFetcher.close();
    _subCatFetcher.close();
  }
}

final catBloc = CategoryBloc();
