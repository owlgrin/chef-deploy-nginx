phpapps = {
	'apps.horntell.com' => {
		'root' => '/home/ubuntu/apps/apps/public'
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

allsites = ['apps.horntell.com']
allsites.each { |site|
	execute "enabling site: #{site}" do
		command "ngxen #{site}" # TODO: run this command only if site is not already enabled
	end
}

execute "restarting nginx service to reload new web sites" do
	command "service nginx restart"
end