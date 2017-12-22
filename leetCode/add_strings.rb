def add_strings(num1, num2)
    arr1 = num1.split("")
    arr2 = num2.split("")

    length = [arr1.length, arr2.length].max
    sum = 0
    (0...length).each do |el|
        sum += (arr1.pop.to_i + arr2.pop.to_i) * 10**el
    end
    sum
end

p add_strings("5", "10") # 15
p add_strings("521", "152") # 673
