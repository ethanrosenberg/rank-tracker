class RemoveKeywordFromProjects < ActiveRecord::Migration[6.0]
  def change
    remove_reference :projects, :keyword, null: false, foreign_key: true
  end
end
