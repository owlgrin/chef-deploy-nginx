server {
	listen 80;

	server_name center.horntell.com;
	root /home/ubuntu/apps/center;
	index index.html index.htm index.php;

	access_log /var/log/nginx/center.horntell.com-access.log;
    error_log  /var/log/nginx/center.horntell.com-error.log error;

	charset utf-8;

	location / {
		try_files $uri $uri/ /index.php?$query_string =404;
        expires            20m;
        add_header         Cache-Control public;
	}

	location = /favicon.ico { log_not_found off; access_log off; }
    location = /robots.txt  { access_log off; log_not_found off; }

	# pass the PHP scripts to php5-fpm
    # Note: .php$ is susceptible to file upload attacks
    # Consider using: "location ~ ^/(index|app|app_dev|config).php(/|$) {"
    location ~ .php$ {
        try_files $uri =404;
        fastcgi_split_path_info ^(.+.php)(/.+)$;
        # With php5-fpm:
        fastcgi_pass 127.0.0.1:9000;
        fastcgi_index index.php;
        include fastcgi_params;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        fastcgi_param APP_ENV production; # Environment variable
        fastcgi_param HTTPS off;
    }

    # Deny .htaccess file access
    location ~ /\.ht {
        deny all;
    }
}
