package main

import (
	pb "github.com/stabai/readysetgo/proto/example/service/v1"
)

type service struct {
	pb.UnimplementedExampleServiceServer
	values map[string]string
}
