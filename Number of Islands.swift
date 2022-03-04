/*
给你一个由 '1'（陆地）和 '0'（水）组成的的二维网格，请你计算网格中岛屿的数量。

岛屿总是被水包围，并且每座岛屿只能由水平方向和/或竖直方向上相邻的陆地连接形成。

此外，你可以假设该网格的四条边均被水包围。

 

示例 1：

输入：grid = [
  ["1","1","1","1","0"],
  ["1","1","0","1","0"],
  ["1","1","0","0","0"],
  ["0","0","0","0","0"]
]
输出：1
示例 2：

输入：grid = [
  ["1","1","0","0","0"],
  ["1","1","0","0","0"],
  ["0","0","1","0","0"],
  ["0","0","0","1","1"]
]
输出：3
 

提示：

m == grid.length
n == grid[i].length
1 <= m, n <= 300
grid[i][j] 的值为 '0' 或 '1'

来源：力扣（LeetCode）
链接：https://leetcode-cn.com/problems/number-of-islands
著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
*/

class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        var count = 0
        for i in 0..<grid.count {
            for j in 0..<grid[0].count {
                if grid[i][j] == "1" {
                    return dfs(grid, i, j)
                }
            }
        }
        return 0
    }
    func dfs(_ grid: [[Character]], _ i: Int, _ j: Int) -> Int {
        var grid = grid
        if i < 0 || i >= grid.count || j < 0 || j >= grid[0].count{
            return 0
        }
        if grid[i][j] == "0"  {
            return 1
        }
        if grid[i][j] == "2"  {
            return 0
        }
        grid[i][j] = "2"
        return dfs(grid, i - 1, j) +
            dfs(grid, i + 1, j) +
        dfs(grid, i, j - 1) +
        dfs(grid, i, j + 1)
    }
}