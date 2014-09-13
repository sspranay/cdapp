ActiveAdmin.register Contract do
  actions :all, :except => [:destroy]
  #index :download_links => [:csv]

  filter :account, :as => :string
  filter :customer, :as => :string
  filter :title, :as => :string
  filter :current_end_date

scope :all, :default => true
  scope :Active do |contracts|
    contracts.where(:status => "A")
  end
  scope :Complete do |contracts|
    contracts.where(:status => "C")
  end


  index do
    selectable_column
    column("ACCOUNT", :sortable => :account) {|contract| link_to "#{contract.account} ", admin_contract_path(contract) }
    column("CUSTOMER", :sortable => :customer) {|contract| contract.customer}
    column("TITLE", :sortable => :title) {|contract| contract.title}
    column("CURRENT END DATE", :sortable => :current_end_date) {|contract| contract.current_end_date.strftime("%d-%b-%Y") }
    column("FUNDED AMOUNT", :sortable => :funded_amount) {|contract| number_to_currency contract.funded_amount }
    column("REVENUE TO DATE", :sortable => :revenue_to_date) {|contract| number_to_currency contract.revenue_to_date }
    column("FUNDS REMAINING", :sortable =>:funds_remaining) {|contract| number_to_currency contract.funds_remaining }
    actions
  end

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  permit_params :account, :customer, :title, :contract_no, :status, :start_date, :current_end_date, :end_date_w_options,
     :revenue_to_date, :funded_amount, :company, :div_pool, :operating_div, :basis, :vehicle, :contract_type, :ecs_role, :signed_contract_amount,
     :account_ex, :director, :project_manager, :cont_admin
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end


end
