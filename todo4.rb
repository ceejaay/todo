
class Todo < Array

  def initialize
   Array.new
   # @list = []
    @total_id_number =  0
  end
 
  def new_item item
    self <<  {:item => item, :done =>false, :id =>(@total_id_number + 1), :date_created => Time.now}
    @total_id_number += 1
  end 
  
  def show_done
    self.each do
    |item|
      if item[:done] == true
        puts item[:item]
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

  def delete_item item_number
    self.each do
    |item|
    if item[:id] == item_number
    self.delete(item)
    end
    end
  end

end #end of todo class.
