class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.string :account
      t.string :customer
      t.string :title
      t.string :contract_no
      t.string :status, :default => 'A'
      t.date :start_date
      t.date :current_end_date
      t.date :end_date_w_options
      t.decimal :revenue_to_date, :default => 0.00
      t.decimal :funded_amount, :default => 0.00
      t.decimal :funds_remaining, :default => 0.00
      t.string :company
      t.integer :div_pool
      t.string :operating_div
      t.string :basis
      t.string :vehicle
      t.string :contract_type
      t.string :ecs_role
      t.decimal :signed_contract_amount
      t.string :account_ex
      t.string :director
      t.string :project_manager
      t.string :cont_admin

      t.timestamps
    end
  end
end
