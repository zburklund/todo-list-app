class TodoItemsController < ApplicationController
	before_action :set_todo_list
	before_action :set_todo_item, except: [:create]


	def create
		@todo_item = @todo_list.todo_items.create(todo_item_params)
		redirect_to @todo_list
	end

	def destroy
		@todo_item.destroy
		respond_to do |format|
			format.html { redirect_to @todo_list, notice: 'Item was successfully destroyed.' }
			format.json { head :no_content }
			format.js   { render :layout => false }
		end
	end

	def complete
		@todo_item.update_attribute(:is_done, true)
		redirect_to @todo_list, notice: "Todo item completed"
	end

	private

	def set_todo_list
		@todo_list = TodoList.find(params[:todo_list_id])
	end

	def set_todo_item
		@todo_item = @todo_list.todo_items.find(params[:id])
	end

	def todo_item_params
		params[:todo_item].permit(:position, :title, :is_done)
	end

end
