class CreateTableItemsTasks < ActiveRecord::Migration
  def change
    create_join_table :tasks, :items do |t|
			t.index :task_id
			t.index :item_id
    end
  end
end
