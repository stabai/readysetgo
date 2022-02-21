package service

import (
	"context"

	v1 "github.com/stabai/readysetgo/proto/example/service/v1"
	"google.golang.org/protobuf/types/known/emptypb"
)

func (s ExampleService) SetExample(
	_ context.Context,
	in *v1.SetExampleRequest,
) (*emptypb.Empty, error) {

	s.Values[in.Id] = in.Data.Text

	resp := emptypb.Empty{}
	return &resp, nil
}
