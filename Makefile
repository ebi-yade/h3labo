clean:
	docker-compose down --volumes && \
	cd server && \
	rm -rf quiche nginx-1.16.1 nginx-1.16.1.tar.gz
