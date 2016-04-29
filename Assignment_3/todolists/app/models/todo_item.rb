class TodoItem < ActiveRecord::Base
    def self.getNumberofCompletedTodoItems
        TodoItem.all.where({:completed => TRUE}).count
    end
end
