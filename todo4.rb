require 'yaml'
class Todo < Array

  def initialize
   Array.new
    @total_id_number =  0
  end
 
  def new_item item
    self <<  {:item => item, :done =>false, :id =>(@total_id_number + 1), :date_created => Time.now}
    @total_id_number += 1
  end 
  
  def show_done
    completed_items = []
    self.each do
      |list_item|
      if list_item[:done] == true
        completed_items << list_item
      end
    end

    if completed_items.empty?
      return "Nothing done yet!"
    else completed_items.each do
      |item|
        return item[:item]
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

  def show_all_items
    self.each do
      |items|
      puts items[:item]
      end
  end
  
  def seed_list_with_data
    seed_array = ["Take out trash", "Wash car", "Go shopping", "Pay bills", "Program in ruby", "Prep Dinner", "Call Mom", "Make doc appointment" ]
    seed_array.each do
      |item|
      self.new_item("#{item}")
    end
  end



  def save_list filename
    File.open filename, "w" do |f|
      f.write(self.to_yaml)
    end
  end
end #end of todo class.
