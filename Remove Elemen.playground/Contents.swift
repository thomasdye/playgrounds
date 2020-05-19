import Foundation

class Solution {
    func removeElement(_ nums: [Int], _ val: Int) -> Int {
        let originalArray: [Int] = nums
        var array: [Int] = []

        for i in nums {
            if i != val {
                array.append(i)
            }
        }
        print("Original Array:\(originalArray)\nNumber Removed: \(val)\nNew Array: \(array)\nTotal Numbers: \(array.count)")
        return array.count
    }
}

var test = Solution()

test.removeElement([1,2,3,4,5,6,6,6,7], 7)
