#include <iostream>
#include <cctype>
/*
 * import class cout, cin, endl from namespace std
 * this preprocess directive reduces potential name conflicts
 * and also have more conctrol what names is needed to include
 * and access
 *
 * for example, a var named "vector" is created, then "using 
 * namspace std" would create a conflict
 */

using std::cout;
using std::cin;
using std::endl;

int main()
{
	// cout << "Security system is activated" << endl;
	// cout << "Enter your code:____\b\b\b\b";
	// int code;
	// cin >> code;
	// if (code == 1234)
	// {
	// 	cout << "You entered " << code << endl;
	// } else {
	// 	cout << "Wrong password!\a" << endl;
	// }

	char c;
	cin.get(c); // reading one char from stdin and assign to var "c", cin
	// will go until it hits whitespace
	
	if (c <= 'd')
	{
		c++;
	}
	if (islower(c))
	{
		c = toupper(c);
	}
	cout << "c is: " << c << endl;
	
	return 0;
}
