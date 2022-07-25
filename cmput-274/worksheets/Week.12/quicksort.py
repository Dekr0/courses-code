# https://www.geeksforgeeks.org/quick-sort/
# Small changes by Paul Lu

# worst case (n^2) when the array / list is sorted or the pivot does not split the array into half (most of the elements)
# on the left / right the pivot).

# more sorter the array is list, worse the time complexity is

from random import randint

# Python program for implementation of Quicksort Sort 

# This function takes last element as pivot, places 
# the pivot element at its correct position in sorted 
# array, and places all smaller (smaller than pivot) 
# to left of pivot and all greater elements to right 
# of pivot 
def partition(arr,low,high): 
	pivotIndex = ( low-1 )		 # index of smaller element 
	pivotKey = arr[high]	 # key value that determines where the pivot locates at (pivot index)

	for currIndex in range(low , high): 

		# If current element is smaller than or 
		# equal to pivot value
		if arr[currIndex] <= pivotKey: 
		
			# increase the size of the sub-partition that contains all the
			# value smaller than the pivot (every time detect a value that
			# smaller than the pivot, increase the pivotIndex by 1, and
			# swap this value to the left

			pivotIndex = pivotIndex+1
			arr[pivotIndex],arr[currIndex] = arr[currIndex],arr[pivotIndex] 

	# Move pivot value to pivot index location
	arr[pivotIndex+1],arr[high] = arr[high],arr[pivotIndex+1] 
	return ( pivotIndex+1 ) 

# The main function that implements QuickSort 
# arr[] --> Array to be sorted, 
# low --> Starting index, 
# high --> Ending index 

# Function to do Quick sort 
def quickSort(arr,low,high):

	# sort from range to range

	if low < high:  # stopping condition as long as the low (start) index and the high (stop) index are not the some
		# same -> there are still some key values to be sorted -> continue to recurse

		# pi is partitioning index, arr[p] is now 
		# at right place 
		pivotIndex = partition(arr,low,high) 

		# Separately sort elements before ->
		# partition and after partition
		# split the list / array in half with a pivot
		quickSort(arr, low, pivotIndex-1)  # left hand side recursive call (low to pivot)
		quickSort(arr, pivotIndex+1, high)  # right hand side recursive call (pivot to high)
		# lastly combine the left and right with the pivot -> final sorted list

# Driver code to test above 
# arr = [10, 7, 8, 9, 1, 5]
arr = []

for i in range(20):
	arr.append(randint(1, 100))

n = len(arr) 
quickSort(arr,0,n-1) 
print ("Sorted array is:") 
for i in range(n): 
	print ("%d " %arr[i], end=""), 
print()

# This code is contributed by Mohit Kumra 
