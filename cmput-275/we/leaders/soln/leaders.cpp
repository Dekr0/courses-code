#include <iostream>
using namespace std;

void reverse(int*, int*);
int find_leaders(int *, int *, int);


int main() {

	int n;
	int cleader;
	cin >> n;
	int nums[n];
	int leaders[n];

	for (int i = 0; i < n; ++i) {
		cin >> nums[i];
		leaders[i] = 0;
		if (i == n-1)
			leaders[0] = nums[i];
	}

	if (n > 1) {
		cleader = find_leaders(nums+(n-1), leaders+1, n);
	} else {
		cleader = 0;
	}

	for (int i = cleader; i >= 0; i--) {
		if (i == 0) {
			cout << leaders[i] << endl;
		} else {
			cout << leaders[i] << " ";
		}
	}

	for (int i = 0; i < n; ++i) {
		if (i == n-1) {
			cout << nums[i] << endl;
		} else {
			cout << nums[i] << " ";
		}
	}

	return 0;
}

int find_leaders(int * nums_ptr, int * leaders_ptr, int size) {

	int i = 1;
	int cleader = 0;
	int max = *nums_ptr;
	int * end = nums_ptr;
	--nums_ptr;

	while (i < size) {
		if (*nums_ptr > max) {
			max = *nums_ptr;
			*leaders_ptr = max;
			reverse(nums_ptr+1, end-1);
			end = nums_ptr;
			++cleader;
			++leaders_ptr;
		}

		++i;
		--nums_ptr;
	}

	reverse(nums_ptr+1, end-1);

	return cleader;
}

void reverse(int* begin, int* end) {

	while (begin <= end) {
		
		int tmp = *begin;
		*begin = *end;
		*end = tmp;

		++begin;
		--end;
	}
}

