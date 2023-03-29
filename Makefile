##
## EPITECH PROJECT, 2021
## Makefile
## File description:
## It's my Makefile
##

NAME = imageCompressor

all :
	@stack build --copy-bins

clean:
	@stack clean
	@echo 'Program cleaned'

fclean:
	@stack purge
	@rm ${NAME}
	@echo 'Program purged'

re : fclean all

run : 
	@stack exec ${NAME}

tests_run:
	@stack clean
	@stack test --coverage

.PHONY: re run fclean clean all