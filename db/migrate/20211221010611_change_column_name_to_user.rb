class ChangeColumnNameToUser < ActiveRecord::Migration[6.1]
  def change
    change_table :users do |t|
      t.rename :user, :username
    end
  end
end
