#include <iostream>
#include <string>
using namespace std;

int main(){
	string str;
	cout << "Enter a word:\n";
	cin >> str;

	char c;
	for (int i=0, j=str.size()-1; i<j; i++, j--){
		c = str[i];
		str[i] = str[j];
		str[j] = c; 
	}
	cout << str << endl;
	return 0;
}