cookbook_file 'catchall.conf' do
	path '/etc/nginx/sites-available/catchall'
end

execute "enabling site: catchall" do
	command "ngxen catchall" # TODO: do not try to enable if already enabled
end

execute "restarting nginx service to reload catchall" do
	command "service nginx restart"
end