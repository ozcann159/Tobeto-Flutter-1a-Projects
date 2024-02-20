import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miniblog/blocs/article_bloc/article_State.dart';
import 'package:miniblog/blocs/article_bloc/article_event.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {

  ArticleBloc() : super(ArticlesInitial()) {   //Bloc oluşturduk(initial değer vermek zorundayız)
    on<FetchArticles>(_onFetchArticles);    //event ve emit komutunu aşağı yazdık // oluştuğum anda fırlayabilecek eventlerin ne yapacağını yazdık. Fetched articles fırlarsa aşağıdaki fonksiyonu çalıştır.       
  }


//state türündeki emitter o fonksiyona gönderilir.
  void _onFetchArticles(FetchArticles event, Emitter<ArticleState> emit) async {  //eventler fırladığında çalışacak fonksiyon
    emit(ArticlesLoading());                     //emitter: State değiştiren mekanizma.Emit ile fonksiyon içini değiştirdik

    //....


    //.. ArticlesLoaded, ArticlesError



  }
}
