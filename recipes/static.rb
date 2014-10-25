cookbook_file 'app.horntell.com.conf' do
	path '/etc/nginx/sites-available/app.horntell.com'
end

cookbook_file 'center.horntell.com.conf' do
	path '/etc/nginx/sites-available/center.horntell.com'
end

allsites = ['app.horntell.com', 'center.horntell.com']
allsites.each { |site|
	execute "enabling site: #{site}" do
		command "ngxen #{site}"
	end
}

execute "restarting nginx service to reload new static sites" do
	command "service nginx restart"
end