build:
	protoc -I proto/consignment/ proto/consignment/consignment.proto --go_out=plugins=micro:proto/consignment
	GOOS=linux GOARCH=amd64
	docker build -t consignment-service .
run:
	docker run -p 50051:50051 -e MICRO_SERVER_ADDRESS=:50051 -e MICRO_REGISTRY=mdns consignment-service