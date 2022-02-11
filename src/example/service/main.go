package main

import (
	"flag"
	"fmt"
	"log"
	"net"

	pb "github.com/stabai/readysetgo/proto/example/service/v1"
	"google.golang.org/grpc"
	"google.golang.org/grpc/reflection"
)

var (
	port = flag.Int("port", 50051, "The server port")
)

type service struct {
	pb.UnimplementedExampleServiceServer
}

func main() {
	flag.Parse()

	log.Println("Initializing server...")
	initializeServer()
}

func initializeServer() {
	lis, err := net.Listen("tcp", fmt.Sprintf(":%d", *port))
	if err != nil {
		log.Fatalf("failed to listen: %v", err)
	}

	s := grpc.NewServer()
	registerGrpcServices(s)

	log.Printf("server listening at %v", lis.Addr())
	if err := s.Serve(lis); err != nil {
		log.Fatalf("failed to serve: %v", err)
	}
}

func registerGrpcServices(s *grpc.Server) {
	reflection.Register(s)
	pb.RegisterExampleServiceServer(s, &service{})
}
