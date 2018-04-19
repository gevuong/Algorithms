# Design a parking lot using OOP

# Question to consider asking:
# So...a parking lot has many parking spaces. Does the parking lot have floors? If so, then it has many floors.
# In terms of parking spaces, can you park motorcycles, busses, or just cars? The question should be, what types of vehicles can park in lot?
# Do you have to pay to park in lot?

# The parking lot sizes are regular and compact.


class ParkingLot
    def initialize(floor_count, space_count)
        @floor_count = floor_count
        @space_count = space_count
    end

end

class Vehicle
    attr_reader :size

    def initialize(size, license_plate)
        @size = size
        @license_plate = license_plate
        @parking_spots = [] # compact, regular
    end

    # some things a vehicle can do
    def park_in_spot

    end

    def can_fit_in_spot(spot)

    end

    def leave_spot

    end
end

class Bus < Vehicle
    def initialize
        # by calling super without arguments
        super
        @spots_needed = 5
        @size = :large
    end
end

class Car < Vehicle

end

class Motorcycle < Vehicle
    def initialize
    end 
end

class ParkingSpace
    def initialize(space_type)
        @space_type = space_type
    end
end
