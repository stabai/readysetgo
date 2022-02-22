package service

import (
	"context"

	pb "github.com/stabai/readysetgo/proto/example"
	v1 "github.com/stabai/readysetgo/proto/example/service/v1"
)

func (s ExampleService) GetExample(
	_ context.Context,
	in *v1.GetExampleRequest,
) (*v1.GetExampleResponse, error) {

	resp := v1.GetExampleResponse{
		Id: in.Id,
		Data: &pb.Example{
			Text: s.Values[in.Id],
		},
	}
	return &resp, nil
}
