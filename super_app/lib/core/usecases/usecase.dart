abstract class Usecase<Type, Params> {
  Future<Type> call({Params params});
}

/*
"Her UseCase mutlaka Future dönmeli."
"Her UseCase mutlaka call ismiyle çağrılmalı."
"Her UseCase bir çıktı tipi (Type) ve bir giriş parametresi (Params) almalı."

Tüm usecaselerin uyması gereken standart bir taban sınıf şablonudur.
Görevi: Yazılımcıların UseCase yazarken kafasına göre metot ismi vermesini engeller. Herkes execute veya call ismini kullanır. Böylece sistem daha düzenli olur.
*/
