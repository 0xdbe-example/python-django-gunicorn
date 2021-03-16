import gunicorn

bind = "0.0.0.0:8000"
worker_tmp_dir = "/dev/shm"
workers = 2 
threads = 4 
worker_class = "gthread"
errorlog = '-'
loglevel = 'debug'

gunicorn.SERVER_SOFTWARE = "Apache"