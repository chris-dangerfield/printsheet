build:
	mkdir -p pkg && R CMD build . && mv *.tar.gz pkg

check: build
	ls pkg/*.tar.gz | tail -n1 | xargs R CMD check