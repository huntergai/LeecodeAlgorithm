/*
4. 寻找两个正序数组的中位数
给定两个大小分别为 m 和 n 的正序（从小到大）数组 nums1 和 nums2。请你找出并返回这两个正序数组的 中位数 。

算法的时间复杂度应该为 O(log (m+n)) 。

 

示例 1：

输入：nums1 = [1,3], nums2 = [2]
输出：2.00000
解释：合并数组 = [1,2,3] ，中位数 2
示例 2：

输入：nums1 = [1,2], nums2 = [3,4]
输出：2.50000
解释：合并数组 = [1,2,3,4] ，中位数 (2 + 3) / 2 = 2.5
示例 3：

输入：nums1 = [0,0], nums2 = [0,0]
输出：0.00000
示例 4：

输入：nums1 = [], nums2 = [1]
输出：1.00000
示例 5：

输入：nums1 = [2], nums2 = []
输出：2.00000
 

提示：

nums1.length == m
nums2.length == n
0 <= m <= 1000
0 <= n <= 1000
1 <= m + n <= 2000
-106 <= nums1[i], nums2[i] <= 106

*/

class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        var numsSum = nums1 + nums2
         quicksort(&numsSum,0,numsSum.count-1)
        if numsSum.count % 2 == 0 {
            return Double((numsSum[numsSum.count/2] + numsSum[numsSum.count/2-1]))/2
        }else {
            return Double(numsSum[(numsSum.count - 1)/2])
        }
	}
	func quicksort(_ array:inout[Int], _ low:Int ,_ high:Int) {
		if low < high {
			let pivot = partition(&array, low, high)
			quicksort(&array, low, pivot - 1)
			quicksort(&array, pivot + 1, high)
		}
	}
	func partition(_  array:inout [Int], _ low:Int, _ high:Int) -> Int {
		let pivot = array[high]
		var i = low - 1
		for j in low..<high {
			if array[j] <= pivot {
				i += 1
				let temp = array[i]
				array[i] = array[j]
				array[j] = temp
			}
		}
		let temp = array[i + 1]
		array[i + 1] = array[high]
		array[high] = temp
		return i + 1
	}
}

let solution = Solution()
// print(solution.quicksort([0,0,0,0,0,-1,0,0,0,0,0,1],0,11))

print(solution.findMedianSortedArrays([0,0,0,0,0], [-1,0,0,0,0,0,1]))
