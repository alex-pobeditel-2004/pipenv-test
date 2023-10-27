# pipenv-test
Test for regression of pipenv 2023.4.20 editable modules installation

# Steps to reproduce
1. Run `make build_old` (build with pipenv==2023.03.20)
2. Run `make test` and ensure that output looks like this:
    ```
    [user@pc pipenv-test]$ make test
    docker run --rm python_pipenv_test python -c "import sys; print('sys.path:', sys.path); import example_lib; example_lib.run_me()"
    sys.path: ['', '/usr/local/lib/python310.zip', '/usr/local/lib/python3.10', '/usr/local/lib/python3.10/lib-dynload', '/opt/venv/lib/python3.10/site-packages', '/libs/example_lib']
    SUCCESS!
   ```
3. Run `make build_new` (build with pipenv==2023.04.20)
4. Run `make test` again and see the output:
    ```
   [user@pc pipenv-test]$ make test
    docker run --rm python_pipenv_test python -c "import sys; print('sys.path:', sys.path); import example_lib; example_lib.run_me()"
    sys.path: ['', '/usr/local/lib/python310.zip', '/usr/local/lib/python3.10', '/usr/local/lib/python3.10/lib-dynload', '/opt/venv/lib/python3.10/site-packages']
    Traceback (most recent call last):
      File "<string>", line 1, in <module>
    ModuleNotFoundError: No module named 'example_lib'
    make: *** [Makefile:5: test] Error 1
   ```

You can see that editable lib is not in the `sys.path` anymore and can't be found during import.
