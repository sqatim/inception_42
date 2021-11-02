NAME=Inception

all: $(NAME)

$(NAME): Build Run

Build:
	@docker-compose -f ./srcs/docker-compose.yml build
Run:
	@docker-compose -f ./srcs/docker-compose.yml up
clean:
	@docker-compose -f ./srcs/docker-compose.yml down

fclean: clean
	docker system prune -a --force