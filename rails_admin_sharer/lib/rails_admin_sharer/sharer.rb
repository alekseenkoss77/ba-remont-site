module RailsAdmin
	module Config
		module Actions
			class Sharer < Base
				RailsAdmin::Config::Actions.register(self)
				
				register_instance_option :root? do
					false
				end
				
				register_instance_option :member? do
					false
				end
				
				register_instance_option :controller? do
					Proc.new do |c|
						p "*"*100
						p "This is my rails plugin"
						p "*"*100
					end
				end
				
				register_instance_option :link_icon do
					'icon-align-left'
				end

				register_instance_option :http_methods do
				  [:get, :post]
				end
			end
		end
	end
end