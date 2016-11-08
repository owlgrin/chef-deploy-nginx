server {
	listen 80;

	server_name app.horntell.com;
	root /home/ubuntu/apps/app;
	index index.html index.htm;

	location / {
		try_files $uri $uri/ =404;
		expires            20m;
        add_header         Cache-Control public;
	}
}
