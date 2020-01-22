init:
	pip3 install pipenv --upgrade
	pipenv install --dev
test:
	# This runs all of the tests, on both Python 2 and Python 3.
	detox
ci:
	pipenv run py.test tests  --junitxml=report.xml

test-readme:
	@pipenv run python src/setup.py check --restructuredtext --strict && ([ $$? -eq 0 ] && echo "README.rst and HISTORY.rst ok") || echo "Invalid markup in README.rst or HISTORY.rst!"

flake8:
	pipenv run flake8 --ignore=E501,F401,E128,E402,E731,F821 woqlclient

coverage:
	pipenv run py.test tests --cov-config .coveragerc --verbose --cov-report term --cov-report xml --cov=woqlclient tests

#command line for publish the module
#using twine to upload packages to PyPI https://pypi.org/project/twine/
#publish:
	#pip install 'twine>=1.5.0'
	#python setup.py sdist bdist_wheel
	#twine upload dist/*
	#rm -fr build dist .egg requests.egg-info