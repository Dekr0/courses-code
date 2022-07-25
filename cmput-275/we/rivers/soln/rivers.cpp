/*
 * Name: Chengxuan Li
 * Student ID: 1631060
 */

#include <iostream>

using namespace std;

int query(int*, int, int, int);

int main() {

    int num_rivers = 0, num_queries = 0;
    cin >> num_rivers >> num_queries;

    int rivers[num_rivers];

    for (int i = 0; i < num_rivers; ++i) {
        cin >> rivers[i];
    }

    for (int i = 0; i < num_queries; ++i) {
        int u = 0, v = 0, meet = 0;

	// "meet" is the river of two river, u and v, connect together

        cin >> u >> v;

        meet = query(rivers, num_rivers, u, v);
        cout << meet << endl;
    }

    return 0;
}

int query(int* a, int n, int u, int v) {
    /*
     * Description:
     *     Search for which river the two river, u and v, connect together
     *
     * Arguments:
     *     (int*) a:
     *         pointer to a array which describes the flow path of each river
     *     
     *     (int) n:
     *         Number of rivers in array "a"
     *
     *     (int) u:
     *         River u in array "a"
     *
     *     (int) v:
     *         River v in array "a"
     *
     * Returns:
     *     (int) meet:
     *         The index of the river of river u and v connect together
     */

    int meet = 0;  // Assuming the river u and v connect in the ocean
    
    // array that track on how many times of each river in the array is visisted
    // by river u and v
    int memo[n];

    for (int i = 0; i < n; ++i) {
	// originally the every river in the array is visisted 0 times
	// by river u and v
        memo[i] = 0;  
    }

    while (u != 0 || v != 0) {
        // increase the number of visisted time for each river by river u and v 
	// unless river u (v) is already flow into the ocean
	
        if (u != 0) {
            memo[u-1] += 1;
        }

        if (v != 0) {
            memo[v-1] += 1;
        }

	// If one of the river is visisted twice, it indicate that river u and v
	// connect together at that river
        if (u != 0 && memo[u-1] >= 2) {
            meet = u;
            break;
        }

        if (v != 0 && memo[v-1] >= 2) {
            meet = v;
            break;
        }

	// Keep track of where the river u (v) flow through unless river u (v) is
	// already flow into the ocean
        u = (u != 0) ? a[u-1] : u;
        v = (v != 0) ? a[v-1] : v;
    }

    return meet;
}
