server {
    listen 80;
    server_name pipe.horntell.com;

    access_log /var/log/nginx/pipe.horntell.com-access.log;
    error_log  /var/log/nginx/pipe.horntell.com-error.log error;

    location / {
        proxy_set_header   X-Real-IP $remote_addr;
        proxy_set_header   Host      $http_host;
        proxy_set_header   Connection "upgrade";
        proxy_set_header   Upgrade $http_upgrade;
    	proxy_http_version 1.1;
        proxy_pass         http://127.0.0.1:25010;
        expires            20m;
        add_header         Cache-Control public;
    }
}
