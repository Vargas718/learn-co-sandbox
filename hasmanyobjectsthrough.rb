class Customer
   attr_accressor :name, :age 
   
   
   @@all = []
   
   def initialize(name, age)
     @name = name 
     @age = age 
     @@all << self 
   end 
   
   def self.all 
     @@all 
   end 
   
   def new_meal(waiter, total, tip=0)
     Meal.new(waiter, self, total, tip)
   end 
   #As you can see, we don't need to take customer in as an argument, because we're passing in self as reference to the current instance of customer. This method will allow us to create new meals as a customer, and automatically associate each new meal with the customer that created it. We can do the same thing for the Waiter class:
    def meals
    Meal.all.select do |meal|
      meal.customer == self
    end
  end
  # We're iterating through every instance of Meal and returning only the ones where the meal's customer matches the current customer instance.
  def waiters
    meals.map do |meal|
      meal.waiter
    end
  end
 # an array of the waiters our customer has interacted with.
end 

class Waiter
  
  attr_accessor :name, yrs_experience 
  
    @@all = []
    
  def intialize(name, yrs_experience)
    @name = name 
    @yrs_experience = yrs_experience 
    @@all << self 
  end 
  
  def self.all 
    @@all 
  end 
  
end 

class Meal 
  
  attr_accessor :waiter, :customer, :total, :tip 
  
    @@all 
    
    def initialize(waiter, customer, total, tip = 0)
      @waiter = waiter 
      @customer = customer 
      @total = total 
      @tip = tip 
      @@all << self 
    end 
    
    def self.all 
      @@all 
    end 
    
   
  end 
  
  