class Solution {
    public boolean isPowerOfTwo(int n) {
        if (n == 0) return false;
    long x = n;
    return (x & (x - 1)) == 0;
    }
}