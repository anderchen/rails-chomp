class CreateUserRestrictions < ActiveRecord::Migration[5.2]
  def change
    create_table :user_restrictions do |t|
      t.references :user, foreign_key: true
      t.references :diet, foreign_key: true

      t.timestamps
    end
  end
end
