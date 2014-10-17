cookbook_file 'app.horntell.com.conf' do
	path '/etc/nginx/sites-available/app.horntell.com'
end

cookbook_file 'center.horntell.com.conf' do
	path '/etc/nginx/sites-available/center.horntell.com'
end