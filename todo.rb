
require 'active_record'
class Todo < ActiveRecord::Base  
    def due_today?    
        due_date == Date.today  
    end  
    def to_displayable_string    
        display_status = completed ? "[X]" : "[ ]"    
        display_date = due_today? ? nil : due_date    
        "#{display_status} #{todo_text} #{display_date}"  
    end
    def self.to_displayable_list
        all.map{|todo| todo.to_displayable_string}
    end
    def mark_as_complete(todo_id)
        all.map{|todo| 
            if todo.id == todo_id
                todo.completed=true
            end
        }
    end

end

