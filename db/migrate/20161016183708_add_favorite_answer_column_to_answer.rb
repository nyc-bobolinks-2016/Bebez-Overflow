class AddFavoriteAnswerColumnToAnswer < ActiveRecord::Migration
  def change
    add_column :answers, :favorite, :boolean
  end
end
