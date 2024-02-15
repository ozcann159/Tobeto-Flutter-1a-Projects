import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:mealsapp/models/meal.dart";

final mealsProvider = Provider((ProviderRef ref) {
  return [
    Meal(
      id: "1",
      categoryId: "1",
      name: "Mercimek Çorbası",
      imageUrl:
          "https://www.acibadem.com.tr/hayat/Images/YayinTarifler/mercimek-corbasi_7817_1.jpg",
      ingredients: [
        "2 Su bardağı Mercimek",
        "1 Adet Soğan",
        "2 Yemek Kaşığı Un",
        "1 Adet Havuç",
        "1 Kaşım Salça",
        "5 Yemek Kaşığı Sıvı Yağ",
        "Tuz"
      ],
      recipe: "Mercimeği iyice yıkayın ve süzün."
          "Soğanı yemeklik doğrayın, havucu rendeleyin."
          "Bir tencerede sıvı yağı ısıtın. Doğranmış soğanı ekleyip pembeleşene kadar kavurun."
          "Üzerine rendelenmiş havucu ilave edip bir süre daha kavurun."
          "Unu ekleyip kokusu çıkana kadar kavurun."
          "Salçayı ekleyip karıştırın."
          "Mercimekleri ekleyip karıştırın."
          "Tuz, karabiber ve isteğe bağlı olarak pul biberi ekleyin."
          "Üzerine suyu ekleyip karıştırın."
          "Kaynamaya bırakın ve ardından kısık ateşte mercimekler iyice pişene kadar pişirin."
          "Pişen çorbayı blender ile pürüzsüz hale getirin."
          "Servis yaparken üzerine isteğe bağlı olarak limon sıkabilir ve biraz zeytinyağı ekleyebilirsiniz."
          "Afiyet olsun!",
    ),
    Meal(
      id: "2",
      categoryId: "2",
      name: "Mücver",
      imageUrl:
          "https://mljwce6xovfs.i.optimole.com/cb:0pW1.3b079/w:auto/h:auto/q:mauto/f:best/https://www.glutensizhayat.com.tr/wp-content/uploads/2023/03/glutensiz-mucver-001.jpg",
      ingredients: [],
      recipe: "Kabakları rendeleyin ve üzerine biraz tuz serpip suyunu sıkın."
          "Havuç ve patatesi rendeleyin."
          "Soğanı ince ince doğrayın."
          "Rendelenmiş kabak, havuç, patates ve doğranmış soğanı derin bir kaba alın."
          "İçerisine yumurtaları kırın, unu ekleyin ve karıştırın."
          "Rendelenmiş beyaz peyniri, taze soğanı ve taze naneyi ekleyip karıştırın."
          "Karışıma tuz ve karabiber ekleyip iyice karıştırın."
          "Karışımdan ceviz büyüklüğünde parçalar alıp avuç içinde şekil verin."
          "Tavaya sıvı yağ koyun ve mücverleri kızartın."
          "Kağıt havlu üzerine alarak fazla yağını süzün."
          "Sıcak veya ılık servis yapın.",
    ),
    Meal(
      id: "3",
      categoryId: "3",
      name: "Kremalı Köri Soslu Tavuk",
      imageUrl:
          "https://img-s1.onedio.com/id-610905431a0b7c4f20c97c1d/rev-0/w-1200/h-1200/f-jpg/s-176c86ad326391b120fe9e75cd93b8964b04e8bc.jpg",
      ingredients: ["Malzeme 1", "Malzeme 2", "Malzeme 3"],
      recipe: "Tavuk göğüslerini kuşbaşı doğrayın."
          "Bir tavada tereyağı veya sıvı yağı ısıtın."
          "Doğranmış soğanı ekleyip pembeleşene kadar kavurun."
          "Sarımsağı ilave edip kokusu çıkana kadar soteleyin."
          "Rendelenmiş havuç ve doğranmış biberleri ekleyin, birkaç dakika daha kavurun."
          "Tavukları ekleyip suyunu salıp çekene kadar kısık ateşte pişirin."
          "Köri ve toz zerdeçalı ekleyip karıştırın."
          "Sıvı kremayı ilave edin, tuz ve karabiberle tatlandırın."
          "Tavuklar iyice pişip sos koyu bir kıvam aldığında ocaktan alın."
          "Pilav veya makarna ile servis yapabilirsiniz."
          "Afiyet olsun!",
    ),
    Meal(
        id: "4",
        categoryId: "4",
        name: "Magnolia",
        imageUrl:
            "https://i.lezzet.com.tr/images-xxlarge-recipe/magnolia-40c2dc1f-9306-4a77-8407-ee4c449dd916.jpg",
        ingredients: ["Malzeme 1", "Malzeme 2", "Malzeme 3"],
        recipe:
            'Bir tencerede süt, toz şeker, margarin veya tereyağı, vanilin ve kakao karıştırılarak kısık ateşte kaynamaya bırakılır.'
            'Karışım kaynadıktan sonra ocaktan alınır ve bir süre soğumaya bırakılır.'
            'Petibör bisküviler küçük parçalara ayrılır veya rondodan geçirilir.'
            'Soğuyan karışıma bisküvi parçaları eklenir ve iyice karıştırılır. Karışımın kıvamı ele yapışmayan yumuşak bir hamur olmalıdır.'
            'Hazırlanan hamurdan ceviz büyüklüğünde parçalar alınarak avuç içinde yuvarlanır.'
            'Hazırlanan toplar hindistancevizi içine bulanarak üzeri kaplanır.'
            'Magnolia tatlısı buzdolabında bir süre dinlendirilerek sıkılaşması beklenir.'
            'Servis yapmadan önce üzerine isteğe bağlı olarak ceviz içi eklenerek servis edebilirsiniz.'
            'Bu tarifi denediğinizde umarım lezzetli bir Magnolia tatlısı elde edersiniz. Afiyet olsun!'),
    Meal(
        id: "5",
        categoryId: "5",
        name: "Haydari",
        imageUrl:
            "https://www.yemektarifisec.com/wp-content/uploads/2023/10/Haydari-Tarifi-jpg.webp?v=1697127645",
        ingredients: ["Malzeme 1", "Malzeme 2", "Malzeme 3"],
        recipe: 'Derin bir kase içerisine yoğurt ve labne peyniri eklenir.'
            'Karışım güzelce çırpılır. Yoğurt ve labne iyice karışana kadar çırpma işlemi devam eder.'
            'Zeytinyağı karışıma eklenir ve karışım homojen bir kıvam alana kadar tekrar çırpılır.'
            'Sarımsak ezilerek karışıma eklenir. Sarımsak sevmiyorsanız bu adımı atlayabilirsiniz.'
            'Ceviz içi iri parçalar halinde doğranarak karışıma eklenir. Ceviz koymak istemiyorsanız bu adımı da atlayabilirsiniz.'
            'Tuz damak zevkinize göre ayarlanır.'
            'İsteğe bağlı olarak nane ilave edilir ve karışım tekrar çırpılır.'
            'Hazırlanan Haydari servis tabağına alınarak üzerine biraz zeytinyağı gezdirilir.'
            'Buzdolabında bir süre dinlendirdikten sonra soğuk servis yapılır.'
            'Afiyet olsun! Bu lezzetli Haydari tarifi, meze olarak ya da kahvaltılarda tüketebilirsiniz.'),
    Meal(
        id: "6",
        categoryId: "6",
        name: "Ayran",
        imageUrl:
            "https://www.yemektarifisec.com/wp-content/uploads/2023/10/Haydari-Tarifi-jpg.webp?v=1697127645",
        ingredients: ["Malzeme 1", "Malzeme 2", "Malzeme 3"],
        recipe: 'Temiz bir kaba yoğurdu alın.'
            'Yoğurdun üzerine suyu ekleyin.'
            'Bir çırpıcı veya mikser yardımıyla yoğurt ve suyu iyice çırpın. Homojen bir kıvam alana kadar çırpma işlemine devam edin.'
            'Isteğe bağlı olarak ayranınıza tuz ekleyebilirsiniz. Tuzlu ayran sevenler için bu adımı atlamayabilirsiniz.'
            'Ayranınız hazır! Bardaklara dökerek soğuk bir şekilde servis edebilirsiniz.'
            'Not: Ayranı yaparken su miktarını damak zevkinize göre ayarlayabilirsiniz. Daha koyu veya daha hafif bir kıvam elde etmek için su miktarını isteğinize göre artırabilir veya azaltabilirsiniz.'
            'Afiyet olsun!'),
  ];
});
