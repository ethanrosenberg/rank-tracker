class AddKeywordToProjects < ActiveRecord::Migration[6.0]
  def change
    add_reference :projects, :keyword, null: false, foreign_key: true
  end
end
