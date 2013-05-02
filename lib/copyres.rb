require 'rails_admin/config/actions'
require 'rails_admin/config/actions/base'

module RailsAdminCopyResource
end

module RailsAdmin
  module Config
    module Actions
      class CopyResource < RailsAdmin::Config::Actions::Base
        register_instance_option :bulkable? do
          true
        end

        register_instance_option :controller do
          Proc.new do

            #get all selected rows
            @object = list_entries(@model_config, :destroy)
            flash[:notice] = "I Am CUSTOM Actions for YOU, blead!"
            #redirect_to back_or_index
            #render :action => :copy_resource
          end
        end

      end
    end
  end
end