class StringConstants {
  static const String mainPageTitleOne = 'Current Exhibitions';
  static const String mainPageTitleTwo = 'Famous Artworks';
  static const String mainPageTitleThree = 'Turkish Exhibitions';
}

/*

Bunu GetIt ile yapmak iyi bir tercih değil çünkü GetIt gibi bağımlılık yönetimi bölümünde
genellikle çalışma anında durumu değişebilen ögeler tutulur

sabitler static const ile doğruca derlenip bellekte sabit yere sahip olduğu için gerek yok

! ÇOK ÖNEMLİ

* Hazır gelmişken öğrenelim, kurucu fonksiyonda {} varsa başka bir yerde bu fonksiyonu çağırırken width: gibi özelliği vererek çağırıyorsun

*/