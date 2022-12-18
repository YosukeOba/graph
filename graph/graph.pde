import java.util.Map;
import java.util.HashMap;
import java.util.Arrays;

//課題7-2は"72.txt"，課題7-3は"73.txt"
String filename = "73.txt";

//頂点の親を管理する辞書型配列
HashMap<Integer, Integer> V = new HashMap<Integer, Integer>();

//辺のデータを格納するArrayList
ArrayList<PVector> E = new ArrayList<PVector>();

int count = 0;

void setup() {
 String[] lines = loadStrings(filename);
 for (int i = 0 ; i < lines.length; i++) {
   String [] temp = split(lines[i], ",");
   String [] temp2 = split(temp[0], "(");
   String [] temp3 = split(temp[1], ")");
   PVector temp4 = new PVector(int(temp2[1]), int(temp3[0]));
   E.add(temp4);
   V.put(int(temp2[1]), int(temp2[1]));
   V.put(int(temp3[0]), int(temp3[0]));
 }
 for (int i = 0; i < E.size(); i++){
   if(parent(int(E.get(i).x)) != parent(int(E.get(i).y))){
     V.put(parent(int(E.get(i).x)), parent(int(E.get(i).y)));
   }
 }
 
 for (Map.Entry me : V.entrySet()) {
   //最終的な頂点の親の情報を出力
   //println(me.getKey() +","+ me.getValue());
   if(me.getKey() == me.getValue()){
     count++;
   }
 }
 
 println("連結成分の個数：" + count);
 
}

int parent(int a){
  if(V.get(a) == a){
    return V.get(a);
  } else {
    return parent(V.get(a));
  }
}
