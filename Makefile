NAME=Inception

all: $(NAME)

$(NAME): Dir Build Run 

Dir: 
	mkdir -p /home/sqatim/data/wordpress /home/sqatim/data/mariadb
Build:
	@docker-compose -f ./srcs/docker-compose.yml build
Run:
	@docker-compose -f ./srcs/docker-compose.yml up
clean:
	@docker-compose -f ./srcs/docker-compose.yml down

fclean: clean
	docker system prune -a --force

re: fclean all