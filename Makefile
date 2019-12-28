all:
	go build upt.go

release:
	GOOS=linux GOARCH=amd64 go build upt.go
	GOOS=darwin GOARCH=amd64 go build upt.go

clean:
	rm upt
