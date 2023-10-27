from setuptools import setup, find_packages

setup(
    name='example-lib',
    version='1.0.0',
    description='example-lib',
    packages=find_packages(where='example_lib', include=['example_lib/']),
    python_requires='>=3.10, <4',
    install_requires=[]
)
