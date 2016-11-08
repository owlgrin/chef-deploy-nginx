cookbook_file 'pipe.horntell.com.conf' do
	path '/etc/nginx/sites-available/pipe.horntell.com'
end

phpapps = {
	'api.horntell.com' => {
		'root' => '/home/ubuntu/apps/core/public'
	},
	'core.horntell.com' => {
		'root' => '/home/ubuntu/apps/core/public'
	},
	'mail.horntell.com' => {
		'root' => '/home/ubuntu/apps/core/public'
	},
	'admin.horntell.com' => {
		'root' => '/home/ubuntu/apps/core/public'
	},
	'me.horntell.com' => {
		'root' => '/home/ubuntu/apps/core/public'
	}
}

phpapps.each { |site, details|
	template "/etc/nginx/sites-available/#{site}" do
		source 'phpapp.erb'
		variables({
			:server_name => site,
			:server_root => details['root'],
			:server_env => 'production' # this can be moved to environment variable
		})
	end
}

allsites = ['pipe.horntell.com', 'core.horntell.com', 'api.horntell.com', 'mail.horntell.com', 'admin.horntell.com', 'me.horntell.com']
allsites.each { |site|
	execute "enabling site: #{site}" do
		not_if do ::File.exists?("/etc/nginx/sites-enabled/#{site}") end
		command "ngxen #{site}" # TODO: run this command only if site is not already enabled
	end
}

execute "restarting nginx service to reload new web sites" do
	command "service nginx restart"
end