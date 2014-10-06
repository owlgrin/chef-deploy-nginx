cookbook_file 'app.horntell.com.conf' do
	path '/etc/nginx/sites-available/app.horntell.com'
end

cookbook_file 'center.horntell.com.conf' do
	path '/etc/nginx/sites-available/center.horntell.com'
end

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
		'root' => '/home/ubuntu/apps/mail/public'
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