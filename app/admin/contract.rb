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

  form do |f|
    f.inputs "Contract Details" do
    f.input :account, :label => "ACCOUNT"
    f.input :customer, :label => "CUSTOMER"
    f.input :title, :label => "TITLE"
    f.input :contract_no, :label => "CONTRACT_NO"
    f.input :status, :label => "STATUS"
    f.input :start_date, :label => "START_DATE", :as => :string, :input_html => {:class => "datepicker hasDatePicker"}
    f.input :current_end_date, :label => "CURRENT END DATE" , :as => :string, :input_html => {:class => "datepicker hasDatePicker"}
    f.input :end_date_w_options, :label => "END DATE W OPTIONS", :as => :string, :input_html => {:class => "datepicker hasDatePicker"}
    f.input :revenue_to_date, :label => "REVENUE TO DATE"
    f.input :funded_amount, :label => "FUNDED AMOUNT"
    f.input :company, :label => "COMPANY"
    f.input :div_pool, :label => "DIV POOL"
    f.input :operating_div, :label => "OPERATING DIV"
    f.input :basis, :label => "BASIS"
    f.input :vehicle, :label => "VEHICLE"
    f.input :contract_type, :label => "CONTRACT TYPE"
    f.input :ecs_role, :label => "ECS ROLE"
    f.input :signed_contract_amount, :label => "SIGNED CONTRACT AMOUNT"
    f.input :account_ex, :label => "ACCOUNT EX"
    f.input :director, :label => "DIRECTOR"
    f.input :project_manager, :label => "PROJECT MANAGER"
    f.input :cont_admin, :label => "CONT ADMIN"
    f.actions :submit, :cancel
  end
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
