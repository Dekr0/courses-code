#include <iostream>
#include <cmath>
#include <string>
using namespace std;

int main() {

	float n, m, result;
	int results;
	string output;

	cin >> n >> m;
	result = log(m) / log (n);
	results = int(result);
	
	return 0;
}
