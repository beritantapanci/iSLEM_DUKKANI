import 'dart:math';

import 'package:islem_dukkani/question.dart';

//yapi
class ManyQuestions {
  //nitelikler ozellikler
  List<Question> questionBank = [
    Question(q: '', a: '', b: '', c: '', d: '', an: ''),
    Question(q: '🍭 + 🍭 +🍭=?', a: '1', b: '2', c: '3', d: '5', an: '3'),
    Question(
        q: 'Resat 7 ,kardesi 8 yasindadir.Ikisinin yaslari toplami kactir?',
        a: '15',
        b: '13',
        c: '21',
        d: '12',
        an: '15'),
    Question(
        q: 'Emreye annesi 4,babasi 5,amcasi da 2 oyku kitabi aldi.Toplam kac kitabi oldu?',
        a: '15',
        b: '14',
        c: '8',
        d: '11',
        an: '11'),
    Question(
        q: 'Okulumuzun alt katinda 5,ust katinda 8 sinif vardir.Okulumuzda toplam kac sinif vardir?',
        a: '17',
        b: '12',
        c: '13',
        d: '14',
        an: '13'),
    Question(
        q: 'Evimizin bahcesinde 4 cam ,3 mese, 5 akasya agaci vardir.Bahcemizde toplam kac agac vardir?',
        a: '13',
        b: '14',
        c: '12',
        d: '9',
        an: '12'),
    Question(
        q: 'Harun once 6,sonra 7 sayfa kitap okudu.Harun toplam kac sayfa kitap okudu?',
        a: '11',
        b: '12',
        c: '13',
        d: '14',
        an: '13'),
    Question(
        q: ' Kumbaramda 8 lira vardi.Annem 5, babam 6 lira verdi.Kumbaramda toplam kac liram oldu?',
        a: '16',
        b: '19',
        c: '21',
        d: '23',
        an: '19'),
    Question(
        q: 'Sinifimizda 12  ogrenci vardir 5 ogrenci daha gelirse toplam kac ogrenci olur? ',
        a: '14',
        b: '15',
        c: '16',
        d: '17',
        an: '17'),
    Question(
        q: 'Gizem 11 yasindadir.Ablasi Gizem den 4 yas buyuktur.Abla kac yasindadir?',
        a: '17',
        b: '18',
        c: '12',
        d: '15',
        an: '15'),
    Question(
        q: 'Ali nin 12 tl si vardir .Babasi 7 tl verdi.Alinin artik kac tl si var?',
        a: '19',
        b: '10',
        c: '11',
        d: '12',
        an: '19'),
    Question(
        q: 'Ayse nin kumbarasinda 20 tl vardir .13 tl ye kitap alirsa ne kadar parasi kalir?',
        a: '5',
        b: '6',
        c: '7',
        d: '8',
        an: '7'),
    Question(
        q: 'Defneye dedesi 17 tl veriyor.5 TL kardesine verirse Defnenin ne kadar parasi kalir?',
        a: '14',
        b: '12',
        c: '11',
        d: '13',
        an: '12'),
    Question(
        q: 'Agacta 8 elma var .7 tanesi duserse agacta kac elma kalir?',
        a: '5',
        b: '3',
        c: '2',
        d: '1',
        an: '1'),
    Question(
        q: '10 araba yolda giderken 4 tanesi duruyor .Kac araba hareket etmeye devam eder?',
        a: '6',
        b: '5',
        c: '7',
        d: '4',
        an: '6'),
    Question(
        q: 'Aklimdan tuttugum sayinin 5 fazlasi 28 ise aklimdan tuttugum sayi kactir?',
        a: '12',
        b: '23',
        c: '32',
        d: '13',
        an: '23'),
    Question(
        q: '29 arkadas korebe oynuyor 11 tanesi eve giderse kac arkadas oynamaya devam eder?',
        a: '28',
        b: '15',
        c: '18',
        d: '17',
        an: '18'),
    Question(
        q: 'Atlarin 37 evi var 8 tanesini kapatirsak kac tane kalir?',
        a: '21',
        b: '19',
        c: '29',
        d: '24',
        an: '29'),
    Question(q: '9 - 5 =?', a: '4', b: '12', c: '13', d: '5', an: '4'),
    Question(q: '24 - 13 =?', a: '11', b: '37', c: '27', d: '12', an: '11'),
    Question(q: '36 - 23 =?', a: '59', b: '12', c: '13', d: '23', an: '13'),
    Question(
        q: 'Bir çember atma yarışmasında, hedefe atılan her çember için 30 puan kazanılmakta, hedef dışına atılan her çember için 15 puan kaybedilmektedir. Bu yarışmada yarışmacı 9 çember atmış, 4 çemberi isabetli olmuştur. Bu yarışmacının topladığı puan kaçtır?',
        a: '45',
        b: '67',
        c: '120',
        d: '60',
        an: '45'),
    Question(
        q: 'Bir fabrikada çalışan kadın işçilerin sayısı erkek işçilerin sayısının 4 katından 9 fazladır. Bu fabrikada 129 kadın işçi çalıştığına göre erkek işçilerin sayısı kaçtır?',
        a: '38',
        b: '42',
        c: '30',
        d: '50',
        an: '30'),
    Question(
        q: 'Bir doğal sayının 15 ile bölümünde bölüm 17, kalan ise 12’dir. Bu sayının 12 ile bölümünden kalan kaçtır?',
        a: '4',
        b: '1',
        c: '3',
        d: '5',
        an: '3'),
    Question(
        q: '18 katlı bir apartmanın her katında 6 daire, her dairede ise 8 kişi yaşamaktadır. Bu apartmanda yaşayan toplam kişi sayısı kaçtır?',
        a: '864',
        b: '792',
        c: '843',
        d: '598',
        an: '864'),
    Question(
        q: 'Bir bölme işleminde bölen 33 ve bölüm 47 olduğuna göre bu bölme işleminde bölünenin alacağı en büyük değer kaçtır?',
        a: '1436',
        b: '1583',
        c: '1784',
        d: '1487',
        an: '1583'),
    Question(
        q: 'Bir bölme işleminde, bölen bölümden 7 eksik, kalandan ise 6 fazladır. Bu bölme işleminde kalan 8 olduğuna göre bölünen sayı kaçtır? ',
        a: '465',
        b: '422',
        c: '302',
        d: '305',
        an: '302'),
    Question(
        q: 'Bir bando takımı 4 adım ileri, 1 adım geri atarak ilerlemektedir. Toplam 99 adım atan bu bando takımı kaç adım ilerlemiş olur?',
        a: '90',
        b: '80',
        c: '76',
        d: '74',
        an: '80'),
    Question(
        q: '7 katı 630 olan sayının 9 katı kaçtır?',
        a: '918',
        b: '192',
        c: '973',
        d: '810',
        an: '810'),
    Question(
        q: '15 katı 225 olan sayının 8 katı kaçtır?',
        a: '49',
        b: '120',
        c: '93',
        d: '68',
        an: '120'),
    Question(
        q: '369 sayfalık bir hikaye kitabının her gün 9 sayfasını okuyan Serdar, bu kitabı kaç günde bitirir?',
        a: '41',
        b: '32',
        c: '43',
        d: '75',
        an: '41'),
    Question(q: '20/5 =?', a: '4', b: '12', c: '13', d: '5', an: '4'),
    Question(q: '100 / 4 =?', a: '46', b: '30', c: '17', d: '25', an: '25'),
    Question(q: ' 25* 5 =?', a: '4', b: '5', c: '3', d: '7', an: '5'),
    Question(q: '24 / 8 =?', a: '4', b: '3', c: '4', d: '5', an: '3'),
    Question(q: '121 /11 =?', a: '11', b: '12', c: '13', d: '15', an: '11'),
    Question(q: '80 / 8 =?', a: '14', b: '12', c: '13', d: '10', an: '10'),
    Question(q: '3 * 18 =?', a: '54', b: '52', c: '63', d: '35', an: '54'),
    Question(q: '4 * 15 =?', a: '60', b: '72', c: '53', d: '65', an: '60'),
    Question(q: '9 * 6 =?', a: '54', b: '12', c: '63', d: '53', an: '54'),
    Question(q: '12 * 7 =?', a: '43', b: '84', c: '23', d: '95', an: '84'),
  ];
  //var random = new Random();
  // Random random = Random();

  // int step = random.nextInt(10);
  // Random random= Random();

}
