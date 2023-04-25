int isPalindrome(const char *s, int len) {
  if(len < 2) return 1;
  else        return s[0]==s[len-1] && isPalindrome(s+1, len-2);
}
