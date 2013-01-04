
class Todo < Array

  def initialize
   Array.new
   # @list = []
    @total_id_number =  0
  end
 
  def new_item item
    #changed @list instance varialbe to self. Seel also line 18
    #also took out :date_created => Time.now
    self <<  {:item => item, :done =>false, :id =>(@total_id_number + 1)}
    @total_id_number += 1
  end 
  
  def show_done
    #changed @list instance variable
    self.each do
    |x|
    if x[:done] == true 
      puts x[:item]
    else
      puts "Nothing done yet"
    end
    end
  end

  def check_off id_number
   self.each do
   |thing|
   if thing[:id] == id_number
     thing[:done] = true
   end
   end
  end

end
