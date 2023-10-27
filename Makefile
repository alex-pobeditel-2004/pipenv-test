build_old:
	docker build --no-cache --tag python_pipenv_test -f Dockerfile_old .

build_new:
	docker build --no-cache --tag python_pipenv_test -f Dockerfile_new .

test:
	docker run --rm python_pipenv_test python -c "import sys; print('sys.path:', sys.path); import example_lib; example_lib.run_me()"
