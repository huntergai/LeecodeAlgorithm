/*
给你一个字符串 s 、一个字符串 t 。返回 s 中涵盖 t 所有字符的最小子串。如果 s 中不存在涵盖 t 所有字符的子串，则返回空字符串 "" 。

 

注意：

对于 t 中重复字符，我们寻找的子字符串中该字符数量必须不少于 t 中该字符数量。
如果 s 中存在这样的子串，我们保证它是唯一的答案。
 

示例 1：

输入：s = "ADOBECODEBANC", t = "ABC"
输出："BANC"
示例 2：

输入：s = "a", t = "a"
输出："a"
示例 3:

输入: s = "a", t = "aa"
输出: ""
解释: t 中两个字符 'a' 均应包含在 s 的子串中，
因此没有符合条件的子字符串，返回空字符串。
 

提示：

1 <= s.length, t.length <= 105
s 和 t 由英文字母组成
 

进阶：你能设计一个在 o(n) 时间内解决此问题的算法吗？

来源：力扣（LeetCode）
链接：https://leetcode-cn.com/problems/minimum-window-substring
著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
*/

class Solution {
    func minWindow(_ s: String, _ t: String) -> String {

        func check(_ map:[Character:Int]) -> Bool {
            for (_, v) in map {
                if v > 0 {
                    return false
                }
            }
            return true
        }
        var map = [Character: Int]()
        for c in t {
            map[c] = (map[c] ?? 0) + 1
        }
        var left = 0
        var right = 0
        var minLeft = 0
        var minRight = 0
        var minLen = Int.max
        var count = t.count
        while right < s.count {
            let c = s[s.index(s.startIndex, offsetBy: right)]
            if let v = map[c] {
                map[c] = v - 1
                if v > 0 {
                    count -= 1
                }
            }
            right += 1
            while count == 0 {
                let c = s[s.index(s.startIndex, offsetBy: left)]
                if let v = map[c] {
                    map[c] = v + 1
                    if v < 0 {
                        count += 1
                    }
                }
                if right - left < minLen {
                    minLeft = left
                    minRight = right
                    minLen = right - left
                }
                left += 1
            }
        }
        if minLen == Int.max {
            return ""
        }
        return String(s[s.index(s.startIndex, offsetBy: minLeft)..<s.index(s.startIndex, offsetBy: minRight)])
    }
}