cookbook_file 'pipe.horntell.com.conf' do
	path '/etc/nginx/sites-available/pipe.horntell.com'
end

phpapps = {
	'api.horntell.com' => {
		'root' => '/home/ubuntu/apps/api/public'
	},
	'core.horntell.com' => {
		'root' => '/home/ubuntu/apps/core/public'
	},
	'mail.horntell.com' => {
		'root' => '/home/ubuntu/apps/core/public'
	}
}

phpapps.each { |site, details|
	template "/etc/nginx/sites-available/#{site}" do
		source 'phpapp.erb'
		variables({
			:server_name => site,
			:server_root => details['root'],
			:server_env => 'production'
		})
	end
}

allsites = ['pipe.horntell.com', 'core.horntell.com', 'api.horntell.com', 'mail.horntell.com']
allsites.each { |site|
	execute "enabling site: #{site}" do
		command "ngxen #{site}"
	end
}

execute "restarting nginx service to reload new web sites" do
	command "service nginx restart"
end