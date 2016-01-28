class CreateModels < ActiveRecord::Migration
  def change
    create_table :models do |t|
      t.string :DictionaryWord
      t.string :word
      t.integer :count

      t.timestamps
    end
  end
end
