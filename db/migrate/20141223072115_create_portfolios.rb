class CreatePortfolios < ActiveRecord::Migration
  def change
    create_table :portfolios do |t|
      t.text :project_url
      t.string :project_caption
      t.boolean :status
      t.references :projecttype, index: true
      t.references :project, index: true

      t.timestamps
    end
  end
end
