# Given a list of numbers in an array, replace all the numbers with the product of all other numbers.
# Do this in O(n) time without using division.
def productify(arr)
    # initialize an array of length arr containing 1's.
    products = Array.new(4) { 1 }

    # keep track of lower products and upper products
    lower_product = 1
    (0...arr.length).each do |idx|
        products[idx] *= lower_product
        # multiply the lower_product by the first val in arr
        lower_product *= arr[idx]
    end

    upper_prod = 1
    (arr.length - 1).downto(0) do |idx|
        products[idx] *= upper_prod
        upper_prod *= arr[idx]
    end

    products
end
