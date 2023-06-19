BINARY_NAME=caprukApp.exe

build:
	@go mod vendor
	@go build -o tmp/${BINARY_NAME} .
	@echo Capruk built!


run: build
	@echo Staring Capruk...
	@.\tmp\${BINARY_NAME} &
	@echo Capruk started!

clean:
	@echo Cleaning...
	@go clean
	@del .\tmp\${BINARY_NAME}
	@echo Cleaned!

start_compose:
	@docker-compose up -d

stop_compose:
	@docker-compose down

test:
	@echo Testing...
	@go test ./...
	@echo Done!


start: run

stop:
	@echo Starting the front end...
	@taskkill /IM ${BINARY_NAME} /F
	@echo Stopped Capruk

restart: stop start
