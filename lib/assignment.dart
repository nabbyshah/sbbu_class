
void main() {
  List<int> a = [3, 4, 8, 16, 224, 66, 49, 6, 81, 102];

  int i = 0;
  List<int> l = [];

  for (var e in a) {
    if (++i % 2 == 0) {
      l.add(e);
    }
  }
 print (l);
  
 
}