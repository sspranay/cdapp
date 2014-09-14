ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    #div class: "blank_slate_container", id: "dashboard_default_message" do
    #  span class: "blank_slate" do
    #    span I18n.t("active_admin.dashboard_welcome.welcome")
    #    small I18n.t("active_admin.dashboard_welcome.call_to_action")
    #  end
    #end

    # Here is an example of a simple dashboard with columns and panels.
    #
     columns do
       column do
         panel "Recently Updated Contracts" do
             table_for Contract.limit(2).order('updated_at desc').map do 
               column ("Contract") {|contract| link_to(contract.title, admin_contract_path(contract)) }
               column ("Updated at") {|contract| contract.updated_at.strftime("%d-%b-%Y %I:%M:%S %p")}
             end
         end
       end

    column do
         panel "At Risk Contracts" do
            table_for Contract.where("date(current_end_date) < ?", Date.today).order('current_end_date desc').map do
                column ("Contract") {|contract| link_to(contract.title, admin_contract_path(contract))}
                column ("Current End Date") {|contract| contract.current_end_date.strftime("%d-%b-%Y")}
            end
           end
    end

       column do
         panel "Contracts Ending Within 60 Days" do
            table_for Contract.where(current_end_date: Date.today..(Date.today + 60.days)).order('current_end_date asc').map do 
                column ("Contract") {|contract| link_to(contract.title, admin_contract_path(contract))}
                column ("Current End Date") {|contract| contract.current_end_date.strftime("%d-%b-%Y")}
            end
           end
       end

     end
  end # content
end
