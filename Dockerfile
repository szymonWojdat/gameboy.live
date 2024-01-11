FROM --platform=linux/amd64 golang:1.21.6
LABEL authors="szymonwojdat"
RUN apt-get update && apt-get install gcc libasound2-dev libgl1-mesa-dev xorg-dev python3 -y
COPY . /app
WORKDIR /app
RUN go get -t .
RUN go build -o gbdotlive main.go
EXPOSE 8080
EXPOSE 1989
RUN touch main.sh
RUN echo "#!/bin/bash" >> main.sh
RUN echo "./gbdotlive -S -r pokered.gb &" >> main.sh
RUN echo "python3 -m http.server 8080" >> main.sh
RUN chmod +x main.sh
CMD ./main.sh
