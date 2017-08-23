class DynamicProgramming

  def initialize
    @blair_cache = { 1 => 1, 2 => 2 }
    @super_frog_cache = { 1 => { 0 => [[]], 1 => [[1]] } }
  end

  def blair_nums(n)
    # Base case(s): which inputs n should return early?
    # Recursive case: what's the recursive relationship?
    # *NB*: you'll need to figure out how to express the nth odd number in terms of n.
    # return 1 if n == 1
    # return 2 if n == 2
    return @blair_cache[n] unless @blair_cache[n].nil?
    odd_num = 2 * (n - 1) - 1
    res = blair_nums(n - 1) + blair_nums(n - 2) + odd_num
    @blair_cache[n] = res
    return res
    # res = blair_nums(n - 1) + blair_nums(n - 2) + odd_num
  end

  def frog_hops_bottom_up(n)
    # Calls helper function
    cache = frog_cache_builder(n)
    # returns the nth entry
    cache[n]
  end

  def frog_cache_builder(n)
    cache = {
      1 => [[1]],
      2 => [[1, 1], [2]],
      3 => [[1, 1, 1], [1, 2], [2, 1], [3]]
            }

    return cache if n < 4

    (4..n).each do |key|
      cache[key] = []
      (1..3).each do |i|
        cache[key] += cache[key - i].map { |sub_arr| sub_arr + [i] }
        # cache_dup[n - (n - i)].each do |sub_arr|
        #   sub_arr << n - i
        #   cache_dup[n] << sub_arr
      end
    end
    cache
  end

  def frog_hops_top_down(n)
    return frog_hops_top_down_helper(n)
    # p cache
    # return cache[n] unless cache[n].nil?
    # # frog_hops_top_down(n - 1)
    # return
  end

  def frog_hops_top_down_helper(n)
    cache = {
      1 => [[1]],
      2 => [[1, 1], [2]],
      3 => [[1, 1, 1], [1, 2], [2, 1], [3]]
      # 4 => [[1, 1, 1, 1], [1, 3], [1, 2, 1], [2, 1, 1], [2, 2], [3, 1]]
            }
      return cache[n] unless cache[n].nil?

      return frog_hops_top_down(n - 1).map { |sub_arr| sub_arr + [1]} + frog_hops_top_down(n - 2).map { |sub_arr| sub_arr + [2]} + frog_hops_top_down(n - 3).map { |sub_arr| sub_arr + [3]}

      # (1..3).each do |i|
      #   res = frog_hops_top_down(n - i).map { |sub_arr| sub_arr + [i] }
      # end
      # return res
  end

  def super_frog_hops(n, k)
    if @super_frog_cache[k].nil?
      @super_frog_cache[k] = { 0 => [[]], 1 => [[1]] }
    end
      return @super_frog_cache[k][n] if @super_frog_cache[k][n]
      superfrog = []
        if n < k
          k = n
        end
      (1..k).each do |idx|
        superfrog += super_frog_hops(n - idx, k).map { |el| el + [idx] }
      end
      @super_frog_cache[k][n] = superfrog
      superfrog
  end

  def knapsack(weights, values, capacity)
    return 0 if capacity < weights.min
    sum = 0
    weights.each_with_index do |weight, idx|
      if weight <= capacity
        sum += values[idx]
      end
    end
    sum

    # knapsack_table(weight, values, capacity - 1)
  end

  # Helper method for bottom-up implementation
  def knapsack_table(weights, values, capacity)

  end

  def maze_solver(maze, start_pos, end_pos)
  end
end
