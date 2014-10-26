class CreateWalkathonPayments < ActiveRecord::Migration
  def change
    create_table :walkathon_payments do |t|
      t.string :description
      t.decimal :amount, precision: 7, scale: 2
      t.references :walkathon_pledge, index: true

      t.timestamps
    end
  end
end
