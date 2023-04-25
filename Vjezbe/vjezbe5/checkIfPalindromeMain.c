#include <string.h>
#include <stdio.h>

int isPalindrome(const char*, int);

int main()
{
  const char* s = "addkdda";

  if(isPalindrome(s, strlen(s))) printf("%s je palindrom\n", s);
  else printf("nije palindrom\n");

  return 0;
}
