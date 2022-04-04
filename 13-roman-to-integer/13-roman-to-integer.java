class Solution {
    static HashMap <String, Integer> values = new HashMap<>();
    static  {
            values.put("I", 1);
            values.put("V", 5);
            values.put("X", 10);
            values.put("L", 50);
            values.put("C", 100);
            values.put("D", 500);
            values.put("M", 1000);
            values.put("IV", 4);
            values.put("IX", 9);
            values.put("XL", 40);
            values.put("XC", 90);
            values.put("CD", 400);
            values.put("CM", 900);
            
    }
    public int romanToInt(String s) {
        
        int i = 0;
        int total = 0;
        while (i < s.length()){
            while (i < s.length() - 1) {
                String doubleSymbol = s.substring(i, i+2);
                if (values.containsKey(doubleSymbol)) {
                    total = total + values.get(doubleSymbol);
                    i = i + 2;
                }
                else {
                    String singleSymbol = s.substring(i, i+1);
                    total += values.get(singleSymbol);
                    i = i + 1;
                }
            }
            if (i == s.length() - 1) {
                String singleSymbol = s.substring(i, i+1);
                total += values.get(singleSymbol);
                i = i + 1;
            }
        }
      return total;  
    }
}