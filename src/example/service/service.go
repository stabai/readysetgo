package service

import (
	v1 "github.com/stabai/readysetgo/proto/example/service/v1"
)

type ExampleService struct {
	v1.UnimplementedExampleServiceServer
	Values map[string]string
}

func NewExampleService() *ExampleService {
	svc := ExampleService{Values: make(map[string]string)}
	svc.Values["animal"] = "cats"
	return &svc
}
