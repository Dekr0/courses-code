#include <iostream>
using namespace std;

int main() {

	struct Point2D {
		int x = 0;
		int y = 0;
		char label[8] = "origin";
	} pointA, pointB[2];

	pointB[1].x = -1;
	pointB[0].x = 2;
	pointA.x = 1;
	Point2D *ptr = &pointB[1];
	cout << ptr->x << endl;

	return 0;
}
