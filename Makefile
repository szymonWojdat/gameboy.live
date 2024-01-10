build:
	go get -t . && go build -o gbdotlive main.go
run:
	./gbdotlive -S -r pokered.gb
