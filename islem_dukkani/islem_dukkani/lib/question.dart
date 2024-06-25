//yapi
class Question {
  String question = '';
  String aSikki = '';
  String bSikki = '';
  String cSikki = '';
  String dSikki = '';
  String answer = '';
//yapici method
  Question(
      {required q,
      required String a,
      required String b,
      required String c,
      required String d,
      required String an}) {
    question = q;
    aSikki = a;
    bSikki = b;
    cSikki = c;
    dSikki = d;
    answer = an;
  }
}
