class AddProjectToKeywords < ActiveRecord::Migration[6.0]
  def change
    add_reference :keywords, :project, null: false, foreign_key: true
  end
end
