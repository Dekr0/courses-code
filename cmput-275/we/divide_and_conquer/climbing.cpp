/*
 * Name: Chengxuan Li
 * ID: 1631060
 * CMPUT 275. Winter 2021
 *
 * Weekly Exercise #7: Divide and Conquer
 */

typedef unsigned int uint;

uint getTime(const uint * heights, uint length, uint rest, uint limit, uint burst);


uint climbing(const uint *heights, uint length, uint rest, uint limit) {
    /**
     * Description:
     *      Find the minimum burst time to finish the climb
     *
     * Parameters:
     *      heights (const uint *) : constant pointer to the height array
     *
     *      length (uint) : the size of height array
     *
     *      rest (uint) : the amount of time take to rest
     *
     *      limit (uint) : the time limit
     *
     * Returns:
     *      high (uint) : minium burst time to finish the climb
     */
     
    // If the time limit is not enough to finish the climb, no solution
    if (limit < heights[length - 1])
        return 0;
    
    // Lower bound and upper bound
    uint low = 0, high = limit;
    
    while (low + 1 < high) {
        uint mid = (low + high) / 2;
        uint time_spend = getTime(heights, length, rest, limit, mid);
        
        // Invariant
        // time_spend <= limit - can finish the climb within time limit
        // time_spend > limit - can't finish the climb within time limit
        if (time_spend <= limit) {
            high = mid;
        } else {
            low = mid;
        }
        
    }
    
    return high;
}

uint getTime(const uint *heights, uint length, uint rest, uint limit,
    uint burst) {
    /**
     * Description:
     *      Find the time spend to finish the climb
     *
     * Parameters:
     *      heights (const uint *) : constant pointer to the height array
     *
     *      length (uint) : the size of height array
     *
     *      rest (uint) : the amount of time take to rest
     *
     *      limit (uint) : the time limit
     *
     *      burst (uint) : burst time
     *
     * Returns:
     *      time_spend (uint) : the time spend to finish the climb
     */

    // burst_left - amount of burst time currently have before reset
    uint burst_left = burst, current_height = 0, time_spend = 0;
    
    for (int i = 0; i < length; ++i) {
        if (burst < heights[i] - current_height) return limit + 1;
        // Exceed time limit if the burst time is less than height between two ledges
        // regardless how many time need to rest

        if (burst_left < heights[i] - current_height) {
            time_spend += rest;
            burst_left = burst;  // re-gain burst time after rest
        }
        
        burst_left -= heights[i] - current_height;
        time_spend += heights[i] - current_height;
        current_height = heights[i];
    }
    
    return time_spend;
}
